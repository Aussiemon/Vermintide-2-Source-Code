return function ()
	define_rule({
		name = "pes_wizard_trail_intro_b",
		response = "pes_wizard_trail_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_intro_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_intro_b",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_intro_b",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_intro_c",
		response = "pes_wizard_trail_intro_c",
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
				"wizard_trail_intro_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_intro_c",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_intro_c",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_caravan_b",
		name = "pes_wizard_trail_caravan_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_caravan_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_lower_bridge_b",
		name = "pes_wizard_trail_lower_bridge_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_lower_bridge_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_crate_drop_b",
		name = "pes_wizard_trail_crate_drop_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nik_wizard_trail_crate_drop_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_olesya_revealed_b",
		name = "pes_wizard_trail_olesya_revealed_b",
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
				"nfl_wizard_trail_olesya_revealed_a"
			},
			{
				"query_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_olesya_revealed_b_distance",
		name = "pes_wizard_trail_olesya_revealed_b_distance",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wizard_trail_olesya_revealed_a_done"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_cargo",
		response = "pes_wizard_trail_cargo",
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
				"wizard_trail_cargo"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_cargo",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_cargo",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_stuck_a",
		response = "pes_wizard_trail_stuck_a",
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
				"wizard_trail_stuck_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_stuck_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_stuck_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_stuck_b",
		name = "pes_wizard_trail_stuck_b",
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
				"wizard_trail_stuck_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_free_sleigh",
		response = "pes_wizard_trail_free_sleigh",
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
				"wizard_trail_free_sleigh"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_free_sleigh",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_free_sleigh",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_shove",
		response = "pes_wizard_trail_shove",
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
				"wizard_trail_shove"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_shove",
				OP.LT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_shove",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_bridge_down",
		response = "pes_wizard_trail_bridge_down",
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
				"wizard_trail_bridge_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_bridge_down",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_bridge_down",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_sleigh_gone",
		response = "pes_wizard_trail_sleigh_gone",
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
				"wizard_trail_sleigh_gone"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_sleigh_gone",
				OP.LT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_sleigh_gone",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_crate_down",
		response = "pes_wizard_trail_crate_down",
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
				"wizard_trail_crate_down"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_crate_down",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_crate_down",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_illusion_fades_a",
		response = "pes_wizard_trail_illusion_fades_a",
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
				"wizard_trail_illusion_fades_a"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_illusion_fades_a",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_illusion_fades_a",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_illusion_fades_b",
		name = "pes_wizard_trail_illusion_fades_b",
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
				"wizard_trail_illusion_fades_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_illusion_fades_c",
		name = "pes_wizard_trail_illusion_fades_c",
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
				"wizard_trail_illusion_fades_b"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_wizard_trail_intruders_b",
		name = "pes_wizard_trail_intruders_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nsf_wizard_trail_intruders_a_done"
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				0
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_vista",
		response = "pes_wizard_trail_vista",
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
				"wizard_trail_vista"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_vista_two",
		response = "pes_wizard_trail_vista_two",
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
				"wizard_trail_vista_two"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_vista_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_vista_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_sleigh_found",
		response = "pes_wizard_trail_sleigh_found",
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
				"wizard_trail_sleigh_found"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_sleigh_found",
				OP.LT,
				2
			},
			{
				"faction_memory",
				"time_since_sleigh_found",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_sleigh_found",
				OP.TIMESET
			},
			{
				"faction_memory",
				"wizard_trail_sleigh_found",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_wizard_trail_open_crate",
		response = "pes_wizard_trail_open_crate",
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
				"wizard_trail_open_crate"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wizard_trail_open_crate",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"wizard_trail_open_crate",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pes_wizard_trail_crate_drop_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_crate_drop_b_01",
				"pes_wizard_trail_crate_drop_b_02",
				"pes_wizard_trail_crate_drop_b_03",
				"pes_wizard_trail_crate_drop_b_04"
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
			sound_events_duration = {
				2.7660000324249,
				2.8870000839233,
				2.7239999771118,
				3.2479791641235
			},
			localization_strings = {
				"pes_wizard_trail_crate_drop_b_01",
				"pes_wizard_trail_crate_drop_b_02",
				"pes_wizard_trail_crate_drop_b_03",
				"pes_wizard_trail_crate_drop_b_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_crate_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_crate_down_01",
				"pes_wizard_trail_crate_down_02",
				"pes_wizard_trail_crate_down_03",
				"pes_wizard_trail_crate_down_04"
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
			sound_events_duration = {
				3.3579790592194,
				4.6560001373291,
				3.1070001125336,
				6.3049793243408
			},
			localization_strings = {
				"pes_wizard_trail_crate_down_01",
				"pes_wizard_trail_crate_down_02",
				"pes_wizard_trail_crate_down_03",
				"pes_wizard_trail_crate_down_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_caravan_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_wizard_trail_caravan_b_01",
				[2.0] = "pes_wizard_trail_caravan_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.2479999065399,
				[2.0] = 2.2059791088104
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_caravan_b_01",
				[2.0] = "pes_wizard_trail_caravan_b_02"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_free_sleigh = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_free_sleigh_01",
				"pes_wizard_trail_free_sleigh_02",
				"pes_wizard_trail_free_sleigh_03",
				"pes_wizard_trail_free_sleigh_04"
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
			sound_events_duration = {
				2.6259999275208,
				2.2890000343323,
				2.4690001010895,
				3.3669791221619
			},
			localization_strings = {
				"pes_wizard_trail_free_sleigh_01",
				"pes_wizard_trail_free_sleigh_02",
				"pes_wizard_trail_free_sleigh_03",
				"pes_wizard_trail_free_sleigh_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_illusion_fades_c = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_illusion_fades_c_01",
				"pes_wizard_trail_illusion_fades_c_02",
				"pes_wizard_trail_illusion_fades_c_03",
				"pes_wizard_trail_illusion_fades_c_04"
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
			sound_events_duration = {
				4.9150414466858,
				3.1513540744781,
				3.5974373817444,
				3.494437456131
			},
			localization_strings = {
				"pes_wizard_trail_illusion_fades_c_01",
				"pes_wizard_trail_illusion_fades_c_02",
				"pes_wizard_trail_illusion_fades_c_03",
				"pes_wizard_trail_illusion_fades_c_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_vista_two = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_vista_two_01",
				"pes_wizard_trail_vista_two_02",
				"pes_wizard_trail_vista_two_03",
				"pes_wizard_trail_vista_two_04"
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
			sound_events_duration = {
				3.2159790992737,
				1.9629791975021,
				6.812979221344,
				3.8510000705719
			},
			localization_strings = {
				"pes_wizard_trail_vista_two_01",
				"pes_wizard_trail_vista_two_02",
				"pes_wizard_trail_vista_two_03",
				"pes_wizard_trail_vista_two_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_sleigh_found = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_sleigh_found_01",
				"pes_wizard_trail_sleigh_found_02",
				"pes_wizard_trail_sleigh_found_03",
				"pes_wizard_trail_sleigh_found_04"
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
			sound_events_duration = {
				3.0099999904633,
				2.8019790649414,
				2.170000076294,
				2.7579998970032
			},
			localization_strings = {
				"pes_wizard_trail_sleigh_found_01",
				"pes_wizard_trail_sleigh_found_02",
				"pes_wizard_trail_sleigh_found_03",
				"pes_wizard_trail_sleigh_found_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_lower_bridge_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_wizard_trail_lower_bridge_b_01",
				[2.0] = "pes_wizard_trail_lower_bridge_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 0.64200001955032,
				[2.0] = 0.99199998378754
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_lower_bridge_b_01",
				[2.0] = "pes_wizard_trail_lower_bridge_b_02"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_vista = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_vista_01",
				"pes_wizard_trail_vista_02",
				"pes_wizard_trail_vista_03",
				"pes_wizard_trail_vista_04"
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
			sound_events_duration = {
				2.0249791145325,
				2.9399790763855,
				2.9629790782928,
				2.9869792461395
			},
			localization_strings = {
				"pes_wizard_trail_vista_01",
				"pes_wizard_trail_vista_02",
				"pes_wizard_trail_vista_03",
				"pes_wizard_trail_vista_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_open_crate = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_open_crate_01",
				"pes_wizard_trail_open_crate_02",
				"pes_wizard_trail_open_crate_03",
				"pes_wizard_trail_open_crate_04"
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
			sound_events_duration = {
				2.1079790592194,
				3.6779792308807,
				2.2799999713898,
				2.9539999961853
			},
			localization_strings = {
				"pes_wizard_trail_open_crate_01",
				"pes_wizard_trail_open_crate_02",
				"pes_wizard_trail_open_crate_03",
				"pes_wizard_trail_open_crate_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_intruders_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_wizard_trail_intruders_b_01",
				[2.0] = "pes_wizard_trail_intruders_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.6410000324249,
				[2.0] = 2.9899792671204
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_intruders_b_01",
				[2.0] = "pes_wizard_trail_intruders_b_02"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_olesya_revealed_b_distance = {
			override_awareness = "wizard_trail_olesya_revealed_b_done",
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_olesya_revealed_b_01",
				"pes_wizard_trail_olesya_revealed_b_02",
				"pes_wizard_trail_olesya_revealed_b_03",
				"pes_wizard_trail_olesya_revealed_b_04"
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
			sound_events_duration = {
				2.2679791450501,
				0.94800001382828,
				3.1889998912811,
				2.3719999790192
			},
			localization_strings = {
				"pes_wizard_trail_olesya_revealed_b_01",
				"pes_wizard_trail_olesya_revealed_b_02",
				"pes_wizard_trail_olesya_revealed_b_03",
				"pes_wizard_trail_olesya_revealed_b_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_illusion_fades_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_illusion_fades_b_01",
				"pes_wizard_trail_illusion_fades_b_02",
				"pes_wizard_trail_illusion_fades_b_03",
				"pes_wizard_trail_illusion_fades_b_04"
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
			sound_events_duration = {
				2.3775000572205,
				2.7157707214356,
				1.4217292070389,
				2.676479101181
			},
			localization_strings = {
				"pes_wizard_trail_illusion_fades_b_01",
				"pes_wizard_trail_illusion_fades_b_02",
				"pes_wizard_trail_illusion_fades_b_03",
				"pes_wizard_trail_illusion_fades_b_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_bridge_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_bridge_down_01",
				"pes_wizard_trail_bridge_down_02",
				"pes_wizard_trail_bridge_down_03",
				"pes_wizard_trail_bridge_down_04"
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
			sound_events_duration = {
				1.6640000343323,
				1.0340000391007,
				4.5459790229797,
				2.7449998855591
			},
			localization_strings = {
				"pes_wizard_trail_bridge_down_01",
				"pes_wizard_trail_bridge_down_02",
				"pes_wizard_trail_bridge_down_03",
				"pes_wizard_trail_bridge_down_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_olesya_revealed_b = {
			override_awareness = "wizard_trail_olesya_revealed_b_done",
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_olesya_revealed_b_01",
				"pes_wizard_trail_olesya_revealed_b_02",
				"pes_wizard_trail_olesya_revealed_b_03",
				"pes_wizard_trail_olesya_revealed_b_04"
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
			sound_events_duration = {
				2.2679791450501,
				0.94800001382828,
				3.1889998912811,
				2.3719999790192
			},
			localization_strings = {
				"pes_wizard_trail_olesya_revealed_b_01",
				"pes_wizard_trail_olesya_revealed_b_02",
				"pes_wizard_trail_olesya_revealed_b_03",
				"pes_wizard_trail_olesya_revealed_b_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_stuck_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_stuck_a_01",
				"pes_wizard_trail_stuck_a_02",
				"pes_wizard_trail_stuck_a_03",
				"pes_wizard_trail_stuck_a_04"
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
			sound_events_duration = {
				1.3159999847412,
				2.5859999656677,
				2.0499999523163,
				3.8869791030884
			},
			localization_strings = {
				"pes_wizard_trail_stuck_a_01",
				"pes_wizard_trail_stuck_a_02",
				"pes_wizard_trail_stuck_a_03",
				"pes_wizard_trail_stuck_a_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_sleigh_gone = {
			override_awareness = "wizard_trail_sleigh_lost",
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_sleigh_gone_01",
				"pes_wizard_trail_sleigh_gone_02",
				"pes_wizard_trail_sleigh_gone_03",
				"pes_wizard_trail_sleigh_gone_04"
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
			sound_events_duration = {
				2.1879999637604,
				3.5339999198914,
				3.914999961853,
				2.5380001068115
			},
			localization_strings = {
				"pes_wizard_trail_sleigh_gone_01",
				"pes_wizard_trail_sleigh_gone_02",
				"pes_wizard_trail_sleigh_gone_03",
				"pes_wizard_trail_sleigh_gone_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_stuck_b = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_stuck_b_01",
				"pes_wizard_trail_stuck_b_02",
				"pes_wizard_trail_stuck_b_03",
				"pes_wizard_trail_stuck_b_04"
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
			sound_events_duration = {
				3.1279792785645,
				3.2559790611267,
				1.8129999637604,
				2.3389999866486
			},
			localization_strings = {
				"pes_wizard_trail_stuck_b_01",
				"pes_wizard_trail_stuck_b_02",
				"pes_wizard_trail_stuck_b_03",
				"pes_wizard_trail_stuck_b_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_cargo = {
			override_awareness = "wizard_trail_winch",
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_cargo_01",
				"pes_wizard_trail_cargo_02",
				"pes_wizard_trail_cargo_03",
				"pes_wizard_trail_cargo_04"
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
			sound_events_duration = {
				3.1859791278839,
				1.6369999647141,
				2.9019999504089,
				2.4809999465942
			},
			localization_strings = {
				"pes_wizard_trail_cargo_01",
				"pes_wizard_trail_cargo_02",
				"pes_wizard_trail_cargo_03",
				"pes_wizard_trail_cargo_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_intro_b = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_wizard_trail_intro_b_01",
				[2.0] = "pes_wizard_trail_intro_b_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.7749791145325,
				[2.0] = 3.0659792423248
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_intro_b_01",
				[2.0] = "pes_wizard_trail_intro_b_02"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_shove = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_shove_01",
				"pes_wizard_trail_shove_02",
				"pes_wizard_trail_shove_03",
				"pes_wizard_trail_shove_04"
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
			sound_events_duration = {
				2.3870000839233,
				2.3629999160767,
				2.312979221344,
				1.9420000314713
			},
			localization_strings = {
				"pes_wizard_trail_shove_01",
				"pes_wizard_trail_shove_02",
				"pes_wizard_trail_shove_03",
				"pes_wizard_trail_shove_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_illusion_fades_a = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_wizard_trail_illusion_fades_a_01",
				"pes_wizard_trail_illusion_fades_a_02",
				"pes_wizard_trail_illusion_fades_a_03",
				"pes_wizard_trail_illusion_fades_a_04"
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
			sound_events_duration = {
				4.0830001831055,
				3.1310000419617,
				6.2350001335144,
				4.044979095459
			},
			localization_strings = {
				"pes_wizard_trail_illusion_fades_a_01",
				"pes_wizard_trail_illusion_fades_a_02",
				"pes_wizard_trail_illusion_fades_a_03",
				"pes_wizard_trail_illusion_fades_a_04"
			},
			randomize_indexes = {}
		},
		pes_wizard_trail_intro_c = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "empire_soldier_dlc_wizards_trail",
			randomize_indexes_n = 0,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_wizard_trail_intro_c_01",
				[2.0] = "pes_wizard_trail_intro_c_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 3.4939999580383,
				[2.0] = 5.9469790458679
			},
			localization_strings = {
				[1.0] = "pes_wizard_trail_intro_c_01",
				[2.0] = "pes_wizard_trail_intro_c_02"
			},
			randomize_indexes = {}
		}
	})
end
