return function ()
	define_rule({
		name = "pes_level_skaven_stronghold_barrier",
		response = "pes_level_skaven_stronghold_barrier",
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
		name = "pes_level_skaven_stronghold_long_way_down",
		response = "pes_level_skaven_stronghold_long_way_down",
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
		name = "pes_level_skaven_stronghold_light_brazier",
		response = "pes_level_skaven_stronghold_light_brazier",
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
		name = "pes_level_skaven_stronghold_vista",
		response = "pes_level_skaven_stronghold_vista",
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
		name = "pes_level_skaven_stronghold_waterwheel_move",
		response = "pes_level_skaven_stronghold_waterwheel_move",
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
		name = "pes_level_skaven_stronghold_waterwheel_complete",
		response = "pes_level_skaven_stronghold_waterwheel_complete",
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
		name = "pes_level_skaven_stronghold_foundry_entered",
		response = "pes_level_skaven_stronghold_foundry_entered",
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
		name = "pes_level_skaven_stronghold_downtown",
		response = "pes_level_skaven_stronghold_downtown",
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
		name = "pes_level_skaven_stronghold_patrol_lanes",
		response = "pes_level_skaven_stronghold_patrol_lanes",
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
		name = "pes_level_skaven_stronghold_warlord_nest",
		response = "pes_level_skaven_stronghold_warlord_nest",
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
		name = "pes_level_skaven_stronghold_taunt_warlord",
		response = "pes_level_skaven_stronghold_taunt_warlord",
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
		name = "pes_level_skaven_stronghold_dead_warlord",
		response = "pes_level_skaven_stronghold_dead_warlord",
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
		name = "pes_level_skaven_stronghold_mission_complete",
		response = "pes_level_skaven_stronghold_mission_complete",
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
		name = "pes_level_skaven_stronghold_city_afire",
		response = "pes_level_skaven_stronghold_city_afire",
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
		name = "pes_level_skaven_stronghold_exit",
		response = "pes_level_skaven_stronghold_exit",
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
		name = "pes_skaven_stronghold_intro_a",
		response = "pes_skaven_stronghold_intro_a",
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
		name = "pes_skaven_stronghold_intro_b",
		response = "pes_skaven_stronghold_intro_b",
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
				"empire_soldier"
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
		name = "pes_skaven_stronghold_intro_c",
		response = "pes_skaven_stronghold_intro_c",
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
				"empire_soldier"
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
		name = "pes_gameplay_chieftain_tips_special_attack_cleave",
		response = "pes_gameplay_chieftain_tips_special_attack_cleave",
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
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.NEQ,
				"empire_soldier"
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
		name = "pes_gameplay_chieftain_tips_special_lunge_attack_2",
		response = "pes_gameplay_chieftain_tips_special_lunge_attack_2",
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
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.NEQ,
				"empire_soldier"
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
		name = "pes_gameplay_skaven_warlord_kill",
		response = "pes_gameplay_skaven_warlord_kill",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
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
		name = "pes_gameplay_skaven_warlord_banter_reply",
		response = "pes_gameplay_skaven_warlord_banter_reply",
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
				"empire_soldier"
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
		name = "pes_gameplay_skaven_warlord_summoning_reply",
		response = "pes_gameplay_skaven_warlord_summoning_reply",
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
				"empire_soldier"
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
	add_dialogues({
		pes_level_skaven_stronghold_taunt_warlord = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_taunt_warlord_01",
				"pes_level_skaven_stronghold_taunt_warlord_02",
				"pes_level_skaven_stronghold_taunt_warlord_03",
				"pes_level_skaven_stronghold_taunt_warlord_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_taunt_warlord_01",
				"pes_level_skaven_stronghold_taunt_warlord_02",
				"pes_level_skaven_stronghold_taunt_warlord_03",
				"pes_level_skaven_stronghold_taunt_warlord_04"
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
				3.8821666240692,
				4.2435417175293,
				2.616229057312,
				5.8596873283386
			}
		},
		pes_level_skaven_stronghold_exit = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_exit_01",
				"pes_level_skaven_stronghold_exit_02",
				"pes_level_skaven_stronghold_exit_03",
				"pes_level_skaven_stronghold_exit_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_exit_01",
				"pes_level_skaven_stronghold_exit_02",
				"pes_level_skaven_stronghold_exit_03",
				"pes_level_skaven_stronghold_exit_04"
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
				4.1098124980926,
				4.1938543319702,
				2.8328750133514,
				3.7025208473206
			}
		},
		pes_level_skaven_stronghold_mission_complete = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_mission_complete_01",
				"pes_level_skaven_stronghold_mission_complete_02",
				"pes_level_skaven_stronghold_mission_complete_03",
				"pes_level_skaven_stronghold_mission_complete_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_mission_complete_01",
				"pes_level_skaven_stronghold_mission_complete_02",
				"pes_level_skaven_stronghold_mission_complete_03",
				"pes_level_skaven_stronghold_mission_complete_04"
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
				2.694854259491,
				2.5978751182556,
				1.8284583091736,
				2.3450832366943
			}
		},
		pes_level_skaven_stronghold_warlord_nest = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_warlord_nest_01",
				"pes_level_skaven_stronghold_warlord_nest_02",
				"pes_level_skaven_stronghold_warlord_nest_03",
				"pes_level_skaven_stronghold_warlord_nest_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_warlord_nest_01",
				"pes_level_skaven_stronghold_warlord_nest_02",
				"pes_level_skaven_stronghold_warlord_nest_03",
				"pes_level_skaven_stronghold_warlord_nest_04"
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
				1.772541642189,
				3.1013333797455,
				3.2939999103546,
				4.0441563129425
			}
		},
		pes_level_skaven_stronghold_dead_warlord = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_dead_warlord_01",
				"pes_level_skaven_stronghold_dead_warlord_02",
				"pes_level_skaven_stronghold_dead_warlord_03",
				"pes_level_skaven_stronghold_dead_warlord_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_dead_warlord_01",
				"pes_level_skaven_stronghold_dead_warlord_02",
				"pes_level_skaven_stronghold_dead_warlord_03",
				"pes_level_skaven_stronghold_dead_warlord_04"
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
				2.7903542518616,
				4.6926040649414,
				2.2330832481384,
				4.042666554451
			}
		},
		pes_gameplay_skaven_warlord_kill = {
			face_animations_n = 3,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pes_gameplay_skaven_warlord_kill_01",
				"pes_gameplay_skaven_warlord_kill_02",
				"pes_gameplay_skaven_warlord_kill_03"
			},
			sound_events = {
				"pes_gameplay_skaven_warlord_kill_01",
				"pes_gameplay_skaven_warlord_kill_02",
				"pes_gameplay_skaven_warlord_kill_03"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.2848749160767,
				2.0540208220482,
				4.4018750190735
			}
		},
		pes_gameplay_skaven_warlord_banter_reply = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_gameplay_skaven_warlord_banter_reply_01",
				"pes_gameplay_skaven_warlord_banter_reply_02",
				"pes_gameplay_skaven_warlord_banter_reply_03",
				"pes_gameplay_skaven_warlord_banter_reply_04"
			},
			sound_events = {
				"pes_gameplay_skaven_warlord_banter_reply_01",
				"pes_gameplay_skaven_warlord_banter_reply_02",
				"pes_gameplay_skaven_warlord_banter_reply_03",
				"pes_gameplay_skaven_warlord_banter_reply_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.5088748931885,
				5.9093751907349,
				6.914083480835,
				3.0216875076294
			}
		},
		pes_level_skaven_stronghold_vista = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_vista_01",
				"pes_level_skaven_stronghold_vista_02",
				"pes_level_skaven_stronghold_vista_03",
				"pes_level_skaven_stronghold_vista_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_vista_01",
				"pes_level_skaven_stronghold_vista_02",
				"pes_level_skaven_stronghold_vista_03",
				"pes_level_skaven_stronghold_vista_04"
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
				5.4487500190735,
				5.279833316803,
				6.076208114624,
				5.0113959312439
			}
		},
		pes_level_skaven_stronghold_waterwheel_complete = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_waterwheel_complete_01",
				"pes_level_skaven_stronghold_waterwheel_complete_02",
				"pes_level_skaven_stronghold_waterwheel_complete_03",
				"pes_level_skaven_stronghold_waterwheel_complete_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_waterwheel_complete_01",
				"pes_level_skaven_stronghold_waterwheel_complete_02",
				"pes_level_skaven_stronghold_waterwheel_complete_03",
				"pes_level_skaven_stronghold_waterwheel_complete_04"
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
				1.8440624475479,
				2.3817083835602,
				1.2332916259766,
				4.5667290687561
			}
		},
		pes_gameplay_chieftain_tips_special_attack_cleave = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_gameplay_chieftain_tips_01",
				"pes_gameplay_chieftain_tips_02",
				"pes_gameplay_chieftain_tips_03",
				"pes_gameplay_chieftain_tips_04"
			},
			sound_events = {
				"pes_gameplay_chieftain_tips_01",
				"pes_gameplay_chieftain_tips_02",
				"pes_gameplay_chieftain_tips_03",
				"pes_gameplay_chieftain_tips_04"
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
				1.7265625,
				1.3058333396912,
				1.1954582929611,
				2.0548334121704
			}
		},
		pes_level_skaven_stronghold_foundry_entered = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_foundry_entered_01",
				"pes_level_skaven_stronghold_foundry_entered_02",
				"pes_level_skaven_stronghold_foundry_entered_03",
				"pes_level_skaven_stronghold_foundry_entered_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_foundry_entered_01",
				"pes_level_skaven_stronghold_foundry_entered_02",
				"pes_level_skaven_stronghold_foundry_entered_03",
				"pes_level_skaven_stronghold_foundry_entered_04"
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
				4.3669166564941,
				6.0256457328796,
				5.7641458511353,
				5.4477500915527
			}
		},
		pes_level_skaven_stronghold_downtown = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_downtown_01",
				"pes_level_skaven_stronghold_downtown_02",
				"pes_level_skaven_stronghold_downtown_03",
				"pes_level_skaven_stronghold_downtown_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_downtown_01",
				"pes_level_skaven_stronghold_downtown_02",
				"pes_level_skaven_stronghold_downtown_03",
				"pes_level_skaven_stronghold_downtown_04"
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
				5.0299372673035,
				4.186541557312,
				2.6621041297913,
				2.7775416374206
			}
		},
		pes_level_skaven_stronghold_waterwheel_move = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_waterwheel_move_01",
				"pes_level_skaven_stronghold_waterwheel_move_02",
				"pes_level_skaven_stronghold_waterwheel_move_03",
				"pes_level_skaven_stronghold_waterwheel_move_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_waterwheel_move_01",
				"pes_level_skaven_stronghold_waterwheel_move_02",
				"pes_level_skaven_stronghold_waterwheel_move_03",
				"pes_level_skaven_stronghold_waterwheel_move_04"
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
				2.326250076294,
				2.6584792137146,
				3.1890208721161,
				5.4540209770203
			}
		},
		pes_level_skaven_stronghold_long_way_down = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_long_way_down_01",
				"pes_level_skaven_stronghold_long_way_down_02",
				"pes_level_skaven_stronghold_long_way_down_03",
				"pes_level_skaven_stronghold_long_way_down_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_long_way_down_01",
				"pes_level_skaven_stronghold_long_way_down_02",
				"pes_level_skaven_stronghold_long_way_down_03",
				"pes_level_skaven_stronghold_long_way_down_04"
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
				2.6323750019074,
				1.2218124866486,
				2.3733749389648,
				3.1619374752045
			}
		},
		pes_level_skaven_stronghold_city_afire = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_city_afire_01",
				"pes_level_skaven_stronghold_city_afire_02",
				"pes_level_skaven_stronghold_city_afire_03",
				"pes_level_skaven_stronghold_city_afire_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_city_afire_01",
				"pes_level_skaven_stronghold_city_afire_02",
				"pes_level_skaven_stronghold_city_afire_03",
				"pes_level_skaven_stronghold_city_afire_04"
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
				4.3991875648499,
				2.3066041469574,
				3.7311041355133,
				3.2741458415985
			}
		},
		pes_level_skaven_stronghold_barrier = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_barrier_01",
				"pes_level_skaven_stronghold_barrier_02",
				"pes_level_skaven_stronghold_barrier_03",
				"pes_level_skaven_stronghold_barrier_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_barrier_01",
				"pes_level_skaven_stronghold_barrier_02",
				"pes_level_skaven_stronghold_barrier_03",
				"pes_level_skaven_stronghold_barrier_04"
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
				1.59475004673,
				3.6160624027252,
				2.0439999103546,
				2.2620832920074
			}
		},
		pes_gameplay_chieftain_tips_special_lunge_attack_2 = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_gameplay_chieftain_tips_01",
				"pes_gameplay_chieftain_tips_02",
				"pes_gameplay_chieftain_tips_03",
				"pes_gameplay_chieftain_tips_04"
			},
			sound_events = {
				"pes_gameplay_chieftain_tips_01",
				"pes_gameplay_chieftain_tips_02",
				"pes_gameplay_chieftain_tips_03",
				"pes_gameplay_chieftain_tips_04"
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
				1.7265625,
				1.3058333396912,
				1.1954582929611,
				2.0548334121704
			}
		},
		pes_skaven_stronghold_intro_b = {
			face_animations_n = 2,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_skaven_stronghold_intro_b_01",
				[2.0] = "pes_skaven_stronghold_intro_b_02"
			},
			sound_events = {
				[1.0] = "pes_skaven_stronghold_intro_b_01",
				[2.0] = "pes_skaven_stronghold_intro_b_02"
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
				[1.0] = 5.8540937900543,
				[2.0] = 3.2045209407806
			}
		},
		pes_skaven_stronghold_intro_a = {
			face_animations_n = 2,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_skaven_stronghold_intro_a_01",
				[2.0] = "pes_skaven_stronghold_intro_a_02"
			},
			sound_events = {
				[1.0] = "pes_skaven_stronghold_intro_a_01",
				[2.0] = "pes_skaven_stronghold_intro_a_02"
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
				[1.0] = 2.6208124160767,
				[2.0] = 3.2975208759308
			}
		},
		pes_level_skaven_stronghold_light_brazier = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_light_brazier_01",
				"pes_level_skaven_stronghold_light_brazier_02",
				"pes_level_skaven_stronghold_light_brazier_03",
				"pes_level_skaven_stronghold_light_brazier_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_light_brazier_01",
				"pes_level_skaven_stronghold_light_brazier_02",
				"pes_level_skaven_stronghold_light_brazier_03",
				"pes_level_skaven_stronghold_light_brazier_04"
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
				4.4577918052673,
				2.7011876106262,
				1.5967500209808,
				5.7029581069946
			}
		},
		pes_skaven_stronghold_intro_c = {
			face_animations_n = 2,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_skaven_stronghold_intro_c_01",
				[2.0] = "pes_skaven_stronghold_intro_c_02"
			},
			sound_events = {
				[1.0] = "pes_skaven_stronghold_intro_c_01",
				[2.0] = "pes_skaven_stronghold_intro_c_02"
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
				[1.0] = 1.9729374647141,
				[2.0] = 3.1163959503174
			}
		},
		pes_level_skaven_stronghold_patrol_lanes = {
			face_animations_n = 4,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_skaven_stronghold_patrol_lanes_01",
				"pes_level_skaven_stronghold_patrol_lanes_02",
				"pes_level_skaven_stronghold_patrol_lanes_03",
				"pes_level_skaven_stronghold_patrol_lanes_04"
			},
			sound_events = {
				"pes_level_skaven_stronghold_patrol_lanes_01",
				"pes_level_skaven_stronghold_patrol_lanes_02",
				"pes_level_skaven_stronghold_patrol_lanes_03",
				"pes_level_skaven_stronghold_patrol_lanes_04"
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
				1.9455416202545,
				2.8093957901001,
				3.123229265213,
				3.5364999771118
			}
		},
		pes_gameplay_skaven_warlord_summoning_reply = {
			face_animations_n = 5,
			database = "empire_soldier_skaven_stronghold",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_alerts_boss",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pes_gameplay_skaven_warlord_summoning_reply_01",
				"pes_gameplay_skaven_warlord_summoning_reply_02",
				"pes_gameplay_skaven_warlord_summoning_reply_03",
				"pes_gameplay_skaven_warlord_summoning_reply_04",
				"pes_gameplay_skaven_warlord_summoning_reply_05"
			},
			sound_events = {
				"pes_gameplay_skaven_warlord_summoning_reply_01",
				"pes_gameplay_skaven_warlord_summoning_reply_02",
				"pes_gameplay_skaven_warlord_summoning_reply_03",
				"pes_gameplay_skaven_warlord_summoning_reply_04",
				"pes_gameplay_skaven_warlord_summoning_reply_05"
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
				3.8970625400543,
				4.1611456871033,
				4.9234375953674,
				3.9286665916443,
				6.330500125885
			}
		}
	})
end
