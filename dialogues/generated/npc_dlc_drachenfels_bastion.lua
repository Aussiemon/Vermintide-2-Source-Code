return function ()
	define_rule({
		response = "ncv1_bastion_vo_first_villager",
		name = "ncv1_bastion_vo_first_villager",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ncv1_bastion_vo_first_villager"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_cage_villager"
			}
		}
	})
	define_rule({
		response = "ncv2_bastion_vo_last_villager",
		name = "ncv2_bastion_vo_last_villager",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bastion_vo_last_villager"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_cage_villager"
			}
		}
	})
	define_rule({
		response = "ncv_bastion_vo_freed_villager",
		name = "ncv_bastion_vo_freed_villager",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ncv_bastion_vo_freed_villager"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"npc_cage_villager"
			}
		}
	})
	define_rule({
		response = "nngl_bastion_vo_sorcerer_greeting",
		name = "nngl_bastion_vo_sorcerer_greeting",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bastion_vo_sorcerer_greeting"
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
		response = "nngl_bastion_vo_sorcerer_taunt",
		name = "nngl_bastion_vo_sorcerer_taunt",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bastion_vo_sorcerer_taunt"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer_drachenfels"
			}
		}
	})
	define_rule({
		name = "pbw_bastion_vo_finale_sorcerer",
		response = "pbw_bastion_vo_finale_sorcerer",
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
				"nngl_bastion_vo_sorcerer_greeting"
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
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_bastion_vo_finale_sorcerer",
		response = "pdr_bastion_vo_finale_sorcerer",
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
				"nngl_bastion_vo_sorcerer_greeting"
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
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_bastion_vo_finale_sorcerer",
		response = "pes_bastion_vo_finale_sorcerer",
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
				"nngl_bastion_vo_sorcerer_greeting"
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
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_bastion_vo_finale_sorcerer",
		response = "pwe_bastion_vo_finale_sorcerer",
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
				"nngl_bastion_vo_sorcerer_greeting"
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
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_bastion_vo_finale_sorcerer",
		response = "pwh_bastion_vo_finale_sorcerer",
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
				"nngl_bastion_vo_sorcerer_greeting"
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
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"nngl_bastion_vo_sorcerer_greeting_reply",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		ncv1_bastion_vo_first_villager = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_bastion",
			sound_events_n = 4,
			category = "npc_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"ncv1_bastion_vo_first_villager_01",
				"ncv1_bastion_vo_first_villager_02",
				"ncv1_bastion_vo_first_villager_03",
				"ncv1_bastion_vo_first_villager_04"
			},
			randomize_indexes = {},
			sound_events = {
				"ncv1_bastion_vo_first_villager_01",
				"ncv1_bastion_vo_first_villager_02",
				"ncv1_bastion_vo_first_villager_03",
				"ncv1_bastion_vo_first_villager_04"
			},
			sound_events_duration = {
				1.5944999456406,
				4.2766251564026,
				2.5176041126251,
				1.7337708473206
			}
		},
		ncv2_bastion_vo_last_villager = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_bastion",
			sound_events_n = 4,
			category = "npc_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"ncv2_bastion_vo_last_villager_01",
				"ncv2_bastion_vo_last_villager_02",
				"ncv2_bastion_vo_last_villager_03",
				"ncv2_bastion_vo_last_villager_04"
			},
			randomize_indexes = {},
			sound_events = {
				"ncv2_bastion_vo_last_villager_01",
				"ncv2_bastion_vo_last_villager_02",
				"ncv2_bastion_vo_last_villager_03",
				"ncv2_bastion_vo_last_villager_04"
			},
			sound_events_duration = {
				4.5085415840149,
				5.538583278656,
				4.5786457061768,
				5.2633957862854
			}
		},
		ncv_bastion_vo_freed_villager = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "npc_dlc_drachenfels_bastion",
			sound_events_n = 8,
			category = "npc_talk",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"ncv_bastion_vo_freed_villager_01",
				"ncv_bastion_vo_freed_villager_02",
				"ncv_bastion_vo_freed_villager_03",
				"ncv_bastion_vo_freed_villager_04",
				"ncv_bastion_vo_freed_villager_05",
				"ncv_bastion_vo_freed_villager_06",
				"ncv_bastion_vo_freed_villager_07",
				"ncv_bastion_vo_freed_villager_08"
			},
			randomize_indexes = {},
			sound_events = {
				"ncv_bastion_vo_freed_villager_01",
				"ncv_bastion_vo_freed_villager_02",
				"ncv_bastion_vo_freed_villager_03",
				"ncv_bastion_vo_freed_villager_04",
				"ncv_bastion_vo_freed_villager_05",
				"ncv_bastion_vo_freed_villager_06",
				"ncv_bastion_vo_freed_villager_07",
				"ncv_bastion_vo_freed_villager_08"
			},
			sound_events_duration = {
				0.70122915506363,
				1.3752083778381,
				3.2088332176209,
				1.9037292003632,
				0.9383749961853,
				0.95995831489563,
				1.7581042051315,
				1.7635208368301
			}
		},
		nngl_bastion_vo_sorcerer_greeting = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_bastion",
			sound_events_n = 4,
			category = "boss_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"nngl_bastion_vo_sorcerer_greeting_01",
				"nngl_bastion_vo_sorcerer_greeting_02",
				"nngl_bastion_vo_sorcerer_greeting_03",
				"nngl_bastion_vo_sorcerer_greeting_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nngl_bastion_vo_sorcerer_greeting_01",
				"nngl_bastion_vo_sorcerer_greeting_02",
				"nngl_bastion_vo_sorcerer_greeting_03",
				"nngl_bastion_vo_sorcerer_greeting_04"
			},
			sound_events_duration = {
				11.338781356812,
				11.910452842712,
				9.147801399231,
				16.589771270752
			}
		},
		nngl_bastion_vo_sorcerer_taunt = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "npc_dlc_drachenfels_bastion",
			sound_events_n = 9,
			category = "boss_talk",
			dialogue_animations_n = 9,
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
				"nngl_bastion_vo_sorcerer_taunt_01",
				"nngl_bastion_vo_sorcerer_taunt_03",
				"nngl_bastion_vo_sorcerer_taunt_06",
				"nngl_bastion_vo_sorcerer_taunt_07",
				"nngl_bastion_vo_sorcerer_taunt_08",
				"nngl_bastion_vo_sorcerer_taunt_09",
				"nngl_bastion_vo_sorcerer_taunt_10",
				"nngl_bastion_vo_sorcerer_taunt_11",
				"nngl_bastion_vo_sorcerer_taunt_12"
			},
			randomize_indexes = {},
			sound_events = {
				"nngl_bastion_vo_sorcerer_taunt_01",
				"nngl_bastion_vo_sorcerer_taunt_03",
				"nngl_bastion_vo_sorcerer_taunt_06",
				"nngl_bastion_vo_sorcerer_taunt_07",
				"nngl_bastion_vo_sorcerer_taunt_08",
				"nngl_bastion_vo_sorcerer_taunt_09",
				"nngl_bastion_vo_sorcerer_taunt_10",
				"nngl_bastion_vo_sorcerer_taunt_11",
				"nngl_bastion_vo_sorcerer_taunt_12"
			},
			sound_events_duration = {
				8.5562477111816,
				5.8540368080139,
				10.102158546448,
				12.050401687622,
				9.1452360153198,
				6.5117998123169,
				6.8245222568512,
				5.9643893241882,
				6.7347722053528
			}
		},
		pbw_bastion_vo_finale_sorcerer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_bastion",
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
				"pbw_bastion_vo_finale_sorcerer_01",
				"pbw_bastion_vo_finale_sorcerer_02",
				"pbw_bastion_vo_finale_sorcerer_03",
				"pbw_bastion_vo_finale_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_bastion_vo_finale_sorcerer_01",
				"pbw_bastion_vo_finale_sorcerer_02",
				"pbw_bastion_vo_finale_sorcerer_03",
				"pbw_bastion_vo_finale_sorcerer_04"
			},
			sound_events_duration = {
				3.5067915916443,
				3.1565208435059,
				5.5768542289734,
				1.6677500009537
			}
		},
		pdr_bastion_vo_finale_sorcerer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_bastion",
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
				"pdr_bastion_vo_finale_sorcerer_01",
				"pdr_bastion_vo_finale_sorcerer_02",
				"pdr_bastion_vo_finale_sorcerer_03",
				"pdr_bastion_vo_finale_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_bastion_vo_finale_sorcerer_01",
				"pdr_bastion_vo_finale_sorcerer_02",
				"pdr_bastion_vo_finale_sorcerer_03",
				"pdr_bastion_vo_finale_sorcerer_04"
			},
			sound_events_duration = {
				3.349791765213,
				1.6511249542236,
				3.7300417423248,
				4.4124374389648
			}
		},
		pes_bastion_vo_finale_sorcerer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_bastion",
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
				"pes_bastion_vo_finale_sorcerer_01",
				"pes_bastion_vo_finale_sorcerer_02",
				"pes_bastion_vo_finale_sorcerer_03",
				"pes_bastion_vo_finale_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bastion_vo_finale_sorcerer_01",
				"pes_bastion_vo_finale_sorcerer_02",
				"pes_bastion_vo_finale_sorcerer_03",
				"pes_bastion_vo_finale_sorcerer_04"
			},
			sound_events_duration = {
				3.1581041812897,
				2.5231249332428,
				3.2865624427795,
				2.9674582481384
			}
		},
		pwe_bastion_vo_finale_sorcerer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_bastion",
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
				"pwe_bastion_vo_finale_sorcerer_01",
				"pwe_bastion_vo_finale_sorcerer_02",
				"pwe_bastion_vo_finale_sorcerer_03",
				"pwe_bastion_vo_finale_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_bastion_vo_finale_sorcerer_01",
				"pwe_bastion_vo_finale_sorcerer_02",
				"pwe_bastion_vo_finale_sorcerer_03",
				"pwe_bastion_vo_finale_sorcerer_04"
			},
			sound_events_duration = {
				2.3492290973663,
				1.6887916326523,
				2.44495844841,
				2.252833366394
			}
		},
		pwh_bastion_vo_finale_sorcerer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "npc_dlc_drachenfels_bastion",
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
				"pwh_bastion_vo_finale_sorcerer_01",
				"pwh_bastion_vo_finale_sorcerer_02",
				"pwh_bastion_vo_finale_sorcerer_03",
				"pwh_bastion_vo_finale_sorcerer_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_bastion_vo_finale_sorcerer_01",
				"pwh_bastion_vo_finale_sorcerer_02",
				"pwh_bastion_vo_finale_sorcerer_03",
				"pwh_bastion_vo_finale_sorcerer_04"
			},
			sound_events_duration = {
				3.745854139328,
				3.2355415821075,
				5.3781666755676,
				4.3389582633972
			}
		}
	})
end
