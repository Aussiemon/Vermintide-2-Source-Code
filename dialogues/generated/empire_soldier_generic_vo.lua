return function ()
	define_rule({
		name = "pes_generic_assemble",
		response = "pes_generic_assemble",
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
		name = "pes_generic_cold_inside",
		response = "pes_generic_cold_inside",
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
		name = "pes_generic_cold_outside",
		response = "pes_generic_cold_outside",
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
		name = "pes_generic_dark",
		response = "pes_generic_dark",
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
		name = "pes_generic_door_locked",
		response = "pes_generic_door_locked",
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
		response = "pes_generic_falling",
		name = "pes_generic_falling",
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
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "pes_generic_getting_dark_outside",
		response = "pes_generic_getting_dark_outside",
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
		name = "pes_generic_objective_complete",
		response = "pes_generic_objective_complete",
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
		name = "pes_generic_path_blocked",
		response = "pes_generic_path_blocked",
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
		name = "pes_generic_rain",
		response = "pes_generic_rain",
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
		name = "pes_generic_reaction_action",
		response = "pes_generic_reaction_action",
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
		name = "pes_generic_reaction_sound",
		response = "pes_generic_reaction_sound",
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
		name = "pes_generic_search_complete",
		response = "pes_generic_search_complete",
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
		name = "pes_generic_search_progressing",
		response = "pes_generic_search_progressing",
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
		name = "pes_generic_search_start",
		response = "pes_generic_search_start",
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
		name = "pes_generic_success",
		response = "pes_generic_success",
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
		name = "pes_generic_unexpected_event_01",
		response = "pes_generic_unexpected_event_01",
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
	add_dialogues({
		pes_generic_assemble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_assemble_01",
				"pes_generic_assemble_02",
				"pes_generic_assemble_03",
				"pes_generic_assemble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_assemble_01",
				"pes_generic_assemble_02",
				"pes_generic_assemble_03",
				"pes_generic_assemble_04"
			},
			sound_events_duration = {
				1.5639582872391,
				1.2544167041779,
				1.9611041545868,
				1.3834999799728
			}
		},
		pes_generic_cold_inside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_cold_inside_01",
				"pes_generic_cold_inside_02",
				"pes_generic_cold_inside_03",
				"pes_generic_cold_inside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_cold_inside_01",
				"pes_generic_cold_inside_02",
				"pes_generic_cold_inside_03",
				"pes_generic_cold_inside_04"
			},
			sound_events_duration = {
				1.6395416259766,
				2.1188542842865,
				2.8802917003632,
				3.0888125896454
			}
		},
		pes_generic_cold_outside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_cold_outside_01",
				"pes_generic_cold_outside_02",
				"pes_generic_cold_outside_03",
				"pes_generic_cold_outside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_cold_outside_01",
				"pes_generic_cold_outside_02",
				"pes_generic_cold_outside_03",
				"pes_generic_cold_outside_04"
			},
			sound_events_duration = {
				2.2096667289734,
				2.0912082195282,
				1.7389999628067,
				1.7257708311081
			}
		},
		pes_generic_dark = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_dark_01",
				"pes_generic_dark_02",
				"pes_generic_dark_03",
				"pes_generic_dark_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_dark_01",
				"pes_generic_dark_02",
				"pes_generic_dark_03",
				"pes_generic_dark_04"
			},
			sound_events_duration = {
				1.4607917070389,
				1.9593541622162,
				1.3973125219345,
				5.5374794006348
			}
		},
		pes_generic_door_locked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_door_locked_01",
				"pes_generic_door_locked_02",
				"pes_generic_door_locked_03",
				"pes_generic_door_locked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_door_locked_01",
				"pes_generic_door_locked_02",
				"pes_generic_door_locked_03",
				"pes_generic_door_locked_04"
			},
			sound_events_duration = {
				1.0136458873749,
				0.95733332633972,
				1.6366041898727,
				2.2381458282471
			}
		},
		pes_generic_falling = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pes_generic_falling_01",
				"pes_generic_falling_02",
				"pes_generic_falling_03",
				"pes_generic_falling_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_falling_01",
				"pes_generic_falling_02",
				"pes_generic_falling_03",
				"pes_generic_falling_04"
			},
			sound_events_duration = {
				0.89125001430511,
				1.0933125019074,
				1.1788541078568,
				0.95772916078568
			}
		},
		pes_generic_getting_dark_outside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_getting_dark_outside_01",
				"pes_generic_getting_dark_outside_02",
				"pes_generic_getting_dark_outside_03",
				"pes_generic_getting_dark_outside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_getting_dark_outside_01",
				"pes_generic_getting_dark_outside_02",
				"pes_generic_getting_dark_outside_03",
				"pes_generic_getting_dark_outside_04"
			},
			sound_events_duration = {
				1.4744583368301,
				2.2925832271576,
				1.6779375076294,
				2.9183542728424
			}
		},
		pes_generic_objective_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_objective_complete_01",
				"pes_generic_objective_complete_02",
				"pes_generic_objective_complete_03",
				"pes_generic_objective_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_objective_complete_01",
				"pes_generic_objective_complete_02",
				"pes_generic_objective_complete_03",
				"pes_generic_objective_complete_04"
			},
			sound_events_duration = {
				1.4616667032242,
				1.2503124475479,
				1.2250416278839,
				1.2772916555405
			}
		},
		pes_generic_path_blocked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_path_blocked_01",
				"pes_generic_path_blocked_02",
				"pes_generic_path_blocked_03",
				"pes_generic_path_blocked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_path_blocked_01",
				"pes_generic_path_blocked_02",
				"pes_generic_path_blocked_03",
				"pes_generic_path_blocked_04"
			},
			sound_events_duration = {
				1.085416674614,
				1.1100208759308,
				1.8353749513626,
				1.0193333625793
			}
		},
		pes_generic_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_rain_01",
				"pes_generic_rain_02",
				"pes_generic_rain_03",
				"pes_generic_rain_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_rain_01",
				"pes_generic_rain_02",
				"pes_generic_rain_03",
				"pes_generic_rain_04"
			},
			sound_events_duration = {
				1.5426249504089,
				2.6928124427795,
				2.1108124256134,
				1.9324375391007
			}
		},
		pes_generic_reaction_action = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_reaction_action_01",
				"pes_generic_reaction_action_02",
				"pes_generic_reaction_action_03",
				"pes_generic_reaction_action_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_reaction_action_01",
				"pes_generic_reaction_action_02",
				"pes_generic_reaction_action_03",
				"pes_generic_reaction_action_04"
			},
			sound_events_duration = {
				0.59364581108093,
				0.70497918128967,
				0.77420830726624,
				0.60591667890549
			}
		},
		pes_generic_reaction_sound = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_reaction_sound_01",
				"pes_generic_reaction_sound_02",
				"pes_generic_reaction_sound_03",
				"pes_generic_reaction_sound_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_reaction_sound_01",
				"pes_generic_reaction_sound_02",
				"pes_generic_reaction_sound_03",
				"pes_generic_reaction_sound_04"
			},
			sound_events_duration = {
				0.7637083530426,
				0.62362498044968,
				1.09475004673,
				1.2932916879654
			}
		},
		pes_generic_search_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_search_complete_01",
				"pes_generic_search_complete_02",
				"pes_generic_search_complete_03",
				"pes_generic_search_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_search_complete_01",
				"pes_generic_search_complete_02",
				"pes_generic_search_complete_03",
				"pes_generic_search_complete_04"
			},
			sound_events_duration = {
				1.5056458711624,
				2.0361874103546,
				1.2945417165756,
				1.2627083063126
			}
		},
		pes_generic_search_progressing = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_generic_vo",
			sound_events_n = 8,
			category = "level_talk",
			dialogue_animations_n = 8,
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
			localization_strings = {
				"pes_generic_search_progressing_01",
				"pes_generic_search_progressing_02",
				"pes_generic_search_progressing_03",
				"pes_generic_search_progressing_04",
				"pes_generic_search_progressing_05",
				"pes_generic_search_progressing_06",
				"pes_generic_search_progressing_07",
				"pes_generic_search_progressing_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_search_progressing_01",
				"pes_generic_search_progressing_02",
				"pes_generic_search_progressing_03",
				"pes_generic_search_progressing_04",
				"pes_generic_search_progressing_05",
				"pes_generic_search_progressing_06",
				"pes_generic_search_progressing_07",
				"pes_generic_search_progressing_08"
			},
			sound_events_duration = {
				0.63083332777023,
				0.8643958568573,
				0.6034791469574,
				1.2626041173935,
				0.95958334207535,
				2.1237709522247,
				2.0628333091736,
				1.2429583072662
			}
		},
		pes_generic_search_start = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_search_start_01",
				"pes_generic_search_start_02",
				"pes_generic_search_start_03",
				"pes_generic_search_start_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_search_start_01",
				"pes_generic_search_start_02",
				"pes_generic_search_start_03",
				"pes_generic_search_start_04"
			},
			sound_events_duration = {
				1.6215833425522,
				1.7004375457764,
				1.1757082939148,
				1.6234375238419
			}
		},
		pes_generic_success = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_success_01",
				"pes_generic_success_02",
				"pes_generic_success_03",
				"pes_generic_success_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_success_01",
				"pes_generic_success_02",
				"pes_generic_success_03",
				"pes_generic_success_04"
			},
			sound_events_duration = {
				1.5039374828339,
				1.138375043869,
				2.324937582016,
				1.1792291402817
			}
		},
		pes_generic_unexpected_event_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_generic_vo",
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
				"pes_generic_unexpected_event_01",
				"pes_generic_unexpected_event_02",
				"pes_generic_unexpected_event_03",
				"pes_generic_unexpected_event_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_generic_unexpected_event_01",
				"pes_generic_unexpected_event_02",
				"pes_generic_unexpected_event_03",
				"pes_generic_unexpected_event_04"
			},
			sound_events_duration = {
				0.93589586019516,
				1.2492083311081,
				1.4685833454132,
				1.2793333530426
			}
		}
	})
end
