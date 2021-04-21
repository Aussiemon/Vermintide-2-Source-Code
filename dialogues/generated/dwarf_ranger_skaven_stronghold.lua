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
		pdr_skaven_stronghold_intro_b = {
			face_animations_n = 2,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_skaven_stronghold_intro_b_01",
				[2.0] = "pdr_skaven_stronghold_intro_b_02"
			},
			sound_events = {
				[1.0] = "pdr_skaven_stronghold_intro_b_01",
				[2.0] = "pdr_skaven_stronghold_intro_b_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 7.0399374961853,
				[2.0] = 7.1224999427795
			}
		},
		pdr_level_skaven_stronghold_taunt_warlord = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_taunt_warlord_01",
				"pdr_level_skaven_stronghold_taunt_warlord_02",
				"pdr_level_skaven_stronghold_taunt_warlord_03",
				"pdr_level_skaven_stronghold_taunt_warlord_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_taunt_warlord_01",
				"pdr_level_skaven_stronghold_taunt_warlord_02",
				"pdr_level_skaven_stronghold_taunt_warlord_03",
				"pdr_level_skaven_stronghold_taunt_warlord_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				7.984395980835,
				5.9255418777466,
				6.4093332290649,
				6.2572917938232
			}
		},
		pdr_level_skaven_stronghold_vista = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_vista_01",
				"pdr_level_skaven_stronghold_vista_02",
				"pdr_level_skaven_stronghold_vista_03",
				"pdr_level_skaven_stronghold_vista_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_vista_01",
				"pdr_level_skaven_stronghold_vista_02",
				"pdr_level_skaven_stronghold_vista_03",
				"pdr_level_skaven_stronghold_vista_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.6560831069946,
				6.561562538147,
				5.8470416069031,
				3.6711459159851
			}
		},
		pdr_level_skaven_stronghold_light_brazier = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_light_brazier_01",
				"pdr_level_skaven_stronghold_light_brazier_02",
				"pdr_level_skaven_stronghold_light_brazier_03",
				"pdr_level_skaven_stronghold_light_brazier_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_light_brazier_01",
				"pdr_level_skaven_stronghold_light_brazier_02",
				"pdr_level_skaven_stronghold_light_brazier_03",
				"pdr_level_skaven_stronghold_light_brazier_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.7053332328796,
				2.4487917423248,
				2.131979227066,
				4.4021873474121
			}
		},
		pdr_skaven_stronghold_intro_c = {
			face_animations_n = 2,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_skaven_stronghold_intro_c_01",
				[2.0] = "pdr_skaven_stronghold_intro_c_02"
			},
			sound_events = {
				[1.0] = "pdr_skaven_stronghold_intro_c_01",
				[2.0] = "pdr_skaven_stronghold_intro_c_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.8809583187103,
				[2.0] = 3.2920207977295
			}
		},
		pdr_level_skaven_stronghold_warlord_nest = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_warlord_nest_01",
				"pdr_level_skaven_stronghold_warlord_nest_02",
				"pdr_level_skaven_stronghold_warlord_nest_03",
				"pdr_level_skaven_stronghold_warlord_nest_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_warlord_nest_01",
				"pdr_level_skaven_stronghold_warlord_nest_02",
				"pdr_level_skaven_stronghold_warlord_nest_03",
				"pdr_level_skaven_stronghold_warlord_nest_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.5605416297913,
				4.7538957595825,
				2.0523958206177,
				3.3330624103546
			}
		},
		pdr_level_skaven_stronghold_mission_complete = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_mission_complete_01",
				"pdr_level_skaven_stronghold_mission_complete_02",
				"pdr_level_skaven_stronghold_mission_complete_03",
				"pdr_level_skaven_stronghold_mission_complete_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_mission_complete_01",
				"pdr_level_skaven_stronghold_mission_complete_02",
				"pdr_level_skaven_stronghold_mission_complete_03",
				"pdr_level_skaven_stronghold_mission_complete_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.4739375114441,
				3.0779583454132,
				3.2195000648499,
				2.6280207633972
			}
		},
		pdr_level_skaven_stronghold_dead_warlord = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_dead_warlord_01",
				"pdr_level_skaven_stronghold_dead_warlord_02",
				"pdr_level_skaven_stronghold_dead_warlord_03",
				"pdr_level_skaven_stronghold_dead_warlord_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_dead_warlord_01",
				"pdr_level_skaven_stronghold_dead_warlord_02",
				"pdr_level_skaven_stronghold_dead_warlord_03",
				"pdr_level_skaven_stronghold_dead_warlord_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.2720415592194,
				2.8939790725708,
				4.1078124046326,
				3.9009165763855
			}
		},
		pdr_level_skaven_stronghold_long_way_down = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_long_way_down_01",
				"pdr_level_skaven_stronghold_long_way_down_02",
				"pdr_level_skaven_stronghold_long_way_down_03",
				"pdr_level_skaven_stronghold_long_way_down_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_long_way_down_01",
				"pdr_level_skaven_stronghold_long_way_down_02",
				"pdr_level_skaven_stronghold_long_way_down_03",
				"pdr_level_skaven_stronghold_long_way_down_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.1674582958221,
				3.6305000782013,
				3.5361666679382,
				3.0411667823791
			}
		},
		pdr_level_skaven_stronghold_waterwheel_complete = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_waterwheel_complete_01",
				"pdr_level_skaven_stronghold_waterwheel_complete_02",
				"pdr_level_skaven_stronghold_waterwheel_complete_03",
				"pdr_level_skaven_stronghold_waterwheel_complete_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_waterwheel_complete_01",
				"pdr_level_skaven_stronghold_waterwheel_complete_02",
				"pdr_level_skaven_stronghold_waterwheel_complete_03",
				"pdr_level_skaven_stronghold_waterwheel_complete_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.7254791259766,
				2.0680000782013,
				1.6703958511352,
				2.9344582557678
			}
		},
		pdr_gameplay_skaven_warlord_banter_reply = {
			face_animations_n = 6,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pdr_gameplay_skaven_warlord_banter_reply_01",
				"pdr_gameplay_skaven_warlord_banter_reply_02",
				"pdr_gameplay_skaven_warlord_banter_reply_03",
				"pdr_gameplay_skaven_warlord_banter_reply_04",
				"pdr_gameplay_skaven_warlord_banter_reply_05",
				"pdr_gameplay_skaven_warlord_banter_reply_06"
			},
			sound_events = {
				"pdr_gameplay_skaven_warlord_banter_reply_01",
				"pdr_gameplay_skaven_warlord_banter_reply_02",
				"pdr_gameplay_skaven_warlord_banter_reply_03",
				"pdr_gameplay_skaven_warlord_banter_reply_04",
				"pdr_gameplay_skaven_warlord_banter_reply_05",
				"pdr_gameplay_skaven_warlord_banter_reply_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.9257707595825,
				2.9788334369659,
				2.7056457996368,
				3.0612499713898,
				2.7836248874664,
				6.0525832176208
			}
		},
		pdr_level_skaven_stronghold_waterwheel_move = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_waterwheel_move_01",
				"pdr_level_skaven_stronghold_waterwheel_move_02",
				"pdr_level_skaven_stronghold_waterwheel_move_03",
				"pdr_level_skaven_stronghold_waterwheel_move_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_waterwheel_move_01",
				"pdr_level_skaven_stronghold_waterwheel_move_02",
				"pdr_level_skaven_stronghold_waterwheel_move_03",
				"pdr_level_skaven_stronghold_waterwheel_move_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.6705417633057,
				3.6952500343323,
				4.6500835418701,
				3.219208240509
			}
		},
		pdr_level_skaven_stronghold_downtown = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_downtown_01",
				"pdr_level_skaven_stronghold_downtown_02",
				"pdr_level_skaven_stronghold_downtown_03",
				"pdr_level_skaven_stronghold_downtown_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_downtown_01",
				"pdr_level_skaven_stronghold_downtown_02",
				"pdr_level_skaven_stronghold_downtown_03",
				"pdr_level_skaven_stronghold_downtown_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.0153541564941,
				3.2082500457764,
				4.4110627174377,
				3.5990417003632
			}
		},
		pdr_skaven_stronghold_intro_a = {
			face_animations_n = 2,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_skaven_stronghold_intro_a_01",
				[2.0] = "pdr_skaven_stronghold_intro_a_02"
			},
			sound_events = {
				[1.0] = "pdr_skaven_stronghold_intro_a_01",
				[2.0] = "pdr_skaven_stronghold_intro_a_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 6.4916248321533,
				[2.0] = 3.6360623836517
			}
		},
		pdr_gameplay_chieftain_tips_special_lunge_attack_2 = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_gameplay_chieftain_tips_01",
				"pdr_gameplay_chieftain_tips_02",
				"pdr_gameplay_chieftain_tips_03",
				"pdr_gameplay_chieftain_tips_04"
			},
			sound_events = {
				"pdr_gameplay_chieftain_tips_01",
				"pdr_gameplay_chieftain_tips_02",
				"pdr_gameplay_chieftain_tips_03",
				"pdr_gameplay_chieftain_tips_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.158083319664,
				1.2273541688919,
				1.6189166307449,
				1.555583357811
			}
		},
		pdr_level_skaven_stronghold_city_afire = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_city_afire_01",
				"pdr_level_skaven_stronghold_city_afire_02",
				"pdr_level_skaven_stronghold_city_afire_03",
				"pdr_level_skaven_stronghold_city_afire_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_city_afire_01",
				"pdr_level_skaven_stronghold_city_afire_02",
				"pdr_level_skaven_stronghold_city_afire_03",
				"pdr_level_skaven_stronghold_city_afire_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.3192706108093,
				4.5118126869202,
				4.2498331069946,
				2.1400415897369
			}
		},
		pdr_gameplay_chieftain_tips_special_attack_cleave = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_gameplay_chieftain_tips_01",
				"pdr_gameplay_chieftain_tips_02",
				"pdr_gameplay_chieftain_tips_03",
				"pdr_gameplay_chieftain_tips_04"
			},
			sound_events = {
				"pdr_gameplay_chieftain_tips_01",
				"pdr_gameplay_chieftain_tips_02",
				"pdr_gameplay_chieftain_tips_03",
				"pdr_gameplay_chieftain_tips_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.158083319664,
				1.2273541688919,
				1.6189166307449,
				1.555583357811
			}
		},
		pdr_level_skaven_stronghold_foundry_entered = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_foundry_entered_01",
				"pdr_level_skaven_stronghold_foundry_entered_02",
				"pdr_level_skaven_stronghold_foundry_entered_03",
				"pdr_level_skaven_stronghold_foundry_entered_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_foundry_entered_01",
				"pdr_level_skaven_stronghold_foundry_entered_02",
				"pdr_level_skaven_stronghold_foundry_entered_03",
				"pdr_level_skaven_stronghold_foundry_entered_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.5133957862854,
				5.809166431427,
				4.5926456451416,
				5.8005418777466
			}
		},
		pdr_level_skaven_stronghold_barrier = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_barrier_01",
				"pdr_level_skaven_stronghold_barrier_02",
				"pdr_level_skaven_stronghold_barrier_03",
				"pdr_level_skaven_stronghold_barrier_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_barrier_01",
				"pdr_level_skaven_stronghold_barrier_02",
				"pdr_level_skaven_stronghold_barrier_03",
				"pdr_level_skaven_stronghold_barrier_04"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.8434998989105,
				4.5661249160767,
				3.6970207691193,
				2.4998333454132
			}
		},
		pdr_level_skaven_stronghold_rat_ogre_rampage = {
			face_animations_n = 1,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_skaven_stronghold_rat_ogre_rampage_01"
			},
			sound_events = {
				[1.0] = "pdr_level_skaven_stronghold_rat_ogre_rampage_01"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.7430624961853
			}
		},
		pdr_gameplay_skaven_warlord_kill = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_gameplay_skaven_warlord_kill_01",
				"pdr_gameplay_skaven_warlord_kill_02",
				"pdr_gameplay_skaven_warlord_kill_03",
				"pdr_gameplay_skaven_warlord_kill_04"
			},
			sound_events = {
				"pdr_gameplay_skaven_warlord_kill_01",
				"pdr_gameplay_skaven_warlord_kill_02",
				"pdr_gameplay_skaven_warlord_kill_03",
				"pdr_gameplay_skaven_warlord_kill_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.503187417984,
				1.6003333330154,
				3.1426250934601,
				1.7957082986832
			}
		},
		pdr_level_skaven_stronghold_exit = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_exit_01",
				"pdr_level_skaven_stronghold_exit_02",
				"pdr_level_skaven_stronghold_exit_03",
				"pdr_level_skaven_stronghold_exit_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_exit_01",
				"pdr_level_skaven_stronghold_exit_02",
				"pdr_level_skaven_stronghold_exit_03",
				"pdr_level_skaven_stronghold_exit_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.4691877365112,
				2.7629375457764,
				3.1596667766571,
				3.5589165687561
			}
		},
		pdr_level_skaven_stronghold_elevator = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_elevator_01",
				"pdr_level_skaven_stronghold_elevator_02",
				"pdr_level_skaven_stronghold_elevator_03",
				"pdr_level_skaven_stronghold_elevator_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_elevator_01",
				"pdr_level_skaven_stronghold_elevator_02",
				"pdr_level_skaven_stronghold_elevator_03",
				"pdr_level_skaven_stronghold_elevator_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.5664167404175,
				1.4204374551773,
				2.6370625495911,
				2.5911874771118
			}
		},
		pdr_gameplay_skaven_warlord_summoning_reply = {
			face_animations_n = 5,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pdr_gameplay_skaven_warlord_summoning_reply_01",
				"pdr_gameplay_skaven_warlord_summoning_reply_02",
				"pdr_gameplay_skaven_warlord_summoning_reply_03",
				"pdr_gameplay_skaven_warlord_summoning_reply_04",
				"pdr_gameplay_skaven_warlord_summoning_reply_05"
			},
			sound_events = {
				"pdr_gameplay_skaven_warlord_summoning_reply_01",
				"pdr_gameplay_skaven_warlord_summoning_reply_02",
				"pdr_gameplay_skaven_warlord_summoning_reply_03",
				"pdr_gameplay_skaven_warlord_summoning_reply_04",
				"pdr_gameplay_skaven_warlord_summoning_reply_05"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.8234167098999,
				3.8873958587647,
				3.6184792518616,
				2.9873332977295,
				3.9112501144409
			}
		},
		pdr_level_skaven_stronghold_patrol_lanes = {
			face_animations_n = 4,
			database = "dwarf_ranger_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_level_skaven_stronghold_patrol_lanes_01",
				"pdr_level_skaven_stronghold_patrol_lanes_02",
				"pdr_level_skaven_stronghold_patrol_lanes_03",
				"pdr_level_skaven_stronghold_patrol_lanes_04"
			},
			sound_events = {
				"pdr_level_skaven_stronghold_patrol_lanes_01",
				"pdr_level_skaven_stronghold_patrol_lanes_02",
				"pdr_level_skaven_stronghold_patrol_lanes_03",
				"pdr_level_skaven_stronghold_patrol_lanes_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.785854101181,
				2.6259167194366,
				3.2836248874664,
				4.3942708969116
			}
		}
	})
end
