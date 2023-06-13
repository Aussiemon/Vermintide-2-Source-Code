return function ()
	define_rule({
		response = "nik_greeting_skulls_event_first",
		name = "nik_greeting_skulls_event_first",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_greeting_skulls_first"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_greeting_skulls_event_second",
		name = "nik_greeting_skulls_event_second",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_greeting_skulls_second"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_hub_backstory_interaction_skulls",
		name = "nik_hub_backstory_interaction_skulls",
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
				"nik_backstory_interacting"
			}
		}
	})
	define_rule({
		name = "pwe_skulls_event_skull_sighted_dummy_trigger",
		response = "pwe_skulls_event_skull_sighted_dummy_trigger",
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
				"skulls_event_skull_pickup"
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
				"query_context",
				"distance",
				OP.LT,
				11
			},
			{
				"global_context",
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				60
			},
			{
				"faction_memory",
				"seen_event_skulls",
				OP.LT,
				1
			},
			{
				"faction_memory",
				"time_since_seen_event_skull",
				OP.TIMEDIFF,
				OP.GT,
				180
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_seen_event_skull",
				OP.TIMESET
			},
			{
				"faction_memory",
				"seen_event_skulls",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_skulls_event_skull_sighted_dummy_trigger",
		response = "pdr_skulls_event_skull_sighted_dummy_trigger",
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
				"skulls_event_skull_pickup"
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
				"query_context",
				"distance",
				OP.LT,
				11
			},
			{
				"global_context",
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				60
			},
			{
				"faction_memory",
				"seen_event_skulls",
				OP.LT,
				1
			},
			{
				"faction_memory",
				"time_since_seen_event_skull",
				OP.TIMEDIFF,
				OP.GT,
				180
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_seen_event_skull",
				OP.TIMESET
			},
			{
				"faction_memory",
				"seen_event_skulls",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_skulls_event_skull_sighted_dummy_trigger",
		response = "pes_skulls_event_skull_sighted_dummy_trigger",
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
				"skulls_event_skull_pickup"
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
				"query_context",
				"distance",
				OP.LT,
				11
			},
			{
				"global_context",
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				60
			},
			{
				"faction_memory",
				"seen_event_skulls",
				OP.LT,
				1
			},
			{
				"faction_memory",
				"time_since_seen_event_skull",
				OP.TIMEDIFF,
				OP.GT,
				180
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_seen_event_skull",
				OP.TIMESET
			},
			{
				"faction_memory",
				"seen_event_skulls",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_skull_sighted",
		name = "nik_skulls_event_skull_sighted",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"skulls_event_skull_sighted_dummy_trigger_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_warcamp",
		name = "nik_skulls_event_start_banter_d_warcamp",
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
				"chaos_war_camp_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_ussingen",
		name = "nik_skulls_event_start_banter_d_ussingen",
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
				"ussingen_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_skittergate",
		name = "nik_skulls_event_start_banter_d_skittergate",
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
				"skittergate_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_skaven_stronghold",
		name = "nik_skulls_event_start_banter_d_skaven_stronghold",
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
				"skaven_stronghold_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_nurgle",
		name = "nik_skulls_event_start_banter_d_nurgle",
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
				"nurgle_intro_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_mine",
		name = "nik_skulls_event_start_banter_d_mine",
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
				"mine_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_military",
		name = "nik_skulls_event_start_banter_d_military",
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
				"helmgart_military_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_ground_zero",
		name = "nik_skulls_event_start_banter_d_ground_zero",
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
				"ground_zero_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_fort",
		name = "nik_skulls_event_start_banter_d_fort",
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
				"fort_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_farmlands",
		name = "nik_skulls_event_start_banter_d_farmlands",
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
				"farmlands_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_elven_ruins",
		name = "nik_skulls_event_start_banter_d_elven_ruins",
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
				"elven_ruins_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_portals",
		name = "nik_skulls_event_start_banter_d_portals",
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
				"portals_intro_line_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_bastion",
		name = "nik_skulls_event_start_banter_d_bastion",
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
				"bastion_intro_line_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_castle",
		name = "nik_skulls_event_start_banter_d_castle",
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
				"castle_intro_line_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_crater",
		name = "nik_skulls_event_start_banter_d_crater",
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
				"crater_intro_banter_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_bogenhafen_slum",
		name = "nik_skulls_event_start_banter_d_bogenhafen_slum",
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
				"level_bogenhafen_slum_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_bogenhafen_city",
		name = "nik_skulls_event_start_banter_d_bogenhafen_city",
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
				"level_bogenhafen_city_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_catacombs",
		name = "nik_skulls_event_start_banter_d_catacombs",
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
				"catacombs_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_bell",
		name = "nik_skulls_event_start_banter_d_bell",
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
				"bell_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	define_rule({
		response = "nik_skulls_event_start_banter_d_wizards_trail",
		name = "nik_skulls_event_start_banter_d_wizards_trail",
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
				"wizard_trail_intro_c"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"inn_keeper"
			}
		}
	})
	add_dialogues({
		pwe_skulls_event_skull_sighted_dummy_trigger = {
			override_awareness = "skulls_event_skull_sighted_dummy_trigger_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "npc_dlc_event_skulls",
			category = "seen_items",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "dummy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			},
			localization_strings = {
				[1.0] = "dummy"
			}
		},
		nik_skulls_event_start_banter_d_skittergate = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_skaven_stronghold = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_bogenhafen_city = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_hub_backstory_interaction_skulls = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 9,
			sound_events = {
				"nik_keep_endtimes_07",
				"nik_keep_endtimes_08",
				"nik_keep_endtimes_12",
				"nik_keep_endtimes_09",
				"nik_keep_endtimes_14",
				"nik_keep_endtimes_11",
				"nik_keep_endtimes_13",
				"nik_keep_endtimes_10",
				"nik_keep_idle_12"
			},
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
			sound_events_duration = {
				8.7913961410522,
				9.5934791564941,
				6.7096042633057,
				5.8461875915527,
				7.9246249198914,
				7.8400206565857,
				9.9928541183472,
				7.9879374504089,
				6.561999797821
			},
			localization_strings = {
				"nik_keep_endtimes_07",
				"nik_keep_endtimes_08",
				"nik_keep_endtimes_12",
				"nik_keep_endtimes_09",
				"nik_keep_endtimes_14",
				"nik_keep_endtimes_11",
				"nik_keep_endtimes_13",
				"nik_keep_endtimes_10",
				"nik_keep_idle_12"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_bogenhafen_slum = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_bastion = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_catacombs = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_wizards_trail = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_bell = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_crater = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_military = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_nurgle = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_castle = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_portals = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_greeting_skulls_event_second = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"nik_hub_skulls_06",
				"nik_hub_skulls_07",
				"nik_hub_skulls_08",
				"nik_hub_skulls_09",
				"nik_hub_skulls_10"
			},
			dialogue_animations = {
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
				"face_neutral"
			},
			sound_events_duration = {
				3.6826040744781,
				8.9105205535889,
				6.1234169006348,
				8.0589170455933,
				3.6441667079926
			},
			localization_strings = {
				"nik_hub_skulls_06",
				"nik_hub_skulls_07",
				"nik_hub_skulls_08",
				"nik_hub_skulls_09",
				"nik_hub_skulls_10"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_ussingen = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_fort = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_elven_ruins = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_greeting_skulls_event_first = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "npc_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"nik_hub_skulls_01",
				"nik_hub_skulls_02",
				"nik_hub_skulls_03",
				"nik_hub_skulls_04"
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
			sound_events_duration = {
				14.034416198731,
				15.869750022888,
				14.959270477295,
				15.571478843689
			},
			localization_strings = {
				"nik_hub_skulls_01",
				"nik_hub_skulls_02",
				"nik_hub_skulls_03",
				"nik_hub_skulls_04"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_farmlands = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_ground_zero = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_mine = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_start_banter_d_warcamp = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
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
			sound_events_duration = {
				5.9430418014526,
				3.6819999217987,
				5.5304164886475,
				6.9877290725708,
				5.7070627212524,
				6.3253126144409,
				9.4732913970947,
				6.0918960571289
			},
			localization_strings = {
				"nik_banter_d_skulls_01",
				"nik_banter_d_skulls_02",
				"nik_banter_d_skulls_03",
				"nik_banter_d_skulls_04",
				"nik_banter_d_skulls_05",
				"nik_banter_d_skulls_06",
				"nik_banter_d_skulls_07",
				"nik_banter_d_skulls_08"
			},
			randomize_indexes = {}
		},
		nik_skulls_event_skull_sighted = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "npc_dlc_event_skulls",
			randomize_indexes_n = 0,
			category = "story_talk",
			dialogue_animations_n = 10,
			sound_events = {
				"nik_mission_skull_sighted_01",
				"nik_mission_skull_sighted_02",
				"nik_mission_skull_sighted_03",
				"nik_mission_skull_sighted_04",
				"nik_mission_skull_sighted_05",
				"nik_mission_skull_sighted_06",
				"nik_mission_skull_sighted_07",
				"nik_mission_skull_sighted_08",
				"nik_mission_skull_sighted_09",
				"nik_mission_skull_sighted_10"
			},
			dialogue_animations = {
				"dialogue_talk",
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
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.1710207462311,
				1.9660625457764,
				3.776624917984,
				5.1771249771118,
				5.3600831031799,
				3.8397083282471,
				5.0257501602173,
				5.5548958778381,
				3.801854133606,
				3.4898540973663
			},
			localization_strings = {
				"nik_mission_skull_sighted_01",
				"nik_mission_skull_sighted_02",
				"nik_mission_skull_sighted_03",
				"nik_mission_skull_sighted_04",
				"nik_mission_skull_sighted_05",
				"nik_mission_skull_sighted_06",
				"nik_mission_skull_sighted_07",
				"nik_mission_skull_sighted_08",
				"nik_mission_skull_sighted_09",
				"nik_mission_skull_sighted_10"
			},
			randomize_indexes = {}
		},
		pes_skulls_event_skull_sighted_dummy_trigger = {
			override_awareness = "skulls_event_skull_sighted_dummy_trigger_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "npc_dlc_event_skulls",
			category = "seen_items",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "dummy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			},
			localization_strings = {
				[1.0] = "dummy"
			}
		},
		pdr_skulls_event_skull_sighted_dummy_trigger = {
			override_awareness = "skulls_event_skull_sighted_dummy_trigger_done",
			sound_events_n = 1,
			face_animations_n = 1,
			database = "npc_dlc_event_skulls",
			category = "seen_items",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "dummy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.20000000298023
			},
			localization_strings = {
				[1.0] = "dummy"
			}
		}
	})
end
