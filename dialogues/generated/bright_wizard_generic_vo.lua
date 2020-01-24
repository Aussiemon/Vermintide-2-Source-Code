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
		name = "pbw_generic_falling",
		response = "pbw_generic_falling",
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
			},
			{
				"faction_memory",
				"generic_falling",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"generic_falling",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_generic_success = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
			category = "level_talk",
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
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_generic_vo",
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
