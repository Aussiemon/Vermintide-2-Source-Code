return function ()
	define_rule({
		name = "pwe_generic_assemble",
		response = "pwe_generic_assemble",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_cold_inside",
		response = "pwe_generic_cold_inside",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_cold_outside",
		response = "pwe_generic_cold_outside",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_dark",
		response = "pwe_generic_dark",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_door_locked",
		response = "pwe_generic_door_locked",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_generic_falling",
		name = "pwe_generic_falling",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwe_generic_getting_dark_outside",
		response = "pwe_generic_getting_dark_outside",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_objective_complete",
		response = "pwe_generic_objective_complete",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_path_blocked",
		response = "pwe_generic_path_blocked",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_rain",
		response = "pwe_generic_rain",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_reaction_action",
		response = "pwe_generic_reaction_action",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_reaction_sound",
		response = "pwe_generic_reaction_sound",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_search_complete",
		response = "pwe_generic_search_complete",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_search_progressing",
		response = "pwe_generic_search_progressing",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_search_start",
		response = "pwe_generic_search_start",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_success",
		response = "pwe_generic_success",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_generic_unexpected_event_01",
		response = "pwe_generic_unexpected_event_01",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		pwe_generic_assemble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_assemble_01",
				"pwe_generic_assemble_02",
				"pwe_generic_assemble_03",
				"pwe_generic_assemble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_assemble_01",
				"pwe_generic_assemble_02",
				"pwe_generic_assemble_03",
				"pwe_generic_assemble_04"
			},
			sound_events_duration = {
				0.93313539028168,
				1.0802291631699,
				0.86462497711182,
				1.0583750009537
			}
		},
		pwe_generic_cold_inside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_cold_inside_01",
				"pwe_generic_cold_inside_02",
				"pwe_generic_cold_inside_03",
				"pwe_generic_cold_inside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_cold_inside_01",
				"pwe_generic_cold_inside_02",
				"pwe_generic_cold_inside_03",
				"pwe_generic_cold_inside_04"
			},
			sound_events_duration = {
				3.3108749389648,
				1.8819791078568,
				3.2955832481384,
				2.697083234787
			}
		},
		pwe_generic_cold_outside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_cold_outside_01",
				"pwe_generic_cold_outside_02",
				"pwe_generic_cold_outside_03",
				"pwe_generic_cold_outside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_cold_outside_01",
				"pwe_generic_cold_outside_02",
				"pwe_generic_cold_outside_03",
				"pwe_generic_cold_outside_04"
			},
			sound_events_duration = {
				2.3587501049042,
				4.3634166717529,
				3.5642082691193,
				3.4697709083557
			}
		},
		pwe_generic_dark = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_dark_01",
				"pwe_generic_dark_02",
				"pwe_generic_dark_03",
				"pwe_generic_dark_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_dark_01",
				"pwe_generic_dark_02",
				"pwe_generic_dark_03",
				"pwe_generic_dark_04"
			},
			sound_events_duration = {
				1.5535625219345,
				2.1772916316986,
				1.1349583864212,
				1.1276249885559
			}
		},
		pwe_generic_door_locked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_door_locked_01",
				"pwe_generic_door_locked_02",
				"pwe_generic_door_locked_03",
				"pwe_generic_door_locked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_door_locked_01",
				"pwe_generic_door_locked_02",
				"pwe_generic_door_locked_03",
				"pwe_generic_door_locked_04"
			},
			sound_events_duration = {
				1.0948958396912,
				1.3822083473206,
				0.94489580392838,
				1.3007708787918
			}
		},
		pwe_generic_falling = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_falling_01",
				"pwe_generic_falling_02",
				"pwe_generic_falling_03",
				"pwe_generic_falling_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_falling_01",
				"pwe_generic_falling_02",
				"pwe_generic_falling_03",
				"pwe_generic_falling_04"
			},
			sound_events_duration = {
				1.0719791650772,
				1.1813958883286,
				0.85874998569489,
				0.98718750476837
			}
		},
		pwe_generic_getting_dark_outside = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_getting_dark_outside_01",
				"pwe_generic_getting_dark_outside_02",
				"pwe_generic_getting_dark_outside_03",
				"pwe_generic_getting_dark_outside_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_getting_dark_outside_01",
				"pwe_generic_getting_dark_outside_02",
				"pwe_generic_getting_dark_outside_03",
				"pwe_generic_getting_dark_outside_04"
			},
			sound_events_duration = {
				1.2609791755676,
				1.199979186058,
				0.98631250858307,
				2.7291042804718
			}
		},
		pwe_generic_objective_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_objective_complete_01",
				"pwe_generic_objective_complete_02",
				"pwe_generic_objective_complete_03",
				"pwe_generic_objective_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_objective_complete_01",
				"pwe_generic_objective_complete_02",
				"pwe_generic_objective_complete_03",
				"pwe_generic_objective_complete_04"
			},
			sound_events_duration = {
				1.3110208511352,
				1.4515208005905,
				0.82504165172577,
				1.9043542146683
			}
		},
		pwe_generic_path_blocked = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_path_blocked_01",
				"pwe_generic_path_blocked_02",
				"pwe_generic_path_blocked_03",
				"pwe_generic_path_blocked_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_path_blocked_01",
				"pwe_generic_path_blocked_02",
				"pwe_generic_path_blocked_03",
				"pwe_generic_path_blocked_04"
			},
			sound_events_duration = {
				0.86060416698456,
				1.9164583683014,
				1.2026666402817,
				1.2530416250229
			}
		},
		pwe_generic_rain = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_rain_01",
				"pwe_generic_rain_02",
				"pwe_generic_rain_03",
				"pwe_generic_rain_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_rain_01",
				"pwe_generic_rain_02",
				"pwe_generic_rain_03",
				"pwe_generic_rain_04"
			},
			sound_events_duration = {
				2.9373333454132,
				3.0715000629425,
				2.0232708454132,
				3.3868958950043
			}
		},
		pwe_generic_reaction_action = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_reaction_action_01",
				"pwe_generic_reaction_action_02",
				"pwe_generic_reaction_action_03",
				"pwe_generic_reaction_action_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_reaction_action_01",
				"pwe_generic_reaction_action_02",
				"pwe_generic_reaction_action_03",
				"pwe_generic_reaction_action_04"
			},
			sound_events_duration = {
				0.84531247615814,
				0.61356252431869,
				0.6590833067894,
				0.78195834159851
			}
		},
		pwe_generic_reaction_sound = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_reaction_sound_01",
				"pwe_generic_reaction_sound_02",
				"pwe_generic_reaction_sound_03",
				"pwe_generic_reaction_sound_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_reaction_sound_01",
				"pwe_generic_reaction_sound_02",
				"pwe_generic_reaction_sound_03",
				"pwe_generic_reaction_sound_04"
			},
			sound_events_duration = {
				0.88714581727982,
				0.69377082586288,
				0.91427081823349,
				0.66877084970474
			}
		},
		pwe_generic_search_complete = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_search_complete_01",
				"pwe_generic_search_complete_02",
				"pwe_generic_search_complete_03",
				"pwe_generic_search_complete_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_search_complete_01",
				"pwe_generic_search_complete_02",
				"pwe_generic_search_complete_03",
				"pwe_generic_search_complete_04"
			},
			sound_events_duration = {
				1.4399791955948,
				2.4303750991821,
				1.2553958892822,
				0.90108335018158
			}
		},
		pwe_generic_search_progressing = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_search_progressing_01",
				"pwe_generic_search_progressing_02",
				"pwe_generic_search_progressing_03",
				"pwe_generic_search_progressing_04",
				"pwe_generic_search_progressing_05",
				"pwe_generic_search_progressing_06",
				"pwe_generic_search_progressing_07",
				"pwe_generic_search_progressing_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_search_progressing_01",
				"pwe_generic_search_progressing_02",
				"pwe_generic_search_progressing_03",
				"pwe_generic_search_progressing_04",
				"pwe_generic_search_progressing_05",
				"pwe_generic_search_progressing_06",
				"pwe_generic_search_progressing_07",
				"pwe_generic_search_progressing_08"
			},
			sound_events_duration = {
				1.3226041793823,
				1.292791724205,
				0.76014584302902,
				1.6958333253861,
				1.147020816803,
				1.0779792070389,
				0.97722917795181,
				1.0869791507721
			}
		},
		pwe_generic_search_start = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_search_start_01",
				"pwe_generic_search_start_02",
				"pwe_generic_search_start_03",
				"pwe_generic_search_start_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_search_start_01",
				"pwe_generic_search_start_02",
				"pwe_generic_search_start_03",
				"pwe_generic_search_start_04"
			},
			sound_events_duration = {
				1.4576666355133,
				1.2169375419617,
				1.2753125429153,
				1.6303541660309
			}
		},
		pwe_generic_success = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_success_01",
				"pwe_generic_success_02",
				"pwe_generic_success_03",
				"pwe_generic_success_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_success_01",
				"pwe_generic_success_02",
				"pwe_generic_success_03",
				"pwe_generic_success_04"
			},
			sound_events_duration = {
				1.4882291555405,
				1.7414166927338,
				1.0034166574478,
				1.3515625
			}
		},
		pwe_generic_unexpected_event_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_generic_vo",
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
				"pwe_generic_unexpected_event_01",
				"pwe_generic_unexpected_event_02",
				"pwe_generic_unexpected_event_03",
				"pwe_generic_unexpected_event_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_generic_unexpected_event_01",
				"pwe_generic_unexpected_event_02",
				"pwe_generic_unexpected_event_03",
				"pwe_generic_unexpected_event_04"
			},
			sound_events_duration = {
				1.20412504673,
				0.99616664648056,
				1.3150207996368,
				2.914999961853
			}
		}
	})
end
