return function ()
	define_rule({
		name = "pwh_gameplay_chieftain_tips_special_attack_cleave",
		response = "pwh_gameplay_chieftain_tips_special_attack_cleave",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_hit",
				OP.EQ,
				1
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"special_attack_cleave"
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.NEQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_special_attack_cleave_hit",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_special_attack_cleave_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_chieftain_tips_special_lunge_attack_2",
		response = "pwh_gameplay_chieftain_tips_special_lunge_attack_2",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_hit",
				OP.EQ,
				1
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"special_lunge_attack_2"
			},
			{
				"user_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.NEQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_last_special_lunge_attack_2_hit",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_special_lunge_attack_2_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_skaven_warlord_banter_reply",
		response = "pwh_gameplay_skaven_warlord_banter_reply",
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
				"ect_gameplay_banter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"gameplay_skaven_warlord_banter_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"gameplay_skaven_warlord_banter_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_skaven_warlord_kill",
		response = "pwh_gameplay_skaven_warlord_kill",
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
				"skaven_storm_vermin_warlord"
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
				"user_memory",
				"level_skaven_stronghold_dead_warlord",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"level_skaven_stronghold_dead_warlord",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_skaven_warlord_summoning_reply",
		response = "pwh_gameplay_skaven_warlord_summoning_reply",
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
				"ect_gameplay_summoning_skaven"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"gameplay_skaven_warlord_summoning_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"gameplay_skaven_warlord_summoning_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_barrier",
		response = "pwh_level_skaven_stronghold_barrier",
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
				"level_skaven_stronghold_barrier"
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
				"level_skaven_stronghold_barrier",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_barrier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_city_afire",
		response = "pwh_level_skaven_stronghold_city_afire",
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
				"level_skaven_stronghold_city_afire"
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
				"level_skaven_stronghold_city_afire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_city_afire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_dead_warlord",
		response = "pwh_level_skaven_stronghold_dead_warlord",
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
				"level_skaven_stronghold_dead_warlord"
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
				"level_skaven_stronghold_dead_warlord",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_dead_warlord",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_downtown",
		response = "pwh_level_skaven_stronghold_downtown",
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
				"level_skaven_stronghold_downtown"
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
				"level_skaven_stronghold_downtown",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_downtown",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_exit",
		response = "pwh_level_skaven_stronghold_exit",
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
				"level_skaven_stronghold_exit"
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
				"level_skaven_stronghold_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_foundry_entered",
		response = "pwh_level_skaven_stronghold_foundry_entered",
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
				"level_skaven_stronghold_foundry_entered"
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
				"level_skaven_stronghold_foundry_entered",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_foundry_entered",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_light_brazier",
		response = "pwh_level_skaven_stronghold_light_brazier",
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
				"level_skaven_stronghold_light_brazier"
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
				"level_skaven_stronghold_light_brazier",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_light_brazier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_long_way_down",
		response = "pwh_level_skaven_stronghold_long_way_down",
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
				"level_skaven_stronghold_long_way_down"
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
				"level_skaven_stronghold_long_way_down",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_long_way_down",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_mission_complete",
		response = "pwh_level_skaven_stronghold_mission_complete",
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
				"level_skaven_stronghold_mission_complete"
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
				"level_skaven_stronghold_mission_complete",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_mission_complete",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_patrol_lanes",
		response = "pwh_level_skaven_stronghold_patrol_lanes",
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
				"level_skaven_stronghold_patrol_lanes"
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
				"level_skaven_stronghold_patrol_lanes",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_patrol_lanes",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_rat_ogre_rampage",
		response = "pwh_level_skaven_stronghold_rat_ogre_rampage",
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
				"level_skaven_stronghold_rat_ogre_rampage"
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
				"level_skaven_stronghold_rat_ogre_rampage",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_rat_ogre_rampage",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_taunt_warlord",
		response = "pwh_level_skaven_stronghold_taunt_warlord",
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
				"level_skaven_stronghold_taunt_warlord"
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
				"level_skaven_stronghold_taunt_warlord",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_taunt_warlord",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_vista",
		response = "pwh_level_skaven_stronghold_vista",
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
				"level_skaven_stronghold_vista"
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
				"level_skaven_stronghold_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_warlord_nest",
		response = "pwh_level_skaven_stronghold_warlord_nest",
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
				"level_skaven_stronghold_warlord_nest"
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
				"level_skaven_stronghold_warlord_nest",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_warlord_nest",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_waterwheel_complete",
		response = "pwh_level_skaven_stronghold_waterwheel_complete",
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
				"level_skaven_stronghold_waterwheel_complete"
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
				"level_skaven_stronghold_waterwheel_complete",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_waterwheel_complete",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_level_skaven_stronghold_waterwheel_move",
		response = "pwh_level_skaven_stronghold_waterwheel_move",
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
				"level_skaven_stronghold_waterwheel_move"
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
				"level_skaven_stronghold_waterwheel_move",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_waterwheel_move",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_skaven_stronghold_intro_a",
		response = "pwh_skaven_stronghold_intro_a",
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
				"skaven_stronghold_intro_a"
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
				"skaven_stronghold_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"skaven_stronghold_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_skaven_stronghold_intro_b",
		response = "pwh_skaven_stronghold_intro_b",
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
				"skaven_stronghold_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"skaven_stronghold_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"skaven_stronghold_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_skaven_stronghold_intro_c",
		response = "pwh_skaven_stronghold_intro_c",
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
				"skaven_stronghold_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"skaven_stronghold_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"skaven_stronghold_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pwh_gameplay_chieftain_tips_special_attack_cleave = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_gameplay_chieftain_tips_01",
				"pwh_gameplay_chieftain_tips_02",
				"pwh_gameplay_chieftain_tips_03",
				"pwh_gameplay_chieftain_tips_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_chieftain_tips_01",
				"pwh_gameplay_chieftain_tips_02",
				"pwh_gameplay_chieftain_tips_03",
				"pwh_gameplay_chieftain_tips_04"
			},
			sound_events_duration = {
				2.0402500629425,
				2.7265000343323,
				3.1482708454132,
				2.7022707462311
			}
		},
		pwh_gameplay_chieftain_tips_special_lunge_attack_2 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_gameplay_chieftain_tips_01",
				"pwh_gameplay_chieftain_tips_02",
				"pwh_gameplay_chieftain_tips_03",
				"pwh_gameplay_chieftain_tips_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_chieftain_tips_01",
				"pwh_gameplay_chieftain_tips_02",
				"pwh_gameplay_chieftain_tips_03",
				"pwh_gameplay_chieftain_tips_04"
			},
			sound_events_duration = {
				2.0402500629425,
				2.7265000343323,
				3.1482708454132,
				2.7022707462311
			}
		},
		pwh_gameplay_skaven_warlord_banter_reply = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
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
				"pwh_gameplay_chieftain_banter_reply_01",
				"pwh_gameplay_chieftain_banter_reply_02",
				"pwh_gameplay_chieftain_banter_reply_03",
				"pwh_gameplay_chieftain_banter_reply_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_chieftain_banter_reply_01",
				"pwh_gameplay_chieftain_banter_reply_02",
				"pwh_gameplay_chieftain_banter_reply_03",
				"pwh_gameplay_chieftain_banter_reply_04"
			},
			sound_events_duration = {
				2.9004790782928,
				3.7456042766571,
				1.4868333339691,
				2.3293750286102
			}
		},
		pwh_gameplay_skaven_warlord_kill = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_level_skaven_stronghold_dead_warlord_01",
				"pwh_level_skaven_stronghold_dead_warlord_02",
				"pwh_level_skaven_stronghold_dead_warlord_03",
				"pwh_level_skaven_stronghold_dead_warlord_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_dead_warlord_01",
				"pwh_level_skaven_stronghold_dead_warlord_02",
				"pwh_level_skaven_stronghold_dead_warlord_03",
				"pwh_level_skaven_stronghold_dead_warlord_04"
			},
			sound_events_duration = {
				6.0427083969116,
				5.998104095459,
				5.862208366394,
				5.1354584693909
			}
		},
		pwh_gameplay_skaven_warlord_summoning_reply = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
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
				"pwh_gameplay_chieftain_summoning_reply_01",
				"pwh_gameplay_chieftain_summoning_reply_02",
				"pwh_gameplay_chieftain_summoning_reply_03",
				"pwh_gameplay_chieftain_summoning_reply_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_gameplay_chieftain_summoning_reply_01",
				"pwh_gameplay_chieftain_summoning_reply_02",
				"pwh_gameplay_chieftain_summoning_reply_03",
				"pwh_gameplay_chieftain_summoning_reply_04"
			},
			sound_events_duration = {
				1.509645819664,
				3.2907500267029,
				3.9650208950043,
				5.0295834541321
			}
		},
		pwh_level_skaven_stronghold_barrier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
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
				"pwh_level_skaven_stronghold_barrier_01",
				"pwh_level_skaven_stronghold_barrier_02",
				"pwh_level_skaven_stronghold_barrier_03",
				"pwh_level_skaven_stronghold_barrier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_barrier_01",
				"pwh_level_skaven_stronghold_barrier_02",
				"pwh_level_skaven_stronghold_barrier_03",
				"pwh_level_skaven_stronghold_barrier_04"
			},
			sound_events_duration = {
				3.2278542518616,
				3.3113124370575,
				5.6345624923706,
				4.1765208244324
			}
		},
		pwh_level_skaven_stronghold_city_afire = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_city_afire_01",
				"pwh_level_skaven_stronghold_city_afire_02",
				"pwh_level_skaven_stronghold_city_afire_03",
				"pwh_level_skaven_stronghold_city_afire_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_city_afire_01",
				"pwh_level_skaven_stronghold_city_afire_02",
				"pwh_level_skaven_stronghold_city_afire_03",
				"pwh_level_skaven_stronghold_city_afire_04"
			},
			sound_events_duration = {
				3.9947500228882,
				2.9066874980927,
				3.2682082653046,
				6.3296666145325
			}
		},
		pwh_level_skaven_stronghold_dead_warlord = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_dead_warlord_01",
				"pwh_level_skaven_stronghold_dead_warlord_02",
				"pwh_level_skaven_stronghold_dead_warlord_03",
				"pwh_level_skaven_stronghold_dead_warlord_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_dead_warlord_01",
				"pwh_level_skaven_stronghold_dead_warlord_02",
				"pwh_level_skaven_stronghold_dead_warlord_03",
				"pwh_level_skaven_stronghold_dead_warlord_04"
			},
			sound_events_duration = {
				6.0427083969116,
				5.998104095459,
				5.862208366394,
				5.1354584693909
			}
		},
		pwh_level_skaven_stronghold_downtown = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_downtown_01",
				"pwh_level_skaven_stronghold_downtown_02",
				"pwh_level_skaven_stronghold_downtown_03",
				"pwh_level_skaven_stronghold_downtown_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_downtown_01",
				"pwh_level_skaven_stronghold_downtown_02",
				"pwh_level_skaven_stronghold_downtown_03",
				"pwh_level_skaven_stronghold_downtown_04"
			},
			sound_events_duration = {
				5.3571457862854,
				5.0792083740234,
				5.7457709312439,
				5.8972706794739
			}
		},
		pwh_level_skaven_stronghold_exit = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_exit_01",
				"pwh_level_skaven_stronghold_exit_02",
				"pwh_level_skaven_stronghold_exit_03",
				"pwh_level_skaven_stronghold_exit_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_exit_01",
				"pwh_level_skaven_stronghold_exit_02",
				"pwh_level_skaven_stronghold_exit_03",
				"pwh_level_skaven_stronghold_exit_04"
			},
			sound_events_duration = {
				3.6005415916443,
				2.9050834178925,
				1.2479583024979,
				3.4039583206177
			}
		},
		pwh_level_skaven_stronghold_foundry_entered = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_foundry_entered_01",
				"pwh_level_skaven_stronghold_foundry_entered_02",
				"pwh_level_skaven_stronghold_foundry_entered_03",
				"pwh_level_skaven_stronghold_foundry_entered_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_foundry_entered_01",
				"pwh_level_skaven_stronghold_foundry_entered_02",
				"pwh_level_skaven_stronghold_foundry_entered_03",
				"pwh_level_skaven_stronghold_foundry_entered_04"
			},
			sound_events_duration = {
				5.0213332176208,
				5.5862083435059,
				6.5012497901917,
				5.7823958396912
			}
		},
		pwh_level_skaven_stronghold_light_brazier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_light_brazier_01",
				"pwh_level_skaven_stronghold_light_brazier_02",
				"pwh_level_skaven_stronghold_light_brazier_03",
				"pwh_level_skaven_stronghold_light_brazier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_light_brazier_01",
				"pwh_level_skaven_stronghold_light_brazier_02",
				"pwh_level_skaven_stronghold_light_brazier_03",
				"pwh_level_skaven_stronghold_light_brazier_04"
			},
			sound_events_duration = {
				4.5946459770203,
				5.0459790229797,
				4.5562915802002,
				3.4763958454132
			}
		},
		pwh_level_skaven_stronghold_long_way_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_long_way_down_01",
				"pwh_level_skaven_stronghold_long_way_down_02",
				"pwh_level_skaven_stronghold_long_way_down_03",
				"pwh_level_skaven_stronghold_long_way_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_long_way_down_01",
				"pwh_level_skaven_stronghold_long_way_down_02",
				"pwh_level_skaven_stronghold_long_way_down_03",
				"pwh_level_skaven_stronghold_long_way_down_04"
			},
			sound_events_duration = {
				1.1473541259766,
				2.9511458873749,
				4.0201458930969,
				4.9778752326965
			}
		},
		pwh_level_skaven_stronghold_mission_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_mission_complete_01",
				"pwh_level_skaven_stronghold_mission_complete_02",
				"pwh_level_skaven_stronghold_mission_complete_03",
				"pwh_level_skaven_stronghold_mission_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_mission_complete_01",
				"pwh_level_skaven_stronghold_mission_complete_02",
				"pwh_level_skaven_stronghold_mission_complete_03",
				"pwh_level_skaven_stronghold_mission_complete_04"
			},
			sound_events_duration = {
				4.6960835456848,
				5.9257497787476,
				4.071249961853,
				4.3720207214356
			}
		},
		pwh_level_skaven_stronghold_patrol_lanes = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_patrol_lanes_01",
				"pwh_level_skaven_stronghold_patrol_lanes_02",
				"pwh_level_skaven_stronghold_patrol_lanes_03",
				"pwh_level_skaven_stronghold_patrol_lanes_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_patrol_lanes_01",
				"pwh_level_skaven_stronghold_patrol_lanes_02",
				"pwh_level_skaven_stronghold_patrol_lanes_03",
				"pwh_level_skaven_stronghold_patrol_lanes_04"
			},
			sound_events_duration = {
				3.8661458492279,
				3.4470207691193,
				3.8541250228882,
				2.7298333644867
			}
		},
		pwh_level_skaven_stronghold_rat_ogre_rampage = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "witch_hunter_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 1,
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwh_level_skaven_stronghold_rat_ogre_rampage_01"
			},
			sound_events = {
				[1.0] = "pwh_level_skaven_stronghold_rat_ogre_rampage_01"
			},
			sound_events_duration = {
				[1.0] = 4.0119791030884
			}
		},
		pwh_level_skaven_stronghold_taunt_warlord = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_taunt_warlord_01",
				"pwh_level_skaven_stronghold_taunt_warlord_02",
				"pwh_level_skaven_stronghold_taunt_warlord_03",
				"pwh_level_skaven_stronghold_taunt_warlord_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_taunt_warlord_01",
				"pwh_level_skaven_stronghold_taunt_warlord_02",
				"pwh_level_skaven_stronghold_taunt_warlord_03",
				"pwh_level_skaven_stronghold_taunt_warlord_04"
			},
			sound_events_duration = {
				4.8936457633972,
				5.1052293777466,
				3.1225209236145,
				3.5428125858307
			}
		},
		pwh_level_skaven_stronghold_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_vista_01",
				"pwh_level_skaven_stronghold_vista_02",
				"pwh_level_skaven_stronghold_vista_03",
				"pwh_level_skaven_stronghold_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_vista_01",
				"pwh_level_skaven_stronghold_vista_02",
				"pwh_level_skaven_stronghold_vista_03",
				"pwh_level_skaven_stronghold_vista_04"
			},
			sound_events_duration = {
				5.8293747901917,
				4.9786872863769,
				6.9532709121704,
				6.224645614624
			}
		},
		pwh_level_skaven_stronghold_warlord_nest = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_warlord_nest_01",
				"pwh_level_skaven_stronghold_warlord_nest_02",
				"pwh_level_skaven_stronghold_warlord_nest_03",
				"pwh_level_skaven_stronghold_warlord_nest_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_warlord_nest_01",
				"pwh_level_skaven_stronghold_warlord_nest_02",
				"pwh_level_skaven_stronghold_warlord_nest_03",
				"pwh_level_skaven_stronghold_warlord_nest_04"
			},
			sound_events_duration = {
				3.9685416221619,
				5.731541633606,
				4.2628960609436,
				5.3619790077209
			}
		},
		pwh_level_skaven_stronghold_waterwheel_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_waterwheel_complete_01",
				"pwh_level_skaven_stronghold_waterwheel_complete_02",
				"pwh_level_skaven_stronghold_waterwheel_complete_03",
				"pwh_level_skaven_stronghold_waterwheel_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_waterwheel_complete_01",
				"pwh_level_skaven_stronghold_waterwheel_complete_02",
				"pwh_level_skaven_stronghold_waterwheel_complete_03",
				"pwh_level_skaven_stronghold_waterwheel_complete_04"
			},
			sound_events_duration = {
				1.4607499837875,
				2.294625043869,
				2.3325207233429,
				5.4045414924622
			}
		},
		pwh_level_skaven_stronghold_waterwheel_move = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
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
				"pwh_level_skaven_stronghold_waterwheel_move_01",
				"pwh_level_skaven_stronghold_waterwheel_move_02",
				"pwh_level_skaven_stronghold_waterwheel_move_03",
				"pwh_level_skaven_stronghold_waterwheel_move_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_level_skaven_stronghold_waterwheel_move_01",
				"pwh_level_skaven_stronghold_waterwheel_move_02",
				"pwh_level_skaven_stronghold_waterwheel_move_03",
				"pwh_level_skaven_stronghold_waterwheel_move_04"
			},
			sound_events_duration = {
				3.7889375686645,
				2.888729095459,
				6.7066459655762,
				3.5332291126251
			}
		},
		pwh_skaven_stronghold_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_skaven_stronghold_intro_a_01",
				[2.0] = "pwh_skaven_stronghold_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_skaven_stronghold_intro_a_01",
				[2.0] = "pwh_skaven_stronghold_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 5.0077710151672,
				[2.0] = 7.5742292404175
			}
		},
		pwh_skaven_stronghold_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_skaven_stronghold_intro_b_01",
				[2.0] = "pwh_skaven_stronghold_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_skaven_stronghold_intro_b_01",
				[2.0] = "pwh_skaven_stronghold_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 6.2605209350586,
				[2.0] = 9.5200004577637
			}
		},
		pwh_skaven_stronghold_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "witch_hunter_skaven_stronghold",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_skaven_stronghold_intro_c_01",
				[2.0] = "pwh_skaven_stronghold_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwh_skaven_stronghold_intro_c_01",
				[2.0] = "pwh_skaven_stronghold_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 4.5401668548584,
				[2.0] = 3.5368542671204
			}
		}
	})
end
