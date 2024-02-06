-- chunkname: @dialogues/generated/bright_wizard_forest_ambush.lua

return function ()
	define_rule({
		name = "pbw_forest_ambush_intro",
		response = "pbw_forest_ambush_intro",
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
				"forest_ambush_intro",
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
				"time_since_forest_ambush_intro",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_intro",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_forest_ambush_intro_b",
		response = "pbw_forest_ambush_intro_b",
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
				"forest_ambush_intro",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_forest_ambush_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_intro_b",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_forest_ambush_intro_c",
		response = "pbw_forest_ambush_intro_c",
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
				"forest_ambush_intro_b",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard",
			},
			{
				"faction_memory",
				"time_since_forest_ambush_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_intro_c",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_back_to_ferry",
		response = "pbw_objective_forest_ambush_back_to_ferry",
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
				"forest_ambush_back_to_ferry",
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
				"time_since_forest_ambush_back_to_ferry",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_back_to_ferry",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_boat_arrives",
		response = "pbw_objective_forest_ambush_boat_arrives",
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
				"forest_ambush_boat_arrives",
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
				"time_since_forest_ambush_boat_arrives",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_boat_arrives",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_crescendo_starting",
		response = "pbw_objective_forest_ambush_crescendo_starting",
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
				"forest_ambush_crescendo_starting",
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
				"time_since_forest_ambush_crescendo_starting",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_crescendo_starting",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_doomwheel_objective_done",
		response = "pbw_objective_forest_ambush_doomwheel_objective_done",
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
				"forest_ambush_doomwheel_objective_done",
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
				"time_since_forest_ambush_doomwheel_objective_done",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_doomwheel_objective_done",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_finding_explosives",
		response = "pbw_objective_forest_ambush_finding_explosives",
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
				"forest_ambush_finding_explosives",
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
				"time_since_forest_ambush_finding_explosives",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_finding_explosives",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_reaching_skaven_camp",
		response = "pbw_objective_forest_ambush_reaching_skaven_camp",
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
				"forest_ambush_reaching_skaven_camp",
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
				"time_since_forest_ambush_reaching_skaven_camp",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_reaching_skaven_camp",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_ring_bell",
		response = "pbw_objective_forest_ambush_ring_bell",
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
				"forest_ambush_ring_bell",
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
				"time_since_forest_ambush_ring_bell",
				OP.TIMEDIFF,
				OP.GT,
				20,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_ring_bell",
				OP.TIMESET,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_bridge",
		response = "pbw_objective_forest_ambush_spotting_bridge",
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
				"forest_ambush_spotting_bridge",
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
				"time_since_forest_ambush_spotting_bridge",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_bridge",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_broken_wagon",
		response = "pbw_objective_forest_ambush_spotting_broken_wagon",
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
				"forest_ambush_spotting_broken_wagon",
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
				"time_since_forest_ambush_spotting_broken_wagon",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_broken_wagon",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_coaching_inn",
		response = "pbw_objective_forest_ambush_spotting_coaching_inn",
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
				"forest_ambush_spotting_coaching_inn",
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
				"time_since_forest_ambush_spotting_coaching_inn",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_coaching_inn",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_first_doomwheel",
		response = "pbw_objective_forest_ambush_spotting_first_doomwheel",
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
				"forest_ambush_spotting_first_doomwheel",
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
				"time_since_forest_ambush_spotting_first_doomwheel",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_first_doomwheel",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_lodge_ruins",
		response = "pbw_objective_forest_ambush_spotting_lodge_ruins",
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
				"forest_ambush_spotting_lodge_ruins",
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
				"time_since_forest_ambush_spotting_lodge_ruins",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_lodge_ruins",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_ruins",
		response = "pbw_objective_forest_ambush_spotting_ruins",
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
				"forest_ambush_spotting_ruins",
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
				"time_since_forest_ambush_spotting_ruins",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_ruins",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_trunk",
		response = "pbw_objective_forest_ambush_spotting_trunk",
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
				"forest_ambush_spotting_trunk",
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
				"time_since_forest_ambush_spotting_trunk",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_trunk",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pbw_objective_forest_ambush_spotting_watch_tower",
		response = "pbw_objective_forest_ambush_spotting_watch_tower",
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
				"forest_ambush_spotting_watch_tower",
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
				"time_since_forest_ambush_spotting_watch_tower",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"time_since_forest_ambush_spotting_watch_tower",
				OP.ADD,
				1,
			},
		},
	})
	add_dialogues({
		pbw_forest_ambush_intro = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				[1] = "pbw_forest_ambush_intro_a_01",
				[2] = "pbw_forest_ambush_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_forest_ambush_intro_a_01",
				[2] = "pbw_forest_ambush_intro_a_02",
			},
			sound_events_duration = {
				[1] = 3.597895860672,
				[2] = 3.1112084388733,
			},
		},
		pbw_forest_ambush_intro_b = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				[1] = "pbw_forest_ambush_intro_b_01",
				[2] = "pbw_forest_ambush_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_forest_ambush_intro_b_01",
				[2] = "pbw_forest_ambush_intro_b_02",
			},
			sound_events_duration = {
				[1] = 4.5725417137146,
				[2] = 3.7097084522247,
			},
		},
		pbw_forest_ambush_intro_c = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				[1] = "pbw_forest_ambush_intro_c_01",
				[2] = "pbw_forest_ambush_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pbw_forest_ambush_intro_c_01",
				[2] = "pbw_forest_ambush_intro_c_02",
			},
			sound_events_duration = {
				[1] = 4.0587916374206,
				[2] = 3.6333541870117,
			},
		},
		pbw_objective_forest_ambush_back_to_ferry = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_back_to_ferry_01",
				"pbw_objective_forest_ambush_back_to_ferry_02",
				"pbw_objective_forest_ambush_back_to_ferry_03",
				"pbw_objective_forest_ambush_back_to_ferry_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_back_to_ferry_01",
				"pbw_objective_forest_ambush_back_to_ferry_02",
				"pbw_objective_forest_ambush_back_to_ferry_03",
				"pbw_objective_forest_ambush_back_to_ferry_04",
			},
			sound_events_duration = {
				4.1769790649414,
				3.3173332214356,
				2.5887291431427,
				2.8273541927338,
			},
		},
		pbw_objective_forest_ambush_boat_arrives = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_boat_arrives_01",
				"pbw_objective_forest_ambush_boat_arrives_02",
				"pbw_objective_forest_ambush_boat_arrives_03",
				"pbw_objective_forest_ambush_boat_arrives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_boat_arrives_01",
				"pbw_objective_forest_ambush_boat_arrives_02",
				"pbw_objective_forest_ambush_boat_arrives_03",
				"pbw_objective_forest_ambush_boat_arrives_04",
			},
			sound_events_duration = {
				0.95202082395554,
				2.0999999046326,
				1.1334166526794,
				0.97247916460037,
			},
		},
		pbw_objective_forest_ambush_crescendo_starting = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_crescendo_starting_01",
				"pbw_objective_forest_ambush_crescendo_starting_02",
				"pbw_objective_forest_ambush_crescendo_starting_03",
				"pbw_objective_forest_ambush_crescendo_starting_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_crescendo_starting_01",
				"pbw_objective_forest_ambush_crescendo_starting_02",
				"pbw_objective_forest_ambush_crescendo_starting_03",
				"pbw_objective_forest_ambush_crescendo_starting_04",
			},
			sound_events_duration = {
				2.9095833301544,
				2.725145816803,
				4.9809165000916,
				2.7759582996368,
			},
		},
		pbw_objective_forest_ambush_doomwheel_objective_done = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_doomwheel_objective_done_01",
				"pbw_objective_forest_ambush_doomwheel_objective_done_02",
				"pbw_objective_forest_ambush_doomwheel_objective_done_03",
				"pbw_objective_forest_ambush_doomwheel_objective_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_doomwheel_objective_done_01",
				"pbw_objective_forest_ambush_doomwheel_objective_done_02",
				"pbw_objective_forest_ambush_doomwheel_objective_done_03",
				"pbw_objective_forest_ambush_doomwheel_objective_done_04",
			},
			sound_events_duration = {
				3.9454998970032,
				2.2462916374206,
				3.5333333015442,
				4.4322500228882,
			},
		},
		pbw_objective_forest_ambush_finding_explosives = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_finding_explosives_01",
				"pbw_objective_forest_ambush_finding_explosives_02",
				"pbw_objective_forest_ambush_finding_explosives_03",
				"pbw_objective_forest_ambush_finding_explosives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_finding_explosives_01",
				"pbw_objective_forest_ambush_finding_explosives_02",
				"pbw_objective_forest_ambush_finding_explosives_03",
				"pbw_objective_forest_ambush_finding_explosives_04",
			},
			sound_events_duration = {
				2.3288125991821,
				3.2849583625794,
				2.7968542575836,
				3.0481667518616,
			},
		},
		pbw_objective_forest_ambush_reaching_skaven_camp = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_reaching_skaven_camp_01",
				"pbw_objective_forest_ambush_reaching_skaven_camp_02",
				"pbw_objective_forest_ambush_reaching_skaven_camp_03",
				"pbw_objective_forest_ambush_reaching_skaven_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_reaching_skaven_camp_01",
				"pbw_objective_forest_ambush_reaching_skaven_camp_02",
				"pbw_objective_forest_ambush_reaching_skaven_camp_03",
				"pbw_objective_forest_ambush_reaching_skaven_camp_04",
			},
			sound_events_duration = {
				4.2854790687561,
				4.4578957557678,
				5.1139998435974,
				5.0067706108093,
			},
		},
		pbw_objective_forest_ambush_ring_bell = {
			category = "player_feedback",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_ring_bell_01",
				"pbw_objective_forest_ambush_ring_bell_02",
				"pbw_objective_forest_ambush_ring_bell_03",
				"pbw_objective_forest_ambush_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_ring_bell_01",
				"pbw_objective_forest_ambush_ring_bell_02",
				"pbw_objective_forest_ambush_ring_bell_03",
				"pbw_objective_forest_ambush_ring_bell_04",
			},
			sound_events_duration = {
				4.0349583625794,
				2.8488540649414,
				1.5101041793823,
				1.8621250391007,
			},
		},
		pbw_objective_forest_ambush_spotting_bridge = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_spotting_bridge_01",
				"pbw_objective_forest_ambush_spotting_bridge_02",
				"pbw_objective_forest_ambush_spotting_bridge_03",
				"pbw_objective_forest_ambush_spotting_bridge_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_bridge_01",
				"pbw_objective_forest_ambush_spotting_bridge_02",
				"pbw_objective_forest_ambush_spotting_bridge_03",
				"pbw_objective_forest_ambush_spotting_bridge_04",
			},
			sound_events_duration = {
				1.067583322525,
				0.98008334636688,
				1.0366458892822,
				1.2558125257492,
			},
		},
		pbw_objective_forest_ambush_spotting_broken_wagon = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_spotting_broken_wagon_01",
				"pbw_objective_forest_ambush_spotting_broken_wagon_02",
				"pbw_objective_forest_ambush_spotting_broken_wagon_03",
				"pbw_objective_forest_ambush_spotting_broken_wagon_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_broken_wagon_01",
				"pbw_objective_forest_ambush_spotting_broken_wagon_02",
				"pbw_objective_forest_ambush_spotting_broken_wagon_03",
				"pbw_objective_forest_ambush_spotting_broken_wagon_04",
			},
			sound_events_duration = {
				3.7428333759308,
				5.6222290992737,
				2.3088126182556,
				1.606229186058,
			},
		},
		pbw_objective_forest_ambush_spotting_coaching_inn = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_spotting_coaching_inn_01",
				"pbw_objective_forest_ambush_spotting_coaching_inn_02",
				"pbw_objective_forest_ambush_spotting_coaching_inn_03",
				"pbw_objective_forest_ambush_spotting_coaching_inn_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_coaching_inn_01",
				"pbw_objective_forest_ambush_spotting_coaching_inn_02",
				"pbw_objective_forest_ambush_spotting_coaching_inn_03",
				"pbw_objective_forest_ambush_spotting_coaching_inn_04",
			},
			sound_events_duration = {
				0.77395832538605,
				1.4033750295639,
				1.1757708787918,
				1.7560000419617,
			},
		},
		pbw_objective_forest_ambush_spotting_first_doomwheel = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_spotting_first_doomwheel_01",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_02",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_03",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_first_doomwheel_01",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_02",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_03",
				"pbw_objective_forest_ambush_spotting_first_doomwheel_04",
			},
			sound_events_duration = {
				4.5699377059936,
				7.3594584465027,
				6.8246459960938,
				3.3101041316986,
			},
		},
		pbw_objective_forest_ambush_spotting_lodge_ruins = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_spotting_lodge_ruins_01",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_02",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_03",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_lodge_ruins_01",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_02",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_03",
				"pbw_objective_forest_ambush_spotting_lodge_ruins_04",
			},
			sound_events_duration = {
				9.466875076294,
				5.1710414886475,
				5.4357085227966,
				3.2089583873749,
			},
		},
		pbw_objective_forest_ambush_spotting_ruins = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_spotting_ruins_01",
				"pbw_objective_forest_ambush_spotting_ruins_02",
				"pbw_objective_forest_ambush_spotting_ruins_03",
				"pbw_objective_forest_ambush_spotting_ruins_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_ruins_01",
				"pbw_objective_forest_ambush_spotting_ruins_02",
				"pbw_objective_forest_ambush_spotting_ruins_03",
				"pbw_objective_forest_ambush_spotting_ruins_04",
			},
			sound_events_duration = {
				2.2501873970032,
				3.6772916316986,
				2.7187082767487,
				2.5558125972748,
			},
		},
		pbw_objective_forest_ambush_spotting_trunk = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_spotting_trunk_01",
				"pbw_objective_forest_ambush_spotting_trunk_02",
				"pbw_objective_forest_ambush_spotting_trunk_03",
				"pbw_objective_forest_ambush_spotting_trunk_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_trunk_01",
				"pbw_objective_forest_ambush_spotting_trunk_02",
				"pbw_objective_forest_ambush_spotting_trunk_03",
				"pbw_objective_forest_ambush_spotting_trunk_04",
			},
			sound_events_duration = {
				2.0399374961853,
				4.9698123931885,
				2.1591875553131,
				2.1914374828339,
			},
		},
		pbw_objective_forest_ambush_spotting_watch_tower = {
			category = "level_talk",
			database = "bright_wizard_forest_ambush",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
			},
			localization_strings = {
				"pbw_objective_forest_ambush_spotting_watch_tower_01",
				"pbw_objective_forest_ambush_spotting_watch_tower_02",
				"pbw_objective_forest_ambush_spotting_watch_tower_03",
				"pbw_objective_forest_ambush_spotting_watch_tower_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_forest_ambush_spotting_watch_tower_01",
				"pbw_objective_forest_ambush_spotting_watch_tower_02",
				"pbw_objective_forest_ambush_spotting_watch_tower_03",
				"pbw_objective_forest_ambush_spotting_watch_tower_04",
			},
			sound_events_duration = {
				1.9383541345596,
				1.7897499799728,
				1.962249994278,
				1.5052708387375,
			},
		},
	})
end
