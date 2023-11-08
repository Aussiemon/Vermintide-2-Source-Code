return function ()
	define_rule({
		response = "ndw_daemon_whispers_bright_wizard",
		name = "ndw_daemon_whispers_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_whisper_daemon"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "ndw_daemon_whispers_dwarf_ranger",
		name = "ndw_daemon_whispers_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "ndw_daemon_whispers_empire_soldier",
		name = "ndw_daemon_whispers_empire_soldier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "ndw_daemon_whispers_witch_hunter",
		name = "ndw_daemon_whispers_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "ndw_daemon_whispers_wood_elf",
		name = "ndw_daemon_whispers_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers"
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_whisper_daemon"
			}
		}
	})
	define_rule({
		response = "pbw_archdaemon_response",
		name = "pbw_archdaemon_response",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers_bright_wizard_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_archdaemon_response_overheard",
		name = "pbw_archdaemon_response_overheard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"archdaemon_response"
			},
			{
				"query_context",
				"speaker_name",
				OP.NEQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_archdaemon_response",
		name = "pdr_archdaemon_response",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers_dwarf_ranger_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_archdaemon_response_overheard",
		name = "pdr_archdaemon_response_overheard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"archdaemon_response"
			},
			{
				"query_context",
				"speaker_name",
				OP.NEQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_archdaemon_response",
		name = "pes_archdaemon_response",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers_empire_soldier_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_archdaemon_response_overheard",
		name = "pes_archdaemon_response_overheard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"archdaemon_response"
			},
			{
				"query_context",
				"speaker_name",
				OP.NEQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pwe_archdaemon_response",
		name = "pwe_archdaemon_response",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers_wood_elf_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_archdaemon_response_overheard",
		name = "pwe_archdaemon_response_overheard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"archdaemon_response"
			},
			{
				"query_context",
				"speaker_name",
				OP.NEQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_archdaemon_response",
		name = "pwh_archdaemon_response",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ndw_daemon_whispers_witch_hunter_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_archdaemon_response_overheard",
		name = "pwh_archdaemon_response_overheard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"archdaemon_response"
			},
			{
				"query_context",
				"speaker_name",
				OP.NEQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	add_dialogues({
		ndw_daemon_whispers_bright_wizard = {
			intended_player_profile = "bright_wizard",
			override_awareness = "ndw_daemon_whispers_bright_wizard_done",
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "nwd_conversations_dlc_drachenfels",
			category = "story_talk",
			dialogue_animations_n = 11,
			sound_events_n = 11,
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
				"dialogue_talk",
				"dialogue_talk"
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
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"ndw_daemon_whispers_bright_wizard_01",
				"ndw_daemon_whispers_bright_wizard_02",
				"ndw_daemon_whispers_bright_wizard_03",
				"ndw_daemon_whispers_bright_wizard_04",
				"ndw_daemon_whispers_bright_wizard_05",
				"ndw_daemon_whispers_bright_wizard_06",
				"ndw_daemon_whispers_bright_wizard_07",
				"ndw_daemon_whispers_bright_wizard_08",
				"ndw_daemon_whispers_bright_wizard_09",
				"ndw_daemon_whispers_bright_wizard_10",
				"ndw_daemon_whispers_bright_wizard_11"
			},
			randomize_indexes = {},
			sound_events = {
				"ndw_daemon_whispers_bright_wizard_01",
				"ndw_daemon_whispers_bright_wizard_02",
				"ndw_daemon_whispers_bright_wizard_03",
				"ndw_daemon_whispers_bright_wizard_04",
				"ndw_daemon_whispers_bright_wizard_05",
				"ndw_daemon_whispers_bright_wizard_06",
				"ndw_daemon_whispers_bright_wizard_07",
				"ndw_daemon_whispers_bright_wizard_08",
				"ndw_daemon_whispers_bright_wizard_09",
				"ndw_daemon_whispers_bright_wizard_10",
				"ndw_daemon_whispers_bright_wizard_11"
			},
			sound_events_duration = {
				11.5,
				11.5,
				10.5,
				9.5,
				13,
				7.5,
				12.5,
				11.5,
				8.5,
				11.5,
				15
			}
		},
		ndw_daemon_whispers_dwarf_ranger = {
			intended_player_profile = "dwarf_ranger",
			override_awareness = "ndw_daemon_whispers_dwarf_ranger_done",
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "nwd_conversations_dlc_drachenfels",
			category = "story_talk",
			dialogue_animations_n = 10,
			sound_events_n = 10,
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
				"dialogue_talk"
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
				"face_neutral"
			},
			localization_strings = {
				"ndw_daemon_whispers_dwarf_ranger_01",
				"ndw_daemon_whispers_dwarf_ranger_02",
				"ndw_daemon_whispers_dwarf_ranger_03",
				"ndw_daemon_whispers_dwarf_ranger_04",
				"ndw_daemon_whispers_dwarf_ranger_05",
				"ndw_daemon_whispers_dwarf_ranger_06",
				"ndw_daemon_whispers_dwarf_ranger_07",
				"ndw_daemon_whispers_dwarf_ranger_08",
				"ndw_daemon_whispers_dwarf_ranger_09",
				"ndw_daemon_whispers_dwarf_ranger_11"
			},
			randomize_indexes = {},
			sound_events = {
				"ndw_daemon_whispers_dwarf_ranger_01",
				"ndw_daemon_whispers_dwarf_ranger_02",
				"ndw_daemon_whispers_dwarf_ranger_03",
				"ndw_daemon_whispers_dwarf_ranger_04",
				"ndw_daemon_whispers_dwarf_ranger_05",
				"ndw_daemon_whispers_dwarf_ranger_06",
				"ndw_daemon_whispers_dwarf_ranger_07",
				"ndw_daemon_whispers_dwarf_ranger_08",
				"ndw_daemon_whispers_dwarf_ranger_09",
				"ndw_daemon_whispers_dwarf_ranger_11"
			},
			sound_events_duration = {
				11,
				11,
				11,
				10.5,
				8,
				12,
				13.5,
				9.5,
				13.5,
				12.5
			}
		},
		ndw_daemon_whispers_empire_soldier = {
			intended_player_profile = "empire_soldier",
			override_awareness = "ndw_daemon_whispers_empire_soldier_done",
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "nwd_conversations_dlc_drachenfels",
			category = "story_talk",
			dialogue_animations_n = 9,
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
				"dialogue_talk"
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
				"face_neutral"
			},
			localization_strings = {
				"ndw_daemon_whispers_empire_soldier_01",
				"ndw_daemon_whispers_empire_soldier_02",
				"ndw_daemon_whispers_empire_soldier_03",
				"ndw_daemon_whispers_empire_soldier_04",
				"ndw_daemon_whispers_empire_soldier_05",
				"ndw_daemon_whispers_empire_soldier_08",
				"ndw_daemon_whispers_empire_soldier_09",
				"ndw_daemon_whispers_empire_soldier_10",
				"ndw_daemon_whispers_empire_soldier_11"
			},
			randomize_indexes = {},
			sound_events = {
				"ndw_daemon_whispers_empire_soldier_01",
				"ndw_daemon_whispers_empire_soldier_02",
				"ndw_daemon_whispers_empire_soldier_03",
				"ndw_daemon_whispers_empire_soldier_04",
				"ndw_daemon_whispers_empire_soldier_05",
				"ndw_daemon_whispers_empire_soldier_08",
				"ndw_daemon_whispers_empire_soldier_09",
				"ndw_daemon_whispers_empire_soldier_10",
				"ndw_daemon_whispers_empire_soldier_11"
			},
			sound_events_duration = {
				9.5,
				9.5200834274292,
				8,
				9.5,
				11.839812278748,
				10.5,
				10.5,
				10.5,
				11.5
			}
		},
		ndw_daemon_whispers_witch_hunter = {
			intended_player_profile = "witch_hunter",
			override_awareness = "ndw_daemon_whispers_witch_hunter_done",
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "nwd_conversations_dlc_drachenfels",
			category = "story_talk",
			dialogue_animations_n = 11,
			sound_events_n = 11,
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
				"dialogue_talk",
				"dialogue_talk"
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
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"ndw_daemon_whispers_witch_hunter_01",
				"ndw_daemon_whispers_witch_hunter_02",
				"ndw_daemon_whispers_witch_hunter_03",
				"ndw_daemon_whispers_witch_hunter_04",
				"ndw_daemon_whispers_witch_hunter_05",
				"ndw_daemon_whispers_witch_hunter_06",
				"ndw_daemon_whispers_witch_hunter_07",
				"ndw_daemon_whispers_witch_hunter_08",
				"ndw_daemon_whispers_witch_hunter_09",
				"ndw_daemon_whispers_witch_hunter_10",
				"ndw_daemon_whispers_witch_hunter_11"
			},
			randomize_indexes = {},
			sound_events = {
				"ndw_daemon_whispers_witch_hunter_01",
				"ndw_daemon_whispers_witch_hunter_02",
				"ndw_daemon_whispers_witch_hunter_03",
				"ndw_daemon_whispers_witch_hunter_04",
				"ndw_daemon_whispers_witch_hunter_05",
				"ndw_daemon_whispers_witch_hunter_06",
				"ndw_daemon_whispers_witch_hunter_07",
				"ndw_daemon_whispers_witch_hunter_08",
				"ndw_daemon_whispers_witch_hunter_09",
				"ndw_daemon_whispers_witch_hunter_10",
				"ndw_daemon_whispers_witch_hunter_11"
			},
			sound_events_duration = {
				10.5,
				9.5,
				11,
				9,
				8.5,
				10.865249633789,
				10.865249633789,
				8.8652496337891,
				13,
				13.5,
				10
			}
		},
		ndw_daemon_whispers_wood_elf = {
			intended_player_profile = "wood_elf",
			override_awareness = "ndw_daemon_whispers_wood_elf_done",
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "nwd_conversations_dlc_drachenfels",
			category = "story_talk",
			dialogue_animations_n = 11,
			sound_events_n = 11,
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
				"dialogue_talk",
				"dialogue_talk"
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
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"ndw_daemon_whispers_wood_elf_01",
				"ndw_daemon_whispers_wood_elf_02",
				"ndw_daemon_whispers_wood_elf_03",
				"ndw_daemon_whispers_wood_elf_04",
				"ndw_daemon_whispers_wood_elf_05",
				"ndw_daemon_whispers_wood_elf_06",
				"ndw_daemon_whispers_wood_elf_07",
				"ndw_daemon_whispers_wood_elf_08",
				"ndw_daemon_whispers_wood_elf_09",
				"ndw_daemon_whispers_wood_elf_10",
				"ndw_daemon_whispers_wood_elf_11"
			},
			randomize_indexes = {},
			sound_events = {
				"ndw_daemon_whispers_wood_elf_01",
				"ndw_daemon_whispers_wood_elf_02",
				"ndw_daemon_whispers_wood_elf_03",
				"ndw_daemon_whispers_wood_elf_04",
				"ndw_daemon_whispers_wood_elf_05",
				"ndw_daemon_whispers_wood_elf_06",
				"ndw_daemon_whispers_wood_elf_07",
				"ndw_daemon_whispers_wood_elf_08",
				"ndw_daemon_whispers_wood_elf_09",
				"ndw_daemon_whispers_wood_elf_10",
				"ndw_daemon_whispers_wood_elf_11"
			},
			sound_events_duration = {
				9,
				11.5,
				14.5,
				9.4707708358765,
				13.5,
				13.5,
				13.5,
				16,
				13.5,
				13.5,
				9
			}
		},
		pbw_archdaemon_response = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk_must_reply",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pbw_archdaemon_response_01",
				"pbw_archdaemon_response_02",
				"pbw_archdaemon_response_03",
				"pbw_archdaemon_response_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_archdaemon_response_01",
				"pbw_archdaemon_response_02",
				"pbw_archdaemon_response_03",
				"pbw_archdaemon_response_04"
			},
			sound_events_duration = {
				1.0526249408722,
				1.2081874608993,
				3.3553957939148,
				1.9626458883286
			}
		},
		pbw_archdaemon_response_overheard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pbw_archdaemon_response_overheard_01",
				"pbw_archdaemon_response_overheard_02",
				"pbw_archdaemon_response_overheard_03",
				"pbw_archdaemon_response_overheard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_archdaemon_response_overheard_01",
				"pbw_archdaemon_response_overheard_02",
				"pbw_archdaemon_response_overheard_03",
				"pbw_archdaemon_response_overheard_04"
			},
			sound_events_duration = {
				0.61360418796539,
				1.5746874809265,
				0.90799999237061,
				0.95272916555405
			}
		},
		pdr_archdaemon_response = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk_must_reply",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_archdaemon_response_01",
				"pdr_archdaemon_response_02",
				"pdr_archdaemon_response_03",
				"pdr_archdaemon_response_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_archdaemon_response_01",
				"pdr_archdaemon_response_02",
				"pdr_archdaemon_response_03",
				"pdr_archdaemon_response_04"
			},
			sound_events_duration = {
				1.3005833625793,
				0.97733330726624,
				1.1853541135788,
				0.87972915172577
			}
		},
		pdr_archdaemon_response_overheard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_archdaemon_response_overheard_01",
				"pdr_archdaemon_response_overheard_02",
				"pdr_archdaemon_response_overheard_03",
				"pdr_archdaemon_response_overheard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_archdaemon_response_overheard_01",
				"pdr_archdaemon_response_overheard_02",
				"pdr_archdaemon_response_overheard_03",
				"pdr_archdaemon_response_overheard_04"
			},
			sound_events_duration = {
				1.4652708768845,
				0.68402081727982,
				1.4239791631699,
				1.3405833244324
			}
		},
		pes_archdaemon_response = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk_must_reply",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pes_archdaemon_response_01",
				"pes_archdaemon_response_02",
				"pes_archdaemon_response_03",
				"pes_archdaemon_response_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_archdaemon_response_01",
				"pes_archdaemon_response_02",
				"pes_archdaemon_response_03",
				"pes_archdaemon_response_04"
			},
			sound_events_duration = {
				1.9077708721161,
				0.69670832157135,
				1.2392083406448,
				1.3866666555405
			}
		},
		pes_archdaemon_response_overheard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pes_archdaemon_response_overheard_01",
				"pes_archdaemon_response_overheard_02",
				"pes_archdaemon_response_overheard_03",
				"pes_archdaemon_response_overheard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_archdaemon_response_overheard_01",
				"pes_archdaemon_response_overheard_02",
				"pes_archdaemon_response_overheard_03",
				"pes_archdaemon_response_overheard_04"
			},
			sound_events_duration = {
				0.72358334064484,
				0.65302085876465,
				1.1392707824707,
				0.70633333921432
			}
		},
		pwe_archdaemon_response = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk_must_reply",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwe_archdaemon_response_01",
				"pwe_archdaemon_response_02",
				"pwe_archdaemon_response_03",
				"pwe_archdaemon_response_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_archdaemon_response_01",
				"pwe_archdaemon_response_02",
				"pwe_archdaemon_response_03",
				"pwe_archdaemon_response_04"
			},
			sound_events_duration = {
				1.6076250076294,
				1.4716666936874,
				2.2540209293366,
				1.6086875200272
			}
		},
		pwe_archdaemon_response_overheard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwe_archdaemon_response_overheard_01",
				"pwe_archdaemon_response_overheard_02",
				"pwe_archdaemon_response_overheard_03",
				"pwe_archdaemon_response_overheard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_archdaemon_response_overheard_01",
				"pwe_archdaemon_response_overheard_02",
				"pwe_archdaemon_response_overheard_03",
				"pwe_archdaemon_response_overheard_04"
			},
			sound_events_duration = {
				1.1503958702087,
				1.9968333244324,
				1.4216250181198,
				0.9072083234787
			}
		},
		pwh_archdaemon_response = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk_must_reply",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_archdaemon_response_01",
				"pwh_archdaemon_response_02",
				"pwh_archdaemon_response_03",
				"pwh_archdaemon_response_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_archdaemon_response_01",
				"pwh_archdaemon_response_02",
				"pwh_archdaemon_response_03",
				"pwh_archdaemon_response_04"
			},
			sound_events_duration = {
				1.402583360672,
				2.910395860672,
				1.1788333654404,
				2.7004792690277
			}
		},
		pwh_archdaemon_response_overheard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "nwd_conversations_dlc_drachenfels",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwh_archdaemon_response_overheard_01",
				"pwh_archdaemon_response_overheard_02",
				"pwh_archdaemon_response_overheard_03",
				"pwh_archdaemon_response_overheard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_archdaemon_response_overheard_01",
				"pwh_archdaemon_response_overheard_02",
				"pwh_archdaemon_response_overheard_03",
				"pwh_archdaemon_response_overheard_04"
			},
			sound_events_duration = {
				0.89262497425079,
				1.3445833921433,
				0.87381249666214,
				1.1336666345596
			}
		}
	})
end
