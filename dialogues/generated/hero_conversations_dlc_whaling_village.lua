-- chunkname: @dialogues/generated/hero_conversations_dlc_whaling_village.lua

return function ()
	define_rule({
		name = "pbw_nm_village_03_gather_unique_01_b",
		response = "pbw_nm_village_03_gather_unique_01_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_03_gather_unique_01_a",
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
		name = "pbw_nm_village_03_gather_unique_01_d",
		response = "pbw_nm_village_03_gather_unique_01_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_03_gather_unique_01_c",
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
		name = "pbw_nm_village_08_ravine_unique_03_a",
		response = "pbw_nm_village_08_ravine_unique_03_a",
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
				"player_career",
				OP.EQ,
				"bw_necromancer",
			},
			{
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_03",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_03",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_nm_village_08_ravine_unique_03_c",
		response = "pbw_nm_village_08_ravine_unique_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_village_08_ravine_unique_03_b",
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
		name = "pbw_nm_village_08_ravine_unique_04_b",
		response = "pbw_nm_village_08_ravine_unique_04_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_08_ravine_unique_04_a",
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
		name = "pbw_nm_village_08_ravine_unique_04_d",
		response = "pbw_nm_village_08_ravine_unique_04_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_08_ravine_unique_04_c",
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
		name = "pbw_nm_village_08_ravine_unique_07_a",
		response = "pbw_nm_village_08_ravine_unique_07_a",
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
				"player_career",
				OP.EQ,
				"bw_necromancer",
			},
			{
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"witch_hunter",
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_07",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_07",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_nm_village_13_town_unique_03_a",
		response = "pbw_nm_village_13_town_unique_03_a",
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
				"player_career",
				OP.EQ,
				"bw_necromancer",
			},
			{
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_03",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_03",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_nm_village_13_town_unique_03_c",
		response = "pbw_nm_village_13_town_unique_03_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_13_town_unique_03_b",
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
		name = "pbw_nm_village_13_town_unique_03_e",
		response = "pbw_nm_village_13_town_unique_03_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_13_town_unique_03_d",
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
		name = "pbw_nm_village_13_town_unique_03_g",
		response = "pbw_nm_village_13_town_unique_03_g",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_13_town_unique_03_f",
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
		name = "pbw_nm_village_13_town_unique_07_a",
		response = "pbw_nm_village_13_town_unique_07_a",
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
				"player_career",
				OP.EQ,
				"bw_necromancer",
			},
			{
				"query_context",
				"friends_close",
				OP.GT,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_07",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_07",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_nm_village_13_town_unique_08_b",
		response = "pbw_nm_village_13_town_unique_08_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_village_13_town_unique_08_a",
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_nm_village_13_town_unique_08_f",
		response = "pbw_nm_village_13_town_unique_08_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_village_13_town_unique_08_e",
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_nm_village_17_team_01_b",
		response = "pbw_nm_village_17_team_01_b",
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
				"village_17_team_01_a",
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
		name = "pbw_nm_village_17_team_02_b",
		response = "pbw_nm_village_17_team_02_b",
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
				"village_17_team_02_a",
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
		name = "pbw_village_08_ravine_unique_01_g",
		response = "pbw_village_08_ravine_unique_01_g",
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
				"village_08_ravine_unique_01_f",
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
		name = "pbw_village_08_ravine_unique_09_a",
		response = "pbw_village_08_ravine_unique_09_a",
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
				"player_career",
				OP.NEQ,
				"bw_necromancer",
			},
			{
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_09",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_09",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_village_08_ravine_unique_09_c",
		response = "pbw_village_08_ravine_unique_09_c",
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
				"village_08_ravine_unique_09_b",
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
		name = "pbw_village_13_town_unique_09_b",
		response = "pbw_village_13_town_unique_09_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_13_town_unique_09_a",
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
		name = "pbw_village_13_town_unique_09_d",
		response = "pbw_village_13_town_unique_09_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_13_town_unique_09_c",
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
		name = "pbw_village_13_town_unique_10_a",
		response = "pbw_village_13_town_unique_10_a",
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
				"player_career",
				OP.NEQ,
				"bw_necromancer",
			},
			{
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_10",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_10",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_village_13_town_unique_10_c",
		response = "pbw_village_13_town_unique_10_c",
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
				"village_13_town_unique_10_b",
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
		name = "pbw_village_13_town_unique_11_a",
		response = "pbw_village_13_town_unique_11_a",
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
				"player_career",
				OP.NEQ,
				"bw_necromancer",
			},
			{
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_11",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_11",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_village_13_town_unique_11_c",
		response = "pbw_village_13_town_unique_11_c",
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
				"village_13_town_unique_11_b",
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
		name = "pbw_village_13_town_unique_12_b",
		response = "pbw_village_13_town_unique_12_b",
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
				"village_13_town_unique_12_a",
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
		name = "pbw_village_13_town_unique_12_d",
		response = "pbw_village_13_town_unique_12_d",
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
				"village_13_town_unique_12_c",
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
		name = "pbw_village_17_team_03_b",
		response = "pbw_village_17_team_03_b",
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
				"village_17_team_03_a",
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
		name = "pbw_village_21_elevator_ride_rant_01_b",
		response = "pbw_village_21_elevator_ride_rant_01_b",
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
				"village_21_elevator_ride_rant_01_a",
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
		name = "pbw_village_21_elevator_ride_rant_01_f",
		response = "pbw_village_21_elevator_ride_rant_01_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_01",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"village_21_elevator_ride_rant_01_e",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_01",
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
		name = "pbw_village_21_elevator_ride_rant_02_b",
		response = "pbw_village_21_elevator_ride_rant_02_b",
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
				"village_21_elevator_ride_rant_02_a",
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
		name = "pbw_village_21_elevator_ride_rant_02_f",
		response = "pbw_village_21_elevator_ride_rant_02_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_02",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"village_21_elevator_ride_rant_02_e",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_02",
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
		name = "pbw_village_21_elevator_ride_rant_03_b",
		response = "pbw_village_21_elevator_ride_rant_03_b",
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
				"village_21_elevator_ride_rant_03_a",
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
		name = "pbw_village_21_elevator_ride_rant_03_f",
		response = "pbw_village_21_elevator_ride_rant_03_f",
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
				"village_21_elevator_ride_rant_03_e",
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
		name = "pbw_village_21_elevator_ride_rant_04_a",
		response = "pbw_village_21_elevator_ride_rant_04_a",
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
				"village_21_elevator_ride_rant_a",
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
				OP.NEQ,
				"bw_necromancer",
			},
			{
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				0,
			},
			{
				"user_memory",
				"elevator_04_instigator",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_04",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_21_elevator_ride_rant_04",
				OP.ADD,
				1,
			},
			{
				"user_memory",
				"elevator_04_instigator",
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
		name = "pbw_village_21_elevator_ride_rant_04_c",
		response = "pbw_village_21_elevator_ride_rant_04_c",
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
				"village_21_elevator_ride_rant_04_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"elevator_04_instigator",
				OP.EQ,
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
		name = "pbw_village_21_elevator_ride_rant_04_e",
		response = "pbw_village_21_elevator_ride_rant_04_e",
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
				"village_21_elevator_ride_rant_04_d",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_memory",
				"elevator_04_instigator",
				OP.EQ,
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
		name = "pbw_village_22_elevator_ride_ends_a",
		response = "pbw_village_22_elevator_ride_ends_a",
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
				"village_22_elevator_ride_ends_a",
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
				0,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"user_memory",
				"elevator_04_instigator",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_04",
				OP.EQ,
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
		name = "pbw_village_27_factory_yard_unique_01_b",
		response = "pbw_village_27_factory_yard_unique_01_b",
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
				"village_27_factory_yard_unique_01_a",
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
		name = "pbw_village_27_factory_yard_unique_02_b",
		response = "pbw_village_27_factory_yard_unique_02_b",
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
				"village_27_factory_yard_unique_02_a",
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
		name = "pbw_village_27_factory_yard_unique_03_a",
		response = "pbw_village_27_factory_yard_unique_03_a",
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
				"player_career",
				OP.NEQ,
				"bw_necromancer",
			},
			{
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				7,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				4,
			},
			{
				"faction_memory",
				"village_27_factory_yard_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_27_factory_yard_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_village_27_factory_yard_unique_04_b",
		response = "pbw_village_27_factory_yard_unique_04_b",
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
				"village_27_factory_yard_unique_04_a",
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
		name = "pbw_village_27_factory_yard_unique_05_b",
		response = "pbw_village_27_factory_yard_unique_05_b",
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
				"village_27_factory_yard_unique_05_a",
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
		name = "pbw_village_36_onboard_01_b",
		response = "pbw_village_36_onboard_01_b",
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
				"village_36_onboard_01_a",
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
		name = "pbw_village_36_onboard_02_a",
		response = "pbw_village_36_onboard_02_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"village_36_onboard_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard_npc",
			},
		},
	})
	define_rule({
		name = "pbw_village_36_onboard_03_b",
		response = "pbw_village_36_onboard_03_b",
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
				"village_36_onboard_03_a",
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
		name = "pbw_village_36_onboard_04_b",
		response = "pbw_village_36_onboard_04_b",
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
				"village_36_onboard_04_a",
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
		name = "pdr_village_03_gather_unique_02_e",
		response = "pdr_village_03_gather_unique_02_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_03_gather_unique_02_d",
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
		name = "pdr_village_08_ravine_unique_03_b",
		response = "pdr_village_08_ravine_unique_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_08_ravine_unique_03_a",
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
		name = "pdr_village_08_ravine_unique_03_d",
		response = "pdr_village_08_ravine_unique_03_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_08_ravine_unique_03_c",
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
		name = "pdr_village_08_ravine_unique_04_g",
		response = "pdr_village_08_ravine_unique_04_g",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_village_08_ravine_unique_04_f",
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
		name = "pdr_village_08_ravine_unique_05_a",
		response = "pdr_village_08_ravine_unique_05_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_05",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_05",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_08_ravine_unique_05_c",
		response = "pdr_village_08_ravine_unique_05_c",
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
				"village_08_ravine_unique_05_b",
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
		name = "pdr_village_08_ravine_unique_07_c",
		response = "pdr_village_08_ravine_unique_07_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_08_ravine_unique_07_b",
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
		name = "pdr_village_08_ravine_unique_08_d",
		response = "pdr_village_08_ravine_unique_08_d",
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
				"village_08_ravine_unique_08_c",
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
		name = "pdr_village_13_town_unique_02_a",
		response = "pdr_village_13_town_unique_02_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
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
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_02",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_13_town_unique_02_c",
		response = "pdr_village_13_town_unique_02_c",
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
				"village_13_town_unique_02_b",
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
		name = "pdr_village_13_town_unique_02_e",
		response = "pdr_village_13_town_unique_02_e",
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
				"village_13_town_unique_02_d",
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
		name = "pdr_village_13_town_unique_04_b",
		response = "pdr_village_13_town_unique_04_b",
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
				"village_13_town_unique_04_a",
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
		name = "pdr_village_13_town_unique_04_d",
		response = "pdr_village_13_town_unique_04_d",
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
				"village_13_town_unique_04_c",
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
		name = "pdr_village_13_town_unique_04_f",
		response = "pdr_village_13_town_unique_04_f",
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
				"village_13_town_unique_04_e",
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
		name = "pdr_village_13_town_unique_06_b",
		response = "pdr_village_13_town_unique_06_b",
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
				"village_13_town_unique_06_a",
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
		name = "pdr_village_13_town_unique_06_d",
		response = "pdr_village_13_town_unique_06_d",
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
				"village_13_town_unique_06_c",
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
		name = "pdr_village_13_town_unique_06_f",
		response = "pdr_village_13_town_unique_06_f",
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
				"village_13_town_unique_06_e",
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
		name = "pdr_village_13_town_unique_08_d",
		response = "pdr_village_13_town_unique_08_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pes_village_13_town_unique_08_c",
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
		name = "pdr_village_13_town_unique_12_a",
		response = "pdr_village_13_town_unique_12_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_12",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_12",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_13_town_unique_12_c",
		response = "pdr_village_13_town_unique_12_c",
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
				"village_13_town_unique_12_b",
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
		name = "pdr_village_17_team_01_a",
		response = "pdr_village_17_team_01_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"village_17_team_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_17_team_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_17_team_01_b",
		response = "pdr_village_17_team_01_b",
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
				"village_17_team_01_a",
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
		name = "pdr_village_17_team_02_b",
		response = "pdr_village_17_team_02_b",
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
				"village_17_team_02_a",
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
		name = "pdr_village_17_team_03_a",
		response = "pdr_village_17_team_03_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
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
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"village_17_team_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_17_team_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_21_elevator_ride_rant_01_f",
		response = "pdr_village_21_elevator_ride_rant_01_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_01",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"village_21_elevator_ride_rant_01_e",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_01",
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
		name = "pdr_village_21_elevator_ride_rant_02_a",
		response = "pdr_village_21_elevator_ride_rant_02_a",
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
				"village_21_elevator_ride_rant_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_21_elevator_ride_rant_02",
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
		name = "pdr_village_21_elevator_ride_rant_02_c",
		response = "pdr_village_21_elevator_ride_rant_02_c",
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
				"village_21_elevator_ride_rant_02_b",
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
		name = "pdr_village_21_elevator_ride_rant_02_d",
		response = "pdr_village_21_elevator_ride_rant_02_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_village_21_elevator_ride_rant_02_c_01",
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
		name = "pdr_village_21_elevator_ride_rant_02_e",
		response = "pdr_village_21_elevator_ride_rant_02_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_village_21_elevator_ride_rant_02_d_01",
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
		name = "pdr_village_21_elevator_ride_rant_03_d",
		response = "pdr_village_21_elevator_ride_rant_03_d",
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
				"village_21_elevator_ride_rant_03_c",
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
		name = "pdr_village_21_elevator_ride_rant_04_d",
		response = "pdr_village_21_elevator_ride_rant_04_d",
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
				"village_21_elevator_ride_rant_04_c",
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
		name = "pdr_village_22_elevator_ride_ends_a",
		response = "pdr_village_22_elevator_ride_ends_a",
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
				"village_22_elevator_ride_ends_a",
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
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_02",
				OP.EQ,
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
		name = "pdr_village_27_factory_yard_unique_01_a",
		response = "pdr_village_27_factory_yard_unique_01_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				4,
			},
			{
				"user_context",
				"intensity",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				4,
			},
			{
				"faction_memory",
				"village_27_factory_yard_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_27_factory_yard_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_27_factory_yard_unique_01_b",
		response = "pdr_village_27_factory_yard_unique_01_b",
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
				"village_27_factory_yard_unique_01_a",
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
		name = "pdr_village_27_factory_yard_unique_02_b",
		response = "pdr_village_27_factory_yard_unique_02_b",
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
				"village_27_factory_yard_unique_02_a",
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
		name = "pdr_village_27_factory_yard_unique_03_b",
		response = "pdr_village_27_factory_yard_unique_03_b",
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
				"village_27_factory_yard_unique_03_a",
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
		name = "pdr_village_27_factory_yard_unique_04_b",
		response = "pdr_village_27_factory_yard_unique_04_b",
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
				"village_27_factory_yard_unique_04_a",
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
		name = "pdr_village_27_factory_yard_unique_05_a",
		response = "pdr_village_27_factory_yard_unique_05_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
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
				"global_context",
				"bw_necromancer",
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
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				4,
			},
			{
				"faction_memory",
				"village_27_factory_yard_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_27_factory_yard_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_village_36_onboard_01_b",
		response = "pdr_village_36_onboard_01_b",
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
				"village_36_onboard_01_a",
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
		name = "pdr_village_36_onboard_03_a",
		response = "pdr_village_36_onboard_03_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"village_36_onboard_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger_npc",
			},
		},
	})
	define_rule({
		name = "pdr_village_36_onboard_04_b",
		response = "pdr_village_36_onboard_04_b",
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
				"village_36_onboard_04_a",
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
		name = "pes_village_03_gather_unique_02_e",
		response = "pes_village_03_gather_unique_02_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_03_gather_unique_02_d",
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
		name = "pes_village_08_ravine_unique_01_a",
		response = "pes_village_08_ravine_unique_01_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
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
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_01",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_village_08_ravine_unique_01_c",
		response = "pes_village_08_ravine_unique_01_c",
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
				"village_08_ravine_unique_01_b",
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
		name = "pes_village_08_ravine_unique_01_e",
		response = "pes_village_08_ravine_unique_01_e",
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
				"village_08_ravine_unique_01_d",
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
		name = "pes_village_08_ravine_unique_04_g",
		response = "pes_village_08_ravine_unique_04_g",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_village_08_ravine_unique_04_f",
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
		name = "pes_village_08_ravine_unique_05_b",
		response = "pes_village_08_ravine_unique_05_b",
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
				"village_08_ravine_unique_05_a",
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
		name = "pes_village_08_ravine_unique_05_d",
		response = "pes_village_08_ravine_unique_05_d",
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
				"village_08_ravine_unique_05_c",
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
		name = "pes_village_08_ravine_unique_06_c",
		response = "pes_village_08_ravine_unique_06_c",
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
				"village_08_ravine_unique_06_b",
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
		name = "pes_village_08_ravine_unique_08_a",
		response = "pes_village_08_ravine_unique_08_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
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
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_08",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_08",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_village_08_ravine_unique_08_c",
		response = "pes_village_08_ravine_unique_08_c",
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
				"village_08_ravine_unique_08_b",
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
		name = "pes_village_13_town_unique_01_a",
		response = "pes_village_13_town_unique_01_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
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
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_01",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_village_13_town_unique_01_c",
		response = "pes_village_13_town_unique_01_c",
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
				"village_13_town_unique_01_b",
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
		name = "pes_village_13_town_unique_01_d",
		response = "pes_village_13_town_unique_01_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_village_13_town_unique_01_c_01",
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
		name = "pes_village_13_town_unique_01_f",
		response = "pes_village_13_town_unique_01_f",
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
				"village_13_town_unique_01_e",
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
		name = "pes_village_13_town_unique_04_a",
		response = "pes_village_13_town_unique_04_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
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
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_04",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_04",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_village_13_town_unique_04_c",
		response = "pes_village_13_town_unique_04_c",
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
				"village_13_town_unique_04_b",
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
		name = "pes_village_13_town_unique_04_e",
		response = "pes_village_13_town_unique_04_e",
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
				"village_13_town_unique_04_d",
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
		name = "pes_village_13_town_unique_05_a",
		response = "pes_village_13_town_unique_05_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
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
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_05",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_05",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_village_13_town_unique_05_c",
		response = "pes_village_13_town_unique_05_c",
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
				"village_13_town_unique_05_b",
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
		name = "pes_village_13_town_unique_05_e",
		response = "pes_village_13_town_unique_05_e",
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
				"village_13_town_unique_05_d",
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
		name = "pes_village_13_town_unique_07_c",
		response = "pes_village_13_town_unique_07_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_13_town_unique_07_b",
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
		name = "pes_village_13_town_unique_08_c",
		response = "pes_village_13_town_unique_08_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_13_town_unique_08_b",
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
		name = "pes_village_13_town_unique_10_b",
		response = "pes_village_13_town_unique_10_b",
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
				"village_13_town_unique_10_a",
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
		name = "pes_village_13_town_unique_10_d",
		response = "pes_village_13_town_unique_10_d",
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
				"village_13_town_unique_10_c",
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
		name = "pes_village_17_team_01_a",
		response = "pes_village_17_team_01_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				7,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"village_17_team_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_17_team_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_village_17_team_02_b",
		response = "pes_village_17_team_02_b",
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
				"village_17_team_02_a",
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
		name = "pes_village_17_team_03_b",
		response = "pes_village_17_team_03_b",
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
				"village_17_team_03_a",
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
		name = "pes_village_21_elevator_ride_rant_01_a",
		response = "pes_village_21_elevator_ride_rant_01_a",
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
				"village_21_elevator_ride_rant_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_01",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_21_elevator_ride_rant_01",
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
		name = "pes_village_21_elevator_ride_rant_01_c",
		response = "pes_village_21_elevator_ride_rant_01_c",
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
				"village_21_elevator_ride_rant_01_b",
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
		name = "pes_village_21_elevator_ride_rant_01_d",
		response = "pes_village_21_elevator_ride_rant_01_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_village_21_elevator_ride_rant_01_c_01",
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
		name = "pes_village_21_elevator_ride_rant_01_e",
		response = "pes_village_21_elevator_ride_rant_01_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak_self",
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_village_21_elevator_ride_rant_01_d_01",
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
		name = "pes_village_21_elevator_ride_rant_03_b",
		response = "pes_village_21_elevator_ride_rant_03_b",
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
				"village_21_elevator_ride_rant_03_a",
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
		name = "pes_village_21_elevator_ride_rant_03_f",
		response = "pes_village_21_elevator_ride_rant_03_f",
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
				"village_21_elevator_ride_rant_03_e",
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
		name = "pes_village_21_elevator_ride_rant_04_b",
		response = "pes_village_21_elevator_ride_rant_04_b",
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
				"village_21_elevator_ride_rant_04_a",
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
		name = "pes_village_21_elevator_ride_rant_04_d",
		response = "pes_village_21_elevator_ride_rant_04_d",
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
				"village_21_elevator_ride_rant_04_c",
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
		name = "pes_village_22_elevator_ride_ends_a",
		response = "pes_village_22_elevator_ride_ends_a",
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
				"village_22_elevator_ride_ends_a",
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
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_01",
				OP.EQ,
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
		name = "pes_village_27_factory_yard_unique_01_a",
		response = "pes_village_27_factory_yard_unique_01_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				7,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				4,
			},
			{
				"faction_memory",
				"village_27_factory_yard_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_27_factory_yard_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_village_27_factory_yard_unique_02_b",
		response = "pes_village_27_factory_yard_unique_02_b",
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
				"village_27_factory_yard_unique_02_a",
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
		name = "pes_village_27_factory_yard_unique_03_b",
		response = "pes_village_27_factory_yard_unique_03_b",
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
				"village_27_factory_yard_unique_03_a",
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
		name = "pes_village_27_factory_yard_unique_04_b",
		response = "pes_village_27_factory_yard_unique_04_b",
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
				"village_27_factory_yard_unique_04_a",
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
		name = "pes_village_27_factory_yard_unique_05_a",
		response = "pes_village_27_factory_yard_unique_05_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
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
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				4,
			},
			{
				"faction_memory",
				"village_27_factory_yard_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_27_factory_yard_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_village_27_factory_yard_unique_05_b",
		response = "pes_village_27_factory_yard_unique_05_b",
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
				"village_27_factory_yard_unique_05_a",
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
		name = "pes_village_36_onboard_05_a",
		response = "pes_village_36_onboard_05_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"village_36_onboard_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier_npc",
			},
		},
	})
	define_rule({
		name = "pwe_village_03_gather_unique_02_a",
		response = "pwe_village_03_gather_unique_02_a",
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
				"village_03_gather_a",
			},
			{
				"query_context",
				"friends_close",
				OP.GT,
				2,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
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
				"village_03_gather_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_03_gather_a",
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
		name = "pwe_village_03_gather_unique_02_c",
		response = "pwe_village_03_gather_unique_02_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_03_gather_unique_02_b",
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
		name = "pwe_village_08_ravine_unique_02_a",
		response = "pwe_village_08_ravine_unique_02_a",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
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
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_02",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_02",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_village_08_ravine_unique_02_c",
		response = "pwe_village_08_ravine_unique_02_c",
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
				"village_08_ravine_unique_02_b",
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
		name = "pwe_village_08_ravine_unique_02_e",
		response = "pwe_village_08_ravine_unique_02_e",
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
				"village_08_ravine_unique_02_d",
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
		name = "pwe_village_08_ravine_unique_04_f",
		response = "pwe_village_08_ravine_unique_04_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_08_ravine_unique_04_e",
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
		name = "pwe_village_08_ravine_unique_06_a",
		response = "pwe_village_08_ravine_unique_06_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
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
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_06",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_06",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_village_08_ravine_unique_09_b",
		response = "pwe_village_08_ravine_unique_09_b",
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
				"village_08_ravine_unique_09_a",
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
		name = "pwe_village_08_ravine_unique_09_d",
		response = "pwe_village_08_ravine_unique_09_d",
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
				"village_08_ravine_unique_09_c",
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
		name = "pwe_village_13_town_unique_02_b",
		response = "pwe_village_13_town_unique_02_b",
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
				"village_13_town_unique_02_a",
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
		name = "pwe_village_13_town_unique_02_d",
		response = "pwe_village_13_town_unique_02_d",
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
				"village_13_town_unique_02_c",
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
		name = "pwe_village_13_town_unique_02_f",
		response = "pwe_village_13_town_unique_02_f",
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
				"village_13_town_unique_02_e",
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
		name = "pwe_village_13_town_unique_05_b",
		response = "pwe_village_13_town_unique_05_b",
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
				"village_13_town_unique_05_a",
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
		name = "pwe_village_13_town_unique_05_d",
		response = "pwe_village_13_town_unique_05_d",
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
				"village_13_town_unique_05_c",
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
		name = "pwe_village_13_town_unique_05_f",
		response = "pwe_village_13_town_unique_05_f",
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
				"village_13_town_unique_05_e",
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
		name = "pwe_village_13_town_unique_07_c",
		response = "pwe_village_13_town_unique_07_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_village_13_town_unique_07_b",
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
		name = "pwe_village_13_town_unique_08_a",
		response = "pwe_village_13_town_unique_08_a",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
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
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_08",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_08",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_village_13_town_unique_08_e",
		response = "pwe_village_13_town_unique_08_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_village_13_town_unique_08_d",
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
		name = "pwe_village_13_town_unique_08_g",
		response = "pwe_village_13_town_unique_08_g",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_13_town_unique_08_f",
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
		name = "pwe_village_13_town_unique_11_b",
		response = "pwe_village_13_town_unique_11_b",
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
				"village_13_town_unique_11_a",
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
		name = "pwe_village_13_town_unique_11_d",
		response = "pwe_village_13_town_unique_11_d",
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
				"village_13_town_unique_11_c",
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
		name = "pwe_village_17_team_01_b",
		response = "pwe_village_17_team_01_b",
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
				"village_17_team_01_a",
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
		name = "pwe_village_17_team_02_b",
		response = "pwe_village_17_team_02_b",
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
				"village_17_team_02_a",
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
		name = "pwe_village_17_team_03_b",
		response = "pwe_village_17_team_03_b",
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
				"village_17_team_03_a",
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
		name = "pwe_village_21_elevator_ride_rant_01_b",
		response = "pwe_village_21_elevator_ride_rant_01_b",
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
				"village_21_elevator_ride_rant_01_a",
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
		name = "pwe_village_21_elevator_ride_rant_01_f",
		response = "pwe_village_21_elevator_ride_rant_01_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_01",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"village_21_elevator_ride_rant_01_e",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_01",
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
		name = "pwe_village_21_elevator_ride_rant_02_b",
		response = "pwe_village_21_elevator_ride_rant_02_b",
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
				"village_21_elevator_ride_rant_02_a",
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
		name = "pwe_village_21_elevator_ride_rant_02_f",
		response = "pwe_village_21_elevator_ride_rant_02_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_02",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"village_21_elevator_ride_rant_02_e",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_02",
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
		name = "pwe_village_21_elevator_ride_rant_03_b",
		response = "pwe_village_21_elevator_ride_rant_03_b",
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
				"village_21_elevator_ride_rant_03_a",
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
		name = "pwe_village_21_elevator_ride_rant_03_f",
		response = "pwe_village_21_elevator_ride_rant_03_f",
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
				"village_21_elevator_ride_rant_03_e",
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
		name = "pwe_village_21_elevator_ride_rant_04_a",
		response = "pwe_village_21_elevator_ride_rant_04_a",
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
				"village_21_elevator_ride_rant",
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
				"query_context",
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
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"user_memory",
				"elevator_04_instigator",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_04",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_21_elevator_ride_rant_04",
				OP.ADD,
				1,
			},
			{
				"user_memory",
				"elevator_04_instigator",
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
		name = "pwe_village_21_elevator_ride_rant_04_c",
		response = "pwe_village_21_elevator_ride_rant_04_c",
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
				"village_21_elevator_ride_rant_04_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"elevator_04_instigator",
				OP.EQ,
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
		name = "pwe_village_21_elevator_ride_rant_04_e",
		response = "pwe_village_21_elevator_ride_rant_04_e",
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
				"village_21_elevator_ride_rant_04_d",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"user_memory",
				"elevator_04_instigator",
				OP.EQ,
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
		name = "pwe_village_22_elevator_ride_ends_a",
		response = "pwe_village_22_elevator_ride_ends_a",
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
				"village_22_elevator_ride_ends_a",
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
				0,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"user_memory",
				"elevator_04_instigator",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_04",
				OP.EQ,
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
		name = "pwe_village_27_factory_yard_unique_01_b",
		response = "pwe_village_27_factory_yard_unique_01_b",
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
				"village_27_factory_yard_unique_01_a",
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
		name = "pwe_village_27_factory_yard_unique_02_b",
		response = "pwe_village_27_factory_yard_unique_02_b",
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
				"village_27_factory_yard_unique_02_a",
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
		name = "pwe_village_27_factory_yard_unique_03_b",
		response = "pwe_village_27_factory_yard_unique_03_b",
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
				"village_27_factory_yard_unique_03_a",
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
		name = "pwe_village_27_factory_yard_unique_04_a",
		response = "pwe_village_27_factory_yard_unique_04_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
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
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				4,
			},
			{
				"faction_memory",
				"village_27_factory_yard_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_27_factory_yard_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_village_27_factory_yard_unique_05_b",
		response = "pwe_village_27_factory_yard_unique_05_b",
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
				"village_27_factory_yard_unique_05_a",
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
		name = "pwe_village_36_onboard_02_b",
		response = "pwe_village_36_onboard_02_b",
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
				"village_36_onboard_02_a",
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
		name = "pwe_village_36_onboard_04_a",
		response = "pwe_village_36_onboard_04_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"village_36_onboard_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf_npc",
			},
		},
	})
	define_rule({
		name = "pwe_village_36_onboard_05_b",
		response = "pwe_village_36_onboard_05_b",
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
				"village_36_onboard_05_a",
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
		name = "pwh_village_03_gather_unique_01_a",
		response = "pwh_village_03_gather_unique_01_a",
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
				"village_03_gather_a",
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
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
				"village_03_gather_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_03_gather_a",
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
		name = "pwh_village_03_gather_unique_01_c",
		response = "pwh_village_03_gather_unique_01_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_03_gather_unique_01_b",
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
		name = "pwh_village_03_gather_unique_01_e",
		response = "pwh_village_03_gather_unique_01_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_03_gather_unique_01_d",
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
		name = "pwh_village_03_gather_unique_02_b",
		response = "pwh_village_03_gather_unique_02_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_village_03_gather_unique_02_a",
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
		name = "pwh_village_03_gather_unique_02_d",
		response = "pwh_village_03_gather_unique_02_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_village_03_gather_unique_02_c",
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
		name = "pwh_village_08_ravine_unique_01_b",
		response = "pwh_village_08_ravine_unique_01_b",
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
				"village_08_ravine_unique_01_a",
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
		name = "pwh_village_08_ravine_unique_01_d",
		response = "pwh_village_08_ravine_unique_01_d",
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
				"village_08_ravine_unique_01_c",
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
		name = "pwh_village_08_ravine_unique_01_f",
		response = "pwh_village_08_ravine_unique_01_f",
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
				"village_08_ravine_unique_01_e",
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
		name = "pwh_village_08_ravine_unique_02_b",
		response = "pwh_village_08_ravine_unique_02_b",
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
				"village_08_ravine_unique_02_a",
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
		name = "pwh_village_08_ravine_unique_02_d",
		response = "pwh_village_08_ravine_unique_02_d",
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
				"village_08_ravine_unique_02_c",
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
		name = "pwh_village_08_ravine_unique_02_f",
		response = "pwh_village_08_ravine_unique_02_f",
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
				"village_08_ravine_unique_02_e",
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
		name = "pwh_village_08_ravine_unique_04_a",
		response = "pwh_village_08_ravine_unique_04_a",
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
				"query_context",
				"friends_close",
				OP.GT,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				5,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
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
				"dialogue_zone",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"ravine_conversation_04",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ravine_conversation_04",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_08_ravine_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_village_08_ravine_unique_04_c",
		response = "pwh_village_08_ravine_unique_04_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_08_ravine_unique_04_b",
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
		name = "pwh_village_08_ravine_unique_04_e",
		response = "pwh_village_08_ravine_unique_04_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_08_ravine_unique_04_d",
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
		name = "pwh_village_08_ravine_unique_06_b",
		response = "pwh_village_08_ravine_unique_06_b",
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
				"village_08_ravine_unique_06_a",
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
		name = "pwh_village_08_ravine_unique_07_b",
		response = "pwh_village_08_ravine_unique_07_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_08_ravine_unique_07_a",
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
		name = "pwh_village_08_ravine_unique_08_b",
		response = "pwh_village_08_ravine_unique_08_b",
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
				"village_08_ravine_unique_08_a",
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
		name = "pwh_village_08_ravine_unique_08_d",
		response = "pwh_village_08_ravine_unique_08_d",
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
				"village_08_ravine_unique_08_c",
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
		name = "pwh_village_13_town_unique_01_b",
		response = "pwh_village_13_town_unique_01_b",
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
				"village_13_town_unique_01_a",
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
		name = "pwh_village_13_town_unique_01_e",
		response = "pwh_village_13_town_unique_01_e",
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
				"village_13_town_unique_01_d",
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
		name = "pwh_village_13_town_unique_03_b",
		response = "pwh_village_13_town_unique_03_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_13_town_unique_03_a",
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
		name = "pwh_village_13_town_unique_03_d",
		response = "pwh_village_13_town_unique_03_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_13_town_unique_03_c",
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
		name = "pwh_village_13_town_unique_03_f",
		response = "pwh_village_13_town_unique_03_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_13_town_unique_03_e",
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
		name = "pwh_village_13_town_unique_06_a",
		response = "pwh_village_13_town_unique_06_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
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
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_06",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_06",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_village_13_town_unique_06_c",
		response = "pwh_village_13_town_unique_06_c",
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
				"village_13_town_unique_06_b",
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
		name = "pwh_village_13_town_unique_06_e",
		response = "pwh_village_13_town_unique_06_e",
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
				"village_13_town_unique_06_d",
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
		name = "pwh_village_13_town_unique_07_b",
		response = "pwh_village_13_town_unique_07_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_nm_village_13_town_unique_07_a",
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
		name = "pwh_village_13_town_unique_07_d",
		response = "pwh_village_13_town_unique_07_d",
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
				"village_13_town_unique_07_c",
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
		name = "pwh_village_13_town_unique_09_a",
		response = "pwh_village_13_town_unique_09_a",
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
				"query_context",
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
				"user_context",
				"intensity",
				OP.LT,
				5,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				2,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.LT,
				2,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
			},
			{
				"faction_memory",
				"town_conversation_09",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"town_conversation_09",
				OP.ADD,
				1,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMESET,
			},
			{
				"faction_memory",
				"village_13_town_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_village_13_town_unique_09_c",
		response = "pwh_village_13_town_unique_09_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_village_13_town_unique_09_b",
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
		name = "pwh_village_17_team_01_b",
		response = "pwh_village_17_team_01_b",
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
				"village_17_team_01_a",
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
		name = "pwh_village_17_team_02_a",
		response = "pwh_village_17_team_02_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				2,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				7,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				3,
			},
			{
				"faction_memory",
				"village_17_team_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_17_team_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_village_17_team_03_b",
		response = "pwh_village_17_team_03_b",
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
				"village_17_team_03_a",
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
		name = "pwh_village_21_elevator_ride_rant_01_b",
		response = "pwh_village_21_elevator_ride_rant_01_b",
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
				"village_21_elevator_ride_rant_01_a",
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
		name = "pwh_village_21_elevator_ride_rant_01_f",
		response = "pwh_village_21_elevator_ride_rant_01_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_01",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"village_21_elevator_ride_rant_01_e",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_01",
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
		name = "pwh_village_21_elevator_ride_rant_02_b",
		response = "pwh_village_21_elevator_ride_rant_02_b",
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
				"village_21_elevator_ride_rant_02_a",
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
		name = "pwh_village_21_elevator_ride_rant_02_f",
		response = "pwh_village_21_elevator_ride_rant_02_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_02",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"village_21_elevator_ride_rant_02_e",
				CombiningOP.OR_NEXT,
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"elevator_rant_multiple_response_trigger_02",
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
		name = "pwh_village_21_elevator_ride_rant_03_a",
		response = "pwh_village_21_elevator_ride_rant_03_a",
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
				"village_21_elevator_ride_rant_a",
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
				"query_context",
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
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_03",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"village_21_elevator_ride_rant_03",
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
		name = "pwh_village_21_elevator_ride_rant_03_c",
		response = "pwh_village_21_elevator_ride_rant_03_c",
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
				"village_21_elevator_ride_rant_03_b",
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
		name = "pwh_village_21_elevator_ride_rant_03_e",
		response = "pwh_village_21_elevator_ride_rant_03_e",
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
				"village_21_elevator_ride_rant_03_d",
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
		name = "pwh_village_22_elevator_ride_ends_a",
		response = "pwh_village_22_elevator_ride_ends_a",
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
				"village_22_elevator_ride_ends_a",
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
				1,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"village_21_elevator_ride_rant_03",
				OP.EQ,
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
		name = "pwh_village_27_factory_yard_unique_01_b",
		response = "pwh_village_27_factory_yard_unique_01_b",
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
				"village_27_factory_yard_unique_01_a",
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
		name = "pwh_village_27_factory_yard_unique_02_a",
		response = "pwh_village_27_factory_yard_unique_02_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				7,
			},
			{
				"global_context",
				"bw_necromancer",
				OP.EQ,
				1,
				CombiningOP.OR_NEXT,
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				4,
			},
			{
				"faction_memory",
				"village_27_factory_yard_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_27_factory_yard_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_village_27_factory_yard_unique_03_b",
		response = "pwh_village_27_factory_yard_unique_03_b",
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
				"village_27_factory_yard_unique_03_a",
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
		name = "pwh_village_27_factory_yard_unique_04_a",
		response = "pwh_village_27_factory_yard_unique_04_a",
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
				"query_context",
				"friends_close",
				OP.GTEQ,
				1,
			},
			{
				"user_context",
				"enemies_close",
				OP.LT,
				6,
			},
			{
				"user_context",
				"intensity",
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
				"global_context",
				"bw_necromancer",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"dialogue_zone",
				OP.EQ,
				4,
			},
			{
				"faction_memory",
				"village_27_factory_yard_conversations",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"time_since_conversation",
				OP.TIMEDIFF,
				OP.GT,
				100,
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
				"village_27_factory_yard_conversations",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_village_36_onboard_01_a",
		response = "pwh_village_36_onboard_01_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"village_36_onboard_a",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter_npc",
			},
		},
	})
	define_rule({
		name = "pwh_village_36_onboard_02_b",
		response = "pwh_village_36_onboard_02_b",
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
				"village_36_onboard_02_a",
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
		name = "pwh_village_36_onboard_03_b",
		response = "pwh_village_36_onboard_03_b",
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
				"village_36_onboard_03_a",
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
		name = "pwh_village_36_onboard_05_b",
		response = "pwh_village_36_onboard_05_b",
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
				"village_36_onboard_05_a",
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
		pbw_nm_village_03_gather_unique_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
				[2] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pbw_nm_village_03_gather_unique_01_b_01",
				[2] = "pbw_nm_village_03_gather_unique_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_nm_village_03_gather_unique_01_b_01",
				[2] = "pbw_nm_village_03_gather_unique_01_b_02",
			},
			sound_events_duration = {
				[1] = 3.3017292022705,
				[2] = 3.4655001163483,
			},
		},
		pbw_nm_village_03_gather_unique_01_d = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_nm_village_03_gather_unique_01_d_01",
				[2] = "pbw_nm_village_03_gather_unique_01_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_nm_village_03_gather_unique_01_d_01",
				[2] = "pbw_nm_village_03_gather_unique_01_d_02",
			},
			sound_events_duration = {
				[1] = 3.1160624027252,
				[2] = 3.0464375019074,
			},
		},
		pbw_nm_village_08_ravine_unique_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pbw_nm_village_08_ravine_unique_03_a_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_08_ravine_unique_03_a_01",
			},
			sound_events_duration = {
				[1] = 6.1546249389648,
			},
		},
		pbw_nm_village_08_ravine_unique_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pbw_nm_village_08_ravine_unique_03_c_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_08_ravine_unique_03_c_01",
			},
			sound_events_duration = {
				[1] = 4.3599166870117,
			},
		},
		pbw_nm_village_08_ravine_unique_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pbw_nm_village_08_ravine_unique_04_b_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_08_ravine_unique_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.7065832614899,
			},
		},
		pbw_nm_village_08_ravine_unique_04_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_nm_village_08_ravine_unique_04_d_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_08_ravine_unique_04_d_01",
			},
			sound_events_duration = {
				[1] = 5.4282083511353,
			},
		},
		pbw_nm_village_08_ravine_unique_07_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_nm_village_08_ravine_unique_07_a_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_08_ravine_unique_07_a_01",
			},
			sound_events_duration = {
				[1] = 4.1417293548584,
			},
		},
		pbw_nm_village_13_town_unique_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pbw_nm_village_13_town_unique_03_a_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_13_town_unique_03_a_01",
			},
			sound_events_duration = {
				[1] = 3.1719791889191,
			},
		},
		pbw_nm_village_13_town_unique_03_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pbw_nm_village_13_town_unique_03_c_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_13_town_unique_03_c_01",
			},
			sound_events_duration = {
				[1] = 2.8164792060852,
			},
		},
		pbw_nm_village_13_town_unique_03_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
			},
			localization_strings = {
				[1] = "pbw_nm_village_13_town_unique_03_e_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_13_town_unique_03_e_01",
			},
			sound_events_duration = {
				[1] = 5.9108543395996,
			},
		},
		pbw_nm_village_13_town_unique_03_g = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pbw_nm_village_13_town_unique_03_g_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_13_town_unique_03_g_01",
			},
			sound_events_duration = {
				[1] = 2.913229227066,
			},
		},
		pbw_nm_village_13_town_unique_07_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_nm_village_13_town_unique_07_a_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_13_town_unique_07_a_01",
			},
			sound_events_duration = {
				[1] = 4.8819999694824,
			},
		},
		pbw_nm_village_13_town_unique_08_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_nm_village_13_town_unique_08_b_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_13_town_unique_08_b_01",
			},
			sound_events_duration = {
				[1] = 2.7002499103546,
			},
		},
		pbw_nm_village_13_town_unique_08_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_nervous",
			},
			localization_strings = {
				[1] = "pbw_nm_village_13_town_unique_08_f_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_13_town_unique_08_f_01",
			},
			sound_events_duration = {
				[1] = 1.7149791717529,
			},
		},
		pbw_nm_village_17_team_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_nm_village_17_team_01_b_01",
				[2] = "pbw_nm_village_17_team_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_nm_village_17_team_01_b_01",
				[2] = "pbw_nm_village_17_team_01_b_02",
			},
			sound_events_duration = {
				[1] = 5.4147500991821,
				[2] = 4.1185626983643,
			},
		},
		pbw_nm_village_17_team_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
				[2] = "face_curious",
			},
			localization_strings = {
				[1] = "pbw_nm_village_17_team_02_b_01",
				[2] = "pbw_nm_village_17_team_02_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_nm_village_17_team_02_b_01",
				[2] = "pbw_nm_village_17_team_02_b_02",
			},
			sound_events_duration = {
				[1] = 2.154375076294,
				[2] = 3.9252083301544,
			},
		},
		pbw_village_08_ravine_unique_01_g = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_village_08_ravine_unique_01_g_01",
			},
			sound_events = {
				[1] = "pbw_village_08_ravine_unique_01_g_01",
			},
			sound_events_duration = {
				[1] = 2.4157292842865,
			},
		},
		pbw_village_08_ravine_unique_09_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_08_ravine_unique_09_a_01",
			},
			sound_events = {
				[1] = "pbw_village_08_ravine_unique_09_a_01",
			},
			sound_events_duration = {
				[1] = 5.3875207901001,
			},
		},
		pbw_village_08_ravine_unique_09_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_08_ravine_unique_09_c_01",
			},
			sound_events = {
				[1] = "pbw_village_08_ravine_unique_09_c_01",
			},
			sound_events_duration = {
				[1] = 3.3854582309723,
			},
		},
		pbw_village_13_town_unique_09_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pbw_village_13_town_unique_09_b_01",
			},
			sound_events = {
				[1] = "pbw_village_13_town_unique_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.1960833072662,
			},
		},
		pbw_village_13_town_unique_09_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_13_town_unique_09_d_01",
			},
			sound_events = {
				[1] = "pbw_village_13_town_unique_09_d_01",
			},
			sound_events_duration = {
				[1] = 2.7080833911896,
			},
		},
		pbw_village_13_town_unique_10_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_sadness",
			},
			localization_strings = {
				[1] = "pbw_village_13_town_unique_10_a_01",
			},
			sound_events = {
				[1] = "pbw_village_13_town_unique_10_a_01",
			},
			sound_events_duration = {
				[1] = 5.5308957099915,
			},
		},
		pbw_village_13_town_unique_10_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pbw_village_13_town_unique_10_c_01",
			},
			sound_events = {
				[1] = "pbw_village_13_town_unique_10_c_01",
			},
			sound_events_duration = {
				[1] = 4.965208530426,
			},
		},
		pbw_village_13_town_unique_11_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_village_13_town_unique_11_a_01",
			},
			sound_events = {
				[1] = "pbw_village_13_town_unique_11_a_01",
			},
			sound_events_duration = {
				[1] = 4.603937625885,
			},
		},
		pbw_village_13_town_unique_11_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_13_town_unique_11_c_01",
			},
			sound_events = {
				[1] = "pbw_village_13_town_unique_11_c_01",
			},
			sound_events_duration = {
				[1] = 2.0811250209808,
			},
		},
		pbw_village_13_town_unique_12_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_13_town_unique_12_b_01",
			},
			sound_events = {
				[1] = "pbw_village_13_town_unique_12_b_01",
			},
			sound_events_duration = {
				[1] = 4.5058331489563,
			},
		},
		pbw_village_13_town_unique_12_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_13_town_unique_12_d_01",
			},
			sound_events = {
				[1] = "pbw_village_13_town_unique_12_d_01",
			},
			sound_events_duration = {
				[1] = 5.7895832061768,
			},
		},
		pbw_village_17_team_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_17_team_03_b_01",
				[2] = "pbw_village_17_team_03_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_village_17_team_03_b_01",
				[2] = "pbw_village_17_team_03_b_02",
			},
			sound_events_duration = {
				[1] = 2.5889375209808,
				[2] = 5.4554581642151,
			},
		},
		pbw_village_21_elevator_ride_rant_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pbw_nm_village_21_elevator_ride_rant_01_b_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_21_elevator_ride_rant_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.6875624656677,
			},
		},
		pbw_village_21_elevator_ride_rant_01_f = {
			additional_trigger_heard = "elevator_rant_multiple_response_trigger_01",
			category = "level_talk_must_play_multiple",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_nm_village_21_elevator_ride_rant_01_f_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_21_elevator_ride_rant_01_f_01",
			},
			sound_events_duration = {
				[1] = 1.4651875495911,
			},
		},
		pbw_village_21_elevator_ride_rant_02_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pbw_nm_village_21_elevator_ride_rant_02_b_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_21_elevator_ride_rant_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.0677499771118,
			},
		},
		pbw_village_21_elevator_ride_rant_02_f = {
			additional_trigger_heard = "elevator_rant_multiple_response_trigger_02",
			category = "level_talk_must_play_multiple",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pbw_nm_village_21_elevator_ride_rant_02_f_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_21_elevator_ride_rant_02_f_01",
			},
			sound_events_duration = {
				[1] = 2.5753750801086,
			},
		},
		pbw_village_21_elevator_ride_rant_03_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
			},
			localization_strings = {
				[1] = "pbw_village_21_elevator_ride_rant_03_b_01",
			},
			sound_events = {
				[1] = "pbw_village_21_elevator_ride_rant_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.0510416030884,
			},
		},
		pbw_village_21_elevator_ride_rant_03_f = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_21_elevator_ride_rant_03_f_01",
			},
			sound_events = {
				[1] = "pbw_village_21_elevator_ride_rant_03_f_01",
			},
			sound_events_duration = {
				[1] = 1.6973541975021,
			},
		},
		pbw_village_21_elevator_ride_rant_04_a = {
			category = "cut_scene_interrupt_three",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pbw_village_21_elevator_ride_rant_04_a_01",
			},
			sound_events = {
				[1] = "pbw_village_21_elevator_ride_rant_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.0672082901001,
			},
		},
		pbw_village_21_elevator_ride_rant_04_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_village_21_elevator_ride_rant_04_c_01",
			},
			sound_events = {
				[1] = "pbw_village_21_elevator_ride_rant_04_c_01",
			},
			sound_events_duration = {
				[1] = 6.9186873435974,
			},
		},
		pbw_village_21_elevator_ride_rant_04_e = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_21_elevator_ride_rant_04_e_01",
			},
			sound_events = {
				[1] = "pbw_village_21_elevator_ride_rant_04_e_01",
			},
			sound_events_duration = {
				[1] = 3.9404375553131,
			},
		},
		pbw_village_22_elevator_ride_ends_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_surprise",
			},
			localization_strings = {
				[1] = "pbw_village_22_elevator_ride_ends_a_01",
			},
			sound_events = {
				[1] = "pbw_village_22_elevator_ride_ends_a_01",
			},
			sound_events_duration = {
				[1] = 2.2388124465942,
			},
		},
		pbw_village_27_factory_yard_unique_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_nm_village_27_factory_yard_unique_01_b_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_27_factory_yard_unique_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.3013541698456,
			},
		},
		pbw_village_27_factory_yard_unique_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pbw_nm_village_27_factory_yard_unique_02_b_01",
			},
			sound_events = {
				[1] = "pbw_nm_village_27_factory_yard_unique_02_b_01",
			},
			sound_events_duration = {
				[1] = 7.4905624389648,
			},
		},
		pbw_village_27_factory_yard_unique_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pbw_village_27_factory_yard_unique_03_a_01",
			},
			sound_events = {
				[1] = "pbw_village_27_factory_yard_unique_03_a_01",
			},
			sound_events_duration = {
				[1] = 5.7952709197998,
			},
		},
		pbw_village_27_factory_yard_unique_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_sadness",
			},
			localization_strings = {
				[1] = "pbw_village_27_factory_yard_unique_04_b_01",
			},
			sound_events = {
				[1] = "pbw_village_27_factory_yard_unique_04_b_01",
			},
			sound_events_duration = {
				[1] = 4.5857706069946,
			},
		},
		pbw_village_27_factory_yard_unique_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pbw_village_27_factory_yard_unique_05_b_01",
			},
			sound_events = {
				[1] = "pbw_village_27_factory_yard_unique_05_b_01",
			},
			sound_events_duration = {
				[1] = 2.8313958644867,
			},
		},
		pbw_village_36_onboard_01_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pbw_village_36_onboard_01_b_01",
			},
			sound_events = {
				[1] = "pbw_village_36_onboard_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.6998331546783,
			},
		},
		pbw_village_36_onboard_02_a = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pbw_village_36_onboard_02_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pbw_village_36_onboard_02_a_01",
			},
			sound_events_duration = {
				[1] = 3.4152500629425,
			},
		},
		pbw_village_36_onboard_03_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pbw_village_36_onboard_03_b_01",
			},
			sound_events = {
				[1] = "pbw_village_36_onboard_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.9993958473206,
			},
		},
		pbw_village_36_onboard_04_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_village_36_onboard_04_b_01",
			},
			sound_events = {
				[1] = "pbw_village_36_onboard_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.7126874923706,
			},
		},
		pdr_village_03_gather_unique_02_e = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_03_gather_unique_02_e_01",
			},
			sound_events = {
				[1] = "pdr_village_03_gather_unique_02_e_01",
			},
			sound_events_duration = {
				[1] = 3.4567,
			},
		},
		pdr_village_08_ravine_unique_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_08_ravine_unique_03_b_01",
			},
			sound_events = {
				[1] = "pdr_village_08_ravine_unique_03_b_01",
			},
			sound_events_duration = {
				[1] = 7.9951457977295,
			},
		},
		pdr_village_08_ravine_unique_03_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_08_ravine_unique_03_d_01",
			},
			sound_events = {
				[1] = "pdr_village_08_ravine_unique_03_d_01",
			},
			sound_events_duration = {
				[1] = 4.2976040840149,
			},
		},
		pdr_village_08_ravine_unique_04_g = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_08_ravine_unique_04_g_01",
			},
			sound_events = {
				[1] = "pdr_village_08_ravine_unique_04_g_01",
			},
			sound_events_duration = {
				[1] = 4.2707500457764,
			},
		},
		pdr_village_08_ravine_unique_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_08_ravine_unique_05_a_01",
			},
			sound_events = {
				[1] = "pdr_village_08_ravine_unique_05_a_01",
			},
			sound_events_duration = {
				[1] = 5.9102292060852,
			},
		},
		pdr_village_08_ravine_unique_05_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_08_ravine_unique_05_c_01",
			},
			sound_events = {
				[1] = "pdr_village_08_ravine_unique_05_c_01",
			},
			sound_events_duration = {
				[1] = 2.4197082519531,
			},
		},
		pdr_village_08_ravine_unique_07_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_village_08_ravine_unique_07_c_01",
			},
			sound_events = {
				[1] = "pdr_village_08_ravine_unique_07_c_01",
			},
			sound_events_duration = {
				[1] = 3.8336250782013,
			},
		},
		pdr_village_08_ravine_unique_08_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pdr_village_08_ravine_unique_08_d_01",
			},
			sound_events = {
				[1] = "pdr_village_08_ravine_unique_08_d_01",
			},
			sound_events_duration = {
				[1] = 3.0949583053589,
			},
		},
		pdr_village_13_town_unique_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_02_a_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_02_a_01",
			},
			sound_events_duration = {
				[1] = 5.9777083396912,
			},
		},
		pdr_village_13_town_unique_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_02_c_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.5856459140778,
			},
		},
		pdr_village_13_town_unique_02_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_02_e_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_02_e_01",
			},
			sound_events_duration = {
				[1] = 4.6746459007263,
			},
		},
		pdr_village_13_town_unique_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_04_b_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_04_b_01",
			},
			sound_events_duration = {
				[1] = 1.9134792089462,
			},
		},
		pdr_village_13_town_unique_04_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_04_d_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_04_d_01",
			},
			sound_events_duration = {
				[1] = 6.305624961853,
			},
		},
		pdr_village_13_town_unique_04_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_nervous",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_04_f_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_04_f_01",
			},
			sound_events_duration = {
				[1] = 2.2119166851044,
			},
		},
		pdr_village_13_town_unique_06_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_06_b_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_06_b_01",
			},
			sound_events_duration = {
				[1] = 2.5179166793823,
			},
		},
		pdr_village_13_town_unique_06_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_06_d_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_06_d_01",
			},
			sound_events_duration = {
				[1] = 2.4558124542236,
			},
		},
		pdr_village_13_town_unique_06_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_06_f_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_06_f_01",
			},
			sound_events_duration = {
				[1] = 6.1546874046326,
			},
		},
		pdr_village_13_town_unique_08_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_08_d_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_08_d_01",
			},
			sound_events_duration = {
				[1] = 4.4992499351502,
			},
		},
		pdr_village_13_town_unique_12_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_12_a_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_12_a_01",
			},
			sound_events_duration = {
				[1] = 4.4672498703003,
			},
		},
		pdr_village_13_town_unique_12_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_13_town_unique_12_c_01",
			},
			sound_events = {
				[1] = "pdr_village_13_town_unique_12_c_01",
			},
			sound_events_duration = {
				[1] = 1.7140624523163,
			},
		},
		pdr_village_17_team_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_17_team_01_a_01",
				[2] = "pdr_village_17_team_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_17_team_01_a_01",
				[2] = "pdr_village_17_team_01_a_02",
			},
			sound_events_duration = {
				[1] = 6.7439584732056,
				[2] = 6.1817083358765,
			},
		},
		pdr_village_17_team_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_village_17_team_01_b_01",
				[2] = "pdr_village_17_team_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_17_team_01_b_01",
				[2] = "pdr_village_17_team_01_b_02",
			},
			sound_events_duration = {
				[1] = 2.0996458530426,
				[2] = 2.2534792423248,
			},
		},
		pdr_village_17_team_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pdr_village_17_team_02_b_01",
			},
			sound_events = {
				[1] = "pdr_village_17_team_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.3465623855591,
			},
		},
		pdr_village_17_team_03_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_happy",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pdr_village_17_team_03_a_01",
				[2] = "pdr_village_17_team_03_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_village_17_team_03_a_01",
				[2] = "pdr_village_17_team_03_a_02",
			},
			sound_events_duration = {
				[1] = 4.9343123435974,
				[2] = 3.857125043869,
			},
		},
		pdr_village_21_elevator_ride_rant_01_f = {
			additional_trigger_heard = "elevator_rant_multiple_response_trigger_01",
			category = "level_talk_must_play_multiple",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pdr_village_21_elevator_ride_rant_01_f_01",
			},
			sound_events = {
				[1] = "pdr_village_21_elevator_ride_rant_01_f_01",
			},
			sound_events_duration = {
				[1] = 2.2993333339691,
			},
		},
		pdr_village_21_elevator_ride_rant_02_a = {
			category = "cut_scene_interrupt_three",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_21_elevator_ride_rant_02_a_01",
			},
			sound_events = {
				[1] = "pdr_village_21_elevator_ride_rant_02_a_01",
			},
			sound_events_duration = {
				[1] = 3.3264167308807,
			},
		},
		pdr_village_21_elevator_ride_rant_02_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pdr_village_21_elevator_ride_rant_02_c_01",
			},
			sound_events = {
				[1] = "pdr_village_21_elevator_ride_rant_02_c_01",
			},
			sound_events_duration = {
				[1] = 3.7949166297913,
			},
		},
		pdr_village_21_elevator_ride_rant_02_d = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_sadness",
			},
			localization_strings = {
				[1] = "pdr_village_21_elevator_ride_rant_02_d_01",
			},
			sound_events = {
				[1] = "pdr_village_21_elevator_ride_rant_02_d_01",
			},
			sound_events_duration = {
				[1] = 4.9120626449585,
			},
		},
		pdr_village_21_elevator_ride_rant_02_e = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_village_21_elevator_ride_rant_02_e_01",
			},
			sound_events = {
				[1] = "pdr_village_21_elevator_ride_rant_02_e_01",
			},
			sound_events_duration = {
				[1] = 7.7201457023621,
			},
		},
		pdr_village_21_elevator_ride_rant_03_d = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pdr_village_21_elevator_ride_rant_03_d_01",
			},
			sound_events = {
				[1] = "pdr_village_21_elevator_ride_rant_03_d_01",
			},
			sound_events_duration = {
				[1] = 3.0433750152588,
			},
		},
		pdr_village_21_elevator_ride_rant_04_d = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_surprise",
			},
			localization_strings = {
				[1] = "pdr_village_21_elevator_ride_rant_04_d_01",
			},
			sound_events = {
				[1] = "pdr_village_21_elevator_ride_rant_04_d_01",
			},
			sound_events_duration = {
				[1] = 2.8870208263397,
			},
		},
		pdr_village_22_elevator_ride_ends_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pdr_village_22_elevator_ride_ends_a_01",
			},
			sound_events = {
				[1] = "pdr_village_22_elevator_ride_ends_a_01",
			},
			sound_events_duration = {
				[1] = 2.6583125591278,
			},
		},
		pdr_village_27_factory_yard_unique_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pdr_village_27_factory_yard_unique_01_a_01",
			},
			sound_events = {
				[1] = "pdr_village_27_factory_yard_unique_01_a_01",
			},
			sound_events_duration = {
				[1] = 2.5983333587647,
			},
		},
		pdr_village_27_factory_yard_unique_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pdr_village_27_factory_yard_unique_01_b_01",
			},
			sound_events = {
				[1] = "pdr_village_27_factory_yard_unique_01_b_01",
			},
			sound_events_duration = {
				[1] = 2.7456667423248,
			},
		},
		pdr_village_27_factory_yard_unique_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pdr_village_27_factory_yard_unique_02_b_01",
			},
			sound_events = {
				[1] = "pdr_village_27_factory_yard_unique_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.2301249504089,
			},
		},
		pdr_village_27_factory_yard_unique_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_27_factory_yard_unique_03_b_01",
			},
			sound_events = {
				[1] = "pdr_village_27_factory_yard_unique_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.4944167137146,
			},
		},
		pdr_village_27_factory_yard_unique_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pdr_village_27_factory_yard_unique_04_b_01",
			},
			sound_events = {
				[1] = "pdr_village_27_factory_yard_unique_04_b_01",
			},
			sound_events_duration = {
				[1] = 3.9033749103546,
			},
		},
		pdr_village_27_factory_yard_unique_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
			},
			localization_strings = {
				[1] = "pdr_village_27_factory_yard_unique_05_a_01",
			},
			sound_events = {
				[1] = "pdr_village_27_factory_yard_unique_05_a_01",
			},
			sound_events_duration = {
				[1] = 4.3034791946411,
			},
		},
		pdr_village_36_onboard_01_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_village_36_onboard_01_b_01",
			},
			sound_events = {
				[1] = "pdr_village_36_onboard_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.1659791469574,
			},
		},
		pdr_village_36_onboard_03_a = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pdr_village_36_onboard_03_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pdr_village_36_onboard_03_a_01",
			},
			sound_events_duration = {
				[1] = 3.3268542289734,
			},
		},
		pdr_village_36_onboard_04_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pdr_village_36_onboard_04_b_01",
			},
			sound_events = {
				[1] = "pdr_village_36_onboard_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.2682499885559,
			},
		},
		pes_village_03_gather_unique_02_e = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_nervous",
			},
			localization_strings = {
				[1] = "pes_village_03_gather_unique_02_e_01",
			},
			sound_events = {
				[1] = "pes_village_03_gather_unique_02_e_01",
			},
			sound_events_duration = {
				[1] = 3.559291601181,
			},
		},
		pes_village_08_ravine_unique_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_01_a_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_01_a_01",
			},
			sound_events_duration = {
				[1] = 3.8795833587647,
			},
		},
		pes_village_08_ravine_unique_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_01_c_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_01_c_01",
			},
			sound_events_duration = {
				[1] = 5.7345833778381,
			},
		},
		pes_village_08_ravine_unique_01_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_01_e_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_01_e_01",
			},
			sound_events_duration = {
				[1] = 4.6418957710266,
			},
		},
		pes_village_08_ravine_unique_04_g = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_04_g_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_04_g_01",
			},
			sound_events_duration = {
				[1] = 3.7576251029968,
			},
		},
		pes_village_08_ravine_unique_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_05_b_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_05_b_01",
			},
			sound_events_duration = {
				[1] = 6.5907292366028,
			},
		},
		pes_village_08_ravine_unique_05_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_05_d_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_05_d_01",
			},
			sound_events_duration = {
				[1] = 2.3734374046326,
			},
		},
		pes_village_08_ravine_unique_06_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_06_c_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_06_c_01",
			},
			sound_events_duration = {
				[1] = 4.8249168395996,
			},
		},
		pes_village_08_ravine_unique_08_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_08_a_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_08_a_01",
			},
			sound_events_duration = {
				[1] = 5.232458114624,
			},
		},
		pes_village_08_ravine_unique_08_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_village_08_ravine_unique_08_c_01",
			},
			sound_events = {
				[1] = "pes_village_08_ravine_unique_08_c_01",
			},
			sound_events_duration = {
				[1] = 4.8868541717529,
			},
		},
		pes_village_13_town_unique_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_01_a_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_01_a_01",
			},
			sound_events_duration = {
				[1] = 1.712729215622,
			},
		},
		pes_village_13_town_unique_01_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_01_c_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_01_c_01",
			},
			sound_events_duration = {
				[1] = 2.8641457557678,
			},
		},
		pes_village_13_town_unique_01_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_01_d_01",
				[2] = "pes_village_13_town_unique_01_d_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pes_village_13_town_unique_01_d_02 = {
					{
						"global_context",
						"wh_priest",
						OP.EQ,
						false,
					},
				},
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_01_d_01",
				[2] = "pes_village_13_town_unique_01_d_02",
			},
			sound_events_duration = {
				[1] = 5.4324584007263,
				[2] = 3.7103333473206,
			},
		},
		pes_village_13_town_unique_01_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_01_f_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_01_f_01",
			},
			sound_events_duration = {
				[1] = 1.5329999923706,
			},
		},
		pes_village_13_town_unique_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_04_a_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_04_a_01",
			},
			sound_events_duration = {
				[1] = 2.0732290744781,
			},
		},
		pes_village_13_town_unique_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_04_c_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_04_c_01",
			},
			sound_events_duration = {
				[1] = 6.4840416908264,
			},
		},
		pes_village_13_town_unique_04_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_04_e_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_04_e_01",
			},
			sound_events_duration = {
				[1] = 4.983437538147,
			},
		},
		pes_village_13_town_unique_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_05_a_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_05_a_01",
			},
			sound_events_duration = {
				[1] = 5.9514789581299,
			},
		},
		pes_village_13_town_unique_05_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_05_c_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_05_c_01",
			},
			sound_events_duration = {
				[1] = 3.4296875,
			},
		},
		pes_village_13_town_unique_05_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_05_e_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_05_e_01",
			},
			sound_events_duration = {
				[1] = 2.3506667613983,
			},
		},
		pes_village_13_town_unique_07_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_07_c_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_07_c_01",
			},
			sound_events_duration = {
				[1] = 2.5364167690277,
			},
		},
		pes_village_13_town_unique_08_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_nervous",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_08_c_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_08_c_01",
			},
			sound_events_duration = {
				[1] = 4.0606665611267,
			},
		},
		pes_village_13_town_unique_10_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_10_b_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_10_b_01",
			},
			sound_events_duration = {
				[1] = 2.5503542423248,
			},
		},
		pes_village_13_town_unique_10_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_surprise",
			},
			localization_strings = {
				[1] = "pes_village_13_town_unique_10_d_01",
			},
			sound_events = {
				[1] = "pes_village_13_town_unique_10_d_01",
			},
			sound_events_duration = {
				[1] = 2.7226457595825,
			},
		},
		pes_village_17_team_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_17_team_01_a_01",
				[2] = "pes_village_17_team_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_17_team_01_a_01",
				[2] = "pes_village_17_team_01_a_02",
			},
			sound_events_duration = {
				[1] = 7.6866874694824,
				[2] = 7.5016250610352,
			},
		},
		pes_village_17_team_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_village_17_team_02_b_01",
			},
			sound_events = {
				[1] = "pes_village_17_team_02_b_01",
			},
			sound_events_duration = {
				[1] = 2.8234167098999,
			},
		},
		pes_village_17_team_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_confused",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_village_17_team_03_b_01",
				[2] = "pes_village_17_team_03_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_village_17_team_03_b_01",
				[2] = "pes_village_17_team_03_b_02",
			},
			sound_events_duration = {
				[1] = 4.7353959083557,
				[2] = 3.9744999408722,
			},
		},
		pes_village_21_elevator_ride_rant_01_a = {
			category = "cut_scene_interrupt_three",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_21_elevator_ride_rant_01_a_01",
			},
			sound_events = {
				[1] = "pes_village_21_elevator_ride_rant_01_a_01",
			},
			sound_events_duration = {
				[1] = 1.773020863533,
			},
		},
		pes_village_21_elevator_ride_rant_01_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_nervous",
			},
			localization_strings = {
				[1] = "pes_village_21_elevator_ride_rant_01_c_01",
			},
			sound_events = {
				[1] = "pes_village_21_elevator_ride_rant_01_c_01",
			},
			sound_events_duration = {
				[1] = 4.0139789581299,
			},
		},
		pes_village_21_elevator_ride_rant_01_d = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_village_21_elevator_ride_rant_01_d_01",
			},
			sound_events = {
				[1] = "pes_village_21_elevator_ride_rant_01_d_01",
			},
			sound_events_duration = {
				[1] = 4.7416667938232,
			},
		},
		pes_village_21_elevator_ride_rant_01_e = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_village_21_elevator_ride_rant_01_e_01",
			},
			sound_events = {
				[1] = "pes_village_21_elevator_ride_rant_01_e_01",
			},
			sound_events_duration = {
				[1] = 5.9197292327881,
			},
		},
		pes_village_21_elevator_ride_rant_03_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_village_21_elevator_ride_rant_03_b_01",
			},
			sound_events = {
				[1] = "pes_village_21_elevator_ride_rant_03_b_01",
			},
			sound_events_duration = {
				[1] = 2.0299167633057,
			},
		},
		pes_village_21_elevator_ride_rant_03_f = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pes_village_21_elevator_ride_rant_03_f_01",
			},
			sound_events = {
				[1] = "pes_village_21_elevator_ride_rant_03_f_01",
			},
			sound_events_duration = {
				[1] = 1.0387707948685,
			},
		},
		pes_village_21_elevator_ride_rant_04_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
			},
			localization_strings = {
				[1] = "pes_village_21_elevator_ride_rant_04_b_01",
			},
			sound_events = {
				[1] = "pes_village_21_elevator_ride_rant_04_b_01",
			},
			sound_events_duration = {
				[1] = 1.9878125190735,
			},
		},
		pes_village_21_elevator_ride_rant_04_d = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_surprise",
			},
			localization_strings = {
				[1] = "pes_village_21_elevator_ride_rant_04_d_01",
			},
			sound_events = {
				[1] = "pes_village_21_elevator_ride_rant_04_d_01",
			},
			sound_events_duration = {
				[1] = 4.4168124198914,
			},
		},
		pes_village_22_elevator_ride_ends_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pes_village_22_elevator_ride_ends_a_01",
			},
			sound_events = {
				[1] = "pes_village_22_elevator_ride_ends_a_01",
			},
			sound_events_duration = {
				[1] = 2.6772916316986,
			},
		},
		pes_village_27_factory_yard_unique_01_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pes_village_27_factory_yard_unique_01_a_01",
			},
			sound_events = {
				[1] = "pes_village_27_factory_yard_unique_01_a_01",
			},
			sound_events_duration = {
				[1] = 3.6301250457764,
			},
		},
		pes_village_27_factory_yard_unique_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pes_village_27_factory_yard_unique_02_b_01",
			},
			sound_events = {
				[1] = "pes_village_27_factory_yard_unique_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.5431456565857,
			},
		},
		pes_village_27_factory_yard_unique_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pes_village_27_factory_yard_unique_03_b_01",
			},
			sound_events = {
				[1] = "pes_village_27_factory_yard_unique_03_b_01",
			},
			sound_events_duration = {
				[1] = 3.8001666069031,
			},
		},
		pes_village_27_factory_yard_unique_04_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pes_village_27_factory_yard_unique_04_b_01",
			},
			sound_events = {
				[1] = "pes_village_27_factory_yard_unique_04_b_01",
			},
			sound_events_duration = {
				[1] = 2.8534166812897,
			},
		},
		pes_village_27_factory_yard_unique_05_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
			},
			localization_strings = {
				[1] = "pes_village_27_factory_yard_unique_05_a_01",
			},
			sound_events = {
				[1] = "pes_village_27_factory_yard_unique_05_a_01",
			},
			sound_events_duration = {
				[1] = 2.0034582614899,
			},
		},
		pes_village_27_factory_yard_unique_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_village_27_factory_yard_unique_05_b_01",
			},
			sound_events = {
				[1] = "pes_village_27_factory_yard_unique_05_b_01",
			},
			sound_events_duration = {
				[1] = 2.9498541355133,
			},
		},
		pes_village_36_onboard_05_a = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pes_village_36_onboard_05_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pes_village_36_onboard_05_a_01",
			},
			sound_events_duration = {
				[1] = 3.0257916450501,
			},
		},
		pwe_village_03_gather_unique_02_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_03_gather_unique_02_a_01",
				[2] = "pwe_village_03_gather_unique_02_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_03_gather_unique_02_a_01",
				[2] = "pwe_village_03_gather_unique_02_a_02",
			},
			sound_events_duration = {
				[1] = 4.3150835037231,
				[2] = 3.9793124198914,
			},
		},
		pwe_village_03_gather_unique_02_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
				[2] = "face_curious",
			},
			localization_strings = {
				[1] = "pwe_village_03_gather_unique_02_c_01",
				[2] = "pwe_village_03_gather_unique_02_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_03_gather_unique_02_c_01",
				[2] = "pwe_village_03_gather_unique_02_c_02",
			},
			sound_events_duration = {
				[1] = 4.4070210456848,
				[2] = 5.0373125076294,
			},
		},
		pwe_village_08_ravine_unique_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_08_ravine_unique_02_a_01",
			},
			sound_events = {
				[1] = "pwe_village_08_ravine_unique_02_a_01",
			},
			sound_events_duration = {
				[1] = 3.4151041507721,
			},
		},
		pwe_village_08_ravine_unique_02_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_08_ravine_unique_02_c_01",
			},
			sound_events = {
				[1] = "pwe_village_08_ravine_unique_02_c_01",
			},
			sound_events_duration = {
				[1] = 2.8213334083557,
			},
		},
		pwe_village_08_ravine_unique_02_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_village_08_ravine_unique_02_e_01",
			},
			sound_events = {
				[1] = "pwe_village_08_ravine_unique_02_e_01",
			},
			sound_events_duration = {
				[1] = 6.2494583129883,
			},
		},
		pwe_village_08_ravine_unique_04_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_village_08_ravine_unique_04_f_01",
			},
			sound_events = {
				[1] = "pwe_village_08_ravine_unique_04_f_01",
			},
			sound_events_duration = {
				[1] = 3.8781073093414,
			},
		},
		pwe_village_08_ravine_unique_06_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
			},
			localization_strings = {
				[1] = "pwe_village_08_ravine_unique_06_a_01",
			},
			sound_events = {
				[1] = "pwe_village_08_ravine_unique_06_a_01",
			},
			sound_events_duration = {
				[1] = 3.8149166107178,
			},
		},
		pwe_village_08_ravine_unique_09_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_08_ravine_unique_09_b_01",
			},
			sound_events = {
				[1] = "pwe_village_08_ravine_unique_09_b_01",
			},
			sound_events_duration = {
				[1] = 3.4432709217072,
			},
		},
		pwe_village_08_ravine_unique_09_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pwe_village_08_ravine_unique_09_d_01",
			},
			sound_events = {
				[1] = "pwe_village_08_ravine_unique_09_d_01",
			},
			sound_events_duration = {
				[1] = 5.5565414428711,
			},
		},
		pwe_village_13_town_unique_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_02_b_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_02_b_01",
			},
			sound_events_duration = {
				[1] = 4.875,
			},
		},
		pwe_village_13_town_unique_02_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_02_d_01",
				[2] = "pwe_st_village_13_town_unique_02_d_02",
			},
			randomize_indexes = {},
			sound_event_filters = {
				pwe_st_village_13_town_unique_02_d_02 = {
					{
						"global_context",
						"we_thornsister",
						OP.EQ,
						false,
					},
				},
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_02_d_01",
				[2] = "pwe_st_village_13_town_unique_02_d_02",
			},
			sound_events_duration = {
				[1] = 4.1066875457764,
				[2] = 5.5311040878296,
			},
		},
		pwe_village_13_town_unique_02_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_02_f_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_02_f_01",
			},
			sound_events_duration = {
				[1] = 3.223249912262,
			},
		},
		pwe_village_13_town_unique_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_05_b_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_05_b_01",
			},
			sound_events_duration = {
				[1] = 6.2399168014526,
			},
		},
		pwe_village_13_town_unique_05_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_05_d_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_05_d_01",
			},
			sound_events_duration = {
				[1] = 3.9788959026337,
			},
		},
		pwe_village_13_town_unique_05_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_05_f_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_05_f_01",
			},
			sound_events_duration = {
				[1] = 3.9511876106262,
			},
		},
		pwe_village_13_town_unique_07_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_07_c_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_07_c_01",
			},
			sound_events_duration = {
				[1] = 2.6275207996368,
			},
		},
		pwe_village_13_town_unique_08_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_08_a_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_08_a_01",
			},
			sound_events_duration = {
				[1] = 3.8165833950043,
			},
		},
		pwe_village_13_town_unique_08_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_08_e_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_08_e_01",
			},
			sound_events_duration = {
				[1] = 2.6508333683014,
			},
		},
		pwe_village_13_town_unique_08_g = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_08_g_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_08_g_01",
			},
			sound_events_duration = {
				[1] = 1.8212916851044,
			},
		},
		pwe_village_13_town_unique_11_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_nervous",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_11_b_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_11_b_01",
			},
			sound_events_duration = {
				[1] = 5.1396040916443,
			},
		},
		pwe_village_13_town_unique_11_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_village_13_town_unique_11_d_01",
			},
			sound_events = {
				[1] = "pwe_village_13_town_unique_11_d_01",
			},
			sound_events_duration = {
				[1] = 1.3821666240692,
			},
		},
		pwe_village_17_team_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_sadness",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_17_team_01_b_01",
				[2] = "pwe_village_17_team_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_17_team_01_b_01",
				[2] = "pwe_village_17_team_01_b_02",
			},
			sound_events_duration = {
				[1] = 2.9020416736603,
				[2] = 4.3020625114441,
			},
		},
		pwe_village_17_team_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pwe_village_17_team_02_b_01",
			},
			sound_events = {
				[1] = "pwe_village_17_team_02_b_01",
			},
			sound_events_duration = {
				[1] = 7.0496039390564,
			},
		},
		pwe_village_17_team_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_bored",
			},
			localization_strings = {
				[1] = "pwe_village_17_team_03_b_01",
				[2] = "pwe_village_17_team_03_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_village_17_team_03_b_01",
				[2] = "pwe_village_17_team_03_b_02",
			},
			sound_events_duration = {
				[1] = 5.1211042404175,
				[2] = 3.3583333492279,
			},
		},
		pwe_village_21_elevator_ride_rant_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_01_b_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_01_b_01",
			},
			sound_events_duration = {
				[1] = 3.9900832176209,
			},
		},
		pwe_village_21_elevator_ride_rant_01_f = {
			additional_trigger_heard = "elevator_rant_multiple_response_trigger_01",
			category = "level_talk_must_play_multiple",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_01_f_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_01_f_01",
			},
			sound_events_duration = {
				[1] = 1.5331457853317,
			},
		},
		pwe_village_21_elevator_ride_rant_02_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_02_b_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_02_b_01",
			},
			sound_events_duration = {
				[1] = 1.2044792175293,
			},
		},
		pwe_village_21_elevator_ride_rant_02_f = {
			additional_trigger_heard = "elevator_rant_multiple_response_trigger_02",
			category = "level_talk_must_play_multiple",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_02_f_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_02_f_01",
			},
			sound_events_duration = {
				[1] = 2.7780001163483,
			},
		},
		pwe_village_21_elevator_ride_rant_03_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_03_b_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_03_b_01",
			},
			sound_events_duration = {
				[1] = 1.9307082891464,
			},
		},
		pwe_village_21_elevator_ride_rant_03_f = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_03_f_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_03_f_01",
			},
			sound_events_duration = {
				[1] = 1.7065625190735,
			},
		},
		pwe_village_21_elevator_ride_rant_04_a = {
			category = "cut_scene_interrupt_three",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_04_a_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_04_a_01",
			},
			sound_events_duration = {
				[1] = 2.8866457939148,
			},
		},
		pwe_village_21_elevator_ride_rant_04_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_04_c_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_04_c_01",
			},
			sound_events_duration = {
				[1] = 6.7995624542236,
			},
		},
		pwe_village_21_elevator_ride_rant_04_e = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_21_elevator_ride_rant_04_e_01",
			},
			sound_events = {
				[1] = "pwe_village_21_elevator_ride_rant_04_e_01",
			},
			sound_events_duration = {
				[1] = 2.9591875076294,
			},
		},
		pwe_village_22_elevator_ride_ends_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwe_village_22_elevator_ride_ends_a_01",
			},
			sound_events = {
				[1] = "pwe_village_22_elevator_ride_ends_a_01",
			},
			sound_events_duration = {
				[1] = 2.7121040821075,
			},
		},
		pwe_village_27_factory_yard_unique_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pwe_village_27_factory_yard_unique_01_b_01",
			},
			sound_events = {
				[1] = "pwe_village_27_factory_yard_unique_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.3727293014526,
			},
		},
		pwe_village_27_factory_yard_unique_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pwe_village_27_factory_yard_unique_02_b_01",
			},
			sound_events = {
				[1] = "pwe_village_27_factory_yard_unique_02_b_01",
			},
			sound_events_duration = {
				[1] = 3.3522500991821,
			},
		},
		pwe_village_27_factory_yard_unique_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pwe_village_27_factory_yard_unique_03_b_01",
			},
			sound_events = {
				[1] = "pwe_village_27_factory_yard_unique_03_b_01",
			},
			sound_events_duration = {
				[1] = 5.7445206642151,
			},
		},
		pwe_village_27_factory_yard_unique_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
			},
			localization_strings = {
				[1] = "pwe_village_27_factory_yard_unique_04_a_01",
			},
			sound_events = {
				[1] = "pwe_village_27_factory_yard_unique_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.640145778656,
			},
		},
		pwe_village_27_factory_yard_unique_05_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwe_village_27_factory_yard_unique_05_b_01",
			},
			sound_events = {
				[1] = "pwe_village_27_factory_yard_unique_05_b_01",
			},
			sound_events_duration = {
				[1] = 2.2815833091736,
			},
		},
		pwe_village_36_onboard_02_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwe_village_36_onboard_02_b_01",
			},
			sound_events = {
				[1] = "pwe_village_36_onboard_02_b_01",
			},
			sound_events_duration = {
				[1] = 2.7188749313355,
			},
		},
		pwe_village_36_onboard_04_a = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
			},
			localization_strings = {
				[1] = "pwe_village_36_onboard_04_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pwe_village_36_onboard_04_a_01",
			},
			sound_events_duration = {
				[1] = 3.7977292537689,
			},
		},
		pwe_village_36_onboard_05_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwe_village_36_onboard_05_b_01",
			},
			sound_events = {
				[1] = "pwe_village_36_onboard_05_b_01",
			},
			sound_events_duration = {
				[1] = 2.1558749675751,
			},
		},
		pwh_village_03_gather_unique_01_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
				[2] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_village_03_gather_unique_01_a_01",
				[2] = "pwh_village_03_gather_unique_01_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_03_gather_unique_01_a_01",
				[2] = "pwh_village_03_gather_unique_01_a_02",
			},
			sound_events_duration = {
				[1] = 3.4232499599457,
				[2] = 4.5407915115356,
			},
		},
		pwh_village_03_gather_unique_01_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_03_gather_unique_01_c_01",
				[2] = "pwh_village_03_gather_unique_01_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_03_gather_unique_01_c_01",
				[2] = "pwh_village_03_gather_unique_01_c_02",
			},
			sound_events_duration = {
				[1] = 6.5183334350586,
				[2] = 4.8886876106262,
			},
		},
		pwh_village_03_gather_unique_01_e = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_03_gather_unique_01_e_01",
				[2] = "pwh_village_03_gather_unique_01_e_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_03_gather_unique_01_e_01",
				[2] = "pwh_village_03_gather_unique_01_e_02",
			},
			sound_events_duration = {
				[1] = 2.2162709236145,
				[2] = 3.1537292003632,
			},
		},
		pwh_village_03_gather_unique_02_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_03_gather_unique_02_b_01",
				[2] = "pwh_village_03_gather_unique_02_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_03_gather_unique_02_b_01",
				[2] = "pwh_village_03_gather_unique_02_b_02",
			},
			sound_events_duration = {
				[1] = 3.5348124504089,
				[2] = 3.1257083415985,
			},
		},
		pwh_village_03_gather_unique_02_d = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_03_gather_unique_02_d_01",
				[2] = "pwh_village_03_gather_unique_02_d_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_03_gather_unique_02_d_01",
				[2] = "pwh_village_03_gather_unique_02_d_02",
			},
			sound_events_duration = {
				[1] = 4.0526885986328,
				[2] = 2.0129928588867,
			},
		},
		pwh_village_08_ravine_unique_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_01_b_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_01_b_01",
			},
			sound_events_duration = {
				[1] = 5.0875625610352,
			},
		},
		pwh_village_08_ravine_unique_01_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_01_d_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_01_d_01",
			},
			sound_events_duration = {
				[1] = 6.090895652771,
			},
		},
		pwh_village_08_ravine_unique_01_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_01_f_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_01_f_01",
			},
			sound_events_duration = {
				[1] = 4.6672501564026,
			},
		},
		pwh_village_08_ravine_unique_02_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_02_b_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_02_b_01",
			},
			sound_events_duration = {
				[1] = 7.3268122673035,
			},
		},
		pwh_village_08_ravine_unique_02_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_smug",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_02_d_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_02_d_01",
			},
			sound_events_duration = {
				[1] = 2.0296666622162,
			},
		},
		pwh_village_08_ravine_unique_02_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_02_f_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_02_f_01",
			},
			sound_events_duration = {
				[1] = 7.3879375457764,
			},
		},
		pwh_village_08_ravine_unique_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_04_a_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_04_a_01",
			},
			sound_events_duration = {
				[1] = 4.2483749389648,
			},
		},
		pwh_village_08_ravine_unique_04_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_04_c_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_04_c_01",
			},
			sound_events_duration = {
				[1] = 3.1501874923706,
			},
		},
		pwh_village_08_ravine_unique_04_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_04_e_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_04_e_01",
			},
			sound_events_duration = {
				[1] = 6.6273331642151,
			},
		},
		pwh_village_08_ravine_unique_06_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_06_b_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_06_b_01",
			},
			sound_events_duration = {
				[1] = 5.3330416679382,
			},
		},
		pwh_village_08_ravine_unique_07_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_07_b_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_07_b_01",
			},
			sound_events_duration = {
				[1] = 4.2510418891907,
			},
		},
		pwh_village_08_ravine_unique_08_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_08_b_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_08_b_01",
			},
			sound_events_duration = {
				[1] = 2.5552916526794,
			},
		},
		pwh_village_08_ravine_unique_08_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_village_08_ravine_unique_08_d_01",
			},
			sound_events = {
				[1] = "pwh_village_08_ravine_unique_08_d_01",
			},
			sound_events_duration = {
				[1] = 2.1869375705719,
			},
		},
		pwh_village_13_town_unique_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_01_b_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.4291667938232,
			},
		},
		pwh_village_13_town_unique_01_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_nervous",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_01_e_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_01_e_01",
			},
			sound_events_duration = {
				[1] = 3.6759166717529,
			},
		},
		pwh_village_13_town_unique_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_03_b_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.9919376373291,
			},
		},
		pwh_village_13_town_unique_03_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_03_d_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_03_d_01",
			},
			sound_events_duration = {
				[1] = 3.6983957290649,
			},
		},
		pwh_village_13_town_unique_03_f = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_03_f_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_03_f_01",
			},
			sound_events_duration = {
				[1] = 3.5267915725708,
			},
		},
		pwh_village_13_town_unique_06_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_06_a_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_06_a_01",
			},
			sound_events_duration = {
				[1] = 7.4327707290649,
			},
		},
		pwh_village_13_town_unique_06_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_06_c_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_06_c_01",
			},
			sound_events_duration = {
				[1] = 1.6478542089462,
			},
		},
		pwh_village_13_town_unique_06_e = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_06_e_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_06_e_01",
			},
			sound_events_duration = {
				[1] = 6.4886250495911,
			},
		},
		pwh_village_13_town_unique_07_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_07_b_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_07_b_01",
			},
			sound_events_duration = {
				[1] = 6.386353969574,
			},
		},
		pwh_village_13_town_unique_07_d = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_07_d_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_07_d_01",
			},
			sound_events_duration = {
				[1] = 8.2518329620361,
			},
		},
		pwh_village_13_town_unique_09_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_09_a_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_09_a_01",
			},
			sound_events_duration = {
				[1] = 3.5089166164398,
			},
		},
		pwh_village_13_town_unique_09_c = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pwh_village_13_town_unique_09_c_01",
			},
			sound_events = {
				[1] = "pwh_village_13_town_unique_09_c_01",
			},
			sound_events_duration = {
				[1] = 5.1349167823792,
			},
		},
		pwh_village_17_team_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
				[2] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_17_team_01_b_01",
				[2] = "pwh_village_17_team_01_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_17_team_01_b_01",
				[2] = "pwh_village_17_team_01_b_02",
			},
			sound_events_duration = {
				[1] = 4.0012707710266,
				[2] = 4.9940414428711,
			},
		},
		pwh_village_17_team_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_village_17_team_02_a_01",
			},
			sound_events = {
				[1] = "pwh_village_17_team_02_a_01",
			},
			sound_events_duration = {
				[1] = 8.2494373321533,
			},
		},
		pwh_village_17_team_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_village_17_team_03_b_01",
				[2] = "pwh_village_17_team_03_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_village_17_team_03_b_01",
				[2] = "pwh_village_17_team_03_b_02",
			},
			sound_events_duration = {
				[1] = 3.3389792442322,
				[2] = 3.8026459217072,
			},
		},
		pwh_village_21_elevator_ride_rant_01_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_bored",
			},
			localization_strings = {
				[1] = "pwh_village_21_elevator_ride_rant_01_b_01",
			},
			sound_events = {
				[1] = "pwh_village_21_elevator_ride_rant_01_b_01",
			},
			sound_events_duration = {
				[1] = 1.7071249485016,
			},
		},
		pwh_village_21_elevator_ride_rant_01_f = {
			additional_trigger_heard = "elevator_rant_multiple_response_trigger_01",
			category = "level_talk_must_play_multiple",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_exhausted",
			},
			localization_strings = {
				[1] = "pwh_village_21_elevator_ride_rant_01_f_01",
			},
			sound_events = {
				[1] = "pwh_village_21_elevator_ride_rant_01_f_01",
			},
			sound_events_duration = {
				[1] = 1.6301250457764,
			},
		},
		pwh_village_21_elevator_ride_rant_02_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_21_elevator_ride_rant_02_b_01",
			},
			sound_events = {
				[1] = "pwh_village_21_elevator_ride_rant_02_b_01",
			},
			sound_events_duration = {
				[1] = 2.9573333263397,
			},
		},
		pwh_village_21_elevator_ride_rant_02_f = {
			additional_trigger_heard = "elevator_rant_multiple_response_trigger_02",
			category = "level_talk_must_play_multiple",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_village_21_elevator_ride_rant_02_f_01",
			},
			sound_events = {
				[1] = "pwh_village_21_elevator_ride_rant_02_f_01",
			},
			sound_events_duration = {
				[1] = 4.2870416641235,
			},
		},
		pwh_village_21_elevator_ride_rant_03_a = {
			category = "cut_scene_interrupt_three",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pwh_village_21_elevator_ride_rant_03_a_01",
			},
			sound_events = {
				[1] = "pwh_village_21_elevator_ride_rant_03_a_01",
			},
			sound_events_duration = {
				[1] = 5.1378045082092,
			},
		},
		pwh_village_21_elevator_ride_rant_03_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pwh_village_21_elevator_ride_rant_03_c_01",
			},
			sound_events = {
				[1] = "pwh_village_21_elevator_ride_rant_03_c_01",
			},
			sound_events_duration = {
				[1] = 10.888604164124,
			},
		},
		pwh_village_21_elevator_ride_rant_03_e = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_village_21_elevator_ride_rant_03_e_01",
			},
			sound_events = {
				[1] = "pwh_village_21_elevator_ride_rant_03_e_01",
			},
			sound_events_duration = {
				[1] = 2.0533332824707,
			},
		},
		pwh_village_22_elevator_ride_ends_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_contempt",
			},
			localization_strings = {
				[1] = "pwh_village_22_elevator_ride_ends_a_01",
			},
			sound_events = {
				[1] = "pwh_village_22_elevator_ride_ends_a_01",
			},
			sound_events_duration = {
				[1] = 3.5140833854675,
			},
		},
		pwh_village_27_factory_yard_unique_01_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
			},
			localization_strings = {
				[1] = "pwh_village_27_factory_yard_unique_01_b_01",
			},
			sound_events = {
				[1] = "pwh_village_27_factory_yard_unique_01_b_01",
			},
			sound_events_duration = {
				[1] = 4.6667289733887,
			},
		},
		pwh_village_27_factory_yard_unique_02_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
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
				[1] = "pwh_village_27_factory_yard_unique_02_a_01",
			},
			sound_events = {
				[1] = "pwh_village_27_factory_yard_unique_02_a_01",
			},
			sound_events_duration = {
				[1] = 6.4620623588562,
			},
		},
		pwh_village_27_factory_yard_unique_03_b = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pwh_village_27_factory_yard_unique_03_b_01",
			},
			sound_events = {
				[1] = "pwh_village_27_factory_yard_unique_03_b_01",
			},
			sound_events_duration = {
				[1] = 4.6482915878296,
			},
		},
		pwh_village_27_factory_yard_unique_04_a = {
			category = "story_talk",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_disgust",
			},
			localization_strings = {
				[1] = "pwh_village_27_factory_yard_unique_04_a_01",
			},
			sound_events = {
				[1] = "pwh_village_27_factory_yard_unique_04_a_01",
			},
			sound_events_duration = {
				[1] = 5.3508958816528,
			},
		},
		pwh_village_36_onboard_01_a = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_36_onboard_01_a_01",
			},
			sound_distance = math.huge,
			sound_events = {
				[1] = "pwh_village_36_onboard_01_a_01",
			},
			sound_events_duration = {
				[1] = 4.372166633606,
			},
		},
		pwh_village_36_onboard_02_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_36_onboard_02_b_01",
			},
			sound_events = {
				[1] = "pwh_village_36_onboard_02_b_01",
			},
			sound_events_duration = {
				[1] = 5.3833122253418,
			},
		},
		pwh_village_36_onboard_03_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_curious",
			},
			localization_strings = {
				[1] = "pwh_village_36_onboard_03_b_01",
			},
			sound_events = {
				[1] = "pwh_village_36_onboard_03_b_01",
			},
			sound_events_duration = {
				[1] = 6.1852917671204,
			},
		},
		pwh_village_36_onboard_05_b = {
			category = "cut_scene",
			database = "hero_conversations_dlc_whaling_village",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_angry",
			},
			localization_strings = {
				[1] = "pwh_village_36_onboard_05_b_01",
			},
			sound_events = {
				[1] = "pwh_village_36_onboard_05_b_01",
			},
			sound_events_duration = {
				[1] = 4.1823124885559,
			},
		},
	})
end
