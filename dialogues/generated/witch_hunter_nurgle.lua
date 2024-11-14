-- chunkname: @dialogues/generated/witch_hunter_nurgle.lua

return function ()
	define_rule({
		name = "pwh_level_nurgle_bury_objective",
		probability = 1,
		response = "pwh_level_nurgle_bury_objective",
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
				"level_nurgle_bury_objective",
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
				"level_nurgle_bury_objective",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_bury_objective",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_coming_down",
		probability = 1,
		response = "pwh_level_nurgle_coming_down",
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
				"level_nurgle_coming_down",
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
				"level_nurgle_coming_down",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_coming_down",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_digsite",
		probability = 1,
		response = "pwh_level_nurgle_digsite",
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
				"level_nurgle_digsite",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_nurgle_digsite",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_digsite",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_drop_down",
		probability = 1,
		response = "pwh_level_nurgle_drop_down",
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
				"level_nurgle_drop_down",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_nurgle_drop_down",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_drop_down",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_nurglification",
		probability = 1,
		response = "pwh_level_nurgle_nurglification",
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
				"level_nurgle_nurglification",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_nurgle_nurglification",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_nurglification",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_nurglification_increase",
		probability = 1,
		response = "pwh_level_nurgle_nurglification_increase",
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
				"level_nurgle_nurglification_increase",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_nurgle_nurglification_increase",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_nurglification_increase",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_outcast_lair",
		probability = 1,
		response = "pwh_level_nurgle_outcast_lair",
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
				"level_nurgle_outcast_lair",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_nurgle_outcast_lair",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_outcast_lair",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_river",
		probability = 1,
		response = "pwh_level_nurgle_river",
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
				"level_nurgle_river",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_nurgle_river",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_river",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_skaven_collapse",
		probability = 1,
		response = "pwh_level_nurgle_skaven_collapse",
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
				"level_nurgle_skaven_collapse",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0,
			},
			{
				"faction_memory",
				"level_nurgle_skaven_collapse",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_skaven_collapse",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_spotting_objective",
		probability = 1,
		response = "pwh_level_nurgle_spotting_objective",
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
				"level_nurgle_spotting_objective",
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
				"level_nurgle_spotting_objective",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_spotting_objective",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_level_nurgle_swift_river",
		probability = 1,
		response = "pwh_level_nurgle_swift_river",
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
				"level_nurgle_swift_river",
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
				"level_nurgle_swift_river",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"level_nurgle_swift_river",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_nurgle_intro_a",
		probability = 1,
		response = "pwh_nurgle_intro_a",
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
				"nurgle_intro_a",
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
				"nurgle_intro_a",
				OP.EQ,
				0,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_intro_a",
				OP.ADD,
				1,
			},
		},
	})
	define_rule({
		name = "pwh_nurgle_intro_b",
		probability = 1,
		response = "pwh_nurgle_intro_b",
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
				"nurgle_intro_a",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter",
			},
			{
				"faction_memory",
				"nurgle_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1,
			},
		},
		on_done = {
			{
				"faction_memory",
				"nurgle_intro_b",
				OP.TIMESET,
			},
		},
	})
	add_dialogues({
		pwh_level_nurgle_bury_objective = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_bury_objective_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_bury_objective_01",
			},
			sound_events_duration = {
				[1] = 5.7862915992737,
			},
		},
		pwh_level_nurgle_coming_down = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_coming_down_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_coming_down_01",
			},
			sound_events_duration = {
				[1] = 5.8908748626709,
			},
		},
		pwh_level_nurgle_digsite = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_digsite_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_digsite_01",
			},
			sound_events_duration = {
				[1] = 3.4481041431427,
			},
		},
		pwh_level_nurgle_drop_down = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_drop_down_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_drop_down_01",
			},
			sound_events_duration = {
				[1] = 4.0208334922791,
			},
		},
		pwh_level_nurgle_nurglification = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_nurglification_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_nurglification_01",
			},
			sound_events_duration = {
				[1] = 4.2301459312439,
			},
		},
		pwh_level_nurgle_nurglification_increase = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_nurglification_increase_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_nurglification_increase_01",
			},
			sound_events_duration = {
				[1] = 4.790020942688,
			},
		},
		pwh_level_nurgle_outcast_lair = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_outcast_lair_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_outcast_lair_01",
			},
			sound_events_duration = {
				[1] = 5.6056041717529,
			},
		},
		pwh_level_nurgle_river = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_river_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_river_01",
			},
			sound_events_duration = {
				[1] = 2.6269791126251,
			},
		},
		pwh_level_nurgle_skaven_collapse = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_skaven_collapse_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_skaven_collapse_01",
			},
			sound_events_duration = {
				[1] = 6.7491250038147,
			},
		},
		pwh_level_nurgle_spotting_objective = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_spotting_objective_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_spotting_objective_01",
			},
			sound_events_duration = {
				[1] = 6.2820625305176,
			},
		},
		pwh_level_nurgle_swift_river = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
			dialogue_animations_n = 1,
			face_animations_n = 1,
			sound_events_n = 1,
			dialogue_animations = {
				[1] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_concerned",
			},
			localization_strings = {
				[1] = "pwh_level_nurgle_swift_river_01",
			},
			sound_events = {
				[1] = "pwh_level_nurgle_swift_river_01",
			},
			sound_events_duration = {
				[1] = 3.3006665706634,
			},
		},
		pwh_nurgle_intro_a = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
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
				[1] = "pwh_nurgle_intro_a_01",
				[2] = "pwh_nurgle_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_nurgle_intro_a_01",
				[2] = "pwh_nurgle_intro_a_02",
			},
			sound_events_duration = {
				[1] = 8.3753747940063,
				[2] = 8.6943330764771,
			},
		},
		pwh_nurgle_intro_b = {
			category = "level_talk",
			database = "witch_hunter_nurgle",
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
				[1] = "pwh_nurgle_intro_b_01",
				[2] = "pwh_nurgle_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pwh_nurgle_intro_b_01",
				[2] = "pwh_nurgle_intro_b_02",
			},
			sound_events_duration = {
				[1] = 8.8635416030884,
				[2] = 8.6546669006348,
			},
		},
	})
end
