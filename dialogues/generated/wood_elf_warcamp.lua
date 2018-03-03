return function ()
	define_rule({
		name = "pwe_level_chaos_war_camp_cabin",
		response = "pwe_level_chaos_war_camp_cabin",
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
				"chaos_war_camp_cabin"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_cabin",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_cabin",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_chaos_war_camp_camp_view_01",
		response = "pwe_level_chaos_war_camp_camp_view_01",
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
				"chaos_war_camp_camp_view"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_camp_view",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_camp_view",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_chaos_war_camp_battering_ram_01",
		response = "pwe_level_chaos_war_camp_battering_ram_01",
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
				"chaos_war_camp_battering_ram"
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
				"level_chaos_war_camp_battering_ram",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_chaos_war_camp_battering_ram_use_01",
		response = "pwe_level_chaos_war_camp_battering_ram_use_01",
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
				"chaos_war_camp_battering_ram_use"
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
				"level_chaos_war_camp_battering_ram_use",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_battering_ram_use",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_chaos_war_camp_arena_01",
		response = "pwe_level_chaos_war_camp_arena_01",
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
				"chaos_war_camp_arena"
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
				"level_chaos_war_camp_arena",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_arena",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_chaos_war_camp_dead_champion_01",
		response = "pwe_level_chaos_war_camp_dead_champion_01",
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
				"chaos_war_camp_dead_champion"
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
				"level_chaos_war_camp_dead_champion",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_dead_champion",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_level_chaos_war_camp_depart_01",
		response = "pwe_level_chaos_war_camp_depart_01",
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
				"chaos_war_camp_depart"
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
				"level_chaos_war_camp_depart",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_depart",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_chaos_war_camp_intro_a",
		response = "pwe_chaos_war_camp_intro_a",
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
				"chaos_war_camp_intro_a"
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
				"chaos_war_camp_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_chaos_war_camp_intro_c",
		response = "pwe_chaos_war_camp_intro_c",
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
				"chaos_war_camp_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_chaos_champion_throwing_axe",
		response = "pwe_gameplay_chaos_champion_throwing_axe",
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
				"ecc_chaos_war_camp_throw_axe"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"chaos_champion_throwing_axe",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_throwing_axe",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_chaos_champion_charge_reply",
		response = "pwe_gameplay_chaos_champion_charge_reply",
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
				"ecc_chaos_war_camp_charge"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"chaos_champion_charge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_charge_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_chaos_champion_summon_reply",
		response = "pwe_gameplay_chaos_champion_summon_reply",
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
				"ecc_chaos_war_camp_ground_summon"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"chaos_champion_summon_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_champion_summon_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_chaos_war_camp_challenge_reply_a",
		response = "pwe_chaos_war_camp_challenge_reply_a",
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
				"ecc_chaos_war_camp_challenge"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_challenge_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_chaos_war_camp_taunt_payback_reply",
		response = "pwe_chaos_war_camp_taunt_payback_reply",
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
				"ecc_chaos_war_camp_taunt_payback"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"chaos_war_camp_taunt_payback_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_taunt_payback_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_level_chaos_war_camp_dead_champion",
		response = "pwe_level_chaos_war_camp_dead_champion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
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
				"user_memory",
				"chaos_war_camp_dead_champion",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"chaos_war_camp_dead_champion",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pwe_level_chaos_war_camp_camp_view_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_chaos_war_camp_camp_view_01",
				"pwe_level_chaos_war_camp_camp_view_02",
				"pwe_level_chaos_war_camp_camp_view_03",
				"pwe_level_chaos_war_camp_camp_view_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_level_chaos_war_camp_camp_view_01",
				"pwe_level_chaos_war_camp_camp_view_02",
				"pwe_level_chaos_war_camp_camp_view_03",
				"pwe_level_chaos_war_camp_camp_view_04"
			},
			randomize_indexes = {}
		},
		pwe_level_chaos_war_camp_arena_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_chaos_war_camp_arena_01",
				"pwe_level_chaos_war_camp_arena_02",
				"pwe_level_chaos_war_camp_arena_03",
				"pwe_level_chaos_war_camp_arena_04"
			},
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
				"pwe_level_chaos_war_camp_arena_01",
				"pwe_level_chaos_war_camp_arena_02",
				"pwe_level_chaos_war_camp_arena_03",
				"pwe_level_chaos_war_camp_arena_04"
			},
			randomize_indexes = {}
		},
		pwe_level_chaos_war_camp_dead_champion = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "wood_elf_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			sound_events = {
				"pwe_level_chaos_war_camp_dead_champion_01",
				"pwe_level_chaos_war_camp_dead_champion_02",
				"pwe_level_chaos_war_camp_dead_champion_03"
			},
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
				"pwe_level_chaos_war_camp_dead_champion_01",
				"pwe_level_chaos_war_camp_dead_champion_02",
				"pwe_level_chaos_war_camp_dead_champion_03"
			},
			randomize_indexes = {}
		},
		pwe_level_chaos_war_camp_battering_ram_use_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_chaos_war_camp_battering_ram_use_01",
				"pwe_level_chaos_war_camp_battering_ram_use_02",
				"pwe_level_chaos_war_camp_battering_ram_use_03",
				"pwe_level_chaos_war_camp_battering_ram_use_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_level_chaos_war_camp_battering_ram_use_01",
				"pwe_level_chaos_war_camp_battering_ram_use_02",
				"pwe_level_chaos_war_camp_battering_ram_use_03",
				"pwe_level_chaos_war_camp_battering_ram_use_04"
			},
			randomize_indexes = {}
		},
		pwe_chaos_war_camp_challenge_reply_a = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_chaos_war_camp_challenge_reply_a_01",
				"pwe_chaos_war_camp_challenge_reply_a_02",
				"pwe_chaos_war_camp_challenge_reply_b_01",
				"pwe_chaos_war_camp_challenge_reply_b_02"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_chaos_war_camp_challenge_reply_a_01",
				"pwe_chaos_war_camp_challenge_reply_a_02",
				"pwe_chaos_war_camp_challenge_reply_b_01",
				"pwe_chaos_war_camp_challenge_reply_b_02"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_chaos_champion_throwing_axe = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_chaos_champion_throwing_axe_01",
				"pwe_gameplay_chaos_champion_throwing_axe_02",
				"pwe_gameplay_chaos_champion_throwing_axe_03",
				"pwe_gameplay_chaos_champion_throwing_axe_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_chaos_champion_throwing_axe_01",
				"pwe_gameplay_chaos_champion_throwing_axe_02",
				"pwe_gameplay_chaos_champion_throwing_axe_03",
				"pwe_gameplay_chaos_champion_throwing_axe_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_chaos_champion_summon_reply = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_chaos_champion_summon_reply_01",
				"pwe_gameplay_chaos_champion_summon_reply_02",
				"pwe_gameplay_chaos_champion_summon_reply_03",
				"pwe_gameplay_chaos_champion_summon_reply_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_chaos_champion_summon_reply_01",
				"pwe_gameplay_chaos_champion_summon_reply_02",
				"pwe_gameplay_chaos_champion_summon_reply_03",
				"pwe_gameplay_chaos_champion_summon_reply_04"
			},
			randomize_indexes = {}
		},
		pwe_chaos_war_camp_taunt_payback_reply = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_chaos_war_camp_taunt_payback_reply_01",
				[2.0] = "pwe_chaos_war_camp_taunt_payback_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_chaos_war_camp_taunt_payback_reply_01",
				[2.0] = "pwe_chaos_war_camp_taunt_payback_reply_02"
			},
			randomize_indexes = {}
		},
		pwe_chaos_war_camp_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_chaos_war_camp_intro_c_01",
				[2.0] = "pwe_chaos_war_camp_intro_c_02"
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
				[1.0] = "pwe_chaos_war_camp_intro_c_01",
				[2.0] = "pwe_chaos_war_camp_intro_c_02"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_chaos_champion_charge_reply = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_chaos_champion_charge_reply_01",
				"pwe_gameplay_chaos_champion_charge_reply_02",
				"pwe_gameplay_chaos_champion_charge_reply_03",
				"pwe_gameplay_chaos_champion_charge_reply_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_chaos_champion_charge_reply_01",
				"pwe_gameplay_chaos_champion_charge_reply_02",
				"pwe_gameplay_chaos_champion_charge_reply_03",
				"pwe_gameplay_chaos_champion_charge_reply_04"
			},
			randomize_indexes = {}
		},
		pwe_chaos_war_camp_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_chaos_war_camp_intro_a_01",
				[2.0] = "pwe_chaos_war_camp_intro_a_02"
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
				[1.0] = "pwe_chaos_war_camp_intro_a_01",
				[2.0] = "pwe_chaos_war_camp_intro_a_02"
			},
			randomize_indexes = {}
		},
		pwe_level_chaos_war_camp_cabin = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_chaos_war_camp_cabin_01",
				"pwe_level_chaos_war_camp_cabin_02",
				"pwe_level_chaos_war_camp_cabin_03",
				"pwe_level_chaos_war_camp_cabin_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pwe_level_chaos_war_camp_cabin_01",
				"pwe_level_chaos_war_camp_cabin_02",
				"pwe_level_chaos_war_camp_cabin_03",
				"pwe_level_chaos_war_camp_cabin_04"
			},
			randomize_indexes = {}
		},
		pwe_level_chaos_war_camp_battering_ram_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_chaos_war_camp_battering_ram_01",
				"pwe_level_chaos_war_camp_battering_ram_02",
				"pwe_level_chaos_war_camp_battering_ram_03",
				"pwe_level_chaos_war_camp_battering_ram_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_level_chaos_war_camp_battering_ram_01",
				"pwe_level_chaos_war_camp_battering_ram_02",
				"pwe_level_chaos_war_camp_battering_ram_03",
				"pwe_level_chaos_war_camp_battering_ram_04"
			},
			randomize_indexes = {}
		},
		pwe_level_chaos_war_camp_depart_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_chaos_war_camp_depart_01",
				"pwe_level_chaos_war_camp_depart_02",
				"pwe_level_chaos_war_camp_depart_03",
				"pwe_level_chaos_war_camp_depart_04"
			},
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
				"pwe_level_chaos_war_camp_depart_01",
				"pwe_level_chaos_war_camp_depart_02",
				"pwe_level_chaos_war_camp_depart_03",
				"pwe_level_chaos_war_camp_depart_04"
			},
			randomize_indexes = {}
		},
		pwe_level_chaos_war_camp_dead_champion_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_level_chaos_war_camp_dead_champion_01",
				"pwe_level_chaos_war_camp_dead_champion_02",
				"pwe_level_chaos_war_camp_dead_champion_03",
				"pwe_level_chaos_war_camp_dead_champion_04"
			},
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
				"pwe_level_chaos_war_camp_dead_champion_01",
				"pwe_level_chaos_war_camp_dead_champion_02",
				"pwe_level_chaos_war_camp_dead_champion_03",
				"pwe_level_chaos_war_camp_dead_champion_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
