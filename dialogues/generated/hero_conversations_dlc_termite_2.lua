-- chunkname: @dialogues/generated/hero_conversations_dlc_termite_2.lua

return function ()
	define_rule({
		name = "pbw_power_cavern_elevator_conversation_a",
		probability = 1,
		response = "pbw_power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_elevator_conversation",
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
		name = "pbw_power_cavern_elevator_conversation_b",
		probability = 1,
		response = "pbw_power_cavern_elevator_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_a",
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
		name = "pbw_power_cavern_elevator_conversation_c",
		probability = 1,
		response = "pbw_power_cavern_elevator_conversation_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_b",
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
		name = "pbw_power_escape_plot_conversation_elf_a",
		probability = 1,
		response = "pbw_power_escape_plot_conversation_elf_a",
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
				"faction_memory",
				"flow_escape_active",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"power_escape_plot_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_escape_plot_conversation",
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
		name = "pbw_power_escape_plot_conversation_no_elf_c",
		probability = 1,
		response = "pbw_power_escape_plot_conversation_no_elf_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_escape_plot_conversation_elf_b",
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
		name = "pdr_power_cavern_elevator_conversation_a",
		probability = 1,
		response = "pdr_power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_elevator_conversation",
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
		name = "pdr_power_cavern_elevator_conversation_b",
		probability = 1,
		response = "pdr_power_cavern_elevator_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_a",
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
		name = "pdr_power_cavern_elevator_conversation_c",
		probability = 1,
		response = "pdr_power_cavern_elevator_conversation_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_b",
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
		name = "pdr_power_escape_plot_conversation_elf_b",
		probability = 1,
		response = "pdr_power_escape_plot_conversation_elf_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_escape_plot_conversation_elf_a",
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
		name = "pdr_power_escape_plot_conversation_no_elf_c",
		probability = 1,
		response = "pdr_power_escape_plot_conversation_no_elf_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_escape_plot_conversation_elf_b",
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
		name = "pes_power_cavern_elevator_conversation_a",
		probability = 1,
		response = "pes_power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_elevator_conversation",
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
		name = "pes_power_cavern_elevator_conversation_b",
		probability = 1,
		response = "pes_power_cavern_elevator_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_a",
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
		name = "pes_power_cavern_elevator_conversation_c",
		probability = 1,
		response = "pes_power_cavern_elevator_conversation_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_b",
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
		name = "pes_power_escape_plot_conversation_elf_b",
		probability = 1,
		response = "pes_power_escape_plot_conversation_elf_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_escape_plot_conversation_elf_a",
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
		name = "pes_power_escape_plot_conversation_no_elf_c",
		probability = 1,
		response = "pes_power_escape_plot_conversation_no_elf_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_escape_plot_conversation_elf_b",
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
		name = "pwe_power_cavern_elevator_conversation_a",
		probability = 1,
		response = "pwe_power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_elevator_conversation",
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
		name = "pwe_power_cavern_elevator_conversation_b",
		probability = 1,
		response = "pwe_power_cavern_elevator_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_a",
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
		name = "pwe_power_cavern_elevator_conversation_c",
		probability = 1,
		response = "pwe_power_cavern_elevator_conversation_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_b",
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
		name = "pwe_power_escape_plot_conversation_elf_a",
		probability = 1,
		response = "pwe_power_escape_plot_conversation_elf_a",
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
				"faction_memory",
				"flow_escape_active",
				OP.EQ,
				1,
			},
			{
				"faction_memory",
				"power_escape_plot_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_escape_plot_conversation",
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
		name = "pwh_power_cavern_elevator_conversation_a",
		probability = 1,
		response = "pwh_power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation_a",
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
				"power_cavern_elevator_conversation",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"power_cavern_elevator_conversation",
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
		name = "pwh_power_cavern_elevator_conversation_b",
		probability = 1,
		response = "pwh_power_cavern_elevator_conversation_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_a",
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
		name = "pwh_power_cavern_elevator_conversation_c",
		probability = 1,
		response = "pwh_power_cavern_elevator_conversation_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_cavern_elevator_conversation_b",
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
		name = "pwh_power_escape_plot_conversation_elf_b",
		probability = 1,
		response = "pwh_power_escape_plot_conversation_elf_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_escape_plot_conversation_elf_a",
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
		name = "pwh_power_escape_plot_conversation_no_elf_c",
		probability = 1,
		response = "pwh_power_escape_plot_conversation_no_elf_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"power_escape_plot_conversation_elf_b",
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
		pbw_power_cavern_elevator_conversation_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pbw_power_cavern_elevator_conversation_a_01",
				[2] = "pbw_power_cavern_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_elevator_conversation_a_01",
				[2] = "pbw_power_cavern_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 4.3381876945496,
				[2] = 4.7708334922791,
			},
		},
		pbw_power_cavern_elevator_conversation_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pbw_power_cavern_elevator_conversation_b_01",
				[2] = "pbw_power_cavern_elevator_conversation_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_elevator_conversation_b_01",
				[2] = "pbw_power_cavern_elevator_conversation_b_02",
			},
			sound_events_duration = {
				[1] = 3.6553957462311,
				[2] = 3.7130625247955,
			},
		},
		pbw_power_cavern_elevator_conversation_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pbw_power_cavern_elevator_conversation_c_01",
				[2] = "pbw_power_cavern_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_cavern_elevator_conversation_c_01",
				[2] = "pbw_power_cavern_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 3.4791874885559,
				[2] = 4.134708404541,
			},
		},
		pbw_power_escape_plot_conversation_elf_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_power_escape_plot_conversation_elf_a_01",
				"pbw_power_escape_plot_conversation_elf_a_02",
				"pbw_power_escape_plot_conversation_elf_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_power_escape_plot_conversation_elf_a_01",
				"pbw_power_escape_plot_conversation_elf_a_02",
				"pbw_power_escape_plot_conversation_elf_a_03",
			},
			sound_events_duration = {
				3.5252499580383,
				4.4979376792908,
				6.4825835227966,
			},
		},
		pbw_power_escape_plot_conversation_no_elf_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pbw_power_escape_plot_conversation_no_elf_c_01",
				[2] = "pbw_power_escape_plot_conversation_no_elf_c_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_power_escape_plot_conversation_no_elf_c_01",
				[2] = "pbw_power_escape_plot_conversation_no_elf_c_01",
			},
			sound_events_duration = {
				[1] = 2.6170208454132,
				[2] = 2.6170208454132,
			},
		},
		pdr_power_cavern_elevator_conversation_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pdr_power_cavern_elevator_conversation_a_01",
				[2] = "pdr_power_cavern_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_elevator_conversation_a_01",
				[2] = "pdr_power_cavern_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 3.4942083358765,
				[2] = 3.9924790859222,
			},
		},
		pdr_power_cavern_elevator_conversation_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pdr_power_cavern_elevator_conversation_b_01",
				[2] = "pdr_power_cavern_elevator_conversation_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_elevator_conversation_b_01",
				[2] = "pdr_power_cavern_elevator_conversation_b_02",
			},
			sound_events_duration = {
				[1] = 4.3278956413269,
				[2] = 4.2944169044495,
			},
		},
		pdr_power_cavern_elevator_conversation_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pdr_power_cavern_elevator_conversation_c_01",
				[2] = "pdr_power_cavern_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_cavern_elevator_conversation_c_01",
				[2] = "pdr_power_cavern_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 5.0031666755676,
				[2] = 4.168541431427,
			},
		},
		pdr_power_escape_plot_conversation_elf_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pdr_power_escape_plot_conversation_elf_b_01",
				[2] = "pdr_power_escape_plot_conversation_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_plot_conversation_elf_b_01",
				[2] = "pdr_power_escape_plot_conversation_elf_b_02",
			},
			sound_events_duration = {
				[1] = 3.634604215622,
				[2] = 2.6365833282471,
			},
		},
		pdr_power_escape_plot_conversation_no_elf_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pdr_power_escape_plot_conversation_no_elf_c_02",
				[2] = "pdr_power_escape_plot_conversation_no_elf_c_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pdr_power_escape_plot_conversation_no_elf_c_02",
				[2] = "pdr_power_escape_plot_conversation_no_elf_c_01",
			},
			sound_events_duration = {
				[1] = 1.9516458511352,
				[2] = 5.0664582252502,
			},
		},
		pes_power_cavern_elevator_conversation_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pes_power_cavern_elevator_conversation_a_01",
				[2] = "pes_power_cavern_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_elevator_conversation_a_01",
				[2] = "pes_power_cavern_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 4.1617498397827,
				[2] = 3.7819583415985,
			},
		},
		pes_power_cavern_elevator_conversation_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pes_power_cavern_elevator_conversation_b_01",
				[2] = "pes_power_cavern_elevator_conversation_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_elevator_conversation_b_01",
				[2] = "pes_power_cavern_elevator_conversation_b_02",
			},
			sound_events_duration = {
				[1] = 4.2722082138061,
				[2] = 3.8963541984558,
			},
		},
		pes_power_cavern_elevator_conversation_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pes_power_cavern_elevator_conversation_c_01",
				[2] = "pes_power_cavern_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_cavern_elevator_conversation_c_01",
				[2] = "pes_power_cavern_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 2.9348957538605,
				[2] = 3.9427499771118,
			},
		},
		pes_power_escape_plot_conversation_elf_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pes_power_escape_plot_conversation_elf_b_01",
				[2] = "pes_power_escape_plot_conversation_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_plot_conversation_elf_b_01",
				[2] = "pes_power_escape_plot_conversation_elf_b_02",
			},
			sound_events_duration = {
				[1] = 2.6514582633972,
				[2] = 2.1541457176209,
			},
		},
		pes_power_escape_plot_conversation_no_elf_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pes_power_escape_plot_conversation_no_elf_c_02",
				[2] = "pes_power_escape_plot_conversation_no_elf_c_01",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_power_escape_plot_conversation_no_elf_c_02",
				[2] = "pes_power_escape_plot_conversation_no_elf_c_01",
			},
			sound_events_duration = {
				[1] = 2.1572291851044,
				[2] = 7.4826664924622,
			},
		},
		pwe_power_cavern_elevator_conversation_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pwe_power_cavern_elevator_conversation_a_01",
				[2] = "pwe_power_cavern_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_elevator_conversation_a_01",
				[2] = "pwe_power_cavern_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 3.5052499771118,
				[2] = 4.007354259491,
			},
		},
		pwe_power_cavern_elevator_conversation_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pwe_power_cavern_elevator_conversation_b_01",
				[2] = "pwe_power_cavern_elevator_conversation_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_elevator_conversation_b_01",
				[2] = "pwe_power_cavern_elevator_conversation_b_02",
			},
			sound_events_duration = {
				[1] = 4.2561459541321,
				[2] = 5.8343749046326,
			},
		},
		pwe_power_cavern_elevator_conversation_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pwe_power_cavern_elevator_conversation_c_01",
				[2] = "pwe_power_cavern_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_power_cavern_elevator_conversation_c_01",
				[2] = "pwe_power_cavern_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 2.7491874694824,
				[2] = 3.3486874103546,
			},
		},
		pwe_power_escape_plot_conversation_elf_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			randomize_indexes_n = 0,
			sound_events_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwe_power_escape_plot_conversation_elf_a_01",
				"pwe_power_escape_plot_conversation_elf_a_02",
				"pwe_power_escape_plot_conversation_elf_a_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_power_escape_plot_conversation_elf_a_01",
				"pwe_power_escape_plot_conversation_elf_a_02",
				"pwe_power_escape_plot_conversation_elf_a_03",
			},
			sound_events_duration = {
				4.0866456031799,
				4.8661251068115,
				4.4530000686645,
			},
		},
		pwh_power_cavern_elevator_conversation_a = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pwh_power_cavern_elevator_conversation_a_01",
				[2] = "pwh_power_cavern_elevator_conversation_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_elevator_conversation_a_01",
				[2] = "pwh_power_cavern_elevator_conversation_a_02",
			},
			sound_events_duration = {
				[1] = 3.5476250648499,
				[2] = 3.2467291355133,
			},
		},
		pwh_power_cavern_elevator_conversation_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pwh_power_cavern_elevator_conversation_b_01",
				[2] = "pwh_power_cavern_elevator_conversation_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_elevator_conversation_b_01",
				[2] = "pwh_power_cavern_elevator_conversation_b_02",
			},
			sound_events_duration = {
				[1] = 5.6785206794739,
				[2] = 2.7759165763855,
			},
		},
		pwh_power_cavern_elevator_conversation_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pwh_power_cavern_elevator_conversation_c_01",
				[2] = "pwh_power_cavern_elevator_conversation_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_cavern_elevator_conversation_c_01",
				[2] = "pwh_power_cavern_elevator_conversation_c_02",
			},
			sound_events_duration = {
				[1] = 3.4779374599457,
				[2] = 3.3433125019074,
			},
		},
		pwh_power_escape_plot_conversation_elf_b = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pwh_power_escape_plot_conversation_elf_b_01",
				[2] = "pwh_power_escape_plot_conversation_elf_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_plot_conversation_elf_b_01",
				[2] = "pwh_power_escape_plot_conversation_elf_b_02",
			},
			sound_events_duration = {
				[1] = 3.8669166564941,
				[2] = 5.0299167633057,
			},
		},
		pwh_power_escape_plot_conversation_no_elf_c = {
			category = "level_talk_must_play",
			database = "hero_conversations_dlc_termite_2",
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
				[1] = "pwh_power_escape_plot_conversation_no_elf_c_01",
				[2] = "pwh_power_escape_plot_conversation_no_elf_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_power_escape_plot_conversation_no_elf_c_01",
				[2] = "pwh_power_escape_plot_conversation_no_elf_c_02",
			},
			sound_events_duration = {
				[1] = 5.4112915992737,
				[2] = 6.0264582633972,
			},
		},
	})
end
