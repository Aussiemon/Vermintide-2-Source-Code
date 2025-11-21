-- chunkname: @dialogues/generated/hero_conversations_dlc_reikwald_river.lua

return function ()
	define_rule({
		name = "npces_reik2_conversation_group_one_01_b",
		probability = 1,
		response = "npces_reik2_conversation_group_one_01_b",
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
				"reik2_conversation_group_one_01_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_one_02_b",
		probability = 1,
		response = "npces_reik2_conversation_group_one_02_b",
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
				"reik2_conversation_group_one_02_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_one_03_b",
		probability = 1,
		response = "npces_reik2_conversation_group_one_03_b",
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
				"reik2_conversation_group_one_03_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_one_04_b",
		probability = 1,
		response = "npces_reik2_conversation_group_one_04_b",
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
				"reik2_conversation_group_one_04_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_one_05_a",
		probability = 1,
		response = "npces_reik2_conversation_group_one_05_a",
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
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
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
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
			},
			{
				"global_context",
				"empire_soldier",
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_one_05_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_one_05_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_three_01_b",
		probability = 1,
		response = "npces_reik2_conversation_group_three_01_b",
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
				"reik2_conversation_group_three_01_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_three_02_b",
		probability = 1,
		response = "npces_reik2_conversation_group_three_02_b",
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
				"reik2_conversation_group_three_02_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_three_03_b",
		probability = 1,
		response = "npces_reik2_conversation_group_three_03_b",
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
				"reik2_conversation_group_three_03_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_three_04_b",
		probability = 1,
		response = "npces_reik2_conversation_group_three_04_b",
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
				"reik2_conversation_group_three_04_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_three_05_a",
		probability = 1,
		response = "npces_reik2_conversation_group_three_05_a",
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
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
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
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_three_05_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_three_05_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_two_01_b",
		probability = 1,
		response = "npces_reik2_conversation_group_two_01_b",
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
				"reik2_conversation_group_two_01_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_two_02_b",
		probability = 1,
		response = "npces_reik2_conversation_group_two_02_b",
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
				"reik2_conversation_group_two_02_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_two_03_b",
		probability = 1,
		response = "npces_reik2_conversation_group_two_03_b",
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
				"reik2_conversation_group_two_03_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_two_04_b",
		probability = 1,
		response = "npces_reik2_conversation_group_two_04_b",
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
				"reik2_conversation_group_two_04_a",
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
			},
		},
	})
	define_rule({
		name = "npces_reik2_conversation_group_two_05_a",
		probability = 1,
		response = "npces_reik2_conversation_group_two_05_a",
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
				"npc_empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_empire_soldier",
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
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_two_05_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_two_05_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_reik2_conversation_group_one_01_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_one_01_b",
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
				"reik2_conversation_group_one_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_one_02_a",
		probability = 1,
		response = "pbw_reik2_conversation_group_one_02_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pbw_reik2_conversation_group_one_02_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pbw_reik2_conversation_group_one_02_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_reik2_conversation_group_one_03_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_one_03_b",
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
				"reik2_conversation_group_one_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_one_04_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_one_04_b",
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
				"reik2_conversation_group_one_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_one_05_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_one_05_b",
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
				"reik2_conversation_group_one_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_three_01_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_three_01_b",
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
				"reik2_conversation_group_three_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_three_02_a",
		probability = 1,
		response = "pbw_reik2_conversation_group_three_02_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pbw_reik2_conversation_group_three_02_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pbw_reik2_conversation_group_three_02_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_reik2_conversation_group_three_03_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_three_03_b",
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
				"reik2_conversation_group_three_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_three_04_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_three_04_b",
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
				"reik2_conversation_group_three_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_three_05_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_three_05_b",
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
				"reik2_conversation_group_three_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_two_01_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_two_01_b",
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
				"reik2_conversation_group_two_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_two_02_a",
		probability = 1,
		response = "pbw_reik2_conversation_group_two_02_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pbw_reik2_conversation_group_two_02_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pbw_reik2_conversation_group_two_02_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_reik2_conversation_group_two_03_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_two_03_b",
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
				"reik2_conversation_group_two_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_two_04_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_two_04_b",
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
				"reik2_conversation_group_two_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pbw_reik2_conversation_group_two_05_b",
		probability = 1,
		response = "pbw_reik2_conversation_group_two_05_b",
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
				"reik2_conversation_group_two_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_one_01_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_one_01_b",
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
				"reik2_conversation_group_one_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_one_02_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_one_02_b",
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
				"reik2_conversation_group_one_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_one_03_a",
		probability = 1,
		response = "pdr_reik2_conversation_group_one_03_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pdr_reik2_conversation_group_one_03_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_reik2_conversation_group_one_03_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_reik2_conversation_group_one_04_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_one_04_b",
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
				"reik2_conversation_group_one_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_one_05_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_one_05_b",
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
				"reik2_conversation_group_one_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_three_01_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_three_01_b",
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
				"reik2_conversation_group_three_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_three_02_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_three_02_b",
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
				"reik2_conversation_group_three_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_three_03_a",
		probability = 1,
		response = "pdr_reik2_conversation_group_three_03_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pdr_reik2_conversation_group_three_03_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_reik2_conversation_group_three_03_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_reik2_conversation_group_three_04_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_three_04_b",
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
				"reik2_conversation_group_three_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_three_05_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_three_05_b",
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
				"reik2_conversation_group_three_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_two_01_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_two_01_b",
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
				"reik2_conversation_group_two_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_two_02_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_two_02_b",
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
				"reik2_conversation_group_two_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_two_03_a",
		probability = 1,
		response = "pdr_reik2_conversation_group_two_03_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pdr_reik2_conversation_group_two_03_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pdr_reik2_conversation_group_two_03_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_reik2_conversation_group_two_04_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_two_04_b",
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
				"reik2_conversation_group_two_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pdr_reik2_conversation_group_two_05_b",
		probability = 1,
		response = "pdr_reik2_conversation_group_two_05_b",
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
				"reik2_conversation_group_two_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_one_01_b",
		probability = 1,
		response = "pes_reik2_conversation_group_one_01_b",
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
				"reik2_conversation_group_one_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_one_02_b",
		probability = 1,
		response = "pes_reik2_conversation_group_one_02_b",
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
				"reik2_conversation_group_one_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_one_03_b",
		probability = 1,
		response = "pes_reik2_conversation_group_one_03_b",
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
				"reik2_conversation_group_one_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_one_04_b",
		probability = 1,
		response = "pes_reik2_conversation_group_one_04_b",
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
				"reik2_conversation_group_one_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_one_05_a",
		probability = 1,
		response = "pes_reik2_conversation_group_one_05_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_one_05_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_one_05_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_reik2_conversation_group_three_01_b",
		probability = 1,
		response = "pes_reik2_conversation_group_three_01_b",
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
				"reik2_conversation_group_three_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_three_02_b",
		probability = 1,
		response = "pes_reik2_conversation_group_three_02_b",
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
				"reik2_conversation_group_three_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_three_03_b",
		probability = 1,
		response = "pes_reik2_conversation_group_three_03_b",
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
				"reik2_conversation_group_three_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_three_04_b",
		probability = 1,
		response = "pes_reik2_conversation_group_three_04_b",
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
				"reik2_conversation_group_three_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_three_05_a",
		probability = 1,
		response = "pes_reik2_conversation_group_three_05_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_three_05_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_three_05_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_reik2_conversation_group_two_01_b",
		probability = 1,
		response = "pes_reik2_conversation_group_two_01_b",
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
				"reik2_conversation_group_two_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_two_02_b",
		probability = 1,
		response = "pes_reik2_conversation_group_two_02_b",
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
				"reik2_conversation_group_two_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_two_03_b",
		probability = 1,
		response = "pes_reik2_conversation_group_two_03_b",
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
				"reik2_conversation_group_two_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_two_04_b",
		probability = 1,
		response = "pes_reik2_conversation_group_two_04_b",
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
				"reik2_conversation_group_two_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pes_reik2_conversation_group_two_05_a",
		probability = 1,
		response = "pes_reik2_conversation_group_two_05_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_two_05_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pes_reik2_conversation_group_two_05_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_reik2_conversation_group_one_01_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_one_01_b",
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
				"reik2_conversation_group_one_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_one_02_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_one_02_b",
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
				"reik2_conversation_group_one_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_one_03_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_one_03_b",
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
				"reik2_conversation_group_one_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_one_04_a",
		probability = 1,
		response = "pwe_reik2_conversation_group_one_04_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pwe_reik2_conversation_group_one_04_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pwe_reik2_conversation_group_one_04_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_reik2_conversation_group_one_05_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_one_05_b",
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
				"reik2_conversation_group_one_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_three_01_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_three_01_b",
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
				"reik2_conversation_group_three_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_three_02_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_three_02_b",
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
				"reik2_conversation_group_three_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_three_03_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_three_03_b",
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
				"reik2_conversation_group_three_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_three_04_a",
		probability = 1,
		response = "pwe_reik2_conversation_group_three_04_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pwe_reik2_conversation_group_three_04_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pwe_reik2_conversation_group_three_04_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_reik2_conversation_group_three_05_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_three_05_b",
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
				"reik2_conversation_group_three_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_two_01_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_two_01_b",
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
				"reik2_conversation_group_two_01_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_two_02_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_two_02_b",
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
				"reik2_conversation_group_two_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_two_03_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_two_03_b",
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
				"reik2_conversation_group_two_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwe_reik2_conversation_group_two_04_a",
		probability = 1,
		response = "pwe_reik2_conversation_group_two_04_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pwe_reik2_conversation_group_two_04_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pwe_reik2_conversation_group_two_04_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_reik2_conversation_group_two_05_b",
		probability = 1,
		response = "pwe_reik2_conversation_group_two_05_b",
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
				"reik2_conversation_group_two_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_one_01_a",
		probability = 1,
		response = "pwh_reik2_conversation_group_one_01_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"pwh_reik2_conversation_group_one_01_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pwh_reik2_conversation_group_one_01_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_reik2_conversation_group_one_02_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_one_02_b",
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
				"reik2_conversation_group_one_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_one_03_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_one_03_b",
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
				"reik2_conversation_group_one_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_one_04_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_one_04_b",
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
				"reik2_conversation_group_one_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_one_05_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_one_05_b",
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
				"reik2_conversation_group_one_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_three_01_a",
		probability = 1,
		response = "pwh_reik2_conversation_group_three_01_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"pwh_reik2_conversation_group_three_01_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pwh_reik2_conversation_group_three_01_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_reik2_conversation_group_three_02_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_three_02_b",
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
				"reik2_conversation_group_three_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_three_03_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_three_03_b",
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
				"reik2_conversation_group_three_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_three_04_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_three_04_b",
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
				"reik2_conversation_group_three_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_three_05_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_three_05_b",
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
				"reik2_conversation_group_three_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_two_01_a",
		probability = 1,
		response = "pwh_reik2_conversation_group_two_01_a",
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
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				2,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				15,
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
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"pwh_reik2_conversation_group_two_01_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"pwh_reik2_conversation_group_two_01_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_reik2_conversation_group_two_02_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_two_02_b",
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
				"reik2_conversation_group_two_02_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_two_03_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_two_03_b",
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
				"reik2_conversation_group_two_03_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_two_04_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_two_04_b",
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
				"reik2_conversation_group_two_04_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		name = "pwh_reik2_conversation_group_two_05_b",
		probability = 1,
		response = "pwh_reik2_conversation_group_two_05_b",
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
				"reik2_conversation_group_two_05_a",
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				7,
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
		npces_reik2_conversation_group_one_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_one_01_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_one_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.828625202179,
			},
		},
		npces_reik2_conversation_group_one_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_one_02_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_one_02_b_01",
			},
			sound_events_duration = {
				[1] = 6.5559582710266,
			},
		},
		npces_reik2_conversation_group_one_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_one_03_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_one_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.9128332138061,
			},
		},
		npces_reik2_conversation_group_one_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_one_04_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_one_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.0669374465942,
			},
		},
		npces_reik2_conversation_group_one_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_one_05_a_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_one_05_a_01",
			},
			sound_events_duration = {
				[1] = 3.5460000038147,
			},
		},
		npces_reik2_conversation_group_three_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_three_01_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_three_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.1202082633972,
			},
		},
		npces_reik2_conversation_group_three_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_three_02_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_three_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.683228969574,
			},
		},
		npces_reik2_conversation_group_three_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_three_03_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_three_03_b_01",
			},
			sound_events_duration = {
				[1] = 5.874062538147,
			},
		},
		npces_reik2_conversation_group_three_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_three_04_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_three_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.4031457901001,
			},
		},
		npces_reik2_conversation_group_three_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_three_05_a_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_three_05_a_01",
			},
			sound_events_duration = {
				[1] = 6.2961039543152,
			},
		},
		npces_reik2_conversation_group_two_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_two_01_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_two_01_b_01",
			},
			sound_events_duration = {
				[1] = 6.9225001335144,
			},
		},
		npces_reik2_conversation_group_two_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_two_02_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_two_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.7776041030884,
			},
		},
		npces_reik2_conversation_group_two_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_two_03_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_two_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.3529167175293,
			},
		},
		npces_reik2_conversation_group_two_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_two_04_b_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_two_04_b_01",
			},
			sound_events_duration = {
				[1] = 6.6770625114441,
			},
		},
		npces_reik2_conversation_group_two_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "npces_reik2_conversation_group_two_05_a_01",
			},
			sound_events = {
				[1] = "npces_reik2_conversation_group_two_05_a_01",
			},
			sound_events_duration = {
				[1] = 4.5599374771118,
			},
		},
		pbw_reik2_conversation_group_one_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_one_01_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_one_01_b_01",
			},
			sound_events_duration = {
				[1] = 5.1590209007263,
			},
		},
		pbw_reik2_conversation_group_one_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_one_02_a_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_one_02_a_01",
			},
			sound_events_duration = {
				[1] = 4.713791847229,
			},
		},
		pbw_reik2_conversation_group_one_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_one_03_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_one_03_b_01",
			},
			sound_events_duration = {
				[1] = 5.3256669044495,
			},
		},
		pbw_reik2_conversation_group_one_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_one_04_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_one_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.1707916259766,
			},
		},
		pbw_reik2_conversation_group_one_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_one_05_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_one_05_b_01",
			},
			sound_events_duration = {
				[1] = 4.6053748130798,
			},
		},
		pbw_reik2_conversation_group_three_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_three_01_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_three_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.3926668167114,
			},
		},
		pbw_reik2_conversation_group_three_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_three_02_a_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_three_02_a_01",
			},
			sound_events_duration = {
				[1] = 4.4062914848328,
			},
		},
		pbw_reik2_conversation_group_three_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_three_03_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_three_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.4608750343323,
			},
		},
		pbw_reik2_conversation_group_three_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_three_04_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_three_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.7162916660309,
			},
		},
		pbw_reik2_conversation_group_three_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_three_05_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_three_05_b_01",
			},
			sound_events_duration = {
				[1] = 4.2836875915527,
			},
		},
		pbw_reik2_conversation_group_two_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_two_01_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_two_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.3974583148956,
			},
		},
		pbw_reik2_conversation_group_two_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_two_02_a_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_two_02_a_01",
			},
			sound_events_duration = {
				[1] = 6.5891666412353,
			},
		},
		pbw_reik2_conversation_group_two_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_two_03_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_two_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.3826665878296,
			},
		},
		pbw_reik2_conversation_group_two_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_two_04_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_two_04_b_01",
			},
			sound_events_duration = {
				[1] = 8.1394376754761,
			},
		},
		pbw_reik2_conversation_group_two_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_reik2_conversation_group_two_05_b_01",
			},
			sound_events = {
				[1] = "pbw_reik2_conversation_group_two_05_b_01",
			},
			sound_events_duration = {
				[1] = 2.9053750038147,
			},
		},
		pdr_reik2_conversation_group_one_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_one_01_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_one_01_b_01",
			},
			sound_events_duration = {
				[1] = 5.2415208816528,
			},
		},
		pdr_reik2_conversation_group_one_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_one_02_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_one_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.3255417346954,
			},
		},
		pdr_reik2_conversation_group_one_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_one_03_a_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_one_03_a_01",
			},
			sound_events_duration = {
				[1] = 5.1049165725708,
			},
		},
		pdr_reik2_conversation_group_one_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_one_04_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_one_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.7668333053589,
			},
		},
		pdr_reik2_conversation_group_one_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_one_05_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_one_05_b_01",
			},
			sound_events_duration = {
				[1] = 6.2210664749145,
			},
		},
		pdr_reik2_conversation_group_three_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_three_01_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_three_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.7464375495911,
			},
		},
		pdr_reik2_conversation_group_three_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_three_02_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_three_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.7217917442322,
			},
		},
		pdr_reik2_conversation_group_three_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_three_03_a_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_three_03_a_01",
			},
			sound_events_duration = {
				[1] = 4.7886247634888,
			},
		},
		pdr_reik2_conversation_group_three_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_three_04_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_three_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.3852500915527,
			},
		},
		pdr_reik2_conversation_group_three_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_three_05_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_three_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.9203124046326,
			},
		},
		pdr_reik2_conversation_group_two_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_two_01_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_two_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.6506667137146,
			},
		},
		pdr_reik2_conversation_group_two_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_two_02_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_two_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.3375835418701,
			},
		},
		pdr_reik2_conversation_group_two_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_two_03_a_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_two_03_a_01",
			},
			sound_events_duration = {
				[1] = 6.7827081680298,
			},
		},
		pdr_reik2_conversation_group_two_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_two_04_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_two_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.2716665267944,
			},
		},
		pdr_reik2_conversation_group_two_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_reik2_conversation_group_two_05_b_01",
			},
			sound_events = {
				[1] = "pdr_reik2_conversation_group_two_05_b_01",
			},
			sound_events_duration = {
				[1] = 4.5192499160767,
			},
		},
		pes_reik2_conversation_group_one_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_one_01_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_one_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.5669167041779,
			},
		},
		pes_reik2_conversation_group_one_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_one_02_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_one_02_b_01",
			},
			sound_events_duration = {
				[1] = 6.1440000534058,
			},
		},
		pes_reik2_conversation_group_one_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_one_03_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_one_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.6642708778381,
			},
		},
		pes_reik2_conversation_group_one_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_one_04_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_one_04_b_01",
			},
			sound_events_duration = {
				[1] = 4.5299792289734,
			},
		},
		pes_reik2_conversation_group_one_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_one_05_a_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_one_05_a_01",
			},
			sound_events_duration = {
				[1] = 2.9554584026337,
			},
		},
		pes_reik2_conversation_group_three_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_three_01_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_three_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.7412707805634,
			},
		},
		pes_reik2_conversation_group_three_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_three_02_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_three_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.5620832443237,
			},
		},
		pes_reik2_conversation_group_three_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_three_03_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_three_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.107479095459,
			},
		},
		pes_reik2_conversation_group_three_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_three_04_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_three_04_b_01",
			},
			sound_events_duration = {
				[1] = 5.1708540916443,
			},
		},
		pes_reik2_conversation_group_three_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_three_05_a_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_three_05_a_01",
			},
			sound_events_duration = {
				[1] = 5.0744791030884,
			},
		},
		pes_reik2_conversation_group_two_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_two_01_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_two_01_b_01",
			},
			sound_events_duration = {
				[1] = 5.8301248550415,
			},
		},
		pes_reik2_conversation_group_two_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_two_02_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_two_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.8398332595825,
			},
		},
		pes_reik2_conversation_group_two_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_two_03_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_two_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.0018124580383,
			},
		},
		pes_reik2_conversation_group_two_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_two_04_b_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_two_04_b_01",
			},
			sound_events_duration = {
				[1] = 6.4889373779297,
			},
		},
		pes_reik2_conversation_group_two_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_reik2_conversation_group_two_05_a_01",
			},
			sound_events = {
				[1] = "pes_reik2_conversation_group_two_05_a_01",
			},
			sound_events_duration = {
				[1] = 4.2696042060852,
			},
		},
		pwe_reik2_conversation_group_one_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_one_01_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_one_01_b_01",
			},
			sound_events_duration = {
				[1] = 5.0962290763855,
			},
		},
		pwe_reik2_conversation_group_one_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_one_02_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_one_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.0927710533142,
			},
		},
		pwe_reik2_conversation_group_one_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_one_03_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_one_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.2139792442322,
			},
		},
		pwe_reik2_conversation_group_one_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_one_04_a_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_one_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.777458190918,
			},
		},
		pwe_reik2_conversation_group_one_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_one_05_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_one_05_b_01",
			},
			sound_events_duration = {
				[1] = 6.4241251945496,
			},
		},
		pwe_reik2_conversation_group_three_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_three_01_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_three_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.6420207023621,
			},
		},
		pwe_reik2_conversation_group_three_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_three_02_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_three_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.6937708854675,
			},
		},
		pwe_reik2_conversation_group_three_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_three_03_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_three_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.497750043869,
			},
		},
		pwe_reik2_conversation_group_three_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_three_04_a_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_three_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.7510418891907,
			},
		},
		pwe_reik2_conversation_group_three_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_three_05_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_three_05_b_01",
			},
			sound_events_duration = {
				[1] = 3.4672501087189,
			},
		},
		pwe_reik2_conversation_group_two_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_two_01_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_two_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.870020866394,
			},
		},
		pwe_reik2_conversation_group_two_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_two_02_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_two_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.9642915725708,
			},
		},
		pwe_reik2_conversation_group_two_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_two_03_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_two_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.3614997863769,
			},
		},
		pwe_reik2_conversation_group_two_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_two_04_a_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_two_04_a_01",
			},
			sound_events_duration = {
				[1] = 4.8346877098083,
			},
		},
		pwe_reik2_conversation_group_two_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_reik2_conversation_group_two_05_b_01",
			},
			sound_events = {
				[1] = "pwe_reik2_conversation_group_two_05_b_01",
			},
			sound_events_duration = {
				[1] = 6.8612084388733,
			},
		},
		pwh_reik2_conversation_group_one_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_one_01_a_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_one_01_a_01",
			},
			sound_events_duration = {
				[1] = 4.997624874115,
			},
		},
		pwh_reik2_conversation_group_one_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_one_02_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_one_02_b_01",
			},
			sound_events_duration = {
				[1] = 7.4470834732056,
			},
		},
		pwh_reik2_conversation_group_one_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_one_03_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_one_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.9169793128967,
			},
		},
		pwh_reik2_conversation_group_one_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_one_04_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_one_04_b_01",
			},
			sound_events_duration = {
				[1] = 4.3466458320618,
			},
		},
		pwh_reik2_conversation_group_one_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_one_05_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_one_05_b_01",
			},
			sound_events_duration = {
				[1] = 6.7082710266113,
			},
		},
		pwh_reik2_conversation_group_three_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_three_01_a_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_three_01_a_01",
			},
			sound_events_duration = {
				[1] = 5.2658748626709,
			},
		},
		pwh_reik2_conversation_group_three_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_three_02_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_three_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.3867707252502,
			},
		},
		pwh_reik2_conversation_group_three_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_three_03_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_three_03_b_01",
			},
			sound_events_duration = {
				[1] = 5.8948125839233,
			},
		},
		pwh_reik2_conversation_group_three_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_three_04_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_three_04_b_01",
			},
			sound_events_duration = {
				[1] = 6.6815414428711,
			},
		},
		pwh_reik2_conversation_group_three_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_three_05_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_three_05_b_01",
			},
			sound_events_duration = {
				[1] = 4.0982918739319,
			},
		},
		pwh_reik2_conversation_group_two_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_two_01_a_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_two_01_a_01",
			},
			sound_events_duration = {
				[1] = 5.980583190918,
			},
		},
		pwh_reik2_conversation_group_two_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_two_02_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_two_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.8540000915527,
			},
		},
		pwh_reik2_conversation_group_two_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_two_03_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_two_03_b_01",
			},
			sound_events_duration = {
				[1] = 8.2779998779297,
			},
		},
		pwh_reik2_conversation_group_two_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_two_04_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_two_04_b_01",
			},
			sound_events_duration = {
				[1] = 6.7299585342407,
			},
		},
		pwh_reik2_conversation_group_two_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_reikwald_river",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_reik2_conversation_group_two_05_b_01",
			},
			sound_events = {
				[1] = "pwh_reik2_conversation_group_two_05_b_01",
			},
			sound_events_duration = {
				[1] = 4.9186458587647,
			},
		},
	})
end
