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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 20,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 20,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 20,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 20,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemy_beastmen_vo",
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
			localization_strings = {
				[1.0] = "play_enemy_gor_alerted_general_vce"
			}
		},
		ebu_gameplay_ranged_fire_in_group = {
			sound_events_n = 15,
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 19,
			database = "enemy_beastmen_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemy_beastmen_vo",
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
