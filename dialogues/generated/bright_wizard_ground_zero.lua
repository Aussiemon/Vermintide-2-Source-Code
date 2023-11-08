return function ()
	define_rule({
		name = "pbw_ground_zero_intro_a",
		response = "pbw_ground_zero_intro_a",
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
				"ground_zero_intro_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"ground_zero_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_ground_zero_intro_b",
		response = "pbw_ground_zero_intro_b",
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
				"ground_zero_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"ground_zero_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_ground_zero_intro_c",
		response = "pbw_ground_zero_intro_c",
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
				"ground_zero_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"ground_zero_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_boss_near",
		response = "pbw_level_ground_zero_boss_near",
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
				"ground_zero_boss_near"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_boss_near",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_boss_near",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_canal_crossing",
		response = "pbw_level_ground_zero_canal_crossing",
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
				"ground_zero_canal_crossing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_canal_crossing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canal_crossing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_canals",
		response = "pbw_level_ground_zero_canals",
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
				"ground_zero_canals"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_canals",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canals",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_corruption_everywhere",
		response = "pbw_level_ground_zero_corruption_everywhere",
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
				"ground_zero_corruption_everywhere"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_corruption_everywhere",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_corruption_everywhere",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_crumbling",
		response = "pbw_level_ground_zero_crumbling",
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
				"ground_zero_crumbling"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_crumbling",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_crumbling",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_landslide",
		response = "pbw_level_ground_zero_landslide",
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
				"ground_zero_landslide"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_landslide",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_landslide",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_looking_for_elevator",
		response = "pbw_level_ground_zero_looking_for_elevator",
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
				"ground_zero_looking_for_elevator"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_looking_for_elevator",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_looking_for_elevator",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_precarious",
		response = "pbw_level_ground_zero_precarious",
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
				"ground_zero_precarious"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_precarious",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_precarious",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_smell",
		response = "pbw_level_ground_zero_smell",
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
				"ground_zero_smell"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_smell",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_smell",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_the_hole",
		response = "pbw_level_ground_zero_the_hole",
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
				"ground_zero_the_hole"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_the_hole",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_the_hole",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_the_hole_second_view",
		response = "pbw_level_ground_zero_the_hole_second_view",
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
				"ground_zero_the_hole_second_view"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_the_hole_second_view",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_the_hole_second_view",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_level_ground_zero_welcoming_committee",
		response = "pbw_level_ground_zero_welcoming_committee",
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
				"ground_zero_welcoming_committee"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"level_ground_zero_welcoming_committee",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_welcoming_committee",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_ground_zero_intro_a = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_ground_zero",
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
				[1.0] = "pbw_ground_zero_intro_a_01",
				[2.0] = "pbw_ground_zero_intro_a_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_ground_zero_intro_a_01",
				[2.0] = "pbw_ground_zero_intro_a_02"
			},
			sound_events_duration = {
				[1.0] = 7.636125087738,
				[2.0] = 5.249499797821
			}
		},
		pbw_ground_zero_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_ground_zero",
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
				[1.0] = "pbw_ground_zero_intro_b_01",
				[2.0] = "pbw_ground_zero_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_ground_zero_intro_b_01",
				[2.0] = "pbw_ground_zero_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.6361041069031,
				[2.0] = 6.3433957099915
			}
		},
		pbw_ground_zero_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_ground_zero",
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
				[1.0] = "pbw_ground_zero_intro_c_01",
				[2.0] = "pbw_ground_zero_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_ground_zero_intro_c_01",
				[2.0] = "pbw_ground_zero_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 9.477520942688,
				[2.0] = 5.3639373779297
			}
		},
		pbw_level_ground_zero_boss_near = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "cut_scene",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_boss_near_01",
				"pbw_level_ground_zero_boss_near_02",
				"pbw_level_ground_zero_boss_near_03",
				"pbw_level_ground_zero_boss_near_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_boss_near_01",
				"pbw_level_ground_zero_boss_near_02",
				"pbw_level_ground_zero_boss_near_03",
				"pbw_level_ground_zero_boss_near_04"
			},
			sound_events_duration = {
				3.9863123893738,
				4.1048331260681,
				3.118499994278,
				2.7592709064484
			}
		},
		pbw_level_ground_zero_canal_crossing = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_canal_crossing_01",
				"pbw_level_ground_zero_canal_crossing_02",
				"pbw_level_ground_zero_canal_crossing_03",
				"pbw_level_ground_zero_canal_crossing_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_canal_crossing_01",
				"pbw_level_ground_zero_canal_crossing_02",
				"pbw_level_ground_zero_canal_crossing_03",
				"pbw_level_ground_zero_canal_crossing_04"
			},
			sound_events_duration = {
				4.1919374465942,
				4.2004165649414,
				5.814875125885,
				2.5520625114441
			}
		},
		pbw_level_ground_zero_canals = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
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
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pbw_level_ground_zero_canals_01",
				"pbw_level_ground_zero_canals_02",
				"pbw_level_ground_zero_canals_03",
				"pbw_level_ground_zero_canals_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_canals_01",
				"pbw_level_ground_zero_canals_02",
				"pbw_level_ground_zero_canals_03",
				"pbw_level_ground_zero_canals_04"
			},
			sound_events_duration = {
				5.7919583320618,
				3.512312412262,
				2.3735625743866,
				3.1449167728424
			}
		},
		pbw_level_ground_zero_corruption_everywhere = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pbw_level_ground_zero_corruption_everywhere_01",
				"pbw_level_ground_zero_corruption_everywhere_02",
				"pbw_level_ground_zero_corruption_everywhere_03",
				"pbw_level_ground_zero_corruption_everywhere_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_corruption_everywhere_01",
				"pbw_level_ground_zero_corruption_everywhere_02",
				"pbw_level_ground_zero_corruption_everywhere_03",
				"pbw_level_ground_zero_corruption_everywhere_04"
			},
			sound_events_duration = {
				3.9973750114441,
				4.9643335342407,
				4.7041249275208,
				3.1804165840149
			}
		},
		pbw_level_ground_zero_crumbling = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_crumbling_01",
				"pbw_level_ground_zero_crumbling_02",
				"pbw_level_ground_zero_crumbling_03",
				"pbw_level_ground_zero_crumbling_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_crumbling_01",
				"pbw_level_ground_zero_crumbling_02",
				"pbw_level_ground_zero_crumbling_03",
				"pbw_level_ground_zero_crumbling_04"
			},
			sound_events_duration = {
				2.4560208320618,
				3.3044583797455,
				2.3943123817444,
				3.2752499580383
			}
		},
		pbw_level_ground_zero_landslide = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "cut_scene",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_landslide_01",
				"pbw_level_ground_zero_landslide_02",
				"pbw_level_ground_zero_landslide_03",
				"pbw_level_ground_zero_landslide_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_landslide_01",
				"pbw_level_ground_zero_landslide_02",
				"pbw_level_ground_zero_landslide_03",
				"pbw_level_ground_zero_landslide_04"
			},
			sound_events_duration = {
				3.276645898819,
				4.4116667509079,
				3.7241249084473,
				4.7655210494995
			}
		},
		pbw_level_ground_zero_looking_for_elevator = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_looking_for_elevator_01",
				"pbw_level_ground_zero_looking_for_elevator_02",
				"pbw_level_ground_zero_looking_for_elevator_03",
				"pbw_level_ground_zero_looking_for_elevator_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_looking_for_elevator_01",
				"pbw_level_ground_zero_looking_for_elevator_02",
				"pbw_level_ground_zero_looking_for_elevator_03",
				"pbw_level_ground_zero_looking_for_elevator_04"
			},
			sound_events_duration = {
				2.4431874752045,
				3.507333278656,
				5.8910207748413,
				2.3743958473206
			}
		},
		pbw_level_ground_zero_precarious = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_precarious_01",
				"pbw_level_ground_zero_precarious_02",
				"pbw_level_ground_zero_precarious_03",
				"pbw_level_ground_zero_precarious_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_precarious_01",
				"pbw_level_ground_zero_precarious_02",
				"pbw_level_ground_zero_precarious_03",
				"pbw_level_ground_zero_precarious_04"
			},
			sound_events_duration = {
				2.0349373817444,
				2.0445625782013,
				2.5372083187103,
				2.1985416412353
			}
		},
		pbw_level_ground_zero_smell = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "level_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_smell_01",
				"pbw_level_ground_zero_smell_02",
				"pbw_level_ground_zero_smell_03",
				"pbw_level_ground_zero_smell_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_smell_01",
				"pbw_level_ground_zero_smell_02",
				"pbw_level_ground_zero_smell_03",
				"pbw_level_ground_zero_smell_04"
			},
			sound_events_duration = {
				2.2152292728424,
				2.2686457633972,
				1.528104186058,
				2.1339478492737
			}
		},
		pbw_level_ground_zero_the_hole = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_the_hole_01",
				"pbw_level_ground_zero_the_hole_02",
				"pbw_level_ground_zero_the_hole_03",
				"pbw_level_ground_zero_the_hole_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_the_hole_01",
				"pbw_level_ground_zero_the_hole_02",
				"pbw_level_ground_zero_the_hole_03",
				"pbw_level_ground_zero_the_hole_04"
			},
			sound_events_duration = {
				4.0749688148499,
				5.4479999542236,
				4.9621458053589,
				5.4297914505005
			}
		},
		pbw_level_ground_zero_the_hole_second_view = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_the_hole_second_view_01",
				"pbw_level_ground_zero_the_hole_second_view_02",
				"pbw_level_ground_zero_the_hole_second_view_03",
				"pbw_level_ground_zero_the_hole_second_view_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_the_hole_second_view_01",
				"pbw_level_ground_zero_the_hole_second_view_02",
				"pbw_level_ground_zero_the_hole_second_view_03",
				"pbw_level_ground_zero_the_hole_second_view_04"
			},
			sound_events_duration = {
				3.5604999065399,
				3.5347499847412,
				5.8615207672119,
				3.5587291717529
			}
		},
		pbw_level_ground_zero_welcoming_committee = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_ground_zero",
			sound_events_n = 4,
			category = "story_talk",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_level_ground_zero_welcoming_committee_01",
				"pbw_level_ground_zero_welcoming_committee_02",
				"pbw_level_ground_zero_welcoming_committee_03",
				"pbw_level_ground_zero_welcoming_committee_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_level_ground_zero_welcoming_committee_01",
				"pbw_level_ground_zero_welcoming_committee_02",
				"pbw_level_ground_zero_welcoming_committee_03",
				"pbw_level_ground_zero_welcoming_committee_04"
			},
			sound_events_duration = {
				5.9077291488647,
				4.531229019165,
				3.0348541736603,
				1.6564583778381
			}
		}
	})
end
