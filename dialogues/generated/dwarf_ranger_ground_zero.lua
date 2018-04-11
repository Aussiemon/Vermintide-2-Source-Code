return function ()
	define_rule({
		name = "pdr_level_ground_zero_canals",
		response = "pdr_level_ground_zero_canals",
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
		name = "pdr_level_ground_zero_canals_crossing",
		response = "pdr_level_ground_zero_canals_crossing",
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
				"ground_zero_canals_crossing"
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
				"level_ground_zero_canals_crossing",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_canals_crossing",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_ground_zero_corruption_everywhere",
		response = "pdr_level_ground_zero_corruption_everywhere",
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
		name = "pdr_level_ground_zero_crumbling",
		response = "pdr_level_ground_zero_crumbling",
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
		name = "pdr_level_ground_zero_looking_for_elevator",
		response = "pdr_level_ground_zero_looking_for_elevator",
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
		name = "pdr_level_ground_zero_smell",
		response = "pdr_level_ground_zero_smell",
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
		name = "pdr_level_ground_zero_the_hole",
		response = "pdr_level_ground_zero_the_hole",
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
		name = "pdr_level_ground_zero_welcoming_committee",
		response = "pdr_level_ground_zero_welcoming_committee",
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
	define_rule({
		name = "pdr_level_ground_zero_precarious",
		response = "pdr_level_ground_zero_precarious",
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
		name = "pdr_level_ground_zero_landslide",
		response = "pdr_level_ground_zero_landslide",
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
		name = "pdr_level_ground_zero_the_hole_second_view",
		response = "pdr_level_ground_zero_the_hole_second_view",
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
		name = "pdr_level_ground_zero_boss_near",
		response = "pdr_level_ground_zero_boss_near",
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
		name = "pdr_level_ground_zero_portal",
		response = "pdr_level_ground_zero_portal",
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
				"ground_zero_portal"
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
				"level_ground_zero_portal",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_ground_zero_portal",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_ground_zero_intro_a",
		response = "pdr_ground_zero_intro_a",
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
		name = "pdr_ground_zero_intro_b",
		response = "pdr_ground_zero_intro_b",
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
				"dwarf_ranger"
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
		name = "pdr_ground_zero_intro_c",
		response = "pdr_ground_zero_intro_c",
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
				"ground_zero_intro_c"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		response = "ebh_level_ground_zero_lord_intro",
		name = "ebh_level_ground_zero_lord_intro",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_intro"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer"
			}
		}
	})
	define_rule({
		response = "ebh_level_ground_zero_lord_spawn_enemies",
		name = "ebh_level_ground_zero_lord_spawn_enemies",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_summon"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer"
			}
		}
	})
	define_rule({
		response = "ebh_level_ground_zero_lord_banter",
		name = "ebh_level_ground_zero_lord_banter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_taunt"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer"
			}
		}
	})
	define_rule({
		response = "ebh_level_ground_zero_lord_insect_spell",
		name = "ebh_level_ground_zero_lord_insect_spell",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_insect_spell"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer"
			}
		}
	})
	define_rule({
		response = "ebh_level_ground_zero_lord_retaliation_missile",
		name = "ebh_level_ground_zero_lord_retaliation_missile",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ebh_retaliation_missile"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_sorcerer"
			}
		}
	})
	define_rule({
		name = "pdr_level_ground_zero_boss_spotted",
		response = "pdr_level_ground_zero_boss_spotted",
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
				"ebh_level_ground_zero_lord_intro"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"ground_zero_boss_spotted",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_boss_spotted",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_ground_zero_boss_taunt_reply",
		response = "pdr_level_ground_zero_boss_taunt_reply",
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
				"ebh_level_ground_zero_lord_banter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"ground_zero_boss_taunt_reply",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"ground_zero_boss_taunt_reply",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_ground_zero_complete",
		response = "pdr_level_ground_zero_complete",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"chaos_exalted_champion_warcamp"
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
				"user_memory",
				"level_ground_zero_complete",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"level_ground_zero_complete",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_ground_zero_canal_crossing",
		response = "pdr_level_ground_zero_canal_crossing",
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
	add_dialogues({
		pdr_level_ground_zero_precarious = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_precarious_01",
				"pdr_level_ground_zero_precarious_02",
				"pdr_level_ground_zero_precarious_03",
				"pdr_level_ground_zero_precarious_04"
			},
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
				"pdr_level_ground_zero_precarious_01",
				"pdr_level_ground_zero_precarious_02",
				"pdr_level_ground_zero_precarious_03",
				"pdr_level_ground_zero_precarious_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_boss_near = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_boss_near_01",
				"pdr_level_ground_zero_boss_near_02",
				"pdr_level_ground_zero_boss_near_03",
				"pdr_level_ground_zero_boss_near_04"
			},
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
				"pdr_level_ground_zero_boss_near_01",
				"pdr_level_ground_zero_boss_near_02",
				"pdr_level_ground_zero_boss_near_03",
				"pdr_level_ground_zero_boss_near_04"
			},
			randomize_indexes = {}
		},
		ebh_level_ground_zero_lord_spawn_enemies = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"ebh_level_ground_zero_lord_spawn_enemies_01",
				"ebh_level_ground_zero_lord_spawn_enemies_02",
				"ebh_level_ground_zero_lord_spawn_enemies_03",
				"ebh_level_ground_zero_lord_spawn_enemies_04"
			},
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
				"ebh_level_ground_zero_lord_spawn_enemies_01",
				"ebh_level_ground_zero_lord_spawn_enemies_02",
				"ebh_level_ground_zero_lord_spawn_enemies_03",
				"ebh_level_ground_zero_lord_spawn_enemies_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_corruption_everywhere = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_corruption_everywhere_01",
				"pdr_level_ground_zero_corruption_everywhere_02",
				"pdr_level_ground_zero_corruption_everywhere_03",
				"pdr_level_ground_zero_corruption_everywhere_04"
			},
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
				"pdr_level_ground_zero_corruption_everywhere_01",
				"pdr_level_ground_zero_corruption_everywhere_02",
				"pdr_level_ground_zero_corruption_everywhere_03",
				"pdr_level_ground_zero_corruption_everywhere_04"
			},
			randomize_indexes = {}
		},
		pdr_ground_zero_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_ground_zero_intro_b_01",
				[2.0] = "pdr_ground_zero_intro_b_02"
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
				[1.0] = "pdr_ground_zero_intro_b_01",
				[2.0] = "pdr_ground_zero_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_the_hole_second_view = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_the_hole_second_view_01",
				"pdr_level_ground_zero_the_hole_second_view_02",
				"pdr_level_ground_zero_the_hole_second_view_03",
				"pdr_level_ground_zero_the_hole_second_view_04"
			},
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
				"pdr_level_ground_zero_the_hole_second_view_01",
				"pdr_level_ground_zero_the_hole_second_view_02",
				"pdr_level_ground_zero_the_hole_second_view_03",
				"pdr_level_ground_zero_the_hole_second_view_04"
			},
			randomize_indexes = {}
		},
		pdr_ground_zero_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_ground_zero_intro_c_01",
				[2.0] = "pdr_ground_zero_intro_c_02"
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
				[1.0] = "pdr_ground_zero_intro_c_01",
				[2.0] = "pdr_ground_zero_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_ground_zero_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_ground_zero_intro_a_01",
				[2.0] = "pdr_ground_zero_intro_a_02"
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
				[1.0] = "pdr_ground_zero_intro_a_01",
				[2.0] = "pdr_ground_zero_intro_a_02"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_crumbling = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_crumbling_01",
				"pdr_level_ground_zero_crumbling_02",
				"pdr_level_ground_zero_crumbling_03",
				"pdr_level_ground_zero_crumbling_04"
			},
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
				"pdr_level_ground_zero_crumbling_01",
				"pdr_level_ground_zero_crumbling_02",
				"pdr_level_ground_zero_crumbling_03",
				"pdr_level_ground_zero_crumbling_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_canals = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_canals_01",
				"pdr_level_ground_zero_canals_02",
				"pdr_level_ground_zero_canals_03",
				"pdr_level_ground_zero_canals_04"
			},
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
				"pdr_level_ground_zero_canals_01",
				"pdr_level_ground_zero_canals_02",
				"pdr_level_ground_zero_canals_03",
				"pdr_level_ground_zero_canals_04"
			},
			randomize_indexes = {}
		},
		ebh_level_ground_zero_lord_insect_spell = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"ebh_level_ground_zero_lord_insect_spell_01",
				"ebh_level_ground_zero_lord_insect_spell_02",
				"ebh_level_ground_zero_lord_insect_spell_03",
				"ebh_level_ground_zero_lord_insect_spell_04"
			},
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
				"ebh_level_ground_zero_lord_insect_spell_01",
				"ebh_level_ground_zero_lord_insect_spell_02",
				"ebh_level_ground_zero_lord_insect_spell_03",
				"ebh_level_ground_zero_lord_insect_spell_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_the_hole = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_the_hole_01",
				"pdr_level_ground_zero_the_hole_02",
				"pdr_level_ground_zero_the_hole_03",
				"pdr_level_ground_zero_the_hole_04"
			},
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
				"pdr_level_ground_zero_the_hole_01",
				"pdr_level_ground_zero_the_hole_02",
				"pdr_level_ground_zero_the_hole_03",
				"pdr_level_ground_zero_the_hole_04"
			},
			randomize_indexes = {}
		},
		ebh_level_ground_zero_lord_intro = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_ground_zero",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "ebh_level_ground_zero_lord_intro_01",
				[2.0] = "ebh_level_ground_zero_lord_intro_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "ebh_level_ground_zero_lord_intro_01",
				[2.0] = "ebh_level_ground_zero_lord_intro_02"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_canal_crossing = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_canal_crossing_01",
				"pdr_level_ground_zero_canal_crossing_02",
				"pdr_level_ground_zero_canal_crossing_03",
				"pdr_level_ground_zero_canal_crossing_04"
			},
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
				"pdr_level_ground_zero_canal_crossing_01",
				"pdr_level_ground_zero_canal_crossing_02",
				"pdr_level_ground_zero_canal_crossing_03",
				"pdr_level_ground_zero_canal_crossing_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_complete = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_ground_zero",
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_level_ground_zero_complete_01",
				"pdr_level_ground_zero_complete_02",
				"pdr_level_ground_zero_complete_03"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_level_ground_zero_complete_01",
				"pdr_level_ground_zero_complete_02",
				"pdr_level_ground_zero_complete_03"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_portal = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_portal_01",
				"pdr_level_ground_zero_portal_02",
				"pdr_level_ground_zero_portal_03",
				"pdr_level_ground_zero_portal_04"
			},
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
				"pdr_level_ground_zero_portal_01",
				"pdr_level_ground_zero_portal_02",
				"pdr_level_ground_zero_portal_03",
				"pdr_level_ground_zero_portal_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_boss_taunt_reply = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "dwarf_ranger_ground_zero",
			category = "player_alerts_boss",
			dialogue_animations_n = 3,
			sound_events = {
				"pdr_level_ground_zero_boss_taunt_reply_01",
				"pdr_level_ground_zero_boss_taunt_reply_02",
				"pdr_level_ground_zero_boss_taunt_reply_03"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_level_ground_zero_boss_taunt_reply_01",
				"pdr_level_ground_zero_boss_taunt_reply_02",
				"pdr_level_ground_zero_boss_taunt_reply_03"
			},
			randomize_indexes = {}
		},
		ebh_level_ground_zero_lord_banter = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"ebh_level_ground_zero_lord_banter_02",
				"ebh_level_ground_zero_lord_banter_03",
				"ebh_level_ground_zero_lord_banter_04",
				"ebh_level_ground_zero_lord_banter_05"
			},
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
				"ebh_level_ground_zero_lord_banter_02",
				"ebh_level_ground_zero_lord_banter_03",
				"ebh_level_ground_zero_lord_banter_04",
				"ebh_level_ground_zero_lord_banter_05"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_smell = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_smell_01",
				"pdr_level_ground_zero_smell_02",
				"pdr_level_ground_zero_smell_03",
				"pdr_level_ground_zero_smell_04"
			},
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
				"pdr_level_ground_zero_smell_01",
				"pdr_level_ground_zero_smell_02",
				"pdr_level_ground_zero_smell_03",
				"pdr_level_ground_zero_smell_04"
			},
			randomize_indexes = {}
		},
		ebh_level_ground_zero_lord_retaliation_missile = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			sound_distance = 50,
			category = "boss_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"ebh_level_ground_zero_lord_retaliation_missile_01",
				"ebh_level_ground_zero_lord_retaliation_missile_02",
				"ebh_level_ground_zero_lord_retaliation_missile_03",
				"ebh_level_ground_zero_lord_retaliation_missile_04"
			},
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
				"ebh_level_ground_zero_lord_retaliation_missile_01",
				"ebh_level_ground_zero_lord_retaliation_missile_02",
				"ebh_level_ground_zero_lord_retaliation_missile_03",
				"ebh_level_ground_zero_lord_retaliation_missile_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_boss_spotted = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_ground_zero",
			category = "player_alerts_boss",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_ground_zero_boss_spotted_03",
				[2.0] = "pdr_level_ground_zero_boss_spotted_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_level_ground_zero_boss_spotted_03",
				[2.0] = "pdr_level_ground_zero_boss_spotted_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_looking_for_elevator = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_looking_for_elevator_01",
				"pdr_level_ground_zero_looking_for_elevator_02",
				"pdr_level_ground_zero_looking_for_elevator_03",
				"pdr_level_ground_zero_looking_for_elevator_04"
			},
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
				"pdr_level_ground_zero_looking_for_elevator_01",
				"pdr_level_ground_zero_looking_for_elevator_02",
				"pdr_level_ground_zero_looking_for_elevator_03",
				"pdr_level_ground_zero_looking_for_elevator_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_welcoming_committee = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_welcoming_committee_01",
				"pdr_level_ground_zero_welcoming_committee_02",
				"pdr_level_ground_zero_welcoming_committee_03",
				"pdr_level_ground_zero_welcoming_committee_04"
			},
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
				"pdr_level_ground_zero_welcoming_committee_01",
				"pdr_level_ground_zero_welcoming_committee_02",
				"pdr_level_ground_zero_welcoming_committee_03",
				"pdr_level_ground_zero_welcoming_committee_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_landslide = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "story_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_landslide_01",
				"pdr_level_ground_zero_landslide_02",
				"pdr_level_ground_zero_landslide_03",
				"pdr_level_ground_zero_landslide_04"
			},
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
				"pdr_level_ground_zero_landslide_01",
				"pdr_level_ground_zero_landslide_02",
				"pdr_level_ground_zero_landslide_03",
				"pdr_level_ground_zero_landslide_04"
			},
			randomize_indexes = {}
		},
		pdr_level_ground_zero_canals_crossing = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_ground_zero",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_ground_zero_canals_crossing_01",
				"pdr_level_ground_zero_canals_crossing_02",
				"pdr_level_ground_zero_canals_crossing_03",
				"pdr_level_ground_zero_canals_crossing_04"
			},
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
				"pdr_level_ground_zero_canals_crossing_01",
				"pdr_level_ground_zero_canals_crossing_02",
				"pdr_level_ground_zero_canals_crossing_03",
				"pdr_level_ground_zero_canals_crossing_04"
			},
			randomize_indexes = {}
		}
	})

	return 
end
