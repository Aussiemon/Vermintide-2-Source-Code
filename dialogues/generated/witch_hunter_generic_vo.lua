return function ()
	define_rule({
		name = "pwh_generic_reaction_action",
		response = "pwh_generic_reaction_action",
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
		name = "pwh_generic_reaction_sound",
		response = "pwh_generic_reaction_sound",
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
		name = "pwh_generic_assemble",
		response = "pwh_generic_assemble",
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
		name = "pwh_generic_door_locked",
		response = "pwh_generic_door_locked",
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
		name = "pwh_generic_path_blocked",
		response = "pwh_generic_path_blocked",
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
		name = "pwh_generic_objective_complete",
		response = "pwh_generic_objective_complete",
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
		name = "pwh_generic_unexpected_event_01",
		response = "pwh_generic_unexpected_event_01",
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
		name = "pwh_generic_search_start",
		response = "pwh_generic_search_start",
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
		name = "pwh_generic_search_progressing",
		response = "pwh_generic_search_progressing",
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
		name = "pwh_generic_search_complete",
		response = "pwh_generic_search_complete",
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
		name = "pwh_generic_success",
		response = "pwh_generic_success",
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
		name = "pwh_generic_cold_outside",
		response = "pwh_generic_cold_outside",
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
		name = "pwh_generic_cold_inside",
		response = "pwh_generic_cold_inside",
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
		name = "pwh_generic_dark",
		response = "pwh_generic_dark",
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
		name = "pwh_generic_getting_dark_outside",
		response = "pwh_generic_getting_dark_outside",
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
		name = "pwh_generic_rain",
		response = "pwh_generic_rain",
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
		response = "pwh_generic_falling",
		name = "pwh_generic_falling",
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	add_dialogues({
		pwh_generic_objective_complete = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_objective_complete_01",
				"pwh_generic_objective_complete_02",
				"pwh_generic_objective_complete_03",
				"pwh_generic_objective_complete_04"
			},
			sound_events = {
				"pwh_generic_objective_complete_01",
				"pwh_generic_objective_complete_02",
				"pwh_generic_objective_complete_03",
				"pwh_generic_objective_complete_04"
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
				1.4898958206177,
				1.3385208845139,
				1.2110416889191,
				1.059666633606
			}
		},
		pwh_generic_search_progressing = {
			face_animations_n = 8,
			database = "witch_hunter_generic_vo",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_search_progressing_01",
				"pwh_generic_search_progressing_02",
				"pwh_generic_search_progressing_03",
				"pwh_generic_search_progressing_04",
				"pwh_generic_search_progressing_05",
				"pwh_generic_search_progressing_06",
				"pwh_generic_search_progressing_07",
				"pwh_generic_search_progressing_08"
			},
			sound_events = {
				"pwh_generic_search_progressing_01",
				"pwh_generic_search_progressing_02",
				"pwh_generic_search_progressing_03",
				"pwh_generic_search_progressing_04",
				"pwh_generic_search_progressing_05",
				"pwh_generic_search_progressing_06",
				"pwh_generic_search_progressing_07",
				"pwh_generic_search_progressing_08"
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
			sound_events_duration = {
				2.4867498874664,
				0.96445834636688,
				3.0677082538605,
				3.7091875076294,
				4.2337918281555,
				4.2652082443237,
				2.6495416164398,
				2.9246459007263
			}
		},
		pwh_generic_search_complete = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_search_complete_01",
				"pwh_generic_search_complete_02",
				"pwh_generic_search_complete_03",
				"pwh_generic_search_complete_04"
			},
			sound_events = {
				"pwh_generic_search_complete_01",
				"pwh_generic_search_complete_02",
				"pwh_generic_search_complete_03",
				"pwh_generic_search_complete_04"
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
				0.59604167938232,
				0.5790833234787,
				3.1808958053589,
				4.3848748207092
			}
		},
		pwh_generic_cold_inside = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_cold_inside_01",
				"pwh_generic_cold_inside_02",
				"pwh_generic_cold_inside_03",
				"pwh_generic_cold_inside_04"
			},
			sound_events = {
				"pwh_generic_cold_inside_01",
				"pwh_generic_cold_inside_02",
				"pwh_generic_cold_inside_03",
				"pwh_generic_cold_inside_04"
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
				1.7484166622162,
				2.363041639328,
				2.0822083950043,
				3.0252916812897
			}
		},
		pwh_generic_reaction_action = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_reaction_action_01",
				"pwh_generic_reaction_action_02",
				"pwh_generic_reaction_action_03",
				"pwh_generic_reaction_action_04"
			},
			sound_events = {
				"pwh_generic_reaction_action_01",
				"pwh_generic_reaction_action_02",
				"pwh_generic_reaction_action_03",
				"pwh_generic_reaction_action_04"
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
				1.1615624427795,
				0.77316665649414,
				1.7944999933243,
				0.76958334445953
			}
		},
		pwh_generic_search_start = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_search_start_01",
				"pwh_generic_search_start_02",
				"pwh_generic_search_start_03",
				"pwh_generic_search_start_04"
			},
			sound_events = {
				"pwh_generic_search_start_01",
				"pwh_generic_search_start_02",
				"pwh_generic_search_start_03",
				"pwh_generic_search_start_04"
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
				1.2980833053589,
				2.2146666049957,
				1.854395866394,
				1.7113332748413
			}
		},
		pwh_generic_cold_outside = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_cold_outside_01",
				"pwh_generic_cold_outside_02",
				"pwh_generic_cold_outside_03",
				"pwh_generic_cold_outside_04"
			},
			sound_events = {
				"pwh_generic_cold_outside_01",
				"pwh_generic_cold_outside_02",
				"pwh_generic_cold_outside_03",
				"pwh_generic_cold_outside_04"
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
				2.5961458683014,
				1.5523958206177,
				2.5908541679382,
				4.1568956375122
			}
		},
		pwh_generic_path_blocked = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_path_blocked_01",
				"pwh_generic_path_blocked_02",
				"pwh_generic_path_blocked_03",
				"pwh_generic_path_blocked_04"
			},
			sound_events = {
				"pwh_generic_path_blocked_01",
				"pwh_generic_path_blocked_02",
				"pwh_generic_path_blocked_03",
				"pwh_generic_path_blocked_04"
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
				1.5702083110809,
				1.7914375066757,
				1.2155208587647,
				1.0631250143051
			}
		},
		pwh_generic_getting_dark_outside = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_getting_dark_outside_01",
				"pwh_generic_getting_dark_outside_02",
				"pwh_generic_getting_dark_outside_03",
				"pwh_generic_getting_dark_outside_04"
			},
			sound_events = {
				"pwh_generic_getting_dark_outside_01",
				"pwh_generic_getting_dark_outside_02",
				"pwh_generic_getting_dark_outside_03",
				"pwh_generic_getting_dark_outside_04"
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
				1.8563749790192,
				1.1393333673477,
				2.3025624752045,
				3.5910832881927
			}
		},
		pwh_generic_assemble = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_assemble_01",
				"pwh_generic_assemble_02",
				"pwh_generic_assemble_03",
				"pwh_generic_assemble_04"
			},
			sound_events = {
				"pwh_generic_assemble_01",
				"pwh_generic_assemble_02",
				"pwh_generic_assemble_03",
				"pwh_generic_assemble_04"
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
				0.67608332633972,
				0.5789999961853,
				0.93860417604446,
				1.5247917175293
			}
		},
		pwh_generic_success = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_success_01",
				"pwh_generic_success_02",
				"pwh_generic_success_03",
				"pwh_generic_success_04"
			},
			sound_events = {
				"pwh_generic_success_01",
				"pwh_generic_success_02",
				"pwh_generic_success_03",
				"pwh_generic_success_04"
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
				1.9391666650772,
				1.9378541707993,
				3.3908958435059,
				1.9285833835602
			}
		},
		pwh_generic_falling = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_falling_01",
				"pwh_generic_falling_02",
				"pwh_generic_falling_03",
				"pwh_generic_falling_04"
			},
			sound_events = {
				"pwh_generic_falling_01",
				"pwh_generic_falling_02",
				"pwh_generic_falling_03",
				"pwh_generic_falling_04"
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
				1.3951457738876,
				1.4766249656677,
				1.3646041154861,
				1.2576667070389
			}
		},
		pwh_generic_rain = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_rain_01",
				"pwh_generic_rain_02",
				"pwh_generic_rain_03",
				"pwh_generic_rain_04"
			},
			sound_events = {
				"pwh_generic_rain_01",
				"pwh_generic_rain_02",
				"pwh_generic_rain_03",
				"pwh_generic_rain_04"
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
				2.790479183197,
				4.1068539619446,
				3.3330833911896,
				1.8814582824707
			}
		},
		pwh_generic_door_locked = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_door_locked_01",
				"pwh_generic_door_locked_02",
				"pwh_generic_door_locked_03",
				"pwh_generic_door_locked_04"
			},
			sound_events = {
				"pwh_generic_door_locked_01",
				"pwh_generic_door_locked_02",
				"pwh_generic_door_locked_03",
				"pwh_generic_door_locked_04"
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
				1.21193754673,
				1.5800000429153,
				2.1963748931885,
				1.9625208377838
			}
		},
		pwh_generic_reaction_sound = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_reaction_sound_01",
				"pwh_generic_reaction_sound_02",
				"pwh_generic_reaction_sound_03",
				"pwh_generic_reaction_sound_04"
			},
			sound_events = {
				"pwh_generic_reaction_sound_01",
				"pwh_generic_reaction_sound_02",
				"pwh_generic_reaction_sound_03",
				"pwh_generic_reaction_sound_04"
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
				1.3845208883286,
				0.67608332633972,
				0.84870833158493,
				0.79835414886475
			}
		},
		pwh_generic_unexpected_event_01 = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_unexpected_event_01",
				"pwh_generic_unexpected_event_02",
				"pwh_generic_unexpected_event_03",
				"pwh_generic_unexpected_event_04"
			},
			sound_events = {
				"pwh_generic_unexpected_event_01",
				"pwh_generic_unexpected_event_02",
				"pwh_generic_unexpected_event_03",
				"pwh_generic_unexpected_event_04"
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
				3.6598749160767,
				0.81170833110809,
				2.9882082939148,
				2.6862292289734
			}
		},
		pwh_generic_dark = {
			face_animations_n = 4,
			database = "witch_hunter_generic_vo",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwh_generic_dark_01",
				"pwh_generic_dark_02",
				"pwh_generic_dark_03",
				"pwh_generic_dark_04"
			},
			sound_events = {
				"pwh_generic_dark_01",
				"pwh_generic_dark_02",
				"pwh_generic_dark_03",
				"pwh_generic_dark_04"
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
				1.2874791622162,
				0.88958334922791,
				2.1591458320618,
				1.864354133606
			}
		}
	})
end
