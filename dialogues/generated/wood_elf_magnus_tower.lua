return function ()
	define_rule({
		name = "pwe_magnus_tower_intro",
		response = "pwe_magnus_tower_intro",
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
		name = "pwe_magnus_tower_intro_b",
		response = "pwe_magnus_tower_intro_b",
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
				"wood_elf"
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
		name = "pwe_magnus_tower_intro_c",
		response = "pwe_magnus_tower_intro_c",
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
				"wood_elf"
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
	define_rule({
		name = "pwe_objective_magnus_tower_arriving_late",
		response = "pwe_objective_magnus_tower_arriving_late",
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
		name = "pwe_objective_magnus_tower_call_elevator",
		response = "pwe_objective_magnus_tower_call_elevator",
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
		name = "pwe_objective_magnus_tower_crescendo_starting",
		response = "pwe_objective_magnus_tower_crescendo_starting",
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
		name = "pwe_objective_magnus_tower_elevator_opens_door",
		response = "pwe_objective_magnus_tower_elevator_opens_door",
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
		name = "pwe_objective_magnus_tower_entering_guardhouse",
		response = "pwe_objective_magnus_tower_entering_guardhouse",
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
		name = "pwe_objective_magnus_tower_finding_explosives",
		response = "pwe_objective_magnus_tower_finding_explosives",
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
		name = "pwe_objective_magnus_tower_hint_blow_horn",
		response = "pwe_objective_magnus_tower_hint_blow_horn",
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
		name = "pwe_objective_magnus_tower_how_to_escape",
		response = "pwe_objective_magnus_tower_how_to_escape",
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
				"magnus_tower_how_to_escape"
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
				"time_since_magnus_tower_how_to_escape",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_how_to_escape",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_objective_magnus_tower_over_rooftops",
		response = "pwe_objective_magnus_tower_over_rooftops",
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
		name = "pwe_objective_magnus_tower_reaching_top_of_magnus_tower",
		response = "pwe_objective_magnus_tower_reaching_top_of_magnus_tower",
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
		name = "pwe_objective_magnus_tower_seeing_gate",
		response = "pwe_objective_magnus_tower_seeing_gate",
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
		name = "pwe_objective_magnus_tower_seeing_guardhouse",
		response = "pwe_objective_magnus_tower_seeing_guardhouse",
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
		name = "pwe_objective_magnus_tower_seeing_tavern",
		response = "pwe_objective_magnus_tower_seeing_tavern",
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
		name = "pwe_objective_magnus_tower_seeing_tower",
		response = "pwe_objective_magnus_tower_seeing_tower",
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
		name = "pwe_objective_magnus_tower_to_rooftops",
		response = "pwe_objective_magnus_tower_to_rooftops",
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
		name = "pwe_objective_magnus_tower_up_stairs",
		response = "pwe_objective_magnus_tower_up_stairs",
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
		name = "pwe_objective_magnus_tower_view_tower",
		response = "pwe_objective_magnus_tower_view_tower",
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
		name = "pwe_objective_magnus_tower_vista",
		response = "pwe_objective_magnus_tower_vista",
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
		name = "pwe_objective_magnus_tower_walking_streets",
		response = "pwe_objective_magnus_tower_walking_streets",
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
	add_dialogues({
		pwe_magnus_tower_intro = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_magnus_tower_intro_a_01",
				[2.0] = "pwe_magnus_tower_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_magnus_tower_intro_a_01",
				[2.0] = "pwe_magnus_tower_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 3.2791249752045,
				[2.0] = 3.0829583406448
			}
		},
		pwe_magnus_tower_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_magnus_tower_intro_b_01",
				[2.0] = "pwe_magnus_tower_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_magnus_tower_intro_b_01",
				[2.0] = "pwe_magnus_tower_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.5105834007263,
				[2.0] = 3.1481041908264
			}
		},
		pwe_magnus_tower_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_magnus_tower_intro_c_01",
				[2.0] = "pwe_magnus_tower_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_magnus_tower_intro_c_01",
				[2.0] = "pwe_magnus_tower_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.7817916870117,
				[2.0] = 3.2339999675751
			}
		},
		pwe_objective_magnus_tower_arriving_late = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_arriving_late_01",
				[2.0] = "pwe_objective_magnus_tower_arriving_late_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_arriving_late_01",
				[2.0] = "pwe_objective_magnus_tower_arriving_late_02"
			},
			sound_events_duration = {
				[1.0] = 3.0424165725708,
				[2.0] = 3.1182916164398
			}
		},
		pwe_objective_magnus_tower_call_elevator = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
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
				"face_happy",
				"face_contempt",
				"face_contempt",
				"face_neutral"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_call_elevator_01",
				"pwe_objective_magnus_tower_call_elevator_02",
				"pwe_objective_magnus_tower_call_elevator_03",
				"pwe_objective_magnus_tower_call_elevator_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_call_elevator_01",
				"pwe_objective_magnus_tower_call_elevator_02",
				"pwe_objective_magnus_tower_call_elevator_03",
				"pwe_objective_magnus_tower_call_elevator_04"
			},
			sound_events_duration = {
				6.4579792022705,
				2.772479057312,
				2.9230000972748,
				5.2707290649414
			}
		},
		pwe_objective_magnus_tower_crescendo_starting = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
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
				"face_neutral",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_crescendo_starting_01",
				"pwe_objective_magnus_tower_crescendo_starting_02",
				"pwe_objective_magnus_tower_crescendo_starting_03",
				"pwe_objective_magnus_tower_crescendo_starting_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_crescendo_starting_01",
				"pwe_objective_magnus_tower_crescendo_starting_02",
				"pwe_objective_magnus_tower_crescendo_starting_03",
				"pwe_objective_magnus_tower_crescendo_starting_04"
			},
			sound_events_duration = {
				1.3703124523163,
				1.8594583272934,
				1.6826666593552,
				1.2689583301544
			}
		},
		pwe_objective_magnus_tower_elevator_opens_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_elevator_opens_door_01",
				"pwe_objective_magnus_tower_elevator_opens_door_02",
				"pwe_objective_magnus_tower_elevator_opens_door_03",
				"pwe_objective_magnus_tower_elevator_opens_door_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_elevator_opens_door_01",
				"pwe_objective_magnus_tower_elevator_opens_door_02",
				"pwe_objective_magnus_tower_elevator_opens_door_03",
				"pwe_objective_magnus_tower_elevator_opens_door_04"
			},
			sound_events_duration = {
				2.2975833415985,
				1.1853541135788,
				2.777937412262,
				3.6286458969116
			}
		},
		pwe_objective_magnus_tower_entering_guardhouse = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_entering_guardhouse_01",
				"pwe_objective_magnus_tower_entering_guardhouse_02",
				"pwe_objective_magnus_tower_entering_guardhouse_03",
				"pwe_objective_magnus_tower_entering_guardhouse_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_entering_guardhouse_01",
				"pwe_objective_magnus_tower_entering_guardhouse_02",
				"pwe_objective_magnus_tower_entering_guardhouse_03",
				"pwe_objective_magnus_tower_entering_guardhouse_04"
			},
			sound_events_duration = {
				2.6057708263397,
				3,
				3.5001249313355,
				4.6963543891907
			}
		},
		pwe_objective_magnus_tower_finding_explosives = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_finding_explosives_01",
				"pwe_objective_magnus_tower_finding_explosives_02",
				"pwe_objective_magnus_tower_finding_explosives_03",
				"pwe_objective_magnus_tower_finding_explosives_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_finding_explosives_01",
				"pwe_objective_magnus_tower_finding_explosives_02",
				"pwe_objective_magnus_tower_finding_explosives_03",
				"pwe_objective_magnus_tower_finding_explosives_04"
			},
			sound_events_duration = {
				3.4000000953674,
				4.019896030426,
				5.8093123435974,
				4.9100208282471
			}
		},
		pwe_objective_magnus_tower_hint_blow_horn = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_hint_blow_horn_01",
				[2.0] = "pwe_objective_magnus_tower_hint_blow_horn_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_hint_blow_horn_01",
				[2.0] = "pwe_objective_magnus_tower_hint_blow_horn_02"
			},
			sound_events_duration = {
				[1.0] = 3.9701249599457,
				[2.0] = 3.6369791030884
			}
		},
		pwe_objective_magnus_tower_how_to_escape = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
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
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_how_to_escape_01",
				"pwe_objective_magnus_tower_how_to_escape_02",
				"pwe_objective_magnus_tower_how_to_escape_03",
				"pwe_objective_magnus_tower_how_to_escape_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_how_to_escape_01",
				"pwe_objective_magnus_tower_how_to_escape_02",
				"pwe_objective_magnus_tower_how_to_escape_03",
				"pwe_objective_magnus_tower_how_to_escape_04"
			},
			sound_events_duration = {
				5.2826457023621,
				2.6156666278839,
				4.8289375305176,
				4.7776665687561
			}
		},
		pwe_objective_magnus_tower_over_rooftops = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_over_rooftops_01",
				[2.0] = "pwe_objective_magnus_tower_over_rooftops_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_over_rooftops_01",
				[2.0] = "pwe_objective_magnus_tower_over_rooftops_02"
			},
			sound_events_duration = {
				[1.0] = 4.2457914352417,
				[2.0] = 2.7546875476837
			}
		},
		pwe_objective_magnus_tower_reaching_top_of_magnus_tower = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pwe_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pwe_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pwe_objective_magnus_tower_reaching_top_of_magnus_tower_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pwe_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pwe_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pwe_objective_magnus_tower_reaching_top_of_magnus_tower_04"
			},
			sound_events_duration = {
				1.4711250066757,
				2.0699791908264,
				2.6691665649414,
				3.1344165802002
			}
		},
		pwe_objective_magnus_tower_seeing_gate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_seeing_gate_01",
				"pwe_objective_magnus_tower_seeing_gate_02",
				"pwe_objective_magnus_tower_seeing_gate_03",
				"pwe_objective_magnus_tower_seeing_gate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_seeing_gate_01",
				"pwe_objective_magnus_tower_seeing_gate_02",
				"pwe_objective_magnus_tower_seeing_gate_03",
				"pwe_objective_magnus_tower_seeing_gate_04"
			},
			sound_events_duration = {
				1.6175416707993,
				4.1999998092651,
				1.20412504673,
				2.3107707500458
			}
		},
		pwe_objective_magnus_tower_seeing_guardhouse = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_seeing_guardhouse_01",
				[2.0] = "pwe_objective_magnus_tower_seeing_guardhouse_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_seeing_guardhouse_01",
				[2.0] = "pwe_objective_magnus_tower_seeing_guardhouse_02"
			},
			sound_events_duration = {
				[1.0] = 3.4413750171661,
				[2.0] = 2.943062543869
			}
		},
		pwe_objective_magnus_tower_seeing_tavern = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_sadness"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_seeing_tavern_01",
				[2.0] = "pwe_objective_magnus_tower_seeing_tavern_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_seeing_tavern_01",
				[2.0] = "pwe_objective_magnus_tower_seeing_tavern_02"
			},
			sound_events_duration = {
				[1.0] = 3.252729177475,
				[2.0] = 3.8272707462311
			}
		},
		pwe_objective_magnus_tower_seeing_tower = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_seeing_tower_01",
				[2.0] = "pwe_objective_magnus_tower_seeing_tower_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_seeing_tower_01",
				[2.0] = "pwe_objective_magnus_tower_seeing_tower_02"
			},
			sound_events_duration = {
				[1.0] = 2.0752499103546,
				[2.0] = 3.554864525795
			}
		},
		pwe_objective_magnus_tower_to_rooftops = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_to_rooftops_01",
				[2.0] = "pwe_objective_magnus_tower_to_rooftops_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_to_rooftops_01",
				[2.0] = "pwe_objective_magnus_tower_to_rooftops_02"
			},
			sound_events_duration = {
				[1.0] = 2.4597916603088,
				[2.0] = 2.2564896345139
			}
		},
		pwe_objective_magnus_tower_up_stairs = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_pain",
				[2.0] = "face_pain"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_up_stairs_01",
				[2.0] = "pwe_objective_magnus_tower_up_stairs_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_up_stairs_01",
				[2.0] = "pwe_objective_magnus_tower_up_stairs_02"
			},
			sound_events_duration = {
				[1.0] = 4.565593957901,
				[2.0] = 4.7198333740234
			}
		},
		pwe_objective_magnus_tower_view_tower = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_magnus_tower",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_objective_magnus_tower_view_tower_01",
				"pwe_objective_magnus_tower_view_tower_02",
				"pwe_objective_magnus_tower_view_tower_03",
				"pwe_objective_magnus_tower_view_tower_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_magnus_tower_view_tower_01",
				"pwe_objective_magnus_tower_view_tower_02",
				"pwe_objective_magnus_tower_view_tower_03",
				"pwe_objective_magnus_tower_view_tower_04"
			},
			sound_events_duration = {
				3.2059166431427,
				2.0631875991821,
				2.5213749408722,
				3.2023541927338
			}
		},
		pwe_objective_magnus_tower_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_vista_01",
				[2.0] = "pwe_objective_magnus_tower_vista_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_vista_01",
				[2.0] = "pwe_objective_magnus_tower_vista_02"
			},
			sound_events_duration = {
				[1.0] = 2.4858124256134,
				[2.0] = 3.2999999523163
			}
		},
		pwe_objective_magnus_tower_walking_streets = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_magnus_tower",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_objective_magnus_tower_walking_streets_01",
				[2.0] = "pwe_objective_magnus_tower_walking_streets_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_objective_magnus_tower_walking_streets_01",
				[2.0] = "pwe_objective_magnus_tower_walking_streets_02"
			},
			sound_events_duration = {
				[1.0] = 4.8299374580383,
				[2.0] = 3.5540626049042
			}
		}
	})
end
