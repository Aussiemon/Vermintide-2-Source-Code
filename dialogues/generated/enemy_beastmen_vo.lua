return function ()
	define_rule({
		name = "ebg_gameplay_running_towards_players",
		response = "ebg_gameplay_running_towards_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_gor"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				6
			},
			{
				"faction_memory",
				"time_since_gor_running",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_gor_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebg_gameplay_flanking_players",
		response = "ebg_gameplay_flanking_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"flanking"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_gor"
			},
			{
				"faction_memory",
				"time_since_gor_flanking",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_gor_flanking",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebg_gameplay_dogpile_shouts",
		response = "ebg_gameplay_dogpile_shouts",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shouting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_gor"
			},
			{
				"faction_memory",
				"time_since_gor_shout",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_gor_shout",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebg_alerted",
		response = "ebg_alerted",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"alerted"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_gor"
			},
			{
				"faction_memory",
				"time_since_gor_alerted",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_gor_alerted",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebu_gameplay_running_in_horde",
		response = "ebu_gameplay_running_in_horde",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_ungor"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				10
			},
			{
				"query_context",
				"num_units",
				OP.GT,
				3
			},
			{
				"faction_memory",
				"time_since_ungor_running",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ungor_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebu_gameplay_running_towards_players",
		response = "ebu_gameplay_running_towards_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_ungor"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				5
			},
			{
				"faction_memory",
				"time_since_ungor_running",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ungor_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebu_gameplay_flanking_players",
		response = "ebu_gameplay_flanking_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"flanking"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_ungor"
			},
			{
				"faction_memory",
				"time_since_ungor_flanking",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ungor_flanking",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "ebu_gameplay_ranged_fire_in_group",
		name = "ebu_gameplay_ranged_fire_in_group",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"fire_in_group"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_ungor"
			}
		}
	})
	define_rule({
		name = "ebu_gameplay_dogpile_shouts",
		response = "ebu_gameplay_dogpile_shouts",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shouting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_ungor"
			},
			{
				"faction_memory",
				"time_since_beastmen_ungor",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_beastmen_ungor",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebu_gameplay_taunt",
		response = "ebu_gameplay_taunt",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunt"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_ungor"
			},
			{
				"faction_memory",
				"time_since_beastmen_ungor_taunt",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_beastmen_ungor_taunt",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebb_gameplay_kerillian_present",
		response = "ebb_gameplay_kerillian_present",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_bestigor"
			},
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebb_gameplay_kruber_present",
		response = "ebb_gameplay_kruber_present",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_bestigor"
			},
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebb_gameplay_saltzpyre_present",
		response = "ebb_gameplay_saltzpyre_present",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_bestigor"
			},
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebb_gameplay_sienna_present",
		response = "ebb_gameplay_sienna_present",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_bestigor"
			},
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebb_gameplay_bardin_present",
		response = "ebb_gameplay_bardin_present",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_bestigor"
			},
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bestigor_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebb_gameplay_no_damage_taunt",
		response = "ebb_gameplay_no_damage_taunt",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"no_damage_taunt_player"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_bestigor"
			},
			{
				"faction_memory",
				"time_since_bestigot_taunt",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bestigot_taunt",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ebb_a_gameplay_running_towards_players",
		response = "ebb_a_gameplay_running_towards_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"beastmen_bestigor"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				5
			},
			{
				"faction_memory",
				"time_since_beastmen_bestigor",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_beastmen_bestigor",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		ebb_gameplay_bardin_present = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_high_prio",
			dialogue_animations_n = 4,
			sound_events = {
				"ebb_gameplay_bardin_present_01",
				"ebb_gameplay_bardin_present_02",
				"ebb_gameplay_bardin_present_03",
				"ebb_gameplay_bardin_present_04"
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
			sound_events_duration = {
				2.8540000915527,
				2.9165832996368,
				1.9036145210266,
				3.3841772079468
			},
			localization_strings = {
				"ebb_gameplay_bardin_present_01",
				"ebb_gameplay_bardin_present_02",
				"ebb_gameplay_bardin_present_03",
				"ebb_gameplay_bardin_present_04"
			},
			randomize_indexes = {}
		},
		ebb_gameplay_saltzpyre_present = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_high_prio",
			dialogue_animations_n = 4,
			sound_events = {
				"ebb_gameplay_saltzpyre_present_01",
				"ebb_gameplay_saltzpyre_present_02",
				"ebb_gameplay_saltzpyre_present_03",
				"ebb_gameplay_saltzpyre_present_04"
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
			sound_events_duration = {
				3.3451352119446,
				3.1532292366028,
				2.6344165802002,
				3.9670209884644
			},
			localization_strings = {
				"ebb_gameplay_saltzpyre_present_01",
				"ebb_gameplay_saltzpyre_present_02",
				"ebb_gameplay_saltzpyre_present_03",
				"ebb_gameplay_saltzpyre_present_04"
			},
			randomize_indexes = {}
		},
		ebb_gameplay_no_damage_taunt = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_high_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ebb_gameplay_no_damage_taunt_01",
				"ebb_gameplay_no_damage_taunt_02",
				"ebb_gameplay_no_damage_taunt_03",
				"ebb_gameplay_no_damage_taunt_04",
				"ebb_gameplay_no_damage_taunt_05",
				"ebb_gameplay_no_damage_taunt_06",
				"ebb_gameplay_no_damage_taunt_07",
				"ebb_gameplay_no_damage_taunt_08",
				"ebb_gameplay_no_damage_taunt_09",
				"ebb_gameplay_no_damage_taunt_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.6967811584473,
				2.0472602844238,
				1.7806562185288,
				0.94986456632614,
				1.6410207748413,
				1.5754582881927,
				1.7265937328339,
				2.1183958053589,
				1.9674166440964,
				2.3748958110809
			},
			localization_strings = {
				"ebb_gameplay_no_damage_taunt_01",
				"ebb_gameplay_no_damage_taunt_02",
				"ebb_gameplay_no_damage_taunt_03",
				"ebb_gameplay_no_damage_taunt_04",
				"ebb_gameplay_no_damage_taunt_05",
				"ebb_gameplay_no_damage_taunt_06",
				"ebb_gameplay_no_damage_taunt_07",
				"ebb_gameplay_no_damage_taunt_08",
				"ebb_gameplay_no_damage_taunt_09",
				"ebb_gameplay_no_damage_taunt_10"
			},
			randomize_indexes = {}
		},
		ebb_gameplay_sienna_present = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_high_prio",
			dialogue_animations_n = 4,
			sound_events = {
				"ebb_gameplay_sienna_present_01",
				"ebb_gameplay_sienna_present_02",
				"ebb_gameplay_sienna_present_03",
				"ebb_gameplay_sienna_present_04"
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
			sound_events_duration = {
				1.8499999046326,
				3.9008123874664,
				3.271427154541,
				2.5762708187103
			},
			localization_strings = {
				"ebb_gameplay_sienna_present_01",
				"ebb_gameplay_sienna_present_02",
				"ebb_gameplay_sienna_present_03",
				"ebb_gameplay_sienna_present_04"
			},
			randomize_indexes = {}
		},
		ebg_gameplay_dogpile_shouts = {
			sound_events_n = 20,
			face_animations_n = 20,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 20,
			sound_events = {
				"ebg_gameplay_dogpile_shouts_01",
				"ebg_gameplay_dogpile_shouts_02",
				"ebg_gameplay_dogpile_shouts_03",
				"ebg_gameplay_dogpile_shouts_04",
				"ebg_gameplay_dogpile_shouts_05",
				"ebg_gameplay_dogpile_shouts_06",
				"ebg_gameplay_dogpile_shouts_07",
				"ebg_gameplay_dogpile_shouts_08",
				"ebg_gameplay_dogpile_shouts_09",
				"ebg_gameplay_dogpile_shouts_10",
				"ebg_gameplay_dogpile_shouts_11",
				"ebg_gameplay_dogpile_shouts_12",
				"ebg_gameplay_dogpile_shouts_13",
				"ebg_gameplay_dogpile_shouts_14",
				"ebg_gameplay_dogpile_shouts_15",
				"ebg_gameplay_dogpile_shouts_16",
				"ebg_gameplay_dogpile_shouts_17",
				"ebg_gameplay_dogpile_shouts_18",
				"ebg_gameplay_dogpile_shouts_19",
				"ebg_gameplay_dogpile_shouts_20"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				2.097177028656,
				2.0713021755219,
				2.1868958473206,
				2.4410417079926,
				1.9654583930969,
				2.0844790935516,
				2.5678541660309,
				1.9982187747955,
				1.7860729694366,
				1.8983750343323,
				1.1008229255676,
				1.3561146259308,
				1.5993750095367,
				1.8292708396912,
				1.2561979293823,
				1.4611353874207,
				1.9950625896454,
				2.3577084541321,
				2.5504479408264,
				3.4014792442322
			},
			localization_strings = {
				"ebg_gameplay_dogpile_shouts_01",
				"ebg_gameplay_dogpile_shouts_02",
				"ebg_gameplay_dogpile_shouts_03",
				"ebg_gameplay_dogpile_shouts_04",
				"ebg_gameplay_dogpile_shouts_05",
				"ebg_gameplay_dogpile_shouts_06",
				"ebg_gameplay_dogpile_shouts_07",
				"ebg_gameplay_dogpile_shouts_08",
				"ebg_gameplay_dogpile_shouts_09",
				"ebg_gameplay_dogpile_shouts_10",
				"ebg_gameplay_dogpile_shouts_11",
				"ebg_gameplay_dogpile_shouts_12",
				"ebg_gameplay_dogpile_shouts_13",
				"ebg_gameplay_dogpile_shouts_14",
				"ebg_gameplay_dogpile_shouts_15",
				"ebg_gameplay_dogpile_shouts_16",
				"ebg_gameplay_dogpile_shouts_17",
				"ebg_gameplay_dogpile_shouts_18",
				"ebg_gameplay_dogpile_shouts_19",
				"ebg_gameplay_dogpile_shouts_20"
			},
			randomize_indexes = {}
		},
		ebg_gameplay_running_towards_players = {
			sound_events_n = 20,
			face_animations_n = 20,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 20,
			sound_events = {
				"ebg_gameplay_running_towards_players_01",
				"ebg_gameplay_running_towards_players_02",
				"ebg_gameplay_running_towards_players_03",
				"ebg_gameplay_running_towards_players_04",
				"ebg_gameplay_running_towards_players_05",
				"ebg_gameplay_running_towards_players_06",
				"ebg_gameplay_running_towards_players_07",
				"ebg_gameplay_running_towards_players_08",
				"ebg_gameplay_running_towards_players_09",
				"ebg_gameplay_running_towards_players_10",
				"ebg_gameplay_running_towards_players_11",
				"ebg_gameplay_running_towards_players_12",
				"ebg_gameplay_running_towards_players_13",
				"ebg_gameplay_running_towards_players_14",
				"ebg_gameplay_running_towards_players_15",
				"ebg_gameplay_running_towards_players_16",
				"ebg_gameplay_running_towards_players_17",
				"ebg_gameplay_running_towards_players_18",
				"ebg_gameplay_running_towards_players_19",
				"ebg_gameplay_running_towards_players_20"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				0.81206178665161,
				1.1812460422516,
				1.0690149068832,
				1.5769417285919,
				1.9504245519638,
				1.9403129816055,
				1.519481420517,
				0.9423480629921,
				1.2229791879654,
				1.819593667984,
				2.1639404296875,
				2.0922198295593,
				1.3048001527786,
				1.2098640203476,
				1.5861642360687,
				0.91834050416946,
				1.3666925430298,
				1.4858169555664,
				2.1752290725708,
				2.2362594604492
			},
			localization_strings = {
				"ebg_gameplay_running_towards_players_01",
				"ebg_gameplay_running_towards_players_02",
				"ebg_gameplay_running_towards_players_03",
				"ebg_gameplay_running_towards_players_04",
				"ebg_gameplay_running_towards_players_05",
				"ebg_gameplay_running_towards_players_06",
				"ebg_gameplay_running_towards_players_07",
				"ebg_gameplay_running_towards_players_08",
				"ebg_gameplay_running_towards_players_09",
				"ebg_gameplay_running_towards_players_10",
				"ebg_gameplay_running_towards_players_11",
				"ebg_gameplay_running_towards_players_12",
				"ebg_gameplay_running_towards_players_13",
				"ebg_gameplay_running_towards_players_14",
				"ebg_gameplay_running_towards_players_15",
				"ebg_gameplay_running_towards_players_16",
				"ebg_gameplay_running_towards_players_17",
				"ebg_gameplay_running_towards_players_18",
				"ebg_gameplay_running_towards_players_19",
				"ebg_gameplay_running_towards_players_20"
			},
			randomize_indexes = {}
		},
		ebb_gameplay_kruber_present = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_high_prio",
			dialogue_animations_n = 4,
			sound_events = {
				"ebb_gameplay_kruber_present_01",
				"ebb_gameplay_kruber_present_02",
				"ebb_gameplay_kruber_present_03",
				"ebb_gameplay_kruber_present_04"
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
			sound_events_duration = {
				3.8537602424622,
				3.7761042118073,
				3.856166601181,
				3.729749917984
			},
			localization_strings = {
				"ebb_gameplay_kruber_present_01",
				"ebb_gameplay_kruber_present_02",
				"ebb_gameplay_kruber_present_03",
				"ebb_gameplay_kruber_present_04"
			},
			randomize_indexes = {}
		},
		ebg_gameplay_flanking_players = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ebg_gameplay_flanking_players_01",
				"ebg_gameplay_flanking_players_02",
				"ebg_gameplay_flanking_players_03",
				"ebg_gameplay_flanking_players_04",
				"ebg_gameplay_flanking_players_05",
				"ebg_gameplay_flanking_players_06",
				"ebg_gameplay_flanking_players_07",
				"ebg_gameplay_flanking_players_08",
				"ebg_gameplay_flanking_players_09",
				"ebg_gameplay_flanking_players_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.2517743110657,
				1.3295505046845,
				1.4994792938232,
				1.4452602863312,
				1.5134925842285,
				1.5207923650742,
				1.4993743896484,
				2.4036979675293,
				1.5474333763123,
				2.0397372245789
			},
			localization_strings = {
				"ebg_gameplay_flanking_players_01",
				"ebg_gameplay_flanking_players_02",
				"ebg_gameplay_flanking_players_03",
				"ebg_gameplay_flanking_players_04",
				"ebg_gameplay_flanking_players_05",
				"ebg_gameplay_flanking_players_06",
				"ebg_gameplay_flanking_players_07",
				"ebg_gameplay_flanking_players_08",
				"ebg_gameplay_flanking_players_09",
				"ebg_gameplay_flanking_players_10"
			},
			randomize_indexes = {}
		},
		ebu_gameplay_dogpile_shouts = {
			sound_events_n = 20,
			face_animations_n = 20,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 20,
			sound_events = {
				"ebu_gameplay_dogpile_shouts_01",
				"ebu_gameplay_dogpile_shouts_02",
				"ebu_gameplay_dogpile_shouts_03",
				"ebu_gameplay_dogpile_shouts_04",
				"ebu_gameplay_dogpile_shouts_05",
				"ebu_gameplay_dogpile_shouts_06",
				"ebu_gameplay_dogpile_shouts_07",
				"ebu_gameplay_dogpile_shouts_08",
				"ebu_gameplay_dogpile_shouts_09",
				"ebu_gameplay_dogpile_shouts_10",
				"ebu_gameplay_dogpile_shouts_11",
				"ebu_gameplay_dogpile_shouts_12",
				"ebu_gameplay_dogpile_shouts_13",
				"ebu_gameplay_dogpile_shouts_14",
				"ebu_gameplay_dogpile_shouts_15",
				"ebu_gameplay_dogpile_shouts_16",
				"ebu_gameplay_dogpile_shouts_17",
				"ebu_gameplay_dogpile_shouts_18",
				"ebu_gameplay_dogpile_shouts_19",
				"ebu_gameplay_dogpile_shouts_20"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.9426140785217,
				1.9121360778809,
				2.4714250564575,
				2.3793156147003,
				2.3866775035858,
				3.2835793495178,
				4.2228574752808,
				2.4388942718506,
				2.7383108139038,
				2.3343193531036,
				1.9188398122788,
				2.2711064815521,
				2.3045287132263,
				2.129830121994,
				2.3155145645142,
				2.3451387882233,
				2.097053527832,
				2.3463320732117,
				2.4110250473023,
				3.0241832733154
			},
			localization_strings = {
				"ebu_gameplay_dogpile_shouts_01",
				"ebu_gameplay_dogpile_shouts_02",
				"ebu_gameplay_dogpile_shouts_03",
				"ebu_gameplay_dogpile_shouts_04",
				"ebu_gameplay_dogpile_shouts_05",
				"ebu_gameplay_dogpile_shouts_06",
				"ebu_gameplay_dogpile_shouts_07",
				"ebu_gameplay_dogpile_shouts_08",
				"ebu_gameplay_dogpile_shouts_09",
				"ebu_gameplay_dogpile_shouts_10",
				"ebu_gameplay_dogpile_shouts_11",
				"ebu_gameplay_dogpile_shouts_12",
				"ebu_gameplay_dogpile_shouts_13",
				"ebu_gameplay_dogpile_shouts_14",
				"ebu_gameplay_dogpile_shouts_15",
				"ebu_gameplay_dogpile_shouts_16",
				"ebu_gameplay_dogpile_shouts_17",
				"ebu_gameplay_dogpile_shouts_18",
				"ebu_gameplay_dogpile_shouts_19",
				"ebu_gameplay_dogpile_shouts_20"
			},
			randomize_indexes = {}
		},
		ebb_gameplay_kerillian_present = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_high_prio",
			dialogue_animations_n = 4,
			sound_events = {
				"ebb_gameplay_kerillian_present_01",
				"ebb_gameplay_kerillian_present_02",
				"ebb_gameplay_kerillian_present_03",
				"ebb_gameplay_kerillian_present_04"
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
			sound_events_duration = {
				1.861968755722,
				2.6323125362396,
				2.6676459312439,
				2.488260269165
			},
			localization_strings = {
				"ebb_gameplay_kerillian_present_01",
				"ebb_gameplay_kerillian_present_02",
				"ebb_gameplay_kerillian_present_03",
				"ebb_gameplay_kerillian_present_04"
			},
			randomize_indexes = {}
		},
		ebu_gameplay_taunt = {
			sound_events_n = 20,
			face_animations_n = 20,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 20,
			sound_events = {
				"ebu_gameplay_dogpile_shouts_01",
				"ebu_gameplay_dogpile_shouts_02",
				"ebu_gameplay_dogpile_shouts_03",
				"ebu_gameplay_dogpile_shouts_04",
				"ebu_gameplay_dogpile_shouts_05",
				"ebu_gameplay_dogpile_shouts_06",
				"ebu_gameplay_dogpile_shouts_07",
				"ebu_gameplay_dogpile_shouts_08",
				"ebu_gameplay_dogpile_shouts_09",
				"ebu_gameplay_dogpile_shouts_10",
				"ebu_gameplay_dogpile_shouts_11",
				"ebu_gameplay_dogpile_shouts_12",
				"ebu_gameplay_dogpile_shouts_13",
				"ebu_gameplay_dogpile_shouts_14",
				"ebu_gameplay_dogpile_shouts_15",
				"ebu_gameplay_dogpile_shouts_16",
				"ebu_gameplay_dogpile_shouts_17",
				"ebu_gameplay_dogpile_shouts_18",
				"ebu_gameplay_dogpile_shouts_19",
				"ebu_gameplay_dogpile_shouts_20"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.9426140785217,
				1.9121360778809,
				2.4714250564575,
				2.3793156147003,
				2.3866775035858,
				3.2835793495178,
				4.2228574752808,
				2.4388942718506,
				2.7383108139038,
				2.3343193531036,
				1.9188398122788,
				2.2711064815521,
				2.3045287132263,
				2.129830121994,
				2.3155145645142,
				2.3451387882233,
				2.097053527832,
				2.3463320732117,
				2.4110250473023,
				3.0241832733154
			},
			localization_strings = {
				"ebu_gameplay_dogpile_shouts_01",
				"ebu_gameplay_dogpile_shouts_02",
				"ebu_gameplay_dogpile_shouts_03",
				"ebu_gameplay_dogpile_shouts_04",
				"ebu_gameplay_dogpile_shouts_05",
				"ebu_gameplay_dogpile_shouts_06",
				"ebu_gameplay_dogpile_shouts_07",
				"ebu_gameplay_dogpile_shouts_08",
				"ebu_gameplay_dogpile_shouts_09",
				"ebu_gameplay_dogpile_shouts_10",
				"ebu_gameplay_dogpile_shouts_11",
				"ebu_gameplay_dogpile_shouts_12",
				"ebu_gameplay_dogpile_shouts_13",
				"ebu_gameplay_dogpile_shouts_14",
				"ebu_gameplay_dogpile_shouts_15",
				"ebu_gameplay_dogpile_shouts_16",
				"ebu_gameplay_dogpile_shouts_17",
				"ebu_gameplay_dogpile_shouts_18",
				"ebu_gameplay_dogpile_shouts_19",
				"ebu_gameplay_dogpile_shouts_20"
			},
			randomize_indexes = {}
		},
		ebu_gameplay_running_in_horde = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ebu_gameplay_running_in_horde_01",
				"ebu_gameplay_running_in_horde_02",
				"ebu_gameplay_running_in_horde_03",
				"ebu_gameplay_running_in_horde_04",
				"ebu_gameplay_running_in_horde_05",
				"ebu_gameplay_running_in_horde_06",
				"ebu_gameplay_running_in_horde_07",
				"ebu_gameplay_running_in_horde_08",
				"ebu_gameplay_running_in_horde_09",
				"ebu_gameplay_running_in_horde_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.8748669624329,
				0.93134850263596,
				1.6477637290955,
				1.2283251285553,
				1.7541611194611,
				1.608606338501,
				2.1226694583893,
				1.3727502822876,
				1.8590416908264,
				2.2928647994995
			},
			localization_strings = {
				"ebu_gameplay_running_in_horde_01",
				"ebu_gameplay_running_in_horde_02",
				"ebu_gameplay_running_in_horde_03",
				"ebu_gameplay_running_in_horde_04",
				"ebu_gameplay_running_in_horde_05",
				"ebu_gameplay_running_in_horde_06",
				"ebu_gameplay_running_in_horde_07",
				"ebu_gameplay_running_in_horde_08",
				"ebu_gameplay_running_in_horde_09",
				"ebu_gameplay_running_in_horde_10"
			},
			randomize_indexes = {}
		},
		ebg_alerted = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemy_beastmen_vo",
			category = "enemy_basic_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "play_enemy_gor_alerted_general_vce"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 1.5603438615799
			},
			localization_strings = {
				[1.0] = "play_enemy_gor_alerted_general_vce"
			}
		},
		ebu_gameplay_ranged_fire_in_group = {
			sound_events_n = 15,
			face_animations_n = 15,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_high_prio",
			dialogue_animations_n = 15,
			sound_events = {
				"ebu_gameplay_ranged_fire_in_group_01",
				"ebu_gameplay_ranged_fire_in_group_02",
				"ebu_gameplay_ranged_fire_in_group_03",
				"ebu_gameplay_ranged_fire_in_group_04",
				"ebu_gameplay_ranged_fire_in_group_05",
				"ebu_gameplay_ranged_fire_in_group_06",
				"ebu_gameplay_ranged_fire_in_group_07",
				"ebu_gameplay_ranged_fire_in_group_08",
				"ebu_gameplay_ranged_fire_in_group_09",
				"ebu_gameplay_ranged_fire_in_group_10",
				"ebu_gameplay_ranged_fire_in_group_11",
				"ebu_gameplay_ranged_fire_in_group_12",
				"ebu_gameplay_ranged_fire_in_group_13",
				"ebu_gameplay_ranged_fire_in_group_14",
				"ebu_gameplay_ranged_fire_in_group_15"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.9534740447998,
				2.2551727294922,
				2.389484167099,
				1.3968713283539,
				2.0356287956238,
				2.2368147373199,
				2.2548189163208,
				2.3321204185486,
				2.1802525520325,
				1.977151632309,
				2.4246697425842,
				1.8894696235657,
				1.9775772094727,
				1.0482275485992,
				1.3239133358002
			},
			localization_strings = {
				"ebu_gameplay_ranged_fire_in_group_01",
				"ebu_gameplay_ranged_fire_in_group_02",
				"ebu_gameplay_ranged_fire_in_group_03",
				"ebu_gameplay_ranged_fire_in_group_04",
				"ebu_gameplay_ranged_fire_in_group_05",
				"ebu_gameplay_ranged_fire_in_group_06",
				"ebu_gameplay_ranged_fire_in_group_07",
				"ebu_gameplay_ranged_fire_in_group_08",
				"ebu_gameplay_ranged_fire_in_group_09",
				"ebu_gameplay_ranged_fire_in_group_10",
				"ebu_gameplay_ranged_fire_in_group_11",
				"ebu_gameplay_ranged_fire_in_group_12",
				"ebu_gameplay_ranged_fire_in_group_13",
				"ebu_gameplay_ranged_fire_in_group_14",
				"ebu_gameplay_ranged_fire_in_group_15"
			},
			randomize_indexes = {}
		},
		ebb_a_gameplay_running_towards_players = {
			sound_events_n = 11,
			face_animations_n = 11,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 11,
			sound_events = {
				"ebb_a_gameplay_running_towards_players_01",
				"ebb_a_gameplay_running_towards_players_02",
				"ebb_a_gameplay_running_towards_players_03",
				"ebb_a_gameplay_running_towards_players_04",
				"ebb_a_gameplay_running_towards_players_05",
				"ebb_a_gameplay_running_towards_players_07",
				"ebb_a_gameplay_running_towards_players_09",
				"ebb_a_gameplay_running_towards_players_13",
				"ebb_a_gameplay_running_towards_players_14",
				"ebb_a_gameplay_running_towards_players_15",
				"ebb_a_gameplay_running_towards_players_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				2.2799999713898,
				2.4115417003632,
				2.1266875267029,
				2.3192915916443,
				2.3587291240692,
				3.8849999904633,
				3.655312538147,
				3.6507916450501,
				2.844687461853,
				1.9252500534058,
				3.821249961853
			},
			localization_strings = {
				"ebb_a_gameplay_running_towards_players_01",
				"ebb_a_gameplay_running_towards_players_02",
				"ebb_a_gameplay_running_towards_players_03",
				"ebb_a_gameplay_running_towards_players_04",
				"ebb_a_gameplay_running_towards_players_05",
				"ebb_a_gameplay_running_towards_players_07",
				"ebb_a_gameplay_running_towards_players_09",
				"ebb_a_gameplay_running_towards_players_13",
				"ebb_a_gameplay_running_towards_players_14",
				"ebb_a_gameplay_running_towards_players_15",
				"ebb_a_gameplay_running_towards_players_16"
			},
			randomize_indexes = {}
		},
		ebu_gameplay_running_towards_players = {
			sound_events_n = 19,
			face_animations_n = 19,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 19,
			sound_events = {
				"ebu_gameplay_running_towards_players_01",
				"ebu_gameplay_running_towards_players_02",
				"ebu_gameplay_running_towards_players_03",
				"ebu_gameplay_running_towards_players_04",
				"ebu_gameplay_running_towards_players_05",
				"ebu_gameplay_running_towards_players_06",
				"ebu_gameplay_running_towards_players_07",
				"ebu_gameplay_running_towards_players_08",
				"ebu_gameplay_running_towards_players_09",
				"ebu_gameplay_running_towards_players_10",
				"ebu_gameplay_running_towards_players_11",
				"ebu_gameplay_running_towards_players_12",
				"ebu_gameplay_running_towards_players_13",
				"ebu_gameplay_running_towards_players_14",
				"ebu_gameplay_running_towards_players_16",
				"ebu_gameplay_running_towards_players_17",
				"ebu_gameplay_running_towards_players_18",
				"ebu_gameplay_running_towards_players_19",
				"ebu_gameplay_running_towards_players_20"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.2949503660202,
				1.9889738559723,
				2.4674406051636,
				2.237003326416,
				2.4674587249756,
				2.084979057312,
				1.853244304657,
				1.8117778301239,
				2.442173242569,
				2.4371547698975,
				2.2822785377502,
				2.9280550479889,
				1.3442802429199,
				1.5737509727478,
				1.0987057685852,
				1.4005897045136,
				1.6420783996582,
				1.734415769577,
				1.6482338905334
			},
			localization_strings = {
				"ebu_gameplay_running_towards_players_01",
				"ebu_gameplay_running_towards_players_02",
				"ebu_gameplay_running_towards_players_03",
				"ebu_gameplay_running_towards_players_04",
				"ebu_gameplay_running_towards_players_05",
				"ebu_gameplay_running_towards_players_06",
				"ebu_gameplay_running_towards_players_07",
				"ebu_gameplay_running_towards_players_08",
				"ebu_gameplay_running_towards_players_09",
				"ebu_gameplay_running_towards_players_10",
				"ebu_gameplay_running_towards_players_11",
				"ebu_gameplay_running_towards_players_12",
				"ebu_gameplay_running_towards_players_13",
				"ebu_gameplay_running_towards_players_14",
				"ebu_gameplay_running_towards_players_16",
				"ebu_gameplay_running_towards_players_17",
				"ebu_gameplay_running_towards_players_18",
				"ebu_gameplay_running_towards_players_19",
				"ebu_gameplay_running_towards_players_20"
			},
			randomize_indexes = {}
		},
		ebu_gameplay_flanking_players = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemy_beastmen_vo",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ebu_gameplay_flanking_players_01",
				"ebu_gameplay_flanking_players_02",
				"ebu_gameplay_flanking_players_03",
				"ebu_gameplay_flanking_players_04",
				"ebu_gameplay_flanking_players_05",
				"ebu_gameplay_flanking_players_06",
				"ebu_gameplay_flanking_players_07",
				"ebu_gameplay_flanking_players_08",
				"ebu_gameplay_flanking_players_09",
				"ebu_gameplay_flanking_players_10"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				2.1371386051178,
				1.4505363702774,
				1.6655871868134,
				2.0247306823731,
				1.5537173748016,
				2.2152252197266,
				1.4774923324585,
				1.888334274292,
				1.5399668216705,
				2.3583960533142
			},
			localization_strings = {
				"ebu_gameplay_flanking_players_01",
				"ebu_gameplay_flanking_players_02",
				"ebu_gameplay_flanking_players_03",
				"ebu_gameplay_flanking_players_04",
				"ebu_gameplay_flanking_players_05",
				"ebu_gameplay_flanking_players_06",
				"ebu_gameplay_flanking_players_07",
				"ebu_gameplay_flanking_players_08",
				"ebu_gameplay_flanking_players_09",
				"ebu_gameplay_flanking_players_10"
			},
			randomize_indexes = {}
		}
	})
end
