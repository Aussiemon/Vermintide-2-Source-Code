return function ()
	define_rule({
		name = "pdr_level_skaven_stronghold_barrier",
		response = "pdr_level_skaven_stronghold_barrier",
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
		name = "pdr_level_skaven_stronghold_long_way_down",
		response = "pdr_level_skaven_stronghold_long_way_down",
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
		name = "pdr_level_skaven_stronghold_light_brazier",
		response = "pdr_level_skaven_stronghold_light_brazier",
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
		name = "pdr_level_skaven_stronghold_vista",
		response = "pdr_level_skaven_stronghold_vista",
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
		name = "pdr_level_skaven_stronghold_waterwheel_move",
		response = "pdr_level_skaven_stronghold_waterwheel_move",
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
		name = "pdr_level_skaven_stronghold_waterwheel_complete",
		response = "pdr_level_skaven_stronghold_waterwheel_complete",
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
		name = "pdr_level_skaven_stronghold_foundry_entered",
		response = "pdr_level_skaven_stronghold_foundry_entered",
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
		name = "pdr_level_skaven_stronghold_downtown",
		response = "pdr_level_skaven_stronghold_downtown",
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
		name = "pdr_level_skaven_stronghold_rat_ogre_rampage",
		response = "pdr_level_skaven_stronghold_rat_ogre_rampage",
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
		name = "pdr_level_skaven_stronghold_patrol_lanes",
		response = "pdr_level_skaven_stronghold_patrol_lanes",
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
		name = "pdr_level_skaven_stronghold_warlord_nest",
		response = "pdr_level_skaven_stronghold_warlord_nest",
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
		name = "pdr_level_skaven_stronghold_taunt_warlord",
		response = "pdr_level_skaven_stronghold_taunt_warlord",
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
		name = "pdr_level_skaven_stronghold_dead_warlord",
		response = "pdr_level_skaven_stronghold_dead_warlord",
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
		name = "pdr_level_skaven_stronghold_mission_complete",
		response = "pdr_level_skaven_stronghold_mission_complete",
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
		name = "pdr_level_skaven_stronghold_elevator",
		response = "pdr_level_skaven_stronghold_elevator",
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
				"level_skaven_stronghold_elevator"
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
				"level_skaven_stronghold_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_skaven_stronghold_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_skaven_stronghold_city_afire",
		response = "pdr_level_skaven_stronghold_city_afire",
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
		name = "pdr_level_skaven_stronghold_exit",
		response = "pdr_level_skaven_stronghold_exit",
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
		name = "pdr_skaven_stronghold_intro_a",
		response = "pdr_skaven_stronghold_intro_a",
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
		name = "pdr_skaven_stronghold_intro_b",
		response = "pdr_skaven_stronghold_intro_b",
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
				"dwarf_ranger"
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
		name = "pdr_skaven_stronghold_intro_c",
		response = "pdr_skaven_stronghold_intro_c",
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
				"dwarf_ranger"
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
	define_rule({
		name = "pdr_gameplay_skaven_warlord_kill",
		response = "pdr_gameplay_skaven_warlord_kill",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_gameplay_skaven_warlord_banter_reply",
		response = "pdr_gameplay_skaven_warlord_banter_reply",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_skaven_warlord_summoning_reply",
		response = "pdr_gameplay_skaven_warlord_summoning_reply",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_chieftain_tips_special_attack_cleave",
		response = "pdr_gameplay_chieftain_tips_special_attack_cleave",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.NEQ,
				"dwarf_ranger"
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
		name = "pdr_gameplay_chieftain_tips_special_lunge_attack_2",
		response = "pdr_gameplay_chieftain_tips_special_lunge_attack_2",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.NEQ,
				"dwarf_ranger"
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
	add_dialogues({
		pdr_level_skaven_stronghold_barrier = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_barrier_01",
				"pdr_level_skaven_stronghold_barrier_02",
				"pdr_level_skaven_stronghold_barrier_03",
				"pdr_level_skaven_stronghold_barrier_04"
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
				"pdr_level_skaven_stronghold_barrier_01",
				"pdr_level_skaven_stronghold_barrier_02",
				"pdr_level_skaven_stronghold_barrier_03",
				"pdr_level_skaven_stronghold_barrier_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_chieftain_tips_special_attack_cleave = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_gameplay_chieftain_tips_01",
				"pdr_gameplay_chieftain_tips_02",
				"pdr_gameplay_chieftain_tips_03",
				"pdr_gameplay_chieftain_tips_04"
			},
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
				"pdr_gameplay_chieftain_tips_01",
				"pdr_gameplay_chieftain_tips_02",
				"pdr_gameplay_chieftain_tips_03",
				"pdr_gameplay_chieftain_tips_04"
			},
			randomize_indexes = {}
		},
		pdr_skaven_stronghold_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_skaven_stronghold_intro_a_01",
				[2.0] = "pdr_skaven_stronghold_intro_a_02"
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
				[1.0] = "pdr_skaven_stronghold_intro_a_01",
				[2.0] = "pdr_skaven_stronghold_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_waterwheel_move = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_waterwheel_move_01",
				"pdr_level_skaven_stronghold_waterwheel_move_02",
				"pdr_level_skaven_stronghold_waterwheel_move_03",
				"pdr_level_skaven_stronghold_waterwheel_move_04"
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
				"pdr_level_skaven_stronghold_waterwheel_move_01",
				"pdr_level_skaven_stronghold_waterwheel_move_02",
				"pdr_level_skaven_stronghold_waterwheel_move_03",
				"pdr_level_skaven_stronghold_waterwheel_move_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_waterwheel_complete = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_waterwheel_complete_01",
				"pdr_level_skaven_stronghold_waterwheel_complete_02",
				"pdr_level_skaven_stronghold_waterwheel_complete_03",
				"pdr_level_skaven_stronghold_waterwheel_complete_04"
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
				"pdr_level_skaven_stronghold_waterwheel_complete_01",
				"pdr_level_skaven_stronghold_waterwheel_complete_02",
				"pdr_level_skaven_stronghold_waterwheel_complete_03",
				"pdr_level_skaven_stronghold_waterwheel_complete_04"
			},
			randomize_indexes = {}
		},
		pdr_skaven_stronghold_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_skaven_stronghold_intro_c_01",
				[2.0] = "pdr_skaven_stronghold_intro_c_02"
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
				[1.0] = "pdr_skaven_stronghold_intro_c_01",
				[2.0] = "pdr_skaven_stronghold_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_skaven_stronghold_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_skaven_stronghold_intro_b_01",
				[2.0] = "pdr_skaven_stronghold_intro_b_02"
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
				[1.0] = "pdr_skaven_stronghold_intro_b_01",
				[2.0] = "pdr_skaven_stronghold_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_mission_complete = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_mission_complete_01",
				"pdr_level_skaven_stronghold_mission_complete_02",
				"pdr_level_skaven_stronghold_mission_complete_03",
				"pdr_level_skaven_stronghold_mission_complete_04"
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
				"pdr_level_skaven_stronghold_mission_complete_01",
				"pdr_level_skaven_stronghold_mission_complete_02",
				"pdr_level_skaven_stronghold_mission_complete_03",
				"pdr_level_skaven_stronghold_mission_complete_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_dead_warlord = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_dead_warlord_01",
				"pdr_level_skaven_stronghold_dead_warlord_02",
				"pdr_level_skaven_stronghold_dead_warlord_03",
				"pdr_level_skaven_stronghold_dead_warlord_04"
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
				"pdr_level_skaven_stronghold_dead_warlord_01",
				"pdr_level_skaven_stronghold_dead_warlord_02",
				"pdr_level_skaven_stronghold_dead_warlord_03",
				"pdr_level_skaven_stronghold_dead_warlord_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_warlord_nest = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_warlord_nest_01",
				"pdr_level_skaven_stronghold_warlord_nest_02",
				"pdr_level_skaven_stronghold_warlord_nest_03",
				"pdr_level_skaven_stronghold_warlord_nest_04"
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
				"pdr_level_skaven_stronghold_warlord_nest_01",
				"pdr_level_skaven_stronghold_warlord_nest_02",
				"pdr_level_skaven_stronghold_warlord_nest_03",
				"pdr_level_skaven_stronghold_warlord_nest_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_city_afire = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_city_afire_01",
				"pdr_level_skaven_stronghold_city_afire_02",
				"pdr_level_skaven_stronghold_city_afire_03",
				"pdr_level_skaven_stronghold_city_afire_04"
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
				"pdr_level_skaven_stronghold_city_afire_01",
				"pdr_level_skaven_stronghold_city_afire_02",
				"pdr_level_skaven_stronghold_city_afire_03",
				"pdr_level_skaven_stronghold_city_afire_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_skaven_warlord_summoning_reply = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_skaven_stronghold",
			category = "player_alerts_boss",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_skaven_warlord_summoning_reply_01",
				"pdr_gameplay_skaven_warlord_summoning_reply_02",
				"pdr_gameplay_skaven_warlord_summoning_reply_03",
				"pdr_gameplay_skaven_warlord_summoning_reply_04",
				"pdr_gameplay_skaven_warlord_summoning_reply_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_skaven_warlord_summoning_reply_01",
				"pdr_gameplay_skaven_warlord_summoning_reply_02",
				"pdr_gameplay_skaven_warlord_summoning_reply_03",
				"pdr_gameplay_skaven_warlord_summoning_reply_04",
				"pdr_gameplay_skaven_warlord_summoning_reply_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_chieftain_tips_special_lunge_attack_2 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_gameplay_chieftain_tips_01",
				"pdr_gameplay_chieftain_tips_02",
				"pdr_gameplay_chieftain_tips_03",
				"pdr_gameplay_chieftain_tips_04"
			},
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
				"pdr_gameplay_chieftain_tips_01",
				"pdr_gameplay_chieftain_tips_02",
				"pdr_gameplay_chieftain_tips_03",
				"pdr_gameplay_chieftain_tips_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_skaven_warlord_banter_reply = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_skaven_stronghold",
			category = "player_alerts_boss",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_skaven_warlord_banter_reply_01",
				"pdr_gameplay_skaven_warlord_banter_reply_02",
				"pdr_gameplay_skaven_warlord_banter_reply_03",
				"pdr_gameplay_skaven_warlord_banter_reply_04",
				"pdr_gameplay_skaven_warlord_banter_reply_05",
				"pdr_gameplay_skaven_warlord_banter_reply_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_skaven_warlord_banter_reply_01",
				"pdr_gameplay_skaven_warlord_banter_reply_02",
				"pdr_gameplay_skaven_warlord_banter_reply_03",
				"pdr_gameplay_skaven_warlord_banter_reply_04",
				"pdr_gameplay_skaven_warlord_banter_reply_05",
				"pdr_gameplay_skaven_warlord_banter_reply_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_skaven_warlord_kill = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_gameplay_skaven_warlord_kill_01",
				"pdr_gameplay_skaven_warlord_kill_02",
				"pdr_gameplay_skaven_warlord_kill_03",
				"pdr_gameplay_skaven_warlord_kill_04"
			},
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
				"pdr_gameplay_skaven_warlord_kill_01",
				"pdr_gameplay_skaven_warlord_kill_02",
				"pdr_gameplay_skaven_warlord_kill_03",
				"pdr_gameplay_skaven_warlord_kill_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_light_brazier = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_light_brazier_01",
				"pdr_level_skaven_stronghold_light_brazier_02",
				"pdr_level_skaven_stronghold_light_brazier_03",
				"pdr_level_skaven_stronghold_light_brazier_04"
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
				"pdr_level_skaven_stronghold_light_brazier_01",
				"pdr_level_skaven_stronghold_light_brazier_02",
				"pdr_level_skaven_stronghold_light_brazier_03",
				"pdr_level_skaven_stronghold_light_brazier_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_exit = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_exit_01",
				"pdr_level_skaven_stronghold_exit_02",
				"pdr_level_skaven_stronghold_exit_03",
				"pdr_level_skaven_stronghold_exit_04"
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
				"pdr_level_skaven_stronghold_exit_01",
				"pdr_level_skaven_stronghold_exit_02",
				"pdr_level_skaven_stronghold_exit_03",
				"pdr_level_skaven_stronghold_exit_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_vista = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_vista_01",
				"pdr_level_skaven_stronghold_vista_02",
				"pdr_level_skaven_stronghold_vista_03",
				"pdr_level_skaven_stronghold_vista_04"
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
				"pdr_level_skaven_stronghold_vista_01",
				"pdr_level_skaven_stronghold_vista_02",
				"pdr_level_skaven_stronghold_vista_03",
				"pdr_level_skaven_stronghold_vista_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_patrol_lanes = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_patrol_lanes_01",
				"pdr_level_skaven_stronghold_patrol_lanes_02",
				"pdr_level_skaven_stronghold_patrol_lanes_03",
				"pdr_level_skaven_stronghold_patrol_lanes_04"
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
				"pdr_level_skaven_stronghold_patrol_lanes_01",
				"pdr_level_skaven_stronghold_patrol_lanes_02",
				"pdr_level_skaven_stronghold_patrol_lanes_03",
				"pdr_level_skaven_stronghold_patrol_lanes_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_long_way_down = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_long_way_down_01",
				"pdr_level_skaven_stronghold_long_way_down_02",
				"pdr_level_skaven_stronghold_long_way_down_03",
				"pdr_level_skaven_stronghold_long_way_down_04"
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
				"pdr_level_skaven_stronghold_long_way_down_01",
				"pdr_level_skaven_stronghold_long_way_down_02",
				"pdr_level_skaven_stronghold_long_way_down_03",
				"pdr_level_skaven_stronghold_long_way_down_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_foundry_entered = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_foundry_entered_01",
				"pdr_level_skaven_stronghold_foundry_entered_02",
				"pdr_level_skaven_stronghold_foundry_entered_03",
				"pdr_level_skaven_stronghold_foundry_entered_04"
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
				"pdr_level_skaven_stronghold_foundry_entered_01",
				"pdr_level_skaven_stronghold_foundry_entered_02",
				"pdr_level_skaven_stronghold_foundry_entered_03",
				"pdr_level_skaven_stronghold_foundry_entered_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_elevator = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_elevator_01",
				"pdr_level_skaven_stronghold_elevator_02",
				"pdr_level_skaven_stronghold_elevator_03",
				"pdr_level_skaven_stronghold_elevator_04"
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
				"pdr_level_skaven_stronghold_elevator_01",
				"pdr_level_skaven_stronghold_elevator_02",
				"pdr_level_skaven_stronghold_elevator_03",
				"pdr_level_skaven_stronghold_elevator_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_rat_ogre_rampage = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_skaven_stronghold_rat_ogre_rampage_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_level_skaven_stronghold_rat_ogre_rampage_01"
			}
		},
		pdr_level_skaven_stronghold_taunt_warlord = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_taunt_warlord_01",
				"pdr_level_skaven_stronghold_taunt_warlord_02",
				"pdr_level_skaven_stronghold_taunt_warlord_03",
				"pdr_level_skaven_stronghold_taunt_warlord_04"
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
				"pdr_level_skaven_stronghold_taunt_warlord_01",
				"pdr_level_skaven_stronghold_taunt_warlord_02",
				"pdr_level_skaven_stronghold_taunt_warlord_03",
				"pdr_level_skaven_stronghold_taunt_warlord_04"
			},
			randomize_indexes = {}
		},
		pdr_level_skaven_stronghold_downtown = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_skaven_stronghold_downtown_01",
				"pdr_level_skaven_stronghold_downtown_02",
				"pdr_level_skaven_stronghold_downtown_03",
				"pdr_level_skaven_stronghold_downtown_04"
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
				"pdr_level_skaven_stronghold_downtown_01",
				"pdr_level_skaven_stronghold_downtown_02",
				"pdr_level_skaven_stronghold_downtown_03",
				"pdr_level_skaven_stronghold_downtown_04"
			},
			randomize_indexes = {}
		}
	})
end
