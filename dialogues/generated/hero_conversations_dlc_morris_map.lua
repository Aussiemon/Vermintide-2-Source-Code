return function ()
	define_rule({
		response = "nfl_morris_before_shrine_tutorial_01",
		name = "nfl_morris_before_shrine_tutorial_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"deus_before_shrine_tutorial"
			},
			{
				"global_context",
				"times_shrine_was_in_range",
				OP.EQ,
				1
			}
		}
	})
	define_rule({
		response = "nfl_morris_map_shrine_tutorial_one",
		name = "nfl_morris_map_shrine_tutorial_one",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"deus_shrine_tutorial"
			},
			{
				"global_context",
				"times_shrine_visited",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		response = "nfl_morris_map_shrine_tutorial_three",
		name = "nfl_morris_map_shrine_tutorial_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nfl_morris_map_shrine_tutorial_two"
			}
		}
	})
	define_rule({
		response = "nfl_morris_map_shrine_tutorial_two",
		name = "nfl_morris_map_shrine_tutorial_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nfl_morris_map_shrine_tutorial_one"
			}
		}
	})
	define_rule({
		response = "nfl_morris_map_tutorial_five",
		name = "nfl_morris_map_tutorial_five",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nfl_morris_map_tutorial_three"
			}
		}
	})
	define_rule({
		response = "nfl_morris_map_tutorial_one",
		name = "nfl_morris_map_tutorial_one",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"deus_map_tutorial"
			},
			{
				"global_context",
				"map_has_belakor",
				OP.EQ,
				0
			},
			{
				"global_context",
				"times_map_visited",
				OP.EQ,
				1
			}
		}
	})
	define_rule({
		response = "nfl_morris_map_tutorial_three",
		name = "nfl_morris_map_tutorial_three",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nfl_morris_map_tutorial_two"
			}
		}
	})
	define_rule({
		response = "nfl_morris_map_tutorial_two",
		name = "nfl_morris_map_tutorial_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"nfl_morris_map_tutorial_one"
			}
		}
	})
	add_dialogues({
		nfl_morris_before_shrine_tutorial_01 = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_map",
			sound_events_n = 4,
			category = "special_occasion",
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
				"nfl_morris_map_tutorial_four_01",
				"nfl_morris_map_tutorial_four_02",
				"nfl_morris_map_tutorial_four_03",
				"nfl_morris_map_tutorial_four_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_morris_map_tutorial_four_01",
				"nfl_morris_map_tutorial_four_02",
				"nfl_morris_map_tutorial_four_03",
				"nfl_morris_map_tutorial_four_04"
			},
			sound_events_duration = {
				5.7184581756592,
				6.7569584846497,
				5.3052706718445,
				5.3604168891907
			}
		},
		nfl_morris_map_shrine_tutorial_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_map",
			sound_events_n = 4,
			category = "special_occasion",
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
				"nfl_morris_map_shrine_tutorial_one_01",
				"nfl_morris_map_shrine_tutorial_one_02",
				"nfl_morris_map_shrine_tutorial_one_03",
				"nfl_morris_map_shrine_tutorial_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_morris_map_shrine_tutorial_one_01",
				"nfl_morris_map_shrine_tutorial_one_02",
				"nfl_morris_map_shrine_tutorial_one_03",
				"nfl_morris_map_shrine_tutorial_one_04"
			},
			sound_events_duration = {
				5.4381875991821,
				5.916916847229,
				5.7074375152588,
				5.2709164619446
			}
		},
		nfl_morris_map_shrine_tutorial_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_map",
			sound_events_n = 4,
			category = "special_occasion",
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
				"nfl_morris_map_shrine_tutorial_three_01",
				"nfl_morris_map_shrine_tutorial_three_02",
				"nfl_morris_map_shrine_tutorial_three_03",
				"nfl_morris_map_shrine_tutorial_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_morris_map_shrine_tutorial_three_01",
				"nfl_morris_map_shrine_tutorial_three_02",
				"nfl_morris_map_shrine_tutorial_three_03",
				"nfl_morris_map_shrine_tutorial_three_04"
			},
			sound_events_duration = {
				5.8499999046326,
				5.0915417671204,
				6.0993332862854,
				5.8219585418701
			}
		},
		nfl_morris_map_shrine_tutorial_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_map",
			sound_events_n = 4,
			category = "special_occasion",
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
				"nfl_morris_map_shrine_tutorial_two_01",
				"nfl_morris_map_shrine_tutorial_two_02",
				"nfl_morris_map_shrine_tutorial_two_03",
				"nfl_morris_map_shrine_tutorial_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_morris_map_shrine_tutorial_two_01",
				"nfl_morris_map_shrine_tutorial_two_02",
				"nfl_morris_map_shrine_tutorial_two_03",
				"nfl_morris_map_shrine_tutorial_two_04"
			},
			sound_events_duration = {
				5.4122915267944,
				4.8190627098083,
				4.983916759491,
				6.6137290000916
			}
		},
		nfl_morris_map_tutorial_five = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_map",
			sound_events_n = 4,
			category = "special_occasion",
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
				"nfl_morris_map_tutorial_five_01",
				"nfl_morris_map_tutorial_five_02",
				"nfl_morris_map_tutorial_five_03",
				"nfl_morris_map_tutorial_five_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_morris_map_tutorial_five_01",
				"nfl_morris_map_tutorial_five_02",
				"nfl_morris_map_tutorial_five_03",
				"nfl_morris_map_tutorial_five_04"
			},
			sound_events_duration = {
				3.1788749694824,
				2.6133332252502,
				2.6453542709351,
				3.3626666069031
			}
		},
		nfl_morris_map_tutorial_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_map",
			sound_events_n = 4,
			category = "special_occasion",
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
				"nfl_morris_map_tutorial_one_01",
				"nfl_morris_map_tutorial_one_02",
				"nfl_morris_map_tutorial_one_03",
				"nfl_morris_map_tutorial_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_morris_map_tutorial_one_01",
				"nfl_morris_map_tutorial_one_02",
				"nfl_morris_map_tutorial_one_03",
				"nfl_morris_map_tutorial_one_04"
			},
			sound_events_duration = {
				3.9939374923706,
				4.296374797821,
				5.4429168701172,
				4.2527918815613
			}
		},
		nfl_morris_map_tutorial_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_map",
			sound_events_n = 4,
			category = "special_occasion",
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
				"nfl_morris_map_tutorial_three_01",
				"nfl_morris_map_tutorial_three_02",
				"nfl_morris_map_tutorial_three_03",
				"nfl_morris_map_tutorial_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_morris_map_tutorial_three_01",
				"nfl_morris_map_tutorial_three_02",
				"nfl_morris_map_tutorial_three_03",
				"nfl_morris_map_tutorial_three_04"
			},
			sound_events_duration = {
				4.7244377136231,
				4.4187707901001,
				4.3516664505005,
				5.6311874389648
			}
		},
		nfl_morris_map_tutorial_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_map",
			sound_events_n = 4,
			category = "special_occasion",
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
				"nfl_morris_map_tutorial_two_01",
				"nfl_morris_map_tutorial_two_02",
				"nfl_morris_map_tutorial_two_03",
				"nfl_morris_map_tutorial_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"nfl_morris_map_tutorial_two_01",
				"nfl_morris_map_tutorial_two_02",
				"nfl_morris_map_tutorial_two_03",
				"nfl_morris_map_tutorial_two_04"
			},
			sound_events_duration = {
				5.6005206108093,
				4.5177083015442,
				4.5318126678467,
				4.6041460037231
			}
		}
	})
end
