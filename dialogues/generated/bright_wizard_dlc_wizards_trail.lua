return function ()
	define_rule({
		name = "pbw_wizard_trail_bridge_down",
		response = "pbw_wizard_trail_bridge_down",
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
		response = "pbw_wizard_trail_caravan_b",
		name = "pbw_wizard_trail_caravan_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pbw_wizard_trail_cargo",
		response = "pbw_wizard_trail_cargo",
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
		name = "pbw_wizard_trail_crate_down",
		response = "pbw_wizard_trail_crate_down",
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
		response = "pbw_wizard_trail_crate_drop_b",
		name = "pbw_wizard_trail_crate_drop_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pbw_wizard_trail_free_sleigh",
		response = "pbw_wizard_trail_free_sleigh",
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
		name = "pbw_wizard_trail_illusion_fades_a",
		response = "pbw_wizard_trail_illusion_fades_a",
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
		response = "pbw_wizard_trail_illusion_fades_b",
		name = "pbw_wizard_trail_illusion_fades_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_wizard_trail_illusion_fades_c",
		name = "pbw_wizard_trail_illusion_fades_c",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pbw_wizard_trail_intro_b",
		response = "pbw_wizard_trail_intro_b",
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
		name = "pbw_wizard_trail_intro_c",
		response = "pbw_wizard_trail_intro_c",
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
		response = "pbw_wizard_trail_intruders_b",
		name = "pbw_wizard_trail_intruders_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nsf_wizard_trail_intruders_a_done"
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
			}
		}
	})
	define_rule({
		response = "pbw_wizard_trail_lower_bridge_b",
		name = "pbw_wizard_trail_lower_bridge_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_wizard_trail_olesya_revealed_b",
		name = "pbw_wizard_trail_olesya_revealed_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_wizard_trail_olesya_revealed_b_distance",
		name = "pbw_wizard_trail_olesya_revealed_b_distance",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pbw_wizard_trail_open_crate",
		response = "pbw_wizard_trail_open_crate",
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
	define_rule({
		name = "pbw_wizard_trail_shove",
		response = "pbw_wizard_trail_shove",
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
		name = "pbw_wizard_trail_sleigh_found",
		response = "pbw_wizard_trail_sleigh_found",
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
		name = "pbw_wizard_trail_sleigh_gone",
		response = "pbw_wizard_trail_sleigh_gone",
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
		name = "pbw_wizard_trail_stuck_a",
		response = "pbw_wizard_trail_stuck_a",
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
		response = "pbw_wizard_trail_stuck_b",
		name = "pbw_wizard_trail_stuck_b",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		name = "pbw_wizard_trail_vista",
		response = "pbw_wizard_trail_vista",
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
		name = "pbw_wizard_trail_vista_two",
		response = "pbw_wizard_trail_vista_two",
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
	add_dialogues({
		pbw_wizard_trail_bridge_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
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
				"pbw_wizard_trail_bridge_down_01",
				"pbw_wizard_trail_bridge_down_02",
				"pbw_wizard_trail_bridge_down_03",
				"pbw_wizard_trail_bridge_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_bridge_down_01",
				"pbw_wizard_trail_bridge_down_02",
				"pbw_wizard_trail_bridge_down_03",
				"pbw_wizard_trail_bridge_down_04"
			},
			sound_events_duration = {
				2.204999923706,
				3.0480000972748,
				3.7000000476837,
				2.1719999313355
			}
		},
		pbw_wizard_trail_caravan_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_caravan_b_01",
				[2.0] = "pbw_wizard_trail_caravan_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wizard_trail_caravan_b_01",
				[2.0] = "pbw_wizard_trail_caravan_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.4439792633057,
				[2.0] = 3.2779791355133
			}
		},
		pbw_wizard_trail_cargo = {
			override_awareness = "wizard_trail_winch",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_cargo_01",
				"pbw_wizard_trail_cargo_02",
				"pbw_wizard_trail_cargo_03",
				"pbw_wizard_trail_cargo_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_cargo_01",
				"pbw_wizard_trail_cargo_02",
				"pbw_wizard_trail_cargo_03",
				"pbw_wizard_trail_cargo_04"
			},
			sound_events_duration = {
				2.1619999408722,
				4.6139793395996,
				2.658979177475,
				4.1749792098999
			}
		},
		pbw_wizard_trail_crate_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_crate_down_01",
				"pbw_wizard_trail_crate_down_02",
				"pbw_wizard_trail_crate_down_03",
				"pbw_wizard_trail_crate_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_crate_down_01",
				"pbw_wizard_trail_crate_down_02",
				"pbw_wizard_trail_crate_down_03",
				"pbw_wizard_trail_crate_down_04"
			},
			sound_events_duration = {
				3.0299792289734,
				2.8740000724792,
				4.1729793548584,
				3.7139999866486
			}
		},
		pbw_wizard_trail_crate_drop_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
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
				"pbw_wizard_trail_crate_drop_b_01",
				"pbw_wizard_trail_crate_drop_b_02",
				"pbw_wizard_trail_crate_drop_b_03",
				"pbw_wizard_trail_crate_drop_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_crate_drop_b_01",
				"pbw_wizard_trail_crate_drop_b_02",
				"pbw_wizard_trail_crate_drop_b_03",
				"pbw_wizard_trail_crate_drop_b_04"
			},
			sound_events_duration = {
				3.1419792175293,
				3.6770000457764,
				3.8739790916443,
				4.9059791564941
			}
		},
		pbw_wizard_trail_free_sleigh = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_free_sleigh_01",
				"pbw_wizard_trail_free_sleigh_02",
				"pbw_wizard_trail_free_sleigh_03",
				"pbw_wizard_trail_free_sleigh_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_free_sleigh_01",
				"pbw_wizard_trail_free_sleigh_02",
				"pbw_wizard_trail_free_sleigh_03",
				"pbw_wizard_trail_free_sleigh_04"
			},
			sound_events_duration = {
				2.9570000171661,
				2.7059791088104,
				2.1829791069031,
				2.5509791374206
			}
		},
		pbw_wizard_trail_illusion_fades_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_illusion_fades_a_01",
				"pbw_wizard_trail_illusion_fades_a_02",
				"pbw_wizard_trail_illusion_fades_a_03",
				"pbw_wizard_trail_illusion_fades_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_illusion_fades_a_01",
				"pbw_wizard_trail_illusion_fades_a_02",
				"pbw_wizard_trail_illusion_fades_a_03",
				"pbw_wizard_trail_illusion_fades_a_04"
			},
			sound_events_duration = {
				3.6630001068115,
				4.6939792633057,
				3.448979139328,
				3.7059791088104
			}
		},
		pbw_wizard_trail_illusion_fades_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_illusion_fades_b_01",
				"pbw_wizard_trail_illusion_fades_b_02",
				"pbw_wizard_trail_illusion_fades_b_03",
				"pbw_wizard_trail_illusion_fades_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_illusion_fades_b_01",
				"pbw_wizard_trail_illusion_fades_b_02",
				"pbw_wizard_trail_illusion_fades_b_03",
				"pbw_wizard_trail_illusion_fades_b_04"
			},
			sound_events_duration = {
				1.2560000419617,
				1.5518125295639,
				5.3508334159851,
				3.1061041355133
			}
		},
		pbw_wizard_trail_illusion_fades_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_illusion_fades_c_01",
				"pbw_wizard_trail_illusion_fades_c_02",
				"pbw_wizard_trail_illusion_fades_c_03",
				"pbw_wizard_trail_illusion_fades_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_illusion_fades_c_01",
				"pbw_wizard_trail_illusion_fades_c_02",
				"pbw_wizard_trail_illusion_fades_c_03",
				"pbw_wizard_trail_illusion_fades_c_04"
			},
			sound_events_duration = {
				3.8969583511352,
				2.8557500839233,
				4.4983539581299,
				3.6575207710266
			}
		},
		pbw_wizard_trail_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 2,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_intro_b_01",
				[2.0] = "pbw_wizard_trail_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wizard_trail_intro_b_01",
				[2.0] = "pbw_wizard_trail_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.0220000743866,
				[2.0] = 4.7259793281555
			}
		},
		pbw_wizard_trail_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 2,
			category = "level_talk_must_play",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_intro_c_01",
				[2.0] = "pbw_wizard_trail_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wizard_trail_intro_c_01",
				[2.0] = "pbw_wizard_trail_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 4.9869790077209,
				[2.0] = 2.8209791183472
			}
		},
		pbw_wizard_trail_intruders_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
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
				"pbw_wizard_trail_intruders_b_01",
				"pbw_wizard_trail_intruders_b_02",
				"pbw_wizard_trail_intruders_b_03",
				"pbw_wizard_trail_intruders_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_intruders_b_01",
				"pbw_wizard_trail_intruders_b_02",
				"pbw_wizard_trail_intruders_b_03",
				"pbw_wizard_trail_intruders_b_04"
			},
			sound_events_duration = {
				3.8159792423248,
				3.2620832920074,
				3.0160000324249,
				1.7219791412354
			}
		},
		pbw_wizard_trail_lower_bridge_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 2,
			category = "level_talk",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm",
				[2.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_wizard_trail_lower_bridge_b_01",
				[2.0] = "pbw_wizard_trail_lower_bridge_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pbw_wizard_trail_lower_bridge_b_01",
				[2.0] = "pbw_wizard_trail_lower_bridge_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.0980000495911,
				[2.0] = 1.6039999723434
			}
		},
		pbw_wizard_trail_olesya_revealed_b = {
			override_awareness = "wizard_trail_olesya_revealed_b_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_olesya_revealed_b_01",
				"pbw_wizard_trail_olesya_revealed_b_02",
				"pbw_wizard_trail_olesya_revealed_b_03",
				"pbw_wizard_trail_olesya_revealed_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_olesya_revealed_b_01",
				"pbw_wizard_trail_olesya_revealed_b_02",
				"pbw_wizard_trail_olesya_revealed_b_03",
				"pbw_wizard_trail_olesya_revealed_b_04"
			},
			sound_events_duration = {
				3.1539790630341,
				2.5539999008179,
				2.0619790554047,
				1.3069791793823
			}
		},
		pbw_wizard_trail_olesya_revealed_b_distance = {
			override_awareness = "wizard_trail_olesya_revealed_b_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_olesya_revealed_b_01",
				"pbw_wizard_trail_olesya_revealed_b_02",
				"pbw_wizard_trail_olesya_revealed_b_03",
				"pbw_wizard_trail_olesya_revealed_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_olesya_revealed_b_01",
				"pbw_wizard_trail_olesya_revealed_b_02",
				"pbw_wizard_trail_olesya_revealed_b_03",
				"pbw_wizard_trail_olesya_revealed_b_04"
			},
			sound_events_duration = {
				3.1539790630341,
				2.5539999008179,
				2.0619790554047,
				1.3069791793823
			}
		},
		pbw_wizard_trail_open_crate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_open_crate_01",
				"pbw_wizard_trail_open_crate_02",
				"pbw_wizard_trail_open_crate_03",
				"pbw_wizard_trail_open_crate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_open_crate_01",
				"pbw_wizard_trail_open_crate_02",
				"pbw_wizard_trail_open_crate_03",
				"pbw_wizard_trail_open_crate_04"
			},
			sound_events_duration = {
				2.9470000267029,
				1.6369792222977,
				3.7269792556763,
				2.191999912262
			}
		},
		pbw_wizard_trail_shove = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
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
				"pbw_wizard_trail_shove_01",
				"pbw_wizard_trail_shove_02",
				"pbw_wizard_trail_shove_03",
				"pbw_wizard_trail_shove_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_shove_01",
				"pbw_wizard_trail_shove_02",
				"pbw_wizard_trail_shove_03",
				"pbw_wizard_trail_shove_04"
			},
			sound_events_duration = {
				2.5769999027252,
				2.0629999637604,
				2.7669999599457,
				2.0889792442322
			}
		},
		pbw_wizard_trail_sleigh_found = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
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
				"pbw_wizard_trail_sleigh_found_01",
				"pbw_wizard_trail_sleigh_found_02",
				"pbw_wizard_trail_sleigh_found_03",
				"pbw_wizard_trail_sleigh_found_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_sleigh_found_01",
				"pbw_wizard_trail_sleigh_found_02",
				"pbw_wizard_trail_sleigh_found_03",
				"pbw_wizard_trail_sleigh_found_04"
			},
			sound_events_duration = {
				1.8209999799728,
				2.739000082016,
				2.3670001029968,
				3.4809999465942
			}
		},
		pbw_wizard_trail_sleigh_gone = {
			override_awareness = "wizard_trail_sleigh_lost",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_sleigh_gone_01",
				"pbw_wizard_trail_sleigh_gone_02",
				"pbw_wizard_trail_sleigh_gone_03",
				"pbw_wizard_trail_sleigh_gone_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_sleigh_gone_01",
				"pbw_wizard_trail_sleigh_gone_02",
				"pbw_wizard_trail_sleigh_gone_03",
				"pbw_wizard_trail_sleigh_gone_04"
			},
			sound_events_duration = {
				3.8429999351502,
				5.2030000686645,
				1.7400000095367,
				2.4360001087189
			}
		},
		pbw_wizard_trail_stuck_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
			sound_events_n = 4,
			category = "level_talk_must_play",
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
				"pbw_wizard_trail_stuck_a_01",
				"pbw_wizard_trail_stuck_a_02",
				"pbw_wizard_trail_stuck_a_03",
				"pbw_wizard_trail_stuck_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_stuck_a_01",
				"pbw_wizard_trail_stuck_a_02",
				"pbw_wizard_trail_stuck_a_03",
				"pbw_wizard_trail_stuck_a_04"
			},
			sound_events_duration = {
				2.0209791660309,
				2.4819791316986,
				1.852979183197,
				3.0859999656677
			}
		},
		pbw_wizard_trail_stuck_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
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
				"pbw_wizard_trail_stuck_b_01",
				"pbw_wizard_trail_stuck_b_02",
				"pbw_wizard_trail_stuck_b_03",
				"pbw_wizard_trail_stuck_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_stuck_b_01",
				"pbw_wizard_trail_stuck_b_02",
				"pbw_wizard_trail_stuck_b_03",
				"pbw_wizard_trail_stuck_b_04"
			},
			sound_events_duration = {
				2.2829999923706,
				3.3180000782013,
				4.3629789352417,
				3.3049790859222
			}
		},
		pbw_wizard_trail_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
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
				"pbw_wizard_trail_vista_01",
				"pbw_wizard_trail_vista_02",
				"pbw_wizard_trail_vista_03",
				"pbw_wizard_trail_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_vista_01",
				"pbw_wizard_trail_vista_02",
				"pbw_wizard_trail_vista_03",
				"pbw_wizard_trail_vista_04"
			},
			sound_events_duration = {
				2.5989999771118,
				3.2069792747498,
				1.6199791431427,
				2.7550001144409
			}
		},
		pbw_wizard_trail_vista_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_dlc_wizards_trail",
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
				"pbw_wizard_trail_vista_two_01",
				"pbw_wizard_trail_vista_two_02",
				"pbw_wizard_trail_vista_two_03",
				"pbw_wizard_trail_vista_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wizard_trail_vista_two_01",
				"pbw_wizard_trail_vista_two_02",
				"pbw_wizard_trail_vista_two_03",
				"pbw_wizard_trail_vista_two_04"
			},
			sound_events_duration = {
				2.7679998874664,
				3.4920001029968,
				1.8419791460037,
				2.6670000553131
			}
		}
	})
end
