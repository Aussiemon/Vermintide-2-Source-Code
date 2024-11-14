-- chunkname: @dialogues/generated/empire_soldier_nurgle.lua

return function ()
	define_rule({
		name = "pes_level_nurgle_bury_objective",
		probability = 1,
		response = "pes_level_nurgle_bury_objective",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_coming_down",
		probability = 1,
		response = "pes_level_nurgle_coming_down",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_digsite",
		probability = 1,
		response = "pes_level_nurgle_digsite",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_drop_down",
		probability = 1,
		response = "pes_level_nurgle_drop_down",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_nurglification",
		probability = 1,
		response = "pes_level_nurgle_nurglification",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_nurglification_increase",
		probability = 1,
		response = "pes_level_nurgle_nurglification_increase",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_outcast_lair",
		probability = 1,
		response = "pes_level_nurgle_outcast_lair",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_river",
		probability = 1,
		response = "pes_level_nurgle_river",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_skaven_collapse",
		probability = 1,
		response = "pes_level_nurgle_skaven_collapse",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_spotting_objective",
		probability = 1,
		response = "pes_level_nurgle_spotting_objective",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_level_nurgle_swift_river",
		probability = 1,
		response = "pes_level_nurgle_swift_river",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_nurgle_intro_a",
		probability = 1,
		response = "pes_nurgle_intro_a",
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
				"empire_soldier",
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier",
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
		name = "pes_nurgle_intro_b",
		probability = 1,
		response = "pes_nurgle_intro_b",
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
				"empire_soldier",
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
		pes_level_nurgle_bury_objective = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_bury_objective_01",
				[2] = "pes_level_nurgle_bury_objective_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_bury_objective_01",
				[2] = "pes_level_nurgle_bury_objective_02",
			},
			sound_events_duration = {
				[1] = 4.2746043205261,
				[2] = 3.0456249713898,
			},
		},
		pes_level_nurgle_coming_down = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_coming_down_01",
				[2] = "pes_level_nurgle_coming_down_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_coming_down_01",
				[2] = "pes_level_nurgle_coming_down_02",
			},
			sound_events_duration = {
				[1] = 6.1494374275208,
				[2] = 6.8563752174377,
			},
		},
		pes_level_nurgle_digsite = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_digsite_01",
				[2] = "pes_level_nurgle_digsite_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_digsite_01",
				[2] = "pes_level_nurgle_digsite_02",
			},
			sound_events_duration = {
				[1] = 1.8633333444595,
				[2] = 3.0818541049957,
			},
		},
		pes_level_nurgle_drop_down = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_drop_down_01",
				[2] = "pes_level_nurgle_drop_down_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_drop_down_01",
				[2] = "pes_level_nurgle_drop_down_02",
			},
			sound_events_duration = {
				[1] = 2.2145624160767,
				[2] = 1.3009999990463,
			},
		},
		pes_level_nurgle_nurglification = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_nurglification_01",
				[2] = "pes_level_nurgle_nurglification_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_nurglification_01",
				[2] = "pes_level_nurgle_nurglification_02",
			},
			sound_events_duration = {
				[1] = 3.8557708263397,
				[2] = 2.7042500972748,
			},
		},
		pes_level_nurgle_nurglification_increase = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_nurglification_increase_01",
				[2] = "pes_level_nurgle_nurglification_increase_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_nurglification_increase_01",
				[2] = "pes_level_nurgle_nurglification_increase_02",
			},
			sound_events_duration = {
				[1] = 3.0373749732971,
				[2] = 7.7443542480469,
			},
		},
		pes_level_nurgle_outcast_lair = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_outcast_lair_01",
				[2] = "pes_level_nurgle_outcast_lair_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_outcast_lair_01",
				[2] = "pes_level_nurgle_outcast_lair_02",
			},
			sound_events_duration = {
				[1] = 4.3796668052673,
				[2] = 4.8788957595825,
			},
		},
		pes_level_nurgle_river = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_calm",
				[2] = "face_calm",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_river_01",
				[2] = "pes_level_nurgle_river_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_river_01",
				[2] = "pes_level_nurgle_river_02",
			},
			sound_events_duration = {
				[1] = 3.4465000629425,
				[2] = 2.9546666145325,
			},
		},
		pes_level_nurgle_skaven_collapse = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_skaven_collapse_01",
				[2] = "pes_level_nurgle_skaven_collapse_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_skaven_collapse_01",
				[2] = "pes_level_nurgle_skaven_collapse_02",
			},
			sound_events_duration = {
				[1] = 4.5346665382385,
				[2] = 3.768833398819,
			},
		},
		pes_level_nurgle_spotting_objective = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_fear",
				[2] = "face_fear",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_spotting_objective_01",
				[2] = "pes_level_nurgle_spotting_objective_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_spotting_objective_01",
				[2] = "pes_level_nurgle_spotting_objective_02",
			},
			sound_events_duration = {
				[1] = 3.2394165992737,
				[2] = 4.6296248435974,
			},
		},
		pes_level_nurgle_swift_river = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
			dialogue_animations_n = 2,
			face_animations_n = 2,
			randomize_indexes_n = 0,
			sound_events_n = 2,
			dialogue_animations = {
				[1] = "dialogue_shout",
				[2] = "dialogue_shout",
			},
			face_animations = {
				[1] = "face_concerned",
				[2] = "face_concerned",
			},
			localization_strings = {
				[1] = "pes_level_nurgle_swift_river_01",
				[2] = "pes_level_nurgle_swift_river_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_level_nurgle_swift_river_01",
				[2] = "pes_level_nurgle_swift_river_02",
			},
			sound_events_duration = {
				[1] = 5.3746666908264,
				[2] = 2.9363749027252,
			},
		},
		pes_nurgle_intro_a = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
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
				[1] = "pes_nurgle_intro_a_01",
				[2] = "pes_nurgle_intro_a_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_nurgle_intro_a_01",
				[2] = "pes_nurgle_intro_a_02",
			},
			sound_events_duration = {
				[1] = 8.272271156311,
				[2] = 8.2816457748413,
			},
		},
		pes_nurgle_intro_b = {
			category = "level_talk",
			database = "empire_soldier_nurgle",
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
				[1] = "pes_nurgle_intro_b_01",
				[2] = "pes_nurgle_intro_b_02",
			},
			randomize_indexes = {},
			sound_events = {
				[1] = "pes_nurgle_intro_b_01",
				[2] = "pes_nurgle_intro_b_02",
			},
			sound_events_duration = {
				[1] = 9.9031667709351,
				[2] = 7.1461873054504,
			},
		},
	})
end
