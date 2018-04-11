return function ()
	define_rule({
		name = "pdr_level_bell_distance_01",
		response = "pdr_level_bell_distance_01",
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
				"bell_distance"
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
				"level_bell_distance",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_distance",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_rain_01",
		response = "pdr_level_bell_rain_01",
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
				"bell_rain"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_rain",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rain",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_poor_quarters_01",
		response = "pdr_level_bell_poor_quarters_01",
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
				"bell_poor_quarters"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_poor_quarters",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_poor_quarters",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_rooftops_01",
		response = "pdr_level_bell_rooftops_01",
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
				"bell_rooftops"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_rooftops",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rooftops",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_rich_quarters_01",
		response = "pdr_level_bell_rich_quarters_01",
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
				"bell_rich_quarters"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_rich_quarters",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_rich_quarters",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_spotting_01",
		response = "pdr_level_bell_spotting_01",
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
				"bell_spotting"
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
				"level_bell_spotting",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_spotting",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_long_stairs_01",
		response = "pdr_level_bell_long_stairs_01",
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
				"bell_long_stairs"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_long_stairs",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_long_stairs",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_vista_01",
		response = "pdr_level_bell_vista_01",
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
				"bell_vista"
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"level_bell_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_reaching_bell_01",
		response = "pdr_level_bell_reaching_bell_01",
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
				"bell_reaching_bell"
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
				"level_bell_reaching_bell",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_reaching_bell",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_destroyed_01",
		response = "pdr_level_bell_destroyed_01",
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
				"bell_destroyed"
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
				"level_bell_destroyed",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_destroyed",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_exit_01",
		response = "pdr_level_bell_exit_01",
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
				"bell_exit"
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
				"level_bell_exit",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_exit",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_bell_intro_a",
		response = "pdr_bell_intro_a",
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
				"bell_intro_a"
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
				"bell_intro_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_bell_intro_b",
		response = "pdr_bell_intro_b",
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
				"bell_intro_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"bell_intro_b",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_b",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_bell_intro_c",
		response = "pdr_bell_intro_c",
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
				"bell_intro_b"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"bell_intro_c",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"bell_intro_c",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_chime_01",
		response = "pdr_level_bell_chime_01",
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
				"bell_chime"
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
				"level_bell_chime",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_chime",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_horde_01",
		response = "pdr_level_bell_horde_01",
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
				"bell_horde"
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
				"level_bell_horde",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_horde",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_falling_01",
		response = "pdr_level_bell_falling_01",
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
				"bell_falling"
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
				"level_bell_falling",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_falling",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_bell_effect_01",
		response = "pdr_level_bell_effect_01",
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
				"bell_effect"
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
				"level_bell_effect",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"level_bell_effect",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pdr_level_bell_distance_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_distance_01",
				"pdr_level_bell_distance_02",
				"pdr_level_bell_distance_03",
				"pdr_level_bell_distance_04"
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
				"pdr_level_bell_distance_01",
				"pdr_level_bell_distance_02",
				"pdr_level_bell_distance_03",
				"pdr_level_bell_distance_04"
			},
			randomize_indexes = {}
		},
		pdr_bell_intro_c = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_bell_intro_c_01",
				[2.0] = "pdr_bell_intro_c_02"
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
				[1.0] = "pdr_bell_intro_c_01",
				[2.0] = "pdr_bell_intro_c_02"
			},
			randomize_indexes = {}
		},
		pdr_bell_intro_b = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_bell_intro_b_01",
				[2.0] = "pdr_bell_intro_b_02"
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
				[1.0] = "pdr_bell_intro_b_01",
				[2.0] = "pdr_bell_intro_b_02"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_chime_01 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_bell_chime_01",
				[2.0] = "pdr_level_bell_chime_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_level_bell_chime_01",
				[2.0] = "pdr_level_bell_chime_02"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_destroyed_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_destroyed_01",
				"pdr_level_bell_destroyed_02",
				"pdr_level_bell_destroyed_03",
				"pdr_level_bell_destroyed_04"
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
				"pdr_level_bell_destroyed_01",
				"pdr_level_bell_destroyed_02",
				"pdr_level_bell_destroyed_03",
				"pdr_level_bell_destroyed_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_rain_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_rain_01",
				"pdr_level_bell_rain_02",
				"pdr_level_bell_rain_03",
				"pdr_level_bell_rain_04"
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
				"pdr_level_bell_rain_01",
				"pdr_level_bell_rain_02",
				"pdr_level_bell_rain_03",
				"pdr_level_bell_rain_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_rooftops_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_rooftops_01",
				"pdr_level_bell_rooftops_02",
				"pdr_level_bell_rooftops_03",
				"pdr_level_bell_rooftops_04"
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
				"pdr_level_bell_rooftops_01",
				"pdr_level_bell_rooftops_02",
				"pdr_level_bell_rooftops_03",
				"pdr_level_bell_rooftops_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_rich_quarters_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_rich_quarters_01",
				"pdr_level_bell_rich_quarters_02",
				"pdr_level_bell_rich_quarters_03",
				"pdr_level_bell_rich_quarters_04"
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
				"pdr_level_bell_rich_quarters_01",
				"pdr_level_bell_rich_quarters_02",
				"pdr_level_bell_rich_quarters_03",
				"pdr_level_bell_rich_quarters_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_exit_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_exit_01",
				"pdr_level_bell_exit_02",
				"pdr_level_bell_exit_03",
				"pdr_level_bell_exit_04"
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
				"pdr_level_bell_exit_01",
				"pdr_level_bell_exit_02",
				"pdr_level_bell_exit_03",
				"pdr_level_bell_exit_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_long_stairs_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_long_stairs_01",
				"pdr_level_bell_long_stairs_02",
				"pdr_level_bell_long_stairs_03",
				"pdr_level_bell_long_stairs_04"
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
				"pdr_level_bell_long_stairs_01",
				"pdr_level_bell_long_stairs_02",
				"pdr_level_bell_long_stairs_03",
				"pdr_level_bell_long_stairs_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_falling_01 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_bell_falling_01",
				[2.0] = "pdr_level_bell_falling_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_level_bell_falling_01",
				[2.0] = "pdr_level_bell_falling_02"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_vista_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_vista_01",
				"pdr_level_bell_vista_02",
				"pdr_level_bell_vista_03",
				"pdr_level_bell_vista_04"
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
				"pdr_level_bell_vista_01",
				"pdr_level_bell_vista_02",
				"pdr_level_bell_vista_03",
				"pdr_level_bell_vista_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_poor_quarters_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_poor_quarters_01",
				"pdr_level_bell_poor_quarters_02",
				"pdr_level_bell_poor_quarters_03",
				"pdr_level_bell_poor_quarters_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_calm",
				"face_calm",
				"face_calm",
				"face_calm"
			},
			localization_strings = {
				"pdr_level_bell_poor_quarters_01",
				"pdr_level_bell_poor_quarters_02",
				"pdr_level_bell_poor_quarters_03",
				"pdr_level_bell_poor_quarters_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_spotting_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_spotting_01",
				"pdr_level_bell_spotting_02",
				"pdr_level_bell_spotting_03",
				"pdr_level_bell_spotting_04"
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
				"pdr_level_bell_spotting_01",
				"pdr_level_bell_spotting_02",
				"pdr_level_bell_spotting_03",
				"pdr_level_bell_spotting_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_effect_01 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_bell_effect_01",
				[2.0] = "pdr_level_bell_effect_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_level_bell_effect_01",
				[2.0] = "pdr_level_bell_effect_02"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_reaching_bell_01 = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pdr_level_bell_reaching_bell_01",
				"pdr_level_bell_reaching_bell_02",
				"pdr_level_bell_reaching_bell_03",
				"pdr_level_bell_reaching_bell_04"
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
				"pdr_level_bell_reaching_bell_01",
				"pdr_level_bell_reaching_bell_02",
				"pdr_level_bell_reaching_bell_03",
				"pdr_level_bell_reaching_bell_04"
			},
			randomize_indexes = {}
		},
		pdr_level_bell_horde_01 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_level_bell_horde_01",
				[2.0] = "pdr_level_bell_horde_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_level_bell_horde_01",
				[2.0] = "pdr_level_bell_horde_02"
			},
			randomize_indexes = {}
		},
		pdr_bell_intro_a = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "dwarf_ranger_bell",
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_bell_intro_a_01",
				[2.0] = "pdr_bell_intro_a_02"
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
				[1.0] = "pdr_bell_intro_a_01",
				[2.0] = "pdr_bell_intro_a_02"
			},
			randomize_indexes = {}
		}
	})

	return 
end
