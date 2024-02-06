-- chunkname: @dialogues/generated/npc_dlc_drachenfels_portals.lua

return function ()
	define_rule({
		name = "ngkd_portals_daemon_challenge",
		response = "ngkd_portals_daemon_challenge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"portals_daemon_challenge",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"npc_gatekeeper_daemon",
			},
		},
	})
	define_rule({
		name = "pbw_portals_crypt_event_demon_voice",
		response = "pbw_portals_crypt_event_demon_voice",
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
				"ngkd_portals_daemon_challenge",
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
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pdr_portals_crypt_event_demon_voice",
		response = "pdr_portals_crypt_event_demon_voice",
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
				"ngkd_portals_daemon_challenge",
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
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pes_portals_crypt_event_demon_voice",
		response = "pes_portals_crypt_event_demon_voice",
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
				"ngkd_portals_daemon_challenge",
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
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwe_portals_crypt_event_demon_voice",
		response = "pwe_portals_crypt_event_demon_voice",
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
				"ngkd_portals_daemon_challenge",
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
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_portals_crypt_event_demon_voice",
		response = "pwh_portals_crypt_event_demon_voice",
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
				"ngkd_portals_daemon_challenge",
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
				"ngkd_portals_daemon_challenge_reply",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"ngkd_portals_daemon_challenge_reply",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		ngkd_portals_daemon_challenge = {
			category = "boss_talk",
			database = "npc_dlc_drachenfels_portals",
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
				[1] = "ngkd_portals_daemon_challenge_01",
				[2] = "ngkd_portals_daemon_challenge_03",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "ngkd_portals_daemon_challenge_01",
				[2] = "ngkd_portals_daemon_challenge_03",
			},
			sound_events_duration = {
				[1] = 4.5272116661072,
				[2] = 5.1037521362305,
			},
		},
		pbw_portals_crypt_event_demon_voice = {
			category = "story_talk_must_reply",
			database = "npc_dlc_drachenfels_portals",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_portals_crypt_event_demon_voice_01",
				"pbw_portals_crypt_event_demon_voice_02",
				"pbw_portals_crypt_event_demon_voice_03",
				"pbw_portals_crypt_event_demon_voice_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_portals_crypt_event_demon_voice_01",
				"pbw_portals_crypt_event_demon_voice_02",
				"pbw_portals_crypt_event_demon_voice_03",
				"pbw_portals_crypt_event_demon_voice_04",
			},
			sound_events_duration = {
				3.190687417984,
				2.7134375572205,
				3.2666459083557,
				3.9763958454132,
			},
		},
		pdr_portals_crypt_event_demon_voice = {
			category = "story_talk_must_reply",
			database = "npc_dlc_drachenfels_portals",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pdr_portals_crypt_event_demon_voice_01",
				"pdr_portals_crypt_event_demon_voice_02",
				"pdr_portals_crypt_event_demon_voice_03",
				"pdr_portals_crypt_event_demon_voice_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_portals_crypt_event_demon_voice_01",
				"pdr_portals_crypt_event_demon_voice_02",
				"pdr_portals_crypt_event_demon_voice_03",
				"pdr_portals_crypt_event_demon_voice_04",
			},
			sound_events_duration = {
				4.9402289390564,
				1.4783124923706,
				3.3614583015442,
				1.7735625505447,
			},
		},
		pes_portals_crypt_event_demon_voice = {
			category = "story_talk_must_reply",
			database = "npc_dlc_drachenfels_portals",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pes_portals_crypt_event_demon_voice_01",
				"pes_portals_crypt_event_demon_voice_02",
				"pes_portals_crypt_event_demon_voice_03",
				"pes_portals_crypt_event_demon_voice_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_portals_crypt_event_demon_voice_01",
				"pes_portals_crypt_event_demon_voice_02",
				"pes_portals_crypt_event_demon_voice_03",
				"pes_portals_crypt_event_demon_voice_04",
			},
			sound_events_duration = {
				1.2156875133514,
				0.89085417985916,
				3.5248959064484,
				1.0278958082199,
			},
		},
		pwe_portals_crypt_event_demon_voice = {
			category = "story_talk_must_reply",
			database = "npc_dlc_drachenfels_portals",
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
				"face_calm",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwe_portals_crypt_event_demon_voice_01",
				"pwe_portals_crypt_event_demon_voice_02",
				"pwe_portals_crypt_event_demon_voice_03",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_portals_crypt_event_demon_voice_01",
				"pwe_portals_crypt_event_demon_voice_02",
				"pwe_portals_crypt_event_demon_voice_03",
			},
			sound_events_duration = {
				0.63887500762939,
				1.6103541851044,
				2.9927188158035,
			},
		},
		pwh_portals_crypt_event_demon_voice = {
			category = "story_talk_must_reply",
			database = "npc_dlc_drachenfels_portals",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwh_portals_crypt_event_demon_voice_01",
				"pwh_portals_crypt_event_demon_voice_02",
				"pwh_portals_crypt_event_demon_voice_03",
				"pwh_portals_crypt_event_demon_voice_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_portals_crypt_event_demon_voice_01",
				"pwh_portals_crypt_event_demon_voice_02",
				"pwh_portals_crypt_event_demon_voice_03",
				"pwh_portals_crypt_event_demon_voice_04",
			},
			sound_events_duration = {
				7.2278752326965,
				4.6356873512268,
				4.5563125610352,
				6.5775208473206,
			},
		},
	})
end
