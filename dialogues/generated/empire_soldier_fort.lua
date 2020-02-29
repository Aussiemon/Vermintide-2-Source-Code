return function ()
	define_rule({
		response = "pes_level_fort_road",
		name = "pes_level_fort_road",
		criterias = {}
	})
	define_rule({
		name = "pes_level_fort_carriage",
		response = "pes_level_fort_carriage",
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
				"level_fort_carriage"
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
				"level_fort_carriage",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_carriage",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_under_attack",
		response = "pes_level_fort_under_attack",
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
				"level_fort_under_attack"
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
				"level_fort_under_attack",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_under_attack",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_river",
		response = "pes_level_fort_river",
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
				"level_fort_river"
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
				"level_fort_river",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_river",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_getting_closer",
		response = "pes_level_fort_getting_closer",
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
				"level_fort_getting_closer"
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
				"level_fort_getting_closer",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_getting_closer",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_gate_fallen",
		response = "pes_level_fort_gate_fallen",
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
				"level_fort_gate_fallen"
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
				"level_fort_gate_fallen",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_gate_fallen",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_skaven_everywhere",
		response = "pes_level_fort_skaven_everywhere",
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
				"level_fort_skaven_everywhere"
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
				"level_fort_skaven_everywhere",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_skaven_everywhere",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_plague_claw_shelling",
		response = "pes_level_fort_plague_claw_shelling",
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
				"level_fort_plague_claw_shelling"
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
				"level_fort_plague_claw_shelling",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_plague_claw_shelling",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_plague_claw_shelling_move",
		response = "pes_level_fort_plague_claw_shelling_move",
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
				"level_fort_plague_claw_shelling_move"
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
				"level_fort_plague_claw_shelling_move",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_plague_claw_shelling_move",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_use_cannons",
		response = "pes_level_fort_use_cannons",
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
				"level_fort_use_cannons"
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
				"level_fort_use_cannons",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_use_cannons",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_skaven_run",
		response = "pes_level_fort_skaven_run",
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
				"level_fort_skaven_run"
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
				"level_fort_skaven_run",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_skaven_run",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_first",
		response = "pes_level_fort_fire_cannon_first",
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
				"level_fort_fire_cannon_first"
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
				"level_fort_fire_cannon_first",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_fuse_is_lit",
		response = "pes_level_fort_fire_cannon_fuse_is_lit",
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
				"level_fort_fire_cannon_fuse_is_lit"
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
				"level_fort_fire_cannon_fuse_is_lit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_fuse_is_lit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_first_hit",
		response = "pes_level_fort_fire_cannon_first_hit",
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
				"level_fort_fire_cannon_first_hit"
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
				"level_fort_fire_cannon_first_hit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_first_hit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_second",
		response = "pes_level_fort_fire_cannon_second",
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
				"level_fort_fire_cannon_second"
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
				"level_fort_fire_cannon_second",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_second_hit",
		response = "pes_level_fort_fire_cannon_second_hit",
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
				"level_fort_fire_cannon_second_hit"
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
				"level_fort_fire_cannon_second_hit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_second_hit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_cannonballs",
		response = "pes_level_fort_cannonballs",
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
				"level_fort_cannonballs"
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
				"level_fort_cannonballs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_cannonballs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_final_hit",
		response = "pes_level_fort_fire_cannon_final_hit",
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
				"level_fort_fire_cannon_final_hit"
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
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_fort_fire_cannon_final_fire",
		response = "pes_level_fort_fire_cannon_final_fire",
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
				"level_fort_fire_cannon_final_fire"
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
				"level_fort_fire_cannon_final_hit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_fort_fire_cannon_final_hit",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_level_fort_skaven_run = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_skaven_run_01",
				[2.0] = "pes_level_fort_skaven_run_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 6.260645866394,
				[2.0] = 6.4361248016357
			},
			localization_strings = {
				[1.0] = "pes_level_fort_skaven_run_01",
				[2.0] = "pes_level_fort_skaven_run_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_under_attack = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_under_attack_01",
				[2.0] = "pes_level_fort_under_attack_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 4.9742918014526,
				[2.0] = 4.160041809082
			},
			localization_strings = {
				[1.0] = "pes_level_fort_under_attack_01",
				[2.0] = "pes_level_fort_under_attack_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_skaven_everywhere = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_skaven_everywhere_01",
				[2.0] = "pes_level_fort_skaven_everywhere_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 3.5371458530426,
				[2.0] = 3.1582915782928
			},
			localization_strings = {
				[1.0] = "pes_level_fort_skaven_everywhere_01",
				[2.0] = "pes_level_fort_skaven_everywhere_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_fire_cannon_first = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_fire_cannon_first_01",
				[2.0] = "pes_level_fort_fire_cannon_first_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.4217081069946,
				[2.0] = 5.1840834617615
			},
			localization_strings = {
				[1.0] = "pes_level_fort_fire_cannon_first_01",
				[2.0] = "pes_level_fort_fire_cannon_first_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_fire_cannon_second_hit = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_fire_cannon_second_hit_01",
				[2.0] = "pes_level_fort_fire_cannon_second_hit_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 3.8996665477753,
				[2.0] = 5.3803334236145
			},
			localization_strings = {
				[1.0] = "pes_level_fort_fire_cannon_second_hit_01",
				[2.0] = "pes_level_fort_fire_cannon_second_hit_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_use_cannons = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_use_cannons_01",
				[2.0] = "pes_level_fort_use_cannons_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.7686247825623,
				[2.0] = 6.8180418014526
			},
			localization_strings = {
				[1.0] = "pes_level_fort_use_cannons_01",
				[2.0] = "pes_level_fort_use_cannons_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_fire_cannon_fuse_is_lit = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_fire_cannon_fuse_is_lit_01",
				[2.0] = "pes_level_fort_fire_cannon_fuse_is_lit_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 1.1457916498184,
				[2.0] = 0.93262499570847
			},
			localization_strings = {
				[1.0] = "pes_level_fort_fire_cannon_fuse_is_lit_01",
				[2.0] = "pes_level_fort_fire_cannon_fuse_is_lit_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_plague_claw_shelling_move = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_plague_claw_shelling_move_01",
				[2.0] = "pes_level_fort_plague_claw_shelling_move_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 1.8506457805634,
				[2.0] = 3.012312412262
			},
			localization_strings = {
				[1.0] = "pes_level_fort_plague_claw_shelling_move_01",
				[2.0] = "pes_level_fort_plague_claw_shelling_move_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_river = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_river_01",
				[2.0] = "pes_level_fort_river_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 2.7193541526794,
				[2.0] = 2.2867708206177
			},
			localization_strings = {
				[1.0] = "pes_level_fort_river_01",
				[2.0] = "pes_level_fort_river_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_fire_cannon_first_hit = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_fire_cannon_first_hit_01",
				[2.0] = "pes_level_fort_fire_cannon_first_hit_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.1897916793823,
				[2.0] = 5.9237289428711
			},
			localization_strings = {
				[1.0] = "pes_level_fort_fire_cannon_first_hit_01",
				[2.0] = "pes_level_fort_fire_cannon_first_hit_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_plague_claw_shelling = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_plague_claw_shelling_alert_01",
				[2.0] = "pes_level_fort_plague_claw_shelling_alert_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 2.2067708969116,
				[2.0] = 3.977520942688
			},
			localization_strings = {
				[1.0] = "pes_level_fort_plague_claw_shelling_alert_01",
				[2.0] = "pes_level_fort_plague_claw_shelling_alert_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_fire_cannon_final_fire = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_fire_cannon_final_fire_01",
				[2.0] = "pes_level_fort_fire_cannon_final_fire_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 5.5894584655762,
				[2.0] = 6.2753748893738
			},
			localization_strings = {
				[1.0] = "pes_level_fort_fire_cannon_final_fire_01",
				[2.0] = "pes_level_fort_fire_cannon_final_fire_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_gate_fallen = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_gate_fallen_01",
				[2.0] = "pes_level_fort_gate_fallen_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 1.7134375572205,
				[2.0] = 2.7997915744781
			},
			localization_strings = {
				[1.0] = "pes_level_fort_gate_fallen_01",
				[2.0] = "pes_level_fort_gate_fallen_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_road = {
			sound_events_n = 0,
			face_animations_n = 0,
			database = "empire_soldier_fort",
			category = "default",
			dialogue_animations_n = 0,
			sound_events = {},
			dialogue_animations = {},
			face_animations = {},
			sound_events_duration = {},
			localization_strings = {}
		},
		pes_level_fort_carriage = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_carriage_01",
				[2.0] = "pes_level_fort_carriage_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 1.9505208730698,
				[2.0] = 1.7348333597183
			},
			localization_strings = {
				[1.0] = "pes_level_fort_carriage_01",
				[2.0] = "pes_level_fort_carriage_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_fire_cannon_final_hit = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_fire_cannon_final_hit_01",
				[2.0] = "pes_level_fort_fire_cannon_final_hit_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 7.2017292976379,
				[2.0] = 5.3440623283386
			},
			localization_strings = {
				[1.0] = "pes_level_fort_fire_cannon_final_hit_01",
				[2.0] = "pes_level_fort_fire_cannon_final_hit_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_cannonballs = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_cannonballs_01",
				[2.0] = "pes_level_fort_cannonballs_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 1.9230833053589,
				[2.0] = 3.3242499828339
			},
			localization_strings = {
				[1.0] = "pes_level_fort_cannonballs_01",
				[2.0] = "pes_level_fort_cannonballs_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_fire_cannon_second = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_fire_cannon_second_01",
				[2.0] = "pes_level_fort_fire_cannon_second_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.6045832633972,
				[2.0] = 6.8185625076294
			},
			localization_strings = {
				[1.0] = "pes_level_fort_fire_cannon_second_01",
				[2.0] = "pes_level_fort_fire_cannon_second_02"
			},
			randomize_indexes = {}
		},
		pes_level_fort_getting_closer = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_fort",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_fort_getting_closer_01",
				[2.0] = "pes_level_fort_getting_closer_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			sound_events_duration = {
				[1.0] = 4.007312297821,
				[2.0] = 2.1470832824707
			},
			localization_strings = {
				[1.0] = "pes_level_fort_getting_closer_01",
				[2.0] = "pes_level_fort_getting_closer_02"
			},
			randomize_indexes = {}
		}
	})
end
