-- chunkname: @dialogues/generated/witch_hunter_magnus_tower.lua

return function ()
	define_rule({
		name = "pwh_magnus_tower_intro",
		probability = 1,
		response = "pwh_magnus_tower_intro",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_magnus_tower_intro_b",
		probability = 1,
		response = "pwh_magnus_tower_intro_b",
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
				"witch_hunter",
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
		name = "pwh_magnus_tower_intro_c",
		probability = 1,
		response = "pwh_magnus_tower_intro_c",
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
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_arriving_late",
		probability = 1,
		response = "pwh_objective_magnus_tower_arriving_late",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_call_elevator",
		probability = 1,
		response = "pwh_objective_magnus_tower_call_elevator",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_crescendo_starting",
		probability = 1,
		response = "pwh_objective_magnus_tower_crescendo_starting",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_elevator_opens_door",
		probability = 1,
		response = "pwh_objective_magnus_tower_elevator_opens_door",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_entering_guardhouse",
		probability = 1,
		response = "pwh_objective_magnus_tower_entering_guardhouse",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_finding_explosives",
		probability = 1,
		response = "pwh_objective_magnus_tower_finding_explosives",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_hint_blow_horn",
		probability = 1,
		response = "pwh_objective_magnus_tower_hint_blow_horn",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_how_to_escape",
		probability = 1,
		response = "pwh_objective_magnus_tower_how_to_escape",
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
				"magnus_tower_how_to_escape",
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"time_since_magnus_tower_how_to_escape",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_magnus_tower_how_to_escape",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_objective_magnus_tower_over_rooftops",
		probability = 1,
		response = "pwh_objective_magnus_tower_over_rooftops",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_reaching_top_of_magnus_tower",
		probability = 1,
		response = "pwh_objective_magnus_tower_reaching_top_of_magnus_tower",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_seeing_gate",
		probability = 1,
		response = "pwh_objective_magnus_tower_seeing_gate",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_seeing_guardhouse",
		probability = 1,
		response = "pwh_objective_magnus_tower_seeing_guardhouse",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_seeing_tavern",
		probability = 1,
		response = "pwh_objective_magnus_tower_seeing_tavern",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_seeing_tower",
		probability = 1,
		response = "pwh_objective_magnus_tower_seeing_tower",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_to_rooftops",
		probability = 1,
		response = "pwh_objective_magnus_tower_to_rooftops",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_up_stairs",
		probability = 1,
		response = "pwh_objective_magnus_tower_up_stairs",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_view_tower",
		probability = 1,
		response = "pwh_objective_magnus_tower_view_tower",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_vista",
		probability = 1,
		response = "pwh_objective_magnus_tower_vista",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		name = "pwh_objective_magnus_tower_walking_streets",
		probability = 1,
		response = "pwh_objective_magnus_tower_walking_streets",
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
				"witch_hunter",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
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
		pwh_magnus_tower_intro = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_magnus_tower_intro_a_01",
				[2] = "pwh_magnus_tower_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_magnus_tower_intro_a_01",
				[2] = "pwh_magnus_tower_intro_a_02",
			},
			sound_events_duration = {
				[1] = 2.8771874904633,
				[2] = 3.9559373855591,
			},
		},
		pwh_magnus_tower_intro_b = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_magnus_tower_intro_b_01",
				[2] = "pwh_magnus_tower_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_magnus_tower_intro_b_01",
				[2] = "pwh_magnus_tower_intro_b_02",
			},
			sound_events_duration = {
				[1] = 3.2061874866486,
				[2] = 2.7396042346954,
			},
		},
		pwh_magnus_tower_intro_c = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_magnus_tower_intro_c_01",
				[2] = "pwh_magnus_tower_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_magnus_tower_intro_c_01",
				[2] = "pwh_magnus_tower_intro_c_02",
			},
			sound_events_duration = {
				[1] = 3.7769374847412,
				[2] = 3.18714594841,
			},
		},
		pwh_objective_magnus_tower_arriving_late = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_arriving_late_01",
				[2] = "pwh_objective_magnus_tower_arriving_late_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_arriving_late_01",
				[2] = "pwh_objective_magnus_tower_arriving_late_02",
			},
			sound_events_duration = {
				[1] = 5.1999998092651,
				[2] = 4.6674165725708,
			},
		},
		pwh_objective_magnus_tower_call_elevator = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"pwh_objective_magnus_tower_call_elevator_01",
				"pwh_objective_magnus_tower_call_elevator_02",
				"pwh_objective_magnus_tower_call_elevator_03",
				"pwh_objective_magnus_tower_call_elevator_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_call_elevator_01",
				"pwh_objective_magnus_tower_call_elevator_02",
				"pwh_objective_magnus_tower_call_elevator_03",
				"pwh_objective_magnus_tower_call_elevator_04",
			},
			sound_events_duration = {
				2.2000000476837,
				1.460000038147,
				2.7771666049957,
				2.6200625896454,
			},
		},
		pwh_objective_magnus_tower_crescendo_starting = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"pwh_objective_magnus_tower_crescendo_starting_01",
				"pwh_objective_magnus_tower_crescendo_starting_02",
				"pwh_objective_magnus_tower_crescendo_starting_03",
				"pwh_objective_magnus_tower_crescendo_starting_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_crescendo_starting_01",
				"pwh_objective_magnus_tower_crescendo_starting_02",
				"pwh_objective_magnus_tower_crescendo_starting_03",
				"pwh_objective_magnus_tower_crescendo_starting_04",
			},
			sound_events_duration = {
				4.8280415534973,
				4.6878123283386,
				5.586437702179,
				3.703958272934,
			},
		},
		pwh_objective_magnus_tower_elevator_opens_door = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"pwh_objective_magnus_tower_elevator_opens_door_01",
				"pwh_objective_magnus_tower_elevator_opens_door_02",
				"pwh_objective_magnus_tower_elevator_opens_door_03",
				"pwh_objective_magnus_tower_elevator_opens_door_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_elevator_opens_door_01",
				"pwh_objective_magnus_tower_elevator_opens_door_02",
				"pwh_objective_magnus_tower_elevator_opens_door_03",
				"pwh_objective_magnus_tower_elevator_opens_door_04",
			},
			sound_events_duration = {
				1.141562461853,
				2.30504155159,
				1.2106666564941,
				3.094583272934,
			},
		},
		pwh_objective_magnus_tower_entering_guardhouse = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"pwh_objective_magnus_tower_entering_guardhouse_01",
				"pwh_objective_magnus_tower_entering_guardhouse_02",
				"pwh_objective_magnus_tower_entering_guardhouse_03",
				"pwh_objective_magnus_tower_entering_guardhouse_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_entering_guardhouse_01",
				"pwh_objective_magnus_tower_entering_guardhouse_02",
				"pwh_objective_magnus_tower_entering_guardhouse_03",
				"pwh_objective_magnus_tower_entering_guardhouse_04",
			},
			sound_events_duration = {
				3.5698125362396,
				6.0529375076294,
				4.1038956642151,
				5.018937587738,
			},
		},
		pwh_objective_magnus_tower_finding_explosives = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"pwh_objective_magnus_tower_finding_explosives_01",
				"pwh_objective_magnus_tower_finding_explosives_02",
				"pwh_objective_magnus_tower_finding_explosives_03",
				"pwh_objective_magnus_tower_finding_explosives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_finding_explosives_01",
				"pwh_objective_magnus_tower_finding_explosives_02",
				"pwh_objective_magnus_tower_finding_explosives_03",
				"pwh_objective_magnus_tower_finding_explosives_04",
			},
			sound_events_duration = {
				3.2864375114441,
				3.8364791870117,
				4.2151460647583,
				7.1007914543152,
			},
		},
		pwh_objective_magnus_tower_hint_blow_horn = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_hint_blow_horn_01",
				[2] = "pwh_objective_magnus_tower_hint_blow_horn_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_hint_blow_horn_01",
				[2] = "pwh_objective_magnus_tower_hint_blow_horn_02",
			},
			sound_events_duration = {
				[1] = 3.8747708797455,
				[2] = 6.258291721344,
			},
		},
		pwh_objective_magnus_tower_how_to_escape = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"face_calm",
				"face_calm",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pwh_objective_magnus_tower_how_to_escape_01",
				"pwh_objective_magnus_tower_how_to_escape_02",
				"pwh_objective_magnus_tower_how_to_escape_03",
				"pwh_objective_magnus_tower_how_to_escape_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_how_to_escape_01",
				"pwh_objective_magnus_tower_how_to_escape_02",
				"pwh_objective_magnus_tower_how_to_escape_03",
				"pwh_objective_magnus_tower_how_to_escape_04",
			},
			sound_events_duration = {
				3.1482291221619,
				4.1819791793823,
				4.3892917633057,
				4.3810000419617,
			},
		},
		pwh_objective_magnus_tower_over_rooftops = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_over_rooftops_01",
				[2] = "pwh_objective_magnus_tower_over_rooftops_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_over_rooftops_01",
				[2] = "pwh_objective_magnus_tower_over_rooftops_02",
			},
			sound_events_duration = {
				[1] = 3.2497498989105,
				[2] = 4.2193751335144,
			},
		},
		pwh_objective_magnus_tower_reaching_top_of_magnus_tower = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"pwh_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pwh_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pwh_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pwh_objective_magnus_tower_reaching_top_of_magnus_tower_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_reaching_top_of_magnus_tower_01",
				"pwh_objective_magnus_tower_reaching_top_of_magnus_tower_02",
				"pwh_objective_magnus_tower_reaching_top_of_magnus_tower_03",
				"pwh_objective_magnus_tower_reaching_top_of_magnus_tower_04",
			},
			sound_events_duration = {
				3.9073750972748,
				3.835000038147,
				2.6466875076294,
				1.4704791307449,
			},
		},
		pwh_objective_magnus_tower_seeing_gate = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"pwh_objective_magnus_tower_seeing_gate_01",
				"pwh_objective_magnus_tower_seeing_gate_02",
				"pwh_objective_magnus_tower_seeing_gate_03",
				"pwh_objective_magnus_tower_seeing_gate_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_seeing_gate_01",
				"pwh_objective_magnus_tower_seeing_gate_02",
				"pwh_objective_magnus_tower_seeing_gate_03",
				"pwh_objective_magnus_tower_seeing_gate_04",
			},
			sound_events_duration = {
				3.4919791221619,
				1.6280208826065,
				1.739354133606,
				2.2250416278839,
			},
		},
		pwh_objective_magnus_tower_seeing_guardhouse = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_seeing_guardhouse_01",
				[2] = "pwh_objective_magnus_tower_seeing_guardhouse_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_seeing_guardhouse_01",
				[2] = "pwh_objective_magnus_tower_seeing_guardhouse_02",
			},
			sound_events_duration = {
				[1] = 3.5999999046326,
				[2] = 1.9087291955948,
			},
		},
		pwh_objective_magnus_tower_seeing_tavern = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_seeing_tavern_01",
				[2] = "pwh_objective_magnus_tower_seeing_tavern_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_seeing_tavern_01",
				[2] = "pwh_objective_magnus_tower_seeing_tavern_02",
			},
			sound_events_duration = {
				[1] = 3.017416715622,
				[2] = 4.7873959541321,
			},
		},
		pwh_objective_magnus_tower_seeing_tower = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_seeing_tower_01",
				[2] = "pwh_objective_magnus_tower_seeing_tower_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_seeing_tower_01",
				[2] = "pwh_objective_magnus_tower_seeing_tower_02",
			},
			sound_events_duration = {
				[1] = 2.904937505722,
				[2] = 3.4662292003632,
			},
		},
		pwh_objective_magnus_tower_to_rooftops = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_to_rooftops_01",
				[2] = "pwh_objective_magnus_tower_to_rooftops_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_to_rooftops_01",
				[2] = "pwh_objective_magnus_tower_to_rooftops_02",
			},
			sound_events_duration = {
				[1] = 3.4378750324249,
				[2] = 1.3439583778381,
			},
		},
		pwh_objective_magnus_tower_up_stairs = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_up_stairs_01",
				[2] = "pwh_objective_magnus_tower_up_stairs_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_up_stairs_01",
				[2] = "pwh_objective_magnus_tower_up_stairs_02",
			},
			sound_events_duration = {
				[1] = 2.7865417003632,
				[2] = 1.5099166631699,
			},
		},
		pwh_objective_magnus_tower_view_tower = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				"pwh_objective_magnus_tower_view_tower_01",
				"pwh_objective_magnus_tower_view_tower_02",
				"pwh_objective_magnus_tower_view_tower_03",
				"pwh_objective_magnus_tower_view_tower_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_objective_magnus_tower_view_tower_01",
				"pwh_objective_magnus_tower_view_tower_02",
				"pwh_objective_magnus_tower_view_tower_03",
				"pwh_objective_magnus_tower_view_tower_04",
			},
			sound_events_duration = {
				3.9519791603088,
				4.287624835968,
				4.9368958473206,
				4.8866248130798,
			},
		},
		pwh_objective_magnus_tower_vista = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_vista_01",
				[2] = "pwh_objective_magnus_tower_vista_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_vista_01",
				[2] = "pwh_objective_magnus_tower_vista_02",
			},
			sound_events_duration = {
				[1] = 7.1113543510437,
				[2] = 3.2101249694824,
			},
		},
		pwh_objective_magnus_tower_walking_streets = {
			category = "level_talk",
			database = "witch_hunter_magnus_tower",
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
				[1] = "pwh_objective_magnus_tower_walking_streets_01",
				[2] = "pwh_objective_magnus_tower_walking_streets_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_objective_magnus_tower_walking_streets_01",
				[2] = "pwh_objective_magnus_tower_walking_streets_02",
			},
			sound_events_duration = {
				[1] = 4.080958366394,
				[2] = 4.5911874771118,
			},
		},
	})
end
