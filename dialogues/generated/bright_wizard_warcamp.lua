return function ()
	define_rule({
		name = "pbw_level_chaos_war_camp_ravine",
		response = "pbw_level_chaos_war_camp_ravine",
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
				"chaos_war_camp_ravine"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_ravine",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_ravine",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_live_in_swamp",
		response = "pbw_level_chaos_war_camp_live_in_swamp",
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
				"chaos_war_camp_live_in_swamp"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_live_in_swamp",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_live_in_swamp",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_cabin",
		response = "pbw_level_chaos_war_camp_cabin",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_chaos_war_camp_which_way",
		response = "pbw_level_chaos_war_camp_which_way",
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
				"chaos_war_camp_which_way"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_which_way",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_which_way",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_ghost_town_state",
		response = "pbw_level_chaos_war_camp_ghost_town_state",
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
				"chaos_war_camp_ghost_town_state"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_ghost_town_state",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_ghost_town_state",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_islands_01",
		response = "pbw_level_chaos_war_camp_islands_01",
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
				"chaos_war_camp_islands"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_islands",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_islands",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_camp_view_01",
		response = "pbw_level_chaos_war_camp_camp_view_01",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_level_chaos_war_camp_tree",
		response = "pbw_level_chaos_war_camp_tree",
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
				"chaos_war_camp_tree"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_tree",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_tree",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_outer_gate_01",
		response = "pbw_level_chaos_war_camp_outer_gate_01",
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
				"chaos_war_camp_outer_gate"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_outer_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_outer_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_battering_ram_01",
		response = "pbw_level_chaos_war_camp_battering_ram_01",
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
		name = "pbw_level_chaos_war_camp_battering_ram_use_01",
		response = "pbw_level_chaos_war_camp_battering_ram_use_01",
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
		name = "pbw_level_chaos_war_camp_wall_01",
		response = "pbw_level_chaos_war_camp_wall_01",
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
				"chaos_war_camp_wall"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_camp_wall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_wall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_surprise_01",
		response = "pbw_level_chaos_war_surprise_01",
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
				"chaos_war_surprise"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_chaos_war_surprise",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_surprise",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_keep_fighting_01",
		response = "pbw_level_chaos_war_camp_keep_fighting_01",
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
				"chaos_war_camp_keep_fighting"
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
				"level_chaos_war_camp_keep_fighting",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_keep_fighting",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_chaos_war_camp_arena_01",
		response = "pbw_level_chaos_war_camp_arena_01",
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
		name = "pbw_level_chaos_war_camp_dead_champion_01",
		response = "pbw_level_chaos_war_camp_dead_champion_01",
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
		name = "pbw_level_chaos_war_camp_depart_01",
		response = "pbw_level_chaos_war_camp_depart_01",
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
		name = "pbw_level_chaos_war_camp_success_01",
		response = "pbw_level_chaos_war_camp_success_01",
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
				"chaos_war_camp_success"
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
				"level_chaos_war_camp_success",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_chaos_war_camp_success",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_chaos_war_camp_intro_a",
		response = "pbw_chaos_war_camp_intro_a",
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
		name = "pbw_chaos_war_camp_intro_b",
		response = "pbw_chaos_war_camp_intro_b",
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
				"chaos_war_camp_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"chaos_war_camp_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_war_camp_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_chaos_war_camp_intro_c",
		response = "pbw_chaos_war_camp_intro_c",
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
				"bright_wizard"
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
		name = "pbw_chaos_war_camp_challenge_reply_a",
		response = "pbw_chaos_war_camp_challenge_reply_a",
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
				"bright_wizard"
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
		name = "pbw_level_chaos_war_camp_dead_champion",
		response = "pbw_level_chaos_war_camp_dead_champion",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		pbw_level_chaos_war_camp_camp_view_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_camp_view_01",
				"pbw_level_chaos_war_camp_camp_view_02",
				"pbw_level_chaos_war_camp_camp_view_03",
				"pbw_level_chaos_war_camp_camp_view_04"
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
				"pbw_level_chaos_war_camp_camp_view_01",
				"pbw_level_chaos_war_camp_camp_view_02",
				"pbw_level_chaos_war_camp_camp_view_03",
				"pbw_level_chaos_war_camp_camp_view_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_outer_gate_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_outer_gate_01",
				"pbw_level_chaos_war_camp_outer_gate_02",
				"pbw_level_chaos_war_camp_outer_gate_03",
				"pbw_level_chaos_war_camp_outer_gate_04"
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
				"pbw_level_chaos_war_camp_outer_gate_01",
				"pbw_level_chaos_war_camp_outer_gate_02",
				"pbw_level_chaos_war_camp_outer_gate_03",
				"pbw_level_chaos_war_camp_outer_gate_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_which_way = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_which_way_01",
				"pbw_level_chaos_war_camp_which_way_02",
				"pbw_level_chaos_war_camp_which_way_03",
				"pbw_level_chaos_war_camp_which_way_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pbw_level_chaos_war_camp_which_way_01",
				"pbw_level_chaos_war_camp_which_way_02",
				"pbw_level_chaos_war_camp_which_way_03",
				"pbw_level_chaos_war_camp_which_way_04"
			},
			randomize_indexes = {}
		},
		pbw_chaos_war_camp_challenge_reply_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pbw_chaos_war_camp_challenge_reply_a_02"
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
				[1.0] = "pbw_chaos_war_camp_challenge_reply_a_01",
				[2.0] = "pbw_chaos_war_camp_challenge_reply_a_02"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_live_in_swamp = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_live_in_swamp_01",
				"pbw_level_chaos_war_camp_live_in_swamp_02",
				"pbw_level_chaos_war_camp_live_in_swamp_03",
				"pbw_level_chaos_war_camp_live_in_swamp_04"
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
				"pbw_level_chaos_war_camp_live_in_swamp_01",
				"pbw_level_chaos_war_camp_live_in_swamp_02",
				"pbw_level_chaos_war_camp_live_in_swamp_03",
				"pbw_level_chaos_war_camp_live_in_swamp_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_arena_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_arena_01",
				"pbw_level_chaos_war_camp_arena_02",
				"pbw_level_chaos_war_camp_arena_03",
				"pbw_level_chaos_war_camp_arena_04"
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
				"pbw_level_chaos_war_camp_arena_01",
				"pbw_level_chaos_war_camp_arena_02",
				"pbw_level_chaos_war_camp_arena_03",
				"pbw_level_chaos_war_camp_arena_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_cabin = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_cabin_01",
				"pbw_level_chaos_war_camp_cabin_02",
				"pbw_level_chaos_war_camp_cabin_03",
				"pbw_level_chaos_war_camp_cabin_04"
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
				"pbw_level_chaos_war_camp_cabin_01",
				"pbw_level_chaos_war_camp_cabin_02",
				"pbw_level_chaos_war_camp_cabin_03",
				"pbw_level_chaos_war_camp_cabin_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_tree = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_tree_01",
				"pbw_level_chaos_war_camp_tree_02",
				"pbw_level_chaos_war_camp_tree_03",
				"pbw_level_chaos_war_camp_tree_04"
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
				"pbw_level_chaos_war_camp_tree_01",
				"pbw_level_chaos_war_camp_tree_02",
				"pbw_level_chaos_war_camp_tree_03",
				"pbw_level_chaos_war_camp_tree_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_wall_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_wall_01",
				"pbw_level_chaos_war_camp_wall_02",
				"pbw_level_chaos_war_camp_wall_03",
				"pbw_level_chaos_war_camp_wall_04"
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
				"pbw_level_chaos_war_camp_wall_01",
				"pbw_level_chaos_war_camp_wall_02",
				"pbw_level_chaos_war_camp_wall_03",
				"pbw_level_chaos_war_camp_wall_04"
			},
			randomize_indexes = {}
		},
		pbw_chaos_war_camp_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_chaos_war_camp_intro_c_01",
				[2.0] = "pbw_chaos_war_camp_intro_c_02"
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
				[1.0] = "pbw_chaos_war_camp_intro_c_01",
				[2.0] = "pbw_chaos_war_camp_intro_c_02"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_ravine = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_ravine_01",
				"pbw_level_chaos_war_camp_ravine_02",
				"pbw_level_chaos_war_camp_ravine_03",
				"pbw_level_chaos_war_camp_ravine_04"
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
				"pbw_level_chaos_war_camp_ravine_01",
				"pbw_level_chaos_war_camp_ravine_02",
				"pbw_level_chaos_war_camp_ravine_03",
				"pbw_level_chaos_war_camp_ravine_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_surprise_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_surprise_01",
				"pbw_level_chaos_war_surprise_02",
				"pbw_level_chaos_war_surprise_03",
				"pbw_level_chaos_war_surprise_04"
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
				"pbw_level_chaos_war_surprise_01",
				"pbw_level_chaos_war_surprise_02",
				"pbw_level_chaos_war_surprise_03",
				"pbw_level_chaos_war_surprise_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_dead_champion = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "bright_wizard_warcamp",
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_level_chaos_war_camp_dead_champion_01",
				"pbw_level_chaos_war_camp_dead_champion_02",
				"pbw_level_chaos_war_camp_dead_champion_03"
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
				"pbw_level_chaos_war_camp_dead_champion_01",
				"pbw_level_chaos_war_camp_dead_champion_02",
				"pbw_level_chaos_war_camp_dead_champion_03"
			},
			randomize_indexes = {}
		},
		pbw_chaos_war_camp_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_chaos_war_camp_intro_b_01",
				[2.0] = "pbw_chaos_war_camp_intro_b_02"
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
				[1.0] = "pbw_chaos_war_camp_intro_b_01",
				[2.0] = "pbw_chaos_war_camp_intro_b_02"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_battering_ram_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_battering_ram_01",
				"pbw_level_chaos_war_camp_battering_ram_02",
				"pbw_level_chaos_war_camp_battering_ram_03",
				"pbw_level_chaos_war_camp_battering_ram_04"
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
				"pbw_level_chaos_war_camp_battering_ram_01",
				"pbw_level_chaos_war_camp_battering_ram_02",
				"pbw_level_chaos_war_camp_battering_ram_03",
				"pbw_level_chaos_war_camp_battering_ram_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_ghost_town_state = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_ghost_town_state_01",
				"pbw_level_chaos_war_camp_ghost_town_state_02",
				"pbw_level_chaos_war_camp_ghost_town_state_03",
				"pbw_level_chaos_war_camp_ghost_town_state_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_level_chaos_war_camp_ghost_town_state_01",
				"pbw_level_chaos_war_camp_ghost_town_state_02",
				"pbw_level_chaos_war_camp_ghost_town_state_03",
				"pbw_level_chaos_war_camp_ghost_town_state_04"
			},
			randomize_indexes = {}
		},
		pbw_chaos_war_camp_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_chaos_war_camp_intro_a_01",
				[2.0] = "pbw_chaos_war_camp_intro_a_02"
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
				[1.0] = "pbw_chaos_war_camp_intro_a_01",
				[2.0] = "pbw_chaos_war_camp_intro_a_02"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_battering_ram_use_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_battering_ram_use_01",
				"pbw_level_chaos_war_camp_battering_ram_use_02",
				"pbw_level_chaos_war_camp_battering_ram_use_03",
				"pbw_level_chaos_war_camp_battering_ram_use_04"
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
				"pbw_level_chaos_war_camp_battering_ram_use_01",
				"pbw_level_chaos_war_camp_battering_ram_use_02",
				"pbw_level_chaos_war_camp_battering_ram_use_03",
				"pbw_level_chaos_war_camp_battering_ram_use_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_depart_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_depart_01",
				"pbw_level_chaos_war_camp_depart_02",
				"pbw_level_chaos_war_camp_depart_03",
				"pbw_level_chaos_war_camp_depart_04"
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
				"pbw_level_chaos_war_camp_depart_01",
				"pbw_level_chaos_war_camp_depart_02",
				"pbw_level_chaos_war_camp_depart_03",
				"pbw_level_chaos_war_camp_depart_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_success_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_success_01",
				"pbw_level_chaos_war_camp_success_02",
				"pbw_level_chaos_war_camp_success_03",
				"pbw_level_chaos_war_camp_success_04"
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
				"pbw_level_chaos_war_camp_success_01",
				"pbw_level_chaos_war_camp_success_02",
				"pbw_level_chaos_war_camp_success_03",
				"pbw_level_chaos_war_camp_success_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_dead_champion_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_dead_champion_01",
				"pbw_level_chaos_war_camp_dead_champion_02",
				"pbw_level_chaos_war_camp_dead_champion_03",
				"pbw_level_chaos_war_camp_dead_champion_04"
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
				"pbw_level_chaos_war_camp_dead_champion_01",
				"pbw_level_chaos_war_camp_dead_champion_02",
				"pbw_level_chaos_war_camp_dead_champion_03",
				"pbw_level_chaos_war_camp_dead_champion_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_keep_fighting_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_keep_fighting_01",
				"pbw_level_chaos_war_camp_keep_fighting_02",
				"pbw_level_chaos_war_camp_keep_fighting_03",
				"pbw_level_chaos_war_camp_keep_fighting_04"
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
				"pbw_level_chaos_war_camp_keep_fighting_01",
				"pbw_level_chaos_war_camp_keep_fighting_02",
				"pbw_level_chaos_war_camp_keep_fighting_03",
				"pbw_level_chaos_war_camp_keep_fighting_04"
			},
			randomize_indexes = {}
		},
		pbw_level_chaos_war_camp_islands_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_warcamp",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_level_chaos_war_camp_islands_01",
				"pbw_level_chaos_war_camp_islands_02",
				"pbw_level_chaos_war_camp_islands_03",
				"pbw_level_chaos_war_camp_islands_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_neutral"
			},
			localization_strings = {
				"pbw_level_chaos_war_camp_islands_01",
				"pbw_level_chaos_war_camp_islands_02",
				"pbw_level_chaos_war_camp_islands_03",
				"pbw_level_chaos_war_camp_islands_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
