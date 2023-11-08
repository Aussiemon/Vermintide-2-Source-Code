return function ()
	define_rule({
		name = "pdr_generic_assemble",
		response = "pdr_generic_assemble",
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
		name = "pdr_generic_cold_inside",
		response = "pdr_generic_cold_inside",
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
		name = "pdr_generic_cold_outside",
		response = "pdr_generic_cold_outside",
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
		name = "pdr_generic_dark",
		response = "pdr_generic_dark",
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
		name = "pdr_generic_door_locked",
		response = "pdr_generic_door_locked",
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
		response = "pdr_generic_falling",
		name = "pdr_generic_falling",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "pdr_generic_getting_dark_outside",
		response = "pdr_generic_getting_dark_outside",
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
		name = "pdr_generic_objective_complete",
		response = "pdr_generic_objective_complete",
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
		name = "pdr_generic_path_blocked",
		response = "pdr_generic_path_blocked",
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
		name = "pdr_generic_rain",
		response = "pdr_generic_rain",
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
		name = "pdr_generic_reaction_action",
		response = "pdr_generic_reaction_action",
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
		name = "pdr_generic_reaction_sound",
		response = "pdr_generic_reaction_sound",
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
		name = "pdr_generic_search_complete",
		response = "pdr_generic_search_complete",
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
		name = "pdr_generic_search_progressing",
		response = "pdr_generic_search_progressing",
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
		name = "pdr_generic_search_start",
		response = "pdr_generic_search_start",
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
		name = "pdr_generic_success",
		response = "pdr_generic_success",
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
		name = "pdr_generic_unexpected_event_01",
		response = "pdr_generic_unexpected_event_01",
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
		pdr_generic_assemble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_assemble_01",
				"pdr_generic_assemble_02",
				"pdr_generic_assemble_03",
				"pdr_generic_assemble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_assemble_01",
				"pdr_generic_assemble_02",
				"pdr_generic_assemble_03",
				"pdr_generic_assemble_04"
			},
			sound_events_duration = {
				1.0378541946411,
				1.3906041383743,
				1.0891666412354,
				0.81197917461395
			}
		},
		pdr_generic_cold_inside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_cold_inside_01",
				"pdr_generic_cold_inside_02",
				"pdr_generic_cold_inside_03",
				"pdr_generic_cold_inside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_cold_inside_01",
				"pdr_generic_cold_inside_02",
				"pdr_generic_cold_inside_03",
				"pdr_generic_cold_inside_04"
			},
			sound_events_duration = {
				1.8282500505447,
				2.044979095459,
				1.8795416355133,
				2.7462708950043
			}
		},
		pdr_generic_cold_outside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_cold_outside_01",
				"pdr_generic_cold_outside_02",
				"pdr_generic_cold_outside_03",
				"pdr_generic_cold_outside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_cold_outside_01",
				"pdr_generic_cold_outside_02",
				"pdr_generic_cold_outside_03",
				"pdr_generic_cold_outside_04"
			},
			sound_events_duration = {
				1.6247708797455,
				1.8080832958221,
				2.9995000362396,
				1.5468332767487
			}
		},
		pdr_generic_dark = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_dark_01",
				"pdr_generic_dark_02",
				"pdr_generic_dark_03",
				"pdr_generic_dark_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_dark_01",
				"pdr_generic_dark_02",
				"pdr_generic_dark_03",
				"pdr_generic_dark_04"
			},
			sound_events_duration = {
				2.4258124828339,
				2.3306250572205,
				1.7216875553131,
				1.7931666374207
			}
		},
		pdr_generic_door_locked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_door_locked_01",
				"pdr_generic_door_locked_02",
				"pdr_generic_door_locked_03",
				"pdr_generic_door_locked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_door_locked_01",
				"pdr_generic_door_locked_02",
				"pdr_generic_door_locked_03",
				"pdr_generic_door_locked_04"
			},
			sound_events_duration = {
				0.87543749809265,
				1.8372083902359,
				1.2600208520889,
				1.1479375362396
			}
		},
		pdr_generic_falling = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_falling_01",
				"pdr_generic_falling_02",
				"pdr_generic_falling_03",
				"pdr_generic_falling_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_falling_01",
				"pdr_generic_falling_02",
				"pdr_generic_falling_03",
				"pdr_generic_falling_04"
			},
			sound_events_duration = {
				1.3424791097641,
				1.6719791889191,
				2.022125005722,
				1.5072083473206
			}
		},
		pdr_generic_getting_dark_outside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_getting_dark_outside_01",
				"pdr_generic_getting_dark_outside_02",
				"pdr_generic_getting_dark_outside_03",
				"pdr_generic_getting_dark_outside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_getting_dark_outside_01",
				"pdr_generic_getting_dark_outside_02",
				"pdr_generic_getting_dark_outside_03",
				"pdr_generic_getting_dark_outside_04"
			},
			sound_events_duration = {
				2.4475417137146,
				2.4507915973663,
				3.2632083892822,
				1.5408333539963
			}
		},
		pdr_generic_objective_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_objective_complete_01",
				"pdr_generic_objective_complete_02",
				"pdr_generic_objective_complete_03",
				"pdr_generic_objective_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_objective_complete_01",
				"pdr_generic_objective_complete_02",
				"pdr_generic_objective_complete_03",
				"pdr_generic_objective_complete_04"
			},
			sound_events_duration = {
				0.83010417222977,
				2.0123751163483,
				2.1536250114441,
				2.4004375934601
			}
		},
		pdr_generic_path_blocked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_path_blocked_01",
				"pdr_generic_path_blocked_02",
				"pdr_generic_path_blocked_03",
				"pdr_generic_path_blocked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_path_blocked_01",
				"pdr_generic_path_blocked_02",
				"pdr_generic_path_blocked_03",
				"pdr_generic_path_blocked_04"
			},
			sound_events_duration = {
				1.6173332929611,
				1.9639791250229,
				1.6466250419617,
				1.7541667222977
			}
		},
		pdr_generic_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_rain_01",
				"pdr_generic_rain_02",
				"pdr_generic_rain_03",
				"pdr_generic_rain_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_rain_01",
				"pdr_generic_rain_02",
				"pdr_generic_rain_03",
				"pdr_generic_rain_04"
			},
			sound_events_duration = {
				2.4051041603088,
				2.2421457767487,
				3.6570000648499,
				3.7942292690277
			}
		},
		pdr_generic_reaction_action = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_reaction_action_01",
				"pdr_generic_reaction_action_02",
				"pdr_generic_reaction_action_03",
				"pdr_generic_reaction_action_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_reaction_action_01",
				"pdr_generic_reaction_action_02",
				"pdr_generic_reaction_action_03",
				"pdr_generic_reaction_action_04"
			},
			sound_events_duration = {
				0.41131249070168,
				0.41977083683014,
				1.2564166784286,
				1.0444791316986
			}
		},
		pdr_generic_reaction_sound = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_reaction_sound_01",
				"pdr_generic_reaction_sound_02",
				"pdr_generic_reaction_sound_03",
				"pdr_generic_reaction_sound_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_reaction_sound_01",
				"pdr_generic_reaction_sound_02",
				"pdr_generic_reaction_sound_03",
				"pdr_generic_reaction_sound_04"
			},
			sound_events_duration = {
				0.58787500858307,
				1.0847916603088,
				0.89272916316986,
				0.51360416412354
			}
		},
		pdr_generic_search_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_search_complete_01",
				"pdr_generic_search_complete_02",
				"pdr_generic_search_complete_03",
				"pdr_generic_search_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_search_complete_01",
				"pdr_generic_search_complete_02",
				"pdr_generic_search_complete_03",
				"pdr_generic_search_complete_04"
			},
			sound_events_duration = {
				1.2005208730698,
				0.769291639328,
				0.83379167318344,
				1.6659791469574
			}
		},
		pdr_generic_search_progressing = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_search_progressing_01",
				"pdr_generic_search_progressing_02",
				"pdr_generic_search_progressing_03",
				"pdr_generic_search_progressing_04",
				"pdr_generic_search_progressing_05",
				"pdr_generic_search_progressing_06",
				"pdr_generic_search_progressing_07",
				"pdr_generic_search_progressing_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_search_progressing_01",
				"pdr_generic_search_progressing_02",
				"pdr_generic_search_progressing_03",
				"pdr_generic_search_progressing_04",
				"pdr_generic_search_progressing_05",
				"pdr_generic_search_progressing_06",
				"pdr_generic_search_progressing_07",
				"pdr_generic_search_progressing_08"
			},
			sound_events_duration = {
				1.754979133606,
				0.93802082538605,
				1.2361249923706,
				1.3378958702087,
				1.7460416555405,
				1.0507082939148,
				1.0067708492279,
				1.2944583892822
			}
		},
		pdr_generic_search_start = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_search_start_01",
				"pdr_generic_search_start_02",
				"pdr_generic_search_start_03",
				"pdr_generic_search_start_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_search_start_01",
				"pdr_generic_search_start_02",
				"pdr_generic_search_start_03",
				"pdr_generic_search_start_04"
			},
			sound_events_duration = {
				0.96941667795181,
				0.79262501001358,
				1.2731666564941,
				1.4391249418259
			}
		},
		pdr_generic_success = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_success_01",
				"pdr_generic_success_02",
				"pdr_generic_success_03",
				"pdr_generic_success_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_success_01",
				"pdr_generic_success_02",
				"pdr_generic_success_03",
				"pdr_generic_success_04"
			},
			sound_events_duration = {
				2.0560207366943,
				2.2943542003632,
				1.8859167098999,
				1.5572082996368
			}
		},
		pdr_generic_unexpected_event_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_generic_vo",
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
				"pdr_generic_unexpected_event_01",
				"pdr_generic_unexpected_event_02",
				"pdr_generic_unexpected_event_03",
				"pdr_generic_unexpected_event_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_generic_unexpected_event_01",
				"pdr_generic_unexpected_event_02",
				"pdr_generic_unexpected_event_03",
				"pdr_generic_unexpected_event_04"
			},
			sound_events_duration = {
				1.0296041965485,
				2.1623332500458,
				1.0525833368301,
				1.1214791536331
			}
		}
	})
end
