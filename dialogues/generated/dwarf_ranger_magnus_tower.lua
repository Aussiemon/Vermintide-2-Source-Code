return function ()
	define_rule({
		name = "pdr_objective_magnus_tower_view_tower",
		response = "pdr_objective_magnus_tower_view_tower",
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
				"magnus_tower_view_tower"
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
				"time_since_magnus_tower_view_tower",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_view_tower",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_entering_guardhouse",
		response = "pdr_objective_magnus_tower_entering_guardhouse",
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
				"magnus_tower_entering_guardhouse"
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
				"time_since_magnus_tower_entering_guardhouse",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_entering_guardhouse",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_seeing_gate",
		response = "pdr_objective_magnus_tower_seeing_gate",
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
				"magnus_tower_seeing_gate"
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
				"time_since_magnus_tower_seeing_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_finding_explosives",
		response = "pdr_objective_magnus_tower_finding_explosives",
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
				"magnus_tower_finding_explosives"
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
				"time_since_magnus_tower_finding_explosives_gate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_finding_explosives_gate",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_reaching_top_of_magnus_tower",
		response = "pdr_objective_magnus_tower_reaching_top_of_magnus_tower",
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
				"magnus_tower_reaching_top_of_magnus_tower"
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
				"time_since_magnus_tower_reaching_top_of_magnus_tower",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_reaching_top_of_magnus_tower",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_crescendo_starting",
		response = "pdr_objective_magnus_tower_crescendo_starting",
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
				"magnus_tower_crescendo_starting"
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
				"time_since_magnus_tower_crescendo_starting",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_crescendo_starting",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_call_elevator",
		response = "pdr_objective_magnus_tower_call_elevator",
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
				"magnus_tower_call_elevator"
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
				"time_since_magnus_tower_call_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_call_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_elevator_opens_door",
		response = "pdr_objective_magnus_tower_elevator_opens_door",
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
				"magnus_tower_elevator_opens_door"
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
				"time_since_magnus_tower_elevator_opens_door",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_elevator_opens_door",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_seeing_guardhouse",
		response = "pdr_objective_magnus_tower_seeing_guardhouse",
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
				"magnus_tower_seeing_guardhouse"
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
				"time_since_magnus_tower_seeing_guardhouse",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_guardhouse",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_up_stairs",
		response = "pdr_objective_magnus_tower_up_stairs",
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
				"magnus_tower_up_stairs"
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
				"time_since_magnus_tower_up_stairs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_up_stairs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_seeing_tavern",
		response = "pdr_objective_magnus_tower_seeing_tavern",
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
				"magnus_tower_seeing_tavern"
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
				"time_since_magnus_tower_seeing_tavern",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_tavern",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_to_rooftops",
		response = "pdr_objective_magnus_tower_to_rooftops",
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
				"magnus_tower_over_rooftops"
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
				"time_since_magnus_tower_over_rooftops",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_over_rooftops",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_over_rooftops",
		response = "pdr_objective_magnus_tower_over_rooftops",
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
				"magnus_tower_over_rooftops"
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
				"time_since_magnus_tower_over_rooftops",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_over_rooftops",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_seeing_tower",
		response = "pdr_objective_magnus_tower_seeing_tower",
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
				"magnus_tower_seeing_tower"
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
				"time_since_magnus_tower_seeing_tower",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_tower",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_walking_streets",
		response = "pdr_objective_magnus_tower_walking_streets",
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
				"magnus_tower_walking_streets"
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
				"time_since_magnus_tower_walking_streets",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_walking_streets",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_hint_blow_horn",
		response = "pdr_objective_magnus_tower_hint_blow_horn",
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
				"magnus_tower_hint_blow_horn"
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
				"time_since_magnus_tower_hint_blow_horn",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_hint_blow_horn",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_arriving_late",
		response = "pdr_objective_magnus_tower_arriving_late",
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
				"magnus_tower_arriving_late"
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
				"time_since_magnus_tower_arriving_late",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_arriving_late",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_objective_magnus_tower_vista",
		response = "pdr_objective_magnus_tower_vista",
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
				"magnus_tower_vista"
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
				"time_since_magnus_tower_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_magnus_tower_intro",
		response = "pdr_magnus_tower_intro",
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
				"magnus_tower_intro"
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
				"time_since_magnus_tower_intro",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_intro",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_magnus_tower_intro_b",
		response = "pdr_magnus_tower_intro_b",
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
				"magnus_tower_intro"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_magnus_tower_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_magnus_tower_intro_c",
		response = "pdr_magnus_tower_intro_c",
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
				"magnus_tower_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_magnus_tower_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_intro_c",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pdr_objective_magnus_tower_over_rooftops = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_over_rooftops_01",
				[2.0] = "pdr_objective_magnus_tower_over_rooftops_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_over_rooftops_01",
				[2.0] = "pdr_objective_magnus_tower_over_rooftops_02"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 1.321729183197,
				[2.0] = 2.1973540782928
			}
		},
		pdr_objective_magnus_tower_hint_blow_horn = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_hint_blow_horn_01",
				[2.0] = "pdr_objective_magnus_tower_hint_blow_horn_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_hint_blow_horn_01",
				[2.0] = "pdr_objective_magnus_tower_hint_blow_horn_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.1983125209808,
				[2.0] = 3.20347905159
			}
		},
		pdr_objective_magnus_tower_seeing_guardhouse = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_seeing_guardhouse_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_guardhouse_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_seeing_guardhouse_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_guardhouse_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.873104095459,
				[2.0] = 3.7648749351502
			}
		},
		pdr_objective_magnus_tower_finding_explosives = {
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_objective_magnus_tower_finding_explosives_01",
				"pdr_objective_magnus_tower_finding_explosives_02",
				"pdr_objective_magnus_tower_finding_explosives_03",
				"pdr_objective_magnus_tower_finding_explosives_04"
			},
			sound_events = {
				"pdr_objective_magnus_tower_finding_explosives_01",
				"pdr_objective_magnus_tower_finding_explosives_02",
				"pdr_objective_magnus_tower_finding_explosives_03",
				"pdr_objective_magnus_tower_finding_explosives_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.4722084999084,
				4.6427707672119,
				4.9427709579468,
				3.6420209407806
			}
		},
		pdr_magnus_tower_intro_b = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_magnus_tower_intro_b_01",
				[2.0] = "pdr_magnus_tower_intro_b_02"
			},
			sound_events = {
				[1.0] = "pdr_magnus_tower_intro_b_01",
				[2.0] = "pdr_magnus_tower_intro_b_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.1083540916443,
				[2.0] = 2.7762291431427
			}
		},
		pdr_objective_magnus_tower_arriving_late = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_arriving_late_01",
				[2.0] = "pdr_objective_magnus_tower_arriving_late_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_arriving_late_01",
				[2.0] = "pdr_objective_magnus_tower_arriving_late_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.2364792823791,
				[2.0] = 5.4926042556763
			}
		},
		pdr_objective_magnus_tower_vista = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_vista_01",
				[2.0] = "pdr_objective_magnus_tower_vista_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_vista_01",
				[2.0] = "pdr_objective_magnus_tower_vista_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.836395740509,
				[2.0] = 3.3622915744781
			}
		},
		pdr_objective_magnus_tower_crescendo_starting = {
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_objective_magnus_tower_crescendo_starting_01",
				"pdr_objective_magnus_tower_crescendo_starting_02",
				"pdr_objective_magnus_tower_crescendo_starting_03",
				"pdr_objective_magnus_tower_crescendo_starting_04"
			},
			sound_events = {
				"pdr_objective_magnus_tower_crescendo_starting_01",
				"pdr_objective_magnus_tower_crescendo_starting_02",
				"pdr_objective_magnus_tower_crescendo_starting_03",
				"pdr_objective_magnus_tower_crescendo_starting_04"
			},
			face_animations = {
				"face_neutral",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.1825624704361,
				4.7373542785644,
				3.0111665725708,
				1.5705833435059
			}
		},
		pdr_objective_magnus_tower_elevator_opens_door = {
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_objective_magnus_tower_elevator_opens_door_01",
				"pdr_objective_magnus_tower_elevator_opens_door_02",
				"pdr_objective_magnus_tower_elevator_opens_door_03",
				"pdr_objective_magnus_tower_elevator_opens_door_04"
			},
			sound_events = {
				"pdr_objective_magnus_tower_elevator_opens_door_01",
				"pdr_objective_magnus_tower_elevator_opens_door_02",
				"pdr_objective_magnus_tower_elevator_opens_door_03",
				"pdr_objective_magnus_tower_elevator_opens_door_04"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.9931458234787,
				1.1735208034515,
				2.2839167118073,
				1.0922083854675
			}
		},
		pdr_objective_magnus_tower_walking_streets = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_walking_streets_01",
				[2.0] = "pdr_objective_magnus_tower_walking_streets_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_walking_streets_01",
				[2.0] = "pdr_objective_magnus_tower_walking_streets_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.7346665859222,
				[2.0] = 2.6140208244324
			}
		},
		pdr_objective_magnus_tower_seeing_gate = {
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_objective_magnus_tower_seeing_gate_01",
				"pdr_objective_magnus_tower_seeing_gate_02",
				"pdr_objective_magnus_tower_seeing_gate_03",
				"pdr_objective_magnus_tower_seeing_gate_04"
			},
			sound_events = {
				"pdr_objective_magnus_tower_seeing_gate_01",
				"pdr_objective_magnus_tower_seeing_gate_02",
				"pdr_objective_magnus_tower_seeing_gate_03",
				"pdr_objective_magnus_tower_seeing_gate_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7407083511352,
				3.2616250514984,
				2.0719165802002,
				2.4269375801086
			}
		},
		pdr_objective_magnus_tower_to_rooftops = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_to_rooftops_01",
				[2.0] = "pdr_objective_magnus_tower_to_rooftops_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_to_rooftops_01",
				[2.0] = "pdr_objective_magnus_tower_to_rooftops_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.5070209503174,
				[2.0] = 3.748229265213
			}
		},
		pdr_objective_magnus_tower_view_tower = {
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_objective_magnus_tower_view_tower_01",
				"pdr_objective_magnus_tower_view_tower_02",
				"pdr_objective_magnus_tower_view_tower_03",
				"pdr_objective_magnus_tower_view_tower_04"
			},
			sound_events = {
				"pdr_objective_magnus_tower_view_tower_01",
				"pdr_objective_magnus_tower_view_tower_02",
				"pdr_objective_magnus_tower_view_tower_03",
				"pdr_objective_magnus_tower_view_tower_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.3237082958221,
				1.954916715622,
				2.0241458415985,
				2.3544790744781
			}
		},
		pdr_magnus_tower_intro = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_magnus_tower_intro_a_01",
				[2.0] = "pdr_magnus_tower_intro_a_02"
			},
			sound_events = {
				[1.0] = "pdr_magnus_tower_intro_a_01",
				[2.0] = "pdr_magnus_tower_intro_a_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.674604177475,
				[2.0] = 2.1760416030884
			}
		},
		pdr_magnus_tower_intro_c = {
			face_animations_n = 1,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 1,
			category = "level_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_magnus_tower_c_01"
			},
			sound_events = {
				[1.0] = "pdr_magnus_tower_c_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.0378541946411
			}
		},
		pdr_objective_magnus_tower_seeing_tower = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_seeing_tower_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_tower_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_seeing_tower_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_tower_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.126874923706,
				[2.0] = 3.3912498950958
			}
		},
		pdr_objective_magnus_tower_seeing_tavern = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_seeing_tavern_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_tavern_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_seeing_tavern_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_tavern_02"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_sadness"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.3796875476837,
				[2.0] = 3.2554376125336
			}
		},
		pdr_objective_magnus_tower_entering_guardhouse = {
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_objective_magnus_tower_entering_guardhouse_01",
				"pdr_objective_magnus_tower_entering_guardhouse_02",
				"pdr_objective_magnus_tower_entering_guardhouse_03",
				"pdr_objective_magnus_tower_entering_guardhouse_04"
			},
			sound_events = {
				"pdr_objective_magnus_tower_entering_guardhouse_01",
				"pdr_objective_magnus_tower_entering_guardhouse_02",
				"pdr_objective_magnus_tower_entering_guardhouse_03",
				"pdr_objective_magnus_tower_entering_guardhouse_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.8446457386017,
				4.1619167327881,
				3.3928124904633,
				3.8709790706634
			}
		},
		pdr_objective_magnus_tower_up_stairs = {
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_up_stairs_01",
				[2.0] = "pdr_objective_magnus_tower_up_stairs_02"
			},
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_up_stairs_01",
				[2.0] = "pdr_objective_magnus_tower_up_stairs_02"
			},
			face_animations = {
				[1.0] = "face_pain",
				[2.0] = "face_pain"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.5765624046326,
				[2.0] = 1.9591250419617
			}
		},
		pdr_objective_magnus_tower_call_elevator = {
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_objective_magnus_tower_call_elevator_01",
				"pdr_objective_magnus_tower_call_elevator_02",
				"pdr_objective_magnus_tower_call_elevator_03",
				"pdr_objective_magnus_tower_call_elevator_04"
			},
			sound_events = {
				"pdr_objective_magnus_tower_call_elevator_01",
				"pdr_objective_magnus_tower_call_elevator_02",
				"pdr_objective_magnus_tower_call_elevator_03",
				"pdr_objective_magnus_tower_call_elevator_04"
			},
			face_animations = {
				"face_happy",
				"face_contempt",
				"face_contempt",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.016104221344,
				1.4541666507721,
				1.0784167051315,
				2.0676250457764
			}
		},
		pdr_objective_magnus_tower_reaching_top_of_magnus_tower = {
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_04"
			},
			sound_events = {
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7401875257492,
				3.940708398819,
				1.786812543869,
				2.5691249370575
			}
		}
	})
end
