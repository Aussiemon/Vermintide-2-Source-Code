return function ()
	define_rule({
		response = "nngl_castle_vo_sorcerer_intro",
		name = "nngl_castle_vo_sorcerer_intro",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"castle_vo_sorcerer_greeting"
			},
			{
				"query_context",
				"player_profile",
				OP.EQ,
				"chaos_exalted_sorcerer_drachenfels"
			}
		}
	})
	define_rule({
		name = "nngl_castle_vo_sorcerer_taunt",
		response = "nngl_castle_vo_sorcerer_taunt",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"castle_vo_sorcerer_taunt"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer_drachenfels"
			},
			{
				"faction_memory",
				"nngl_castle_vo_sorcerer_taunt",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"nngl_castle_vo_sorcerer_taunt",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pbw_castle_vo_meet_sorcerer_heard_npc",
		name = "pbw_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pdr_castle_vo_meet_sorcerer_heard_npc",
		name = "pdr_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_castle_vo_meet_sorcerer_heard_npc",
		name = "pes_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pwe_castle_vo_meet_sorcerer_heard_npc",
		name = "pwe_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwh_castle_vo_meet_sorcerer_heard_npc",
		name = "pwh_castle_vo_meet_sorcerer_heard_npc",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nngl_castle_vo_sorcerer_intro_done"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	add_dialogues({
		nngl_castle_vo_sorcerer_intro = {
			override_awareness = "nngl_castle_vo_sorcerer_intro_done",
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_drachenfels_castle",
			sound_events_n = 3,
			category = "boss_talk",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"nngl_castle_vo_sorcerer_intro_02",
				"nngl_castle_vo_sorcerer_intro_03",
				"nngl_castle_vo_sorcerer_intro_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nngl_castle_vo_sorcerer_intro_02",
				"nngl_castle_vo_sorcerer_intro_03",
				"nngl_castle_vo_sorcerer_intro_04"
			},
			sound_events_duration = {
				8.2472333908081,
				9.2535429000854,
				8.5205574035644
			}
		},
		nngl_castle_vo_sorcerer_taunt = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "npc_dlc_drachenfels_castle",
			sound_events_n = 3,
			category = "boss_talk",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"nngl_bastion_vo_sorcerer_taunt_02",
				"nngl_bastion_vo_sorcerer_taunt_04",
				"nngl_bastion_vo_sorcerer_taunt_05"
			},
			randomize_indexes = {},
			sound_events = {
				"nngl_bastion_vo_sorcerer_taunt_02",
				"nngl_bastion_vo_sorcerer_taunt_04",
				"nngl_bastion_vo_sorcerer_taunt_05"
			},
			sound_events_duration = {
				4.6458239555359,
				6.3390107154846,
				9.0637407302856
			}
		},
		pbw_castle_vo_meet_sorcerer_heard_npc = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "player_alerts_boss",
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
				"pbw_castle_vo_meet_sorcerer_01",
				"pbw_castle_vo_meet_sorcerer_02",
				"pbw_castle_vo_meet_sorcerer_03",
				"pbw_castle_vo_meet_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_castle_vo_meet_sorcerer_01",
				"pbw_castle_vo_meet_sorcerer_02",
				"pbw_castle_vo_meet_sorcerer_03",
				"pbw_castle_vo_meet_sorcerer_04"
			},
			sound_events_duration = {
				3.4121251106262,
				4.2257084846497,
				2.7504167556763,
				2.5710208415985
			}
		},
		pdr_castle_vo_meet_sorcerer_heard_npc = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "player_alerts_boss",
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
				"pdr_castle_vo_meet_sorcerer_01",
				"pdr_castle_vo_meet_sorcerer_02",
				"pdr_castle_vo_meet_sorcerer_03",
				"pdr_castle_vo_meet_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_castle_vo_meet_sorcerer_01",
				"pdr_castle_vo_meet_sorcerer_02",
				"pdr_castle_vo_meet_sorcerer_03",
				"pdr_castle_vo_meet_sorcerer_04"
			},
			sound_events_duration = {
				4.1739792823792,
				3.3168125152588,
				3.6464583873749,
				2.9270207881927
			}
		},
		pes_castle_vo_meet_sorcerer_heard_npc = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "player_alerts_boss",
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
				"pes_castle_vo_meet_sorcerer_01",
				"pes_castle_vo_meet_sorcerer_02",
				"pes_castle_vo_meet_sorcerer_03",
				"pes_castle_vo_meet_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_castle_vo_meet_sorcerer_01",
				"pes_castle_vo_meet_sorcerer_02",
				"pes_castle_vo_meet_sorcerer_03",
				"pes_castle_vo_meet_sorcerer_04"
			},
			sound_events_duration = {
				5.7882914543152,
				3.3156042098999,
				2.251791715622,
				2.6129584312439
			}
		},
		pwe_castle_vo_meet_sorcerer_heard_npc = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "player_alerts_boss",
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
				"pwe_castle_vo_meet_sorcerer_01",
				"pwe_castle_vo_meet_sorcerer_02",
				"pwe_castle_vo_meet_sorcerer_03",
				"pwe_castle_vo_meet_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_castle_vo_meet_sorcerer_01",
				"pwe_castle_vo_meet_sorcerer_02",
				"pwe_castle_vo_meet_sorcerer_03",
				"pwe_castle_vo_meet_sorcerer_04"
			},
			sound_events_duration = {
				4.2481460571289,
				3.5073957443237,
				3.8573334217072,
				2.7552917003632
			}
		},
		pwh_castle_vo_meet_sorcerer_heard_npc = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_castle",
			sound_events_n = 4,
			category = "player_alerts_boss",
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
				"pwh_castle_vo_meet_sorcerer_01",
				"pwh_castle_vo_meet_sorcerer_02",
				"pwh_castle_vo_meet_sorcerer_03",
				"pwh_castle_vo_meet_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_castle_vo_meet_sorcerer_01",
				"pwh_castle_vo_meet_sorcerer_02",
				"pwh_castle_vo_meet_sorcerer_03",
				"pwh_castle_vo_meet_sorcerer_04"
			},
			sound_events_duration = {
				6.6816668510437,
				3.700395822525,
				3.2299582958221,
				7.9926042556763
			}
		}
	})
end
