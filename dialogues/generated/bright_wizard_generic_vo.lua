return function ()
	define_rule({
		name = "pbw_generic_reaction_action",
		response = "pbw_generic_reaction_action",
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
				"generic_reaction_action"
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
				"generic_reaction_action",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_reaction_action",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_reaction_sound",
		response = "pbw_generic_reaction_sound",
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
				"generic_reaction_sound"
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
				"generic_reaction_sound",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_reaction_sound",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_assemble",
		response = "pbw_generic_assemble",
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
				"generic_assemble"
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
				"generic_assemble",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_assemble",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_door_locked",
		response = "pbw_generic_door_locked",
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
				"generic_door_locked"
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
				"generic_door_locked",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_door_locked",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_path_blocked",
		response = "pbw_generic_path_blocked",
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
				"generic_path_blocked"
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
				"generic_path_blocked",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_path_blocked",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_objective_complete",
		response = "pbw_generic_objective_complete",
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
				"generic_objective_complete"
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
				"generic_objective_complete",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_objective_complete",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_unexpected_event_01",
		response = "pbw_generic_unexpected_event_01",
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
				"generic_unexpected_event"
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
				"generic_unexpected_event",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_unexpected_event",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_search_start",
		response = "pbw_generic_search_start",
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
				"generic_search_start"
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
				"generic_search_start",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_search_start",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_search_progressing",
		response = "pbw_generic_search_progressing",
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
				"generic_search_progressing"
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
				"generic_search_progressing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_search_progressing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_search_complete",
		response = "pbw_generic_search_complete",
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
				"generic_search_complete"
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
				"generic_search_complete",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_search_complete",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_success",
		response = "pbw_generic_success",
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
				"generic_success"
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
				"generic_success",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_success",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_cold_outside",
		response = "pbw_generic_cold_outside",
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
				"generic_cold_outside"
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
				"generic_cold_outside",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_cold_outside",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_cold_inside",
		response = "pbw_generic_cold_inside",
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
				"generic_cold_inside"
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
				"generic_cold_inside",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_cold_inside",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_dark",
		response = "pbw_generic_dark",
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
				"generic_dark"
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
				"generic_dark",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_dark",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_getting_dark_outside",
		response = "pbw_generic_getting_dark_outside",
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
				"generic_getting_dark_outside"
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
				"generic_getting_dark_outside",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_getting_dark_outside",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_generic_rain",
		response = "pbw_generic_rain",
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
				"generic_rain"
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
				"generic_rain",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_rain",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_generic_falling",
		name = "pbw_generic_falling",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"generic_falling"
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
			}
		}
	})
	add_dialogues({
		pbw_generic_success = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_success_01",
				"pbw_generic_success_02",
				"pbw_generic_success_03",
				"pbw_generic_success_04"
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
			sound_events_duration = {
				3.4702084064484,
				1.1767292022705,
				1.9494999647141,
				1.8055208921433
			},
			localization_strings = {
				"pbw_generic_success_01",
				"pbw_generic_success_02",
				"pbw_generic_success_03",
				"pbw_generic_success_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_assemble = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_assemble_01",
				"pbw_generic_assemble_02",
				"pbw_generic_assemble_03",
				"pbw_generic_assemble_04"
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
			sound_events_duration = {
				0.79231250286102,
				1.6037499904633,
				1.4211041927338,
				0.55722916126251
			},
			localization_strings = {
				"pbw_generic_assemble_01",
				"pbw_generic_assemble_02",
				"pbw_generic_assemble_03",
				"pbw_generic_assemble_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_rain = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_rain_01",
				"pbw_generic_rain_02",
				"pbw_generic_rain_03",
				"pbw_generic_rain_04"
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
			sound_events_duration = {
				1.8126666545868,
				2.217916727066,
				1.601979136467,
				3.0897917747498
			},
			localization_strings = {
				"pbw_generic_rain_01",
				"pbw_generic_rain_02",
				"pbw_generic_rain_03",
				"pbw_generic_rain_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_cold_inside = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_cold_inside_01",
				"pbw_generic_cold_inside_02",
				"pbw_generic_cold_inside_03",
				"pbw_generic_cold_inside_04"
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
			sound_events_duration = {
				1.881875038147,
				2.9943957328796,
				2.2599375247955,
				4.7120833396912
			},
			localization_strings = {
				"pbw_generic_cold_inside_01",
				"pbw_generic_cold_inside_02",
				"pbw_generic_cold_inside_03",
				"pbw_generic_cold_inside_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_unexpected_event_01 = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_unexpected_event_01",
				"pbw_generic_unexpected_event_02",
				"pbw_generic_unexpected_event_03",
				"pbw_generic_unexpected_event_04"
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
			sound_events_duration = {
				1.8376666307449,
				1.9248125553131,
				0.72131252288818,
				1.2327708005905
			},
			localization_strings = {
				"pbw_generic_unexpected_event_01",
				"pbw_generic_unexpected_event_02",
				"pbw_generic_unexpected_event_03",
				"pbw_generic_unexpected_event_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_cold_outside = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_cold_outside_01",
				"pbw_generic_cold_outside_02",
				"pbw_generic_cold_outside_03",
				"pbw_generic_cold_outside_04"
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
			sound_events_duration = {
				1.1928541660309,
				2.3439166545868,
				4.0962710380554,
				1.3823750019074
			},
			localization_strings = {
				"pbw_generic_cold_outside_01",
				"pbw_generic_cold_outside_02",
				"pbw_generic_cold_outside_03",
				"pbw_generic_cold_outside_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_path_blocked = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_path_blocked_01",
				"pbw_generic_path_blocked_02",
				"pbw_generic_path_blocked_03",
				"pbw_generic_path_blocked_04"
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
			sound_events_duration = {
				1.229708313942,
				1.3492292165756,
				1.2307499647141,
				2.3981459140778
			},
			localization_strings = {
				"pbw_generic_path_blocked_01",
				"pbw_generic_path_blocked_02",
				"pbw_generic_path_blocked_03",
				"pbw_generic_path_blocked_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_getting_dark_outside = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_getting_dark_outside_01",
				"pbw_generic_getting_dark_outside_02",
				"pbw_generic_getting_dark_outside_03",
				"pbw_generic_getting_dark_outside_04"
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
			sound_events_duration = {
				1.6737707853317,
				1.1182916164398,
				1.3271666765213,
				1.6492708921433
			},
			localization_strings = {
				"pbw_generic_getting_dark_outside_01",
				"pbw_generic_getting_dark_outside_02",
				"pbw_generic_getting_dark_outside_03",
				"pbw_generic_getting_dark_outside_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_search_progressing = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_generic_search_progressing_01",
				"pbw_generic_search_progressing_02",
				"pbw_generic_search_progressing_03",
				"pbw_generic_search_progressing_04",
				"pbw_generic_search_progressing_05",
				"pbw_generic_search_progressing_06",
				"pbw_generic_search_progressing_07",
				"pbw_generic_search_progressing_08"
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
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			sound_events_duration = {
				1.6381249427795,
				1.0668958425522,
				1.1249166727066,
				0.87708336114883,
				1.1626249551773,
				1.7479374408722,
				1.1414999961853,
				1.3762708902359
			},
			localization_strings = {
				"pbw_generic_search_progressing_01",
				"pbw_generic_search_progressing_02",
				"pbw_generic_search_progressing_03",
				"pbw_generic_search_progressing_04",
				"pbw_generic_search_progressing_05",
				"pbw_generic_search_progressing_06",
				"pbw_generic_search_progressing_07",
				"pbw_generic_search_progressing_08"
			},
			randomize_indexes = {}
		},
		pbw_generic_dark = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_dark_01",
				"pbw_generic_dark_02",
				"pbw_generic_dark_03",
				"pbw_generic_dark_04"
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
			sound_events_duration = {
				1.158083319664,
				2.2347500324249,
				1.4452291727066,
				2.8126249313355
			},
			localization_strings = {
				"pbw_generic_dark_01",
				"pbw_generic_dark_02",
				"pbw_generic_dark_03",
				"pbw_generic_dark_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_search_start = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_search_start_01",
				"pbw_generic_search_start_02",
				"pbw_generic_search_start_03",
				"pbw_generic_search_start_04"
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
			sound_events_duration = {
				0.77889585494995,
				1.1656874418259,
				1.0041249990463,
				1.4949375391007
			},
			localization_strings = {
				"pbw_generic_search_start_01",
				"pbw_generic_search_start_02",
				"pbw_generic_search_start_03",
				"pbw_generic_search_start_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_reaction_action = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_reaction_action_01",
				"pbw_generic_reaction_action_02",
				"pbw_generic_reaction_action_03",
				"pbw_generic_reaction_action_04"
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
			sound_events_duration = {
				0.39360415935516,
				0.64220833778381,
				0.80283331871033,
				0.47285416722298
			},
			localization_strings = {
				"pbw_generic_reaction_action_01",
				"pbw_generic_reaction_action_02",
				"pbw_generic_reaction_action_03",
				"pbw_generic_reaction_action_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_objective_complete = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_objective_complete_01",
				"pbw_generic_objective_complete_02",
				"pbw_generic_objective_complete_03",
				"pbw_generic_objective_complete_04"
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
			sound_events_duration = {
				1.2612291574478,
				1.0660417079925,
				1.393770813942,
				3.2644166946411
			},
			localization_strings = {
				"pbw_generic_objective_complete_01",
				"pbw_generic_objective_complete_02",
				"pbw_generic_objective_complete_03",
				"pbw_generic_objective_complete_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_search_complete = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_search_complete_01",
				"pbw_generic_search_complete_02",
				"pbw_generic_search_complete_03",
				"pbw_generic_search_complete_04"
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
			sound_events_duration = {
				0.66083335876465,
				1.1482291221619,
				1.580854177475,
				2.7464792728424
			},
			localization_strings = {
				"pbw_generic_search_complete_01",
				"pbw_generic_search_complete_02",
				"pbw_generic_search_complete_03",
				"pbw_generic_search_complete_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_door_locked = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_door_locked_01",
				"pbw_generic_door_locked_02",
				"pbw_generic_door_locked_03",
				"pbw_generic_door_locked_04"
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
			sound_events_duration = {
				0.6777708530426,
				2.3858957290649,
				2.3088126182556,
				1.1142499446869
			},
			localization_strings = {
				"pbw_generic_door_locked_01",
				"pbw_generic_door_locked_02",
				"pbw_generic_door_locked_03",
				"pbw_generic_door_locked_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_falling = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_falling_01",
				"pbw_generic_falling_02",
				"pbw_generic_falling_03",
				"pbw_generic_falling_04"
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
			sound_events_duration = {
				1.4785000085831,
				1.1784166097641,
				1.0940208435059,
				1.9392708539963
			},
			localization_strings = {
				"pbw_generic_falling_01",
				"pbw_generic_falling_02",
				"pbw_generic_falling_03",
				"pbw_generic_falling_04"
			},
			randomize_indexes = {}
		},
		pbw_generic_reaction_sound = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_generic_reaction_sound_01",
				"pbw_generic_reaction_sound_02",
				"pbw_generic_reaction_sound_03",
				"pbw_generic_reaction_sound_04"
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
			sound_events_duration = {
				0.50995832681656,
				0.64985418319702,
				0.51862502098083,
				0.58756250143051
			},
			localization_strings = {
				"pbw_generic_reaction_sound_01",
				"pbw_generic_reaction_sound_02",
				"pbw_generic_reaction_sound_03",
				"pbw_generic_reaction_sound_04"
			},
			randomize_indexes = {}
		}
	})
end
