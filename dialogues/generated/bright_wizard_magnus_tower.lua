-- chunkname: @dialogues/generated/bright_wizard_magnus_tower.lua

return function ()
	define_rule({
		name = "pbw_magnus_tower_intro",
		response = "pbw_magnus_tower_intro",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_intro",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_intro",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_intro",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_magnus_tower_intro_b",
		response = "pbw_magnus_tower_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"magnus_tower_intro",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_magnus_tower_intro_c",
		response = "pbw_magnus_tower_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak",
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"magnus_tower_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_arriving_late",
		response = "pbw_objective_magnus_tower_arriving_late",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_arriving_late",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_arriving_late",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_arriving_late",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_call_elevator",
		response = "pbw_objective_magnus_tower_call_elevator",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_call_elevator",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_call_elevator",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_call_elevator",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_crescendo_starting",
		response = "pbw_objective_magnus_tower_crescendo_starting",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_crescendo_starting",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_crescendo_starting",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_crescendo_starting",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_elevator_opens_door",
		response = "pbw_objective_magnus_tower_elevator_opens_door",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_elevator_opens_door",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_elevator_opens_door",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_elevator_opens_door",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_entering_guardhouse",
		response = "pbw_objective_magnus_tower_entering_guardhouse",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_entering_guardhouse",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_entering_guardhouse",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_entering_guardhouse",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_finding_explosives",
		response = "pbw_objective_magnus_tower_finding_explosives",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_finding_explosives",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_finding_explosives_gate",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_finding_explosives_gate",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_hint_blow_horn",
		response = "pbw_objective_magnus_tower_hint_blow_horn",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_hint_blow_horn",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_hint_blow_horn",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_hint_blow_horn",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_over_rooftops",
		response = "pbw_objective_magnus_tower_over_rooftops",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_over_rooftops",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_over_rooftops",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_over_rooftops",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_reaching_top_of_magnus_tower",
		response = "pbw_objective_magnus_tower_reaching_top_of_magnus_tower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_reaching_top_of_magnus_tower",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_reaching_top_of_magnus_tower",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_reaching_top_of_magnus_tower",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_seeing_gate",
		response = "pbw_objective_magnus_tower_seeing_gate",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_seeing_gate",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_gate",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_gate",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_seeing_guardhouse",
		response = "pbw_objective_magnus_tower_seeing_guardhouse",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_seeing_guardhouse",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_guardhouse",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_guardhouse",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_seeing_tavern",
		response = "pbw_objective_magnus_tower_seeing_tavern",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_seeing_tavern",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_tavern",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_tavern",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_seeing_tower",
		response = "pbw_objective_magnus_tower_seeing_tower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_seeing_tower",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_tower",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_seeing_tower",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_to_rooftops",
		response = "pbw_objective_magnus_tower_to_rooftops",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_over_rooftops",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_over_rooftops",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_over_rooftops",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_up_stairs",
		response = "pbw_objective_magnus_tower_up_stairs",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_up_stairs",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_up_stairs",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_up_stairs",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_view_tower",
		response = "pbw_objective_magnus_tower_view_tower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_view_tower",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_view_tower",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_view_tower",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_vista",
		response = "pbw_objective_magnus_tower_vista",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_vista",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_vista",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_vista",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_magnus_tower_walking_streets",
		response = "pbw_objective_magnus_tower_walking_streets",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item",
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"magnus_tower_walking_streets",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_walking_streets",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_walking_streets",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_magnus_tower_intro = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_magnus_tower_intro_a_01",
				[2] = "pbw_magnus_tower_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_magnus_tower_intro_a_01",
				[2] = "pbw_magnus_tower_intro_a_02",
			},
			sound_events_duration = {
				[1] = 2.0632083415985,
				[2] = 2.4788541793823,
			},
		},
		pbw_magnus_tower_intro_b = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_magnus_tower_intro_b_01",
				[2] = "pbw_magnus_tower_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_magnus_tower_intro_b_01",
				[2] = "pbw_magnus_tower_intro_b_02",
			},
			sound_events_duration = {
				[1] = 2.7541251182556,
				[2] = 3.8795626163483,
			},
		},
		pbw_magnus_tower_intro_c = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_magnus_tower_intro_c_01",
				[2] = "pbw_magnus_tower_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_magnus_tower_intro_c_01",
				[2] = "pbw_magnus_tower_intro_c_02",
			},
			sound_events_duration = {
				[1] = 4.0914998054504,
				[2] = 3.8841457366943,
			},
		},
		pbw_objective_magnus_tower_arriving_late = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_arriving_late_01",
				[2] = "pbw_objective_magnus_tower_arriving_late_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_arriving_late_01",
				[2] = "pbw_objective_magnus_tower_arriving_late_02",
			},
			sound_events_duration = {
				[1] = 2.7953124046326,
				[2] = 2.4423124790192,
			},
		},
		pbw_objective_magnus_tower_call_elevator = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_happy",
				"face_contempt",
				"face_contempt",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_magnus_tower_call_elevator_01",
				"pbw_objective_magnus_tower_call_elevator_02",
				"pbw_objective_magnus_tower_call_elevator_03",
				"pbw_objective_magnus_tower_call_elevator_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_magnus_tower_call_elevator_01",
				"pbw_objective_magnus_tower_call_elevator_02",
				"pbw_objective_magnus_tower_call_elevator_03",
				"pbw_objective_magnus_tower_call_elevator_04",
			},
			sound_events_duration = {
				3.2184374332428,
				2.709458231926,
				2.6899790763855,
				3.231062412262,
			},
		},
		pbw_objective_magnus_tower_crescendo_starting = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pbw_objective_magnus_tower_crescendo_starting_01",
				"pbw_objective_magnus_tower_crescendo_starting_02",
				"pbw_objective_magnus_tower_crescendo_starting_03",
				"pbw_objective_magnus_tower_crescendo_starting_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_magnus_tower_crescendo_starting_01",
				"pbw_objective_magnus_tower_crescendo_starting_02",
				"pbw_objective_magnus_tower_crescendo_starting_03",
				"pbw_objective_magnus_tower_crescendo_starting_04",
			},
			sound_events_duration = {
				4.3058123588562,
				2.0471875667572,
				2.4613542556763,
				3.8064167499542,
			},
		},
		pbw_objective_magnus_tower_elevator_opens_door = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_magnus_tower_elevator_opens_door_01",
				"pbw_objective_magnus_tower_elevator_opens_door_02",
				"pbw_objective_magnus_tower_elevator_opens_door_03",
				"pbw_objective_magnus_tower_elevator_opens_door_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_magnus_tower_elevator_opens_door_01",
				"pbw_objective_magnus_tower_elevator_opens_door_02",
				"pbw_objective_magnus_tower_elevator_opens_door_03",
				"pbw_objective_magnus_tower_elevator_opens_door_04",
			},
			sound_events_duration = {
				1.9026875495911,
				1.8085625171661,
				2.5054166316986,
				4.3066458702087,
			},
		},
		pbw_objective_magnus_tower_entering_guardhouse = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_objective_magnus_tower_entering_guardhouse_01",
				"pbw_objective_magnus_tower_entering_guardhouse_02",
				"pbw_objective_magnus_tower_entering_guardhouse_03",
				"pbw_objective_magnus_tower_entering_guardhouse_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_magnus_tower_entering_guardhouse_01",
				"pbw_objective_magnus_tower_entering_guardhouse_02",
				"pbw_objective_magnus_tower_entering_guardhouse_03",
				"pbw_objective_magnus_tower_entering_guardhouse_04",
			},
			sound_events_duration = {
				3.3435416221619,
				4.8969583511353,
				3.8086874485016,
				4.7717289924622,
			},
		},
		pbw_objective_magnus_tower_finding_explosives = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_objective_magnus_tower_finding_explosives_01",
				"pbw_objective_magnus_tower_finding_explosives_02",
				"pbw_objective_magnus_tower_finding_explosives_03",
				"pbw_objective_magnus_tower_finding_explosives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_magnus_tower_finding_explosives_01",
				"pbw_objective_magnus_tower_finding_explosives_02",
				"pbw_objective_magnus_tower_finding_explosives_03",
				"pbw_objective_magnus_tower_finding_explosives_04",
			},
			sound_events_duration = {
				5.165958404541,
				5.9296460151672,
				3.865875005722,
				3.7890207767487,
			},
		},
		pbw_objective_magnus_tower_hint_blow_horn = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_hint_blow_horn_01",
				[2] = "pbw_objective_magnus_tower_hint_blow_horn_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_hint_blow_horn_01",
				[2] = "pbw_objective_magnus_tower_hint_blow_horn_02",
			},
			sound_events_duration = {
				[1] = 3.4000000953674,
				[2] = 3.1338748931885,
			},
		},
		pbw_objective_magnus_tower_over_rooftops = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_over_rooftops_01",
				[2] = "pbw_objective_magnus_tower_over_rooftops_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_over_rooftops_01",
				[2] = "pbw_objective_magnus_tower_over_rooftops_02",
			},
			sound_events_duration = {
				[1] = 1.0319583415985,
				[2] = 1.6000000238419,
			},
		},
		pbw_objective_magnus_tower_reaching_top_of_magnus_tower = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
			},
			localization_strings = {
				"pbw_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pbw_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pbw_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pbw_objective_magnus_tower_reaching_top_of_magnus_tower_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pbw_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pbw_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pbw_objective_magnus_tower_reaching_top_of_magnus_tower_04",
			},
			sound_events_duration = {
				3.5075833797455,
				3.2939584255219,
				3.9860417842865,
				3.1646666526794,
			},
		},
		pbw_objective_magnus_tower_seeing_gate = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_objective_magnus_tower_seeing_gate_01",
				"pbw_objective_magnus_tower_seeing_gate_02",
				"pbw_objective_magnus_tower_seeing_gate_03",
				"pbw_objective_magnus_tower_seeing_gate_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_magnus_tower_seeing_gate_01",
				"pbw_objective_magnus_tower_seeing_gate_02",
				"pbw_objective_magnus_tower_seeing_gate_03",
				"pbw_objective_magnus_tower_seeing_gate_04",
			},
			sound_events_duration = {
				1.3657292127609,
				2.170562505722,
				3.4914374351502,
				3.1268124580383,
			},
		},
		pbw_objective_magnus_tower_seeing_guardhouse = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_seeing_guardhouse_01",
				[2] = "pbw_objective_magnus_tower_seeing_guardhouse_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_seeing_guardhouse_01",
				[2] = "pbw_objective_magnus_tower_seeing_guardhouse_02",
			},
			sound_events_duration = {
				[1] = 2.8384375572205,
				[2] = 2.4577708244324,
			},
		},
		pbw_objective_magnus_tower_seeing_tavern = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_sadness",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_seeing_tavern_01",
				[2] = "pbw_objective_magnus_tower_seeing_tavern_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_seeing_tavern_01",
				[2] = "pbw_objective_magnus_tower_seeing_tavern_02",
			},
			sound_events_duration = {
				[1] = 3.533041715622,
				[2] = 2.6173748970032,
			},
		},
		pbw_objective_magnus_tower_seeing_tower = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_seeing_tower_01",
				[2] = "pbw_objective_magnus_tower_seeing_tower_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_seeing_tower_01",
				[2] = "pbw_objective_magnus_tower_seeing_tower_02",
			},
			sound_events_duration = {
				[1] = 1.0655833482742,
				[2] = 1.3348125219345,
			},
		},
		pbw_objective_magnus_tower_to_rooftops = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_neutral",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_to_rooftops_01",
				[2] = "pbw_objective_magnus_tower_to_rooftops_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_to_rooftops_01",
				[2] = "pbw_objective_magnus_tower_to_rooftops_02",
			},
			sound_events_duration = {
				[1] = 1.8508125543594,
				[2] = 1.6707916259766,
			},
		},
		pbw_objective_magnus_tower_up_stairs = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_pain",
				[2] = "face_pain",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_up_stairs_01",
				[2] = "pbw_objective_magnus_tower_up_stairs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_up_stairs_01",
				[2] = "pbw_objective_magnus_tower_up_stairs_02",
			},
			sound_events_duration = {
				[1] = 0.93908333778381,
				[2] = 1.609854221344,
			},
		},
		pbw_objective_magnus_tower_view_tower = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 4,
			face_animations_n = 4,
			randomize_indexes_n = 0,
			sound_events_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
			},
			localization_strings = {
				"pbw_objective_magnus_tower_view_tower_01",
				"pbw_objective_magnus_tower_view_tower_02",
				"pbw_objective_magnus_tower_view_tower_03",
				"pbw_objective_magnus_tower_view_tower_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_magnus_tower_view_tower_01",
				"pbw_objective_magnus_tower_view_tower_02",
				"pbw_objective_magnus_tower_view_tower_03",
				"pbw_objective_magnus_tower_view_tower_04",
			},
			sound_events_duration = {
				2.855708360672,
				3.2751874923706,
				2.275229215622,
				4.5406041145325,
			},
		},
		pbw_objective_magnus_tower_vista = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_vista_01",
				[2] = "pbw_objective_magnus_tower_vista_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_vista_01",
				[2] = "pbw_objective_magnus_tower_vista_02",
			},
			sound_events_duration = {
				[1] = 4.0412917137146,
				[2] = 5.4157085418701,
			},
		},
		pbw_objective_magnus_tower_walking_streets = {
			category = "level_talk",
			database = "bright_wizard_magnus_tower",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_talk",
				[2] = "dialogue_talk",
			},
			face_animations = {
				[1] = "face_neutral",
				[2] = "face_happy",
			},
			localization_strings = {
				[1] = "pbw_objective_magnus_tower_walking_streets_01",
				[2] = "pbw_objective_magnus_tower_walking_streets_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_objective_magnus_tower_walking_streets_01",
				[2] = "pbw_objective_magnus_tower_walking_streets_02",
			},
			sound_events_duration = {
				[1] = 3.8997292518616,
				[2] = 3.636479139328,
			},
		},
	})
end
