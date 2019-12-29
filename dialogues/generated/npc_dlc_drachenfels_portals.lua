return function ()
	define_rule({
		response = "ngkd_portals_daemon_challenge",
		name = "ngkd_portals_daemon_challenge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"portals_daemon_challenge"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_gatekeeper_daemon"
			}
		}
	})
	define_rule({
		name = "pbw_portals_crypt_event_demon_voice",
		response = "pbw_portals_crypt_event_demon_voice",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ngkd_portals_daemon_challenge"
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
			},
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_portals_crypt_event_demon_voice",
		response = "pwh_portals_crypt_event_demon_voice",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ngkd_portals_daemon_challenge"
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
			},
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_portals_crypt_event_demon_voice",
		response = "pdr_portals_crypt_event_demon_voice",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ngkd_portals_daemon_challenge"
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
			},
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_portals_crypt_event_demon_voice",
		response = "pwe_portals_crypt_event_demon_voice",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ngkd_portals_daemon_challenge"
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
			},
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_portals_crypt_event_demon_voice",
		response = "pes_portals_crypt_event_demon_voice",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"ngkd_portals_daemon_challenge"
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
			},
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pwh_portals_crypt_event_demon_voice = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_portals",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_portals_crypt_event_demon_voice_01",
				"pwh_portals_crypt_event_demon_voice_02",
				"pwh_portals_crypt_event_demon_voice_03",
				"pwh_portals_crypt_event_demon_voice_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_portals_crypt_event_demon_voice_01",
				"pwh_portals_crypt_event_demon_voice_02",
				"pwh_portals_crypt_event_demon_voice_03",
				"pwh_portals_crypt_event_demon_voice_04"
			},
			randomize_indexes = {}
		},
		pdr_portals_crypt_event_demon_voice = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_portals",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_portals_crypt_event_demon_voice_01",
				"pdr_portals_crypt_event_demon_voice_02",
				"pdr_portals_crypt_event_demon_voice_03",
				"pdr_portals_crypt_event_demon_voice_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_portals_crypt_event_demon_voice_01",
				"pdr_portals_crypt_event_demon_voice_02",
				"pdr_portals_crypt_event_demon_voice_03",
				"pdr_portals_crypt_event_demon_voice_04"
			},
			randomize_indexes = {}
		},
		pes_portals_crypt_event_demon_voice = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_portals",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_portals_crypt_event_demon_voice_01",
				"pes_portals_crypt_event_demon_voice_02",
				"pes_portals_crypt_event_demon_voice_03",
				"pes_portals_crypt_event_demon_voice_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_portals_crypt_event_demon_voice_01",
				"pes_portals_crypt_event_demon_voice_02",
				"pes_portals_crypt_event_demon_voice_03",
				"pes_portals_crypt_event_demon_voice_04"
			},
			randomize_indexes = {}
		},
		pwe_portals_crypt_event_demon_voice = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_drachenfels_portals",
			category = "boss_talk",
			dialogue_animations_n = 3,
			sound_events = {
				"pwe_portals_crypt_event_demon_voice_01",
				"pwe_portals_crypt_event_demon_voice_02",
				"pwe_portals_crypt_event_demon_voice_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_portals_crypt_event_demon_voice_01",
				"pwe_portals_crypt_event_demon_voice_02",
				"pwe_portals_crypt_event_demon_voice_03"
			},
			randomize_indexes = {}
		},
		ngkd_portals_daemon_challenge = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "npc_dlc_drachenfels_portals",
			category = "boss_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "ngkd_portals_daemon_challenge_01",
				[2.0] = "ngkd_portals_daemon_challenge_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "ngkd_portals_daemon_challenge_01",
				[2.0] = "ngkd_portals_daemon_challenge_03"
			},
			randomize_indexes = {}
		},
		pbw_portals_crypt_event_demon_voice = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_portals",
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_portals_crypt_event_demon_voice_01",
				"pbw_portals_crypt_event_demon_voice_02",
				"pbw_portals_crypt_event_demon_voice_03",
				"pbw_portals_crypt_event_demon_voice_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_portals_crypt_event_demon_voice_01",
				"pbw_portals_crypt_event_demon_voice_02",
				"pbw_portals_crypt_event_demon_voice_03",
				"pbw_portals_crypt_event_demon_voice_04"
			},
			randomize_indexes = {}
		}
	})
end
