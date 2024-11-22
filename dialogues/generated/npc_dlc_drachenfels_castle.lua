-- chunkname: @dialogues/generated/npc_dlc_drachenfels_castle.lua

return function ()
	define_rule({
		name = "nngl_castle_vo_sorcerer_intro",
		probability = 1,
		response = "nngl_castle_vo_sorcerer_intro",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"castle_vo_sorcerer_greeting",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer_drachenfels",
			},
		},
	})
	define_rule({
		name = "nngl_castle_vo_sorcerer_taunt",
		probability = 1,
		response = "nngl_castle_vo_sorcerer_taunt",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"castle_vo_sorcerer_taunt",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer_drachenfels",
			},
			{
				"faction_memory",
				"nngl_castle_vo_sorcerer_taunt",
				OP.TIMEDIFF,
				OP.GT,
				20,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nngl_castle_vo_sorcerer_taunt",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_castle_vo_meet_sorcerer_heard_npc",
		probability = 1,
		response = "pbw_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
		},
	})
	define_rule({
		name = "pdr_castle_vo_meet_sorcerer_heard_npc",
		probability = 1,
		response = "pdr_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger",
			},
		},
	})
	define_rule({
		name = "pes_castle_vo_meet_sorcerer_heard_npc",
		probability = 1,
		response = "pes_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier",
			},
		},
	})
	define_rule({
		name = "pwe_castle_vo_meet_sorcerer_heard_npc",
		probability = 1,
		response = "pwe_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf",
			},
		},
	})
	define_rule({
		name = "pwh_castle_vo_meet_sorcerer_heard_npc",
		probability = 1,
		response = "pwh_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
		},
	})
	add_dialogues({
		nngl_castle_vo_sorcerer_intro = {
			category = "boss_talk",
			database = "npc_dlc_drachenfels_castle",
			dialogue_animations_n = 3,
			face_animations_n = 3,
			override_awareness = "nngl_castle_vo_sorcerer_intro_done",
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
				"nngl_castle_vo_sorcerer_intro_02",
				"nngl_castle_vo_sorcerer_intro_03",
				"nngl_castle_vo_sorcerer_intro_04",
			},
			randomize_indexes = {},
			sound_events = {
				"nngl_castle_vo_sorcerer_intro_02",
				"nngl_castle_vo_sorcerer_intro_03",
				"nngl_castle_vo_sorcerer_intro_04",
			},
			sound_events_duration = {
				8.2472333908081,
				9.2535429000854,
				8.5205574035644,
			},
		},
		nngl_castle_vo_sorcerer_taunt = {
			category = "boss_talk",
			database = "npc_dlc_drachenfels_castle",
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
				"nngl_bastion_vo_sorcerer_taunt_02",
				"nngl_bastion_vo_sorcerer_taunt_04",
				"nngl_bastion_vo_sorcerer_taunt_05",
			},
			randomize_indexes = {},
			sound_events = {
				"nngl_bastion_vo_sorcerer_taunt_02",
				"nngl_bastion_vo_sorcerer_taunt_04",
				"nngl_bastion_vo_sorcerer_taunt_05",
			},
			sound_events_duration = {
				4.6458239555359,
				6.3390107154846,
				9.0637407302856,
			},
		},
		pbw_castle_vo_meet_sorcerer_heard_npc = {
			category = "player_alerts_boss",
			database = "npc_dlc_drachenfels_castle",
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
				"pbw_castle_vo_meet_sorcerer_01",
				"pbw_castle_vo_meet_sorcerer_02",
				"pbw_castle_vo_meet_sorcerer_03",
				"pbw_castle_vo_meet_sorcerer_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_meet_sorcerer_01",
				"pbw_castle_vo_meet_sorcerer_02",
				"pbw_castle_vo_meet_sorcerer_03",
				"pbw_castle_vo_meet_sorcerer_04",
			},
			sound_events_duration = {
				3.4119791984558,
				4.2249794006348,
				2.7499792575836,
				2.5709791183472,
			},
		},
		pdr_castle_vo_meet_sorcerer_heard_npc = {
			category = "player_alerts_boss",
			database = "npc_dlc_drachenfels_castle",
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
				"pdr_castle_vo_meet_sorcerer_01",
				"pdr_castle_vo_meet_sorcerer_02",
				"pdr_castle_vo_meet_sorcerer_03",
				"pdr_castle_vo_meet_sorcerer_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_castle_vo_meet_sorcerer_01",
				"pdr_castle_vo_meet_sorcerer_02",
				"pdr_castle_vo_meet_sorcerer_03",
				"pdr_castle_vo_meet_sorcerer_04",
			},
			sound_events_duration = {
				4.1729793548584,
				3.3159792423248,
				3.6459791660309,
				2.9269790649414,
			},
		},
		pes_castle_vo_meet_sorcerer_heard_npc = {
			category = "player_alerts_boss",
			database = "npc_dlc_drachenfels_castle",
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
				"pes_castle_vo_meet_sorcerer_01",
				"pes_castle_vo_meet_sorcerer_02",
				"pes_castle_vo_meet_sorcerer_03",
				"pes_castle_vo_meet_sorcerer_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pes_castle_vo_meet_sorcerer_01",
				"pes_castle_vo_meet_sorcerer_02",
				"pes_castle_vo_meet_sorcerer_03",
				"pes_castle_vo_meet_sorcerer_04",
			},
			sound_events_duration = {
				5.7879791259766,
				3.3149790763855,
				2.2509999275208,
				2.6119792461395,
			},
		},
		pwe_castle_vo_meet_sorcerer_heard_npc = {
			category = "player_alerts_boss",
			database = "npc_dlc_drachenfels_castle",
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
				"pwe_castle_vo_meet_sorcerer_01",
				"pwe_castle_vo_meet_sorcerer_02",
				"pwe_castle_vo_meet_sorcerer_03",
				"pwe_castle_vo_meet_sorcerer_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_castle_vo_meet_sorcerer_01",
				"pwe_castle_vo_meet_sorcerer_02",
				"pwe_castle_vo_meet_sorcerer_03",
				"pwe_castle_vo_meet_sorcerer_04",
			},
			sound_events_duration = {
				4.2479791641235,
				3.506979227066,
				3.8569791316986,
				2.754979133606,
			},
		},
		pwh_castle_vo_meet_sorcerer_heard_npc = {
			category = "player_alerts_boss",
			database = "npc_dlc_drachenfels_castle",
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
				"pwh_castle_vo_meet_sorcerer_01",
				"pwh_castle_vo_meet_sorcerer_02",
				"pwh_castle_vo_meet_sorcerer_03",
				"pwh_castle_vo_meet_sorcerer_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_meet_sorcerer_01",
				"pwh_castle_vo_meet_sorcerer_02",
				"pwh_castle_vo_meet_sorcerer_03",
				"pwh_castle_vo_meet_sorcerer_04",
			},
			sound_events_duration = {
				6.6809792518616,
				3.6999790668488,
				3.2289791107178,
				7.9919791221619,
			},
		},
	})
end
