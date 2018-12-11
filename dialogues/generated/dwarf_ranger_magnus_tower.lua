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
		pdr_objective_magnus_tower_up_stairs = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_up_stairs_01",
				[2.0] = "pdr_objective_magnus_tower_up_stairs_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_pain",
				[2.0] = "face_pain"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_up_stairs_01",
				[2.0] = "pdr_objective_magnus_tower_up_stairs_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_view_tower = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_magnus_tower_view_tower_01",
				"pdr_objective_magnus_tower_view_tower_02",
				"pdr_objective_magnus_tower_view_tower_03",
				"pdr_objective_magnus_tower_view_tower_04"
			},
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
				"pdr_objective_magnus_tower_view_tower_01",
				"pdr_objective_magnus_tower_view_tower_02",
				"pdr_objective_magnus_tower_view_tower_03",
				"pdr_objective_magnus_tower_view_tower_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_over_rooftops = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_over_rooftops_01",
				[2.0] = "pdr_objective_magnus_tower_over_rooftops_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_over_rooftops_01",
				[2.0] = "pdr_objective_magnus_tower_over_rooftops_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_hint_blow_horn = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_hint_blow_horn_01",
				[2.0] = "pdr_objective_magnus_tower_hint_blow_horn_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_hint_blow_horn_01",
				[2.0] = "pdr_objective_magnus_tower_hint_blow_horn_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_seeing_tavern = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_seeing_tavern_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_tavern_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_sadness"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_seeing_tavern_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_tavern_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_seeing_gate = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_magnus_tower_seeing_gate_01",
				"pdr_objective_magnus_tower_seeing_gate_02",
				"pdr_objective_magnus_tower_seeing_gate_03",
				"pdr_objective_magnus_tower_seeing_gate_04"
			},
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
				"pdr_objective_magnus_tower_seeing_gate_01",
				"pdr_objective_magnus_tower_seeing_gate_02",
				"pdr_objective_magnus_tower_seeing_gate_03",
				"pdr_objective_magnus_tower_seeing_gate_04"
			},
			randomize_indexes = {}
		},
		pdr_magnus_tower_intro = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_magnus_tower_intro_a_01",
				[2.0] = "pdr_magnus_tower_intro_a_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_magnus_tower_intro_a_01",
				[2.0] = "pdr_magnus_tower_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_finding_explosives = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_magnus_tower_finding_explosives_01",
				"pdr_objective_magnus_tower_finding_explosives_02",
				"pdr_objective_magnus_tower_finding_explosives_03",
				"pdr_objective_magnus_tower_finding_explosives_04"
			},
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
				"pdr_objective_magnus_tower_finding_explosives_01",
				"pdr_objective_magnus_tower_finding_explosives_02",
				"pdr_objective_magnus_tower_finding_explosives_03",
				"pdr_objective_magnus_tower_finding_explosives_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_crescendo_starting = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_magnus_tower_crescendo_starting_01",
				"pdr_objective_magnus_tower_crescendo_starting_02",
				"pdr_objective_magnus_tower_crescendo_starting_03",
				"pdr_objective_magnus_tower_crescendo_starting_04"
			},
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
				"pdr_objective_magnus_tower_crescendo_starting_01",
				"pdr_objective_magnus_tower_crescendo_starting_02",
				"pdr_objective_magnus_tower_crescendo_starting_03",
				"pdr_objective_magnus_tower_crescendo_starting_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_seeing_tower = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_seeing_tower_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_tower_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_seeing_tower_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_tower_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_reaching_top_of_magnus_tower = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_04"
			},
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
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pdr_objective_magnus_tower_reaching_top_of_magnus_tower_04"
			},
			randomize_indexes = {}
		},
		pdr_magnus_tower_intro_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_magnus_tower_c_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_magnus_tower_c_01"
			}
		},
		pdr_magnus_tower_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_magnus_tower_intro_b_01",
				[2.0] = "pdr_magnus_tower_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_magnus_tower_intro_b_01",
				[2.0] = "pdr_magnus_tower_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_vista = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_vista_01",
				[2.0] = "pdr_objective_magnus_tower_vista_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_vista_01",
				[2.0] = "pdr_objective_magnus_tower_vista_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_arriving_late = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_arriving_late_01",
				[2.0] = "pdr_objective_magnus_tower_arriving_late_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_arriving_late_01",
				[2.0] = "pdr_objective_magnus_tower_arriving_late_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_entering_guardhouse = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_magnus_tower_entering_guardhouse_01",
				"pdr_objective_magnus_tower_entering_guardhouse_02",
				"pdr_objective_magnus_tower_entering_guardhouse_03",
				"pdr_objective_magnus_tower_entering_guardhouse_04"
			},
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
				"pdr_objective_magnus_tower_entering_guardhouse_01",
				"pdr_objective_magnus_tower_entering_guardhouse_02",
				"pdr_objective_magnus_tower_entering_guardhouse_03",
				"pdr_objective_magnus_tower_entering_guardhouse_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_call_elevator = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_magnus_tower_call_elevator_01",
				"pdr_objective_magnus_tower_call_elevator_02",
				"pdr_objective_magnus_tower_call_elevator_03",
				"pdr_objective_magnus_tower_call_elevator_04"
			},
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
				"pdr_objective_magnus_tower_call_elevator_01",
				"pdr_objective_magnus_tower_call_elevator_02",
				"pdr_objective_magnus_tower_call_elevator_03",
				"pdr_objective_magnus_tower_call_elevator_04"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_walking_streets = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_walking_streets_01",
				[2.0] = "pdr_objective_magnus_tower_walking_streets_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_walking_streets_01",
				[2.0] = "pdr_objective_magnus_tower_walking_streets_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_to_rooftops = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_to_rooftops_01",
				[2.0] = "pdr_objective_magnus_tower_to_rooftops_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_to_rooftops_01",
				[2.0] = "pdr_objective_magnus_tower_to_rooftops_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_seeing_guardhouse = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_objective_magnus_tower_seeing_guardhouse_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_guardhouse_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_objective_magnus_tower_seeing_guardhouse_01",
				[2.0] = "pdr_objective_magnus_tower_seeing_guardhouse_02"
			},
			randomize_indexes = {}
		},
		pdr_objective_magnus_tower_elevator_opens_door = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_magnus_tower",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_objective_magnus_tower_elevator_opens_door_01",
				"pdr_objective_magnus_tower_elevator_opens_door_02",
				"pdr_objective_magnus_tower_elevator_opens_door_03",
				"pdr_objective_magnus_tower_elevator_opens_door_04"
			},
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
				"pdr_objective_magnus_tower_elevator_opens_door_01",
				"pdr_objective_magnus_tower_elevator_opens_door_02",
				"pdr_objective_magnus_tower_elevator_opens_door_03",
				"pdr_objective_magnus_tower_elevator_opens_door_04"
			},
			randomize_indexes = {}
		}
	})
end
