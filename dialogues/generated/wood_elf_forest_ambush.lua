-- chunkname: @dialogues/generated/wood_elf_forest_ambush.lua

return function ()
	define_rule({
		name = "pwe_forest_ambush_intro",
		response = "pwe_forest_ambush_intro",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_forest_ambush_intro_b",
		response = "pwe_forest_ambush_intro_b",
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
				"wood_elf",
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
		name = "pwe_forest_ambush_intro_c",
		response = "pwe_forest_ambush_intro_c",
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
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_back_to_ferry",
		response = "pwe_objective_forest_ambush_back_to_ferry",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_boat_arrives",
		response = "pwe_objective_forest_ambush_boat_arrives",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_crescendo_starting",
		response = "pwe_objective_forest_ambush_crescendo_starting",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_doomwheel_objective_done",
		response = "pwe_objective_forest_ambush_doomwheel_objective_done",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_finding_explosives",
		response = "pwe_objective_forest_ambush_finding_explosives",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_reaching_skaven_camp",
		response = "pwe_objective_forest_ambush_reaching_skaven_camp",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_ring_bell",
		response = "pwe_objective_forest_ambush_ring_bell",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_spotting_bridge",
		response = "pwe_objective_forest_ambush_spotting_bridge",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_spotting_coaching_inn",
		response = "pwe_objective_forest_ambush_spotting_coaching_inn",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_spotting_first_doomwheel",
		response = "pwe_objective_forest_ambush_spotting_first_doomwheel",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_spotting_lodge_ruins",
		response = "pwe_objective_forest_ambush_spotting_lodge_ruins",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_spotting_ruins",
		response = "pwe_objective_forest_ambush_spotting_ruins",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_spotting_trunk",
		response = "pwe_objective_forest_ambush_spotting_trunk",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		name = "pwe_objective_forest_ambush_spotting_watch_tower",
		response = "pwe_objective_forest_ambush_spotting_watch_tower",
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
				"wood_elf",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf",
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
		pwe_forest_ambush_intro = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				[1] = "pwe_forest_ambush_intro_a_01",
				[2] = "pwe_forest_ambush_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_forest_ambush_intro_a_01",
				[2] = "pwe_forest_ambush_intro_a_02",
			},
			sound_events_duration = {
				[1] = 2.0321667194366,
				[2] = 2.7007915973663,
			},
		},
		pwe_forest_ambush_intro_b = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				[1] = "pwe_forest_ambush_intro_b_01",
				[2] = "pwe_forest_ambush_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_forest_ambush_intro_b_01",
				[2] = "pwe_forest_ambush_intro_b_02",
			},
			sound_events_duration = {
				[1] = 2.6171250343323,
				[2] = 4.2991876602173,
			},
		},
		pwe_forest_ambush_intro_c = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				[1] = "pwe_forest_ambush_intro_c_01",
				[2] = "pwe_forest_ambush_intro_c_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwe_forest_ambush_intro_c_01",
				[2] = "pwe_forest_ambush_intro_c_02",
			},
			sound_events_duration = {
				[1] = 3.5871665477753,
				[2] = 2.6783125400543,
			},
		},
		pwe_objective_forest_ambush_back_to_ferry = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_back_to_ferry_01",
				"pwe_objective_forest_ambush_back_to_ferry_02",
				"pwe_objective_forest_ambush_back_to_ferry_03",
				"pwe_objective_forest_ambush_back_to_ferry_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_back_to_ferry_01",
				"pwe_objective_forest_ambush_back_to_ferry_02",
				"pwe_objective_forest_ambush_back_to_ferry_03",
				"pwe_objective_forest_ambush_back_to_ferry_04",
			},
			sound_events_duration = {
				2.5958750247955,
				1.4242082834244,
				6.1288957595825,
				2.9568123817444,
			},
		},
		pwe_objective_forest_ambush_boat_arrives = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_boat_arrives_01",
				"pwe_objective_forest_ambush_boat_arrives_02",
				"pwe_objective_forest_ambush_boat_arrives_03",
				"pwe_objective_forest_ambush_boat_arrives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_boat_arrives_01",
				"pwe_objective_forest_ambush_boat_arrives_02",
				"pwe_objective_forest_ambush_boat_arrives_03",
				"pwe_objective_forest_ambush_boat_arrives_04",
			},
			sound_events_duration = {
				1.0335416793823,
				1.5670833587647,
				3.5815207958221,
				2.3906042575836,
			},
		},
		pwe_objective_forest_ambush_crescendo_starting = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_crescendo_starting_01",
				"pwe_objective_forest_ambush_crescendo_starting_02",
				"pwe_objective_forest_ambush_crescendo_starting_03",
				"pwe_objective_forest_ambush_crescendo_starting_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_crescendo_starting_01",
				"pwe_objective_forest_ambush_crescendo_starting_02",
				"pwe_objective_forest_ambush_crescendo_starting_03",
				"pwe_objective_forest_ambush_crescendo_starting_04",
			},
			sound_events_duration = {
				4.6518125534058,
				3.2057082653046,
				3.0521665811539,
				3.7096042633057,
			},
		},
		pwe_objective_forest_ambush_doomwheel_objective_done = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_doomwheel_objective_done_01",
				"pwe_objective_forest_ambush_doomwheel_objective_done_02",
				"pwe_objective_forest_ambush_doomwheel_objective_done_03",
				"pwe_objective_forest_ambush_doomwheel_objective_done_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_doomwheel_objective_done_01",
				"pwe_objective_forest_ambush_doomwheel_objective_done_02",
				"pwe_objective_forest_ambush_doomwheel_objective_done_03",
				"pwe_objective_forest_ambush_doomwheel_objective_done_04",
			},
			sound_events_duration = {
				2.2595000267029,
				4.9688959121704,
				4.6127915382385,
				2.1247916221619,
			},
		},
		pwe_objective_forest_ambush_finding_explosives = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_finding_explosives_01",
				"pwe_objective_forest_ambush_finding_explosives_02",
				"pwe_objective_forest_ambush_finding_explosives_03",
				"pwe_objective_forest_ambush_finding_explosives_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_finding_explosives_01",
				"pwe_objective_forest_ambush_finding_explosives_02",
				"pwe_objective_forest_ambush_finding_explosives_03",
				"pwe_objective_forest_ambush_finding_explosives_04",
			},
			sound_events_duration = {
				4.946750164032,
				3.7101666927338,
				2.3981666564941,
				4.2102708816528,
			},
		},
		pwe_objective_forest_ambush_reaching_skaven_camp = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_reaching_skaven_camp_01",
				"pwe_objective_forest_ambush_reaching_skaven_camp_02",
				"pwe_objective_forest_ambush_reaching_skaven_camp_03",
				"pwe_objective_forest_ambush_reaching_skaven_camp_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_reaching_skaven_camp_01",
				"pwe_objective_forest_ambush_reaching_skaven_camp_02",
				"pwe_objective_forest_ambush_reaching_skaven_camp_03",
				"pwe_objective_forest_ambush_reaching_skaven_camp_04",
			},
			sound_events_duration = {
				3.7863125801086,
				4.1138124465942,
				1.7016458511352,
				2.4332292079926,
			},
		},
		pwe_objective_forest_ambush_ring_bell = {
			category = "player_feedback",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_ring_bell_01",
				"pwe_objective_forest_ambush_ring_bell_02",
				"pwe_objective_forest_ambush_ring_bell_03",
				"pwe_objective_forest_ambush_ring_bell_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_ring_bell_01",
				"pwe_objective_forest_ambush_ring_bell_02",
				"pwe_objective_forest_ambush_ring_bell_03",
				"pwe_objective_forest_ambush_ring_bell_04",
			},
			sound_events_duration = {
				1.2860000133514,
				3.4208333492279,
				2.5999999046326,
				2.4909999370575,
			},
		},
		pwe_objective_forest_ambush_spotting_bridge = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_spotting_bridge_01",
				"pwe_objective_forest_ambush_spotting_bridge_02",
				"pwe_objective_forest_ambush_spotting_bridge_03",
				"pwe_objective_forest_ambush_spotting_bridge_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_spotting_bridge_01",
				"pwe_objective_forest_ambush_spotting_bridge_02",
				"pwe_objective_forest_ambush_spotting_bridge_03",
				"pwe_objective_forest_ambush_spotting_bridge_04",
			},
			sound_events_duration = {
				1.3483958244324,
				2.6386978626251,
				2.1226458549499,
				4.1417918205261,
			},
		},
		pwe_objective_forest_ambush_spotting_coaching_inn = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_spotting_coaching_inn_01",
				"pwe_objective_forest_ambush_spotting_coaching_inn_02",
				"pwe_objective_forest_ambush_spotting_coaching_inn_03",
				"pwe_objective_forest_ambush_spotting_coaching_inn_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_spotting_coaching_inn_01",
				"pwe_objective_forest_ambush_spotting_coaching_inn_02",
				"pwe_objective_forest_ambush_spotting_coaching_inn_03",
				"pwe_objective_forest_ambush_spotting_coaching_inn_04",
			},
			sound_events_duration = {
				1.7477916479111,
				3.8510625362396,
				2.2139896154404,
				2.4711666107178,
			},
		},
		pwe_objective_forest_ambush_spotting_first_doomwheel = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_spotting_first_doomwheel_01",
				"pwe_objective_forest_ambush_spotting_first_doomwheel_02",
				"pwe_objective_forest_ambush_spotting_first_doomwheel_03",
				"pwe_objective_forest_ambush_spotting_first_doomwheel_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_spotting_first_doomwheel_01",
				"pwe_objective_forest_ambush_spotting_first_doomwheel_02",
				"pwe_objective_forest_ambush_spotting_first_doomwheel_03",
				"pwe_objective_forest_ambush_spotting_first_doomwheel_04",
			},
			sound_events_duration = {
				2.729749917984,
				3.7657916545868,
				2.7178542613983,
				2.913125038147,
			},
		},
		pwe_objective_forest_ambush_spotting_lodge_ruins = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_spotting_lodge_ruins_01",
				"pwe_objective_forest_ambush_spotting_lodge_ruins_02",
				"pwe_objective_forest_ambush_spotting_lodge_ruins_03",
				"pwe_objective_forest_ambush_spotting_lodge_ruins_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_spotting_lodge_ruins_01",
				"pwe_objective_forest_ambush_spotting_lodge_ruins_02",
				"pwe_objective_forest_ambush_spotting_lodge_ruins_03",
				"pwe_objective_forest_ambush_spotting_lodge_ruins_04",
			},
			sound_events_duration = {
				4.5696043968201,
				4.5698957443237,
				4.427791595459,
				3.4877500534058,
			},
		},
		pwe_objective_forest_ambush_spotting_ruins = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_spotting_ruins_01",
				"pwe_objective_forest_ambush_spotting_ruins_02",
				"pwe_objective_forest_ambush_spotting_ruins_03",
				"pwe_objective_forest_ambush_spotting_ruins_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_spotting_ruins_01",
				"pwe_objective_forest_ambush_spotting_ruins_02",
				"pwe_objective_forest_ambush_spotting_ruins_03",
				"pwe_objective_forest_ambush_spotting_ruins_04",
			},
			sound_events_duration = {
				5.2616457939148,
				4.8414168357849,
				2.5709791183472,
				4.0710835456848,
			},
		},
		pwe_objective_forest_ambush_spotting_trunk = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_spotting_trunk_01",
				"pwe_objective_forest_ambush_spotting_trunk_02",
				"pwe_objective_forest_ambush_spotting_trunk_03",
				"pwe_objective_forest_ambush_spotting_trunk_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_spotting_trunk_01",
				"pwe_objective_forest_ambush_spotting_trunk_02",
				"pwe_objective_forest_ambush_spotting_trunk_03",
				"pwe_objective_forest_ambush_spotting_trunk_04",
			},
			sound_events_duration = {
				3.461770772934,
				2.6733541488648,
				2.1213541030884,
				2.493958234787,
			},
		},
		pwe_objective_forest_ambush_spotting_watch_tower = {
			category = "level_talk",
			database = "wood_elf_forest_ambush",
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
				"pwe_objective_forest_ambush_spotting_watch_tower_01",
				"pwe_objective_forest_ambush_spotting_watch_tower_02",
				"pwe_objective_forest_ambush_spotting_watch_tower_03",
				"pwe_objective_forest_ambush_spotting_watch_tower_04",
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_objective_forest_ambush_spotting_watch_tower_01",
				"pwe_objective_forest_ambush_spotting_watch_tower_02",
				"pwe_objective_forest_ambush_spotting_watch_tower_03",
				"pwe_objective_forest_ambush_spotting_watch_tower_04",
			},
			sound_events_duration = {
				2.2809166908264,
				2.4039790630341,
				2.3289999961853,
				1.3343958854675,
			},
		},
	})
end
