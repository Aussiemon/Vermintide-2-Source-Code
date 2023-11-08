return function ()
	define_rule({
		name = "pwe_wizard_trail_bridge_down",
		response = "pwe_wizard_trail_bridge_down",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_wizard_trail_caravan_b",
		name = "pwe_wizard_trail_caravan_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwe_wizard_trail_cargo",
		response = "pwe_wizard_trail_cargo",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_wizard_trail_crate_down",
		response = "pwe_wizard_trail_crate_down",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_wizard_trail_crate_drop_b",
		name = "pwe_wizard_trail_crate_drop_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwe_wizard_trail_free_sleigh",
		response = "pwe_wizard_trail_free_sleigh",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_wizard_trail_illusion_fades_a",
		response = "pwe_wizard_trail_illusion_fades_a",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_wizard_trail_illusion_fades_b",
		name = "pwe_wizard_trail_illusion_fades_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_wizard_trail_illusion_fades_c",
		name = "pwe_wizard_trail_illusion_fades_c",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwe_wizard_trail_intro_b",
		response = "pwe_wizard_trail_intro_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_wizard_trail_intro_c",
		response = "pwe_wizard_trail_intro_c",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_wizard_trail_intruders_b",
		name = "pwe_wizard_trail_intruders_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_wizard_trail_lower_bridge_b",
		name = "pwe_wizard_trail_lower_bridge_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_wizard_trail_olesya_revealed_b",
		name = "pwe_wizard_trail_olesya_revealed_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_wizard_trail_olesya_revealed_b_distance",
		name = "pwe_wizard_trail_olesya_revealed_b_distance",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwe_wizard_trail_open_crate",
		response = "pwe_wizard_trail_open_crate",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_wizard_trail_shove",
		response = "pwe_wizard_trail_shove",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_wizard_trail_sleigh_found",
		response = "pwe_wizard_trail_sleigh_found",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_wizard_trail_sleigh_gone",
		response = "pwe_wizard_trail_sleigh_gone",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_wizard_trail_stuck_a",
		response = "pwe_wizard_trail_stuck_a",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_wizard_trail_stuck_b",
		name = "pwe_wizard_trail_stuck_b",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		name = "pwe_wizard_trail_vista",
		response = "pwe_wizard_trail_vista",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_wizard_trail_vista_two",
		response = "pwe_wizard_trail_vista_two",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		pwe_wizard_trail_bridge_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_bridge_down_01",
				"pwe_wizard_trail_bridge_down_02",
				"pwe_wizard_trail_bridge_down_03",
				"pwe_wizard_trail_bridge_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_bridge_down_01",
				"pwe_wizard_trail_bridge_down_02",
				"pwe_wizard_trail_bridge_down_03",
				"pwe_wizard_trail_bridge_down_04"
			},
			sound_events_duration = {
				2.9649791717529,
				3.8209791183472,
				3.5659792423248,
				4.5889792442322
			}
		},
		pwe_wizard_trail_caravan_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_wizards_trail",
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
				[1.0] = "pwe_wizard_trail_caravan_b_01",
				[2.0] = "pwe_wizard_trail_caravan_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wizard_trail_caravan_b_01",
				[2.0] = "pwe_wizard_trail_caravan_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.6979792118073,
				[2.0] = 3.1050000190735
			}
		},
		pwe_wizard_trail_cargo = {
			override_awareness = "wizard_trail_winch",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_cargo_01",
				"pwe_wizard_trail_cargo_02",
				"pwe_wizard_trail_cargo_03",
				"pwe_wizard_trail_cargo_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_cargo_01",
				"pwe_wizard_trail_cargo_02",
				"pwe_wizard_trail_cargo_03",
				"pwe_wizard_trail_cargo_04"
			},
			sound_events_duration = {
				4.1909999847412,
				2.7079999446869,
				1.5210000276566,
				3.2409999370575
			}
		},
		pwe_wizard_trail_crate_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_crate_down_01",
				"pwe_wizard_trail_crate_down_02",
				"pwe_wizard_trail_crate_down_03",
				"pwe_wizard_trail_crate_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_crate_down_01",
				"pwe_wizard_trail_crate_down_02",
				"pwe_wizard_trail_crate_down_03",
				"pwe_wizard_trail_crate_down_04"
			},
			sound_events_duration = {
				3.4339792728424,
				3.4509792327881,
				5.526978969574,
				3.6469790935516
			}
		},
		pwe_wizard_trail_crate_drop_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_crate_drop_b_01",
				"pwe_wizard_trail_crate_drop_b_02",
				"pwe_wizard_trail_crate_drop_b_03",
				"pwe_wizard_trail_crate_drop_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_crate_drop_b_01",
				"pwe_wizard_trail_crate_drop_b_02",
				"pwe_wizard_trail_crate_drop_b_03",
				"pwe_wizard_trail_crate_drop_b_04"
			},
			sound_events_duration = {
				3.1959791183472,
				4.8319792747498,
				4.955979347229,
				3.260999917984
			}
		},
		pwe_wizard_trail_free_sleigh = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_free_sleigh_01",
				"pwe_wizard_trail_free_sleigh_02",
				"pwe_wizard_trail_free_sleigh_03",
				"pwe_wizard_trail_free_sleigh_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_free_sleigh_01",
				"pwe_wizard_trail_free_sleigh_02",
				"pwe_wizard_trail_free_sleigh_03",
				"pwe_wizard_trail_free_sleigh_04"
			},
			sound_events_duration = {
				4.4739789962769,
				2.7819790840149,
				3.6089792251587,
				3.1929790973663
			}
		},
		pwe_wizard_trail_illusion_fades_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_illusion_fades_a_01",
				"pwe_wizard_trail_illusion_fades_a_02",
				"pwe_wizard_trail_illusion_fades_a_03",
				"pwe_wizard_trail_illusion_fades_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_illusion_fades_a_01",
				"pwe_wizard_trail_illusion_fades_a_02",
				"pwe_wizard_trail_illusion_fades_a_03",
				"pwe_wizard_trail_illusion_fades_a_04"
			},
			sound_events_duration = {
				3.2309999465942,
				3.2339792251587,
				3.0949790477753,
				2.8489792346954
			}
		},
		pwe_wizard_trail_illusion_fades_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_illusion_fades_b_01",
				"pwe_wizard_trail_illusion_fades_b_02",
				"pwe_wizard_trail_illusion_fades_b_03",
				"pwe_wizard_trail_illusion_fades_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_illusion_fades_b_01",
				"pwe_wizard_trail_illusion_fades_b_02",
				"pwe_wizard_trail_illusion_fades_b_03",
				"pwe_wizard_trail_illusion_fades_b_04"
			},
			sound_events_duration = {
				3.5418124198914,
				1.9630625247955,
				4.491229057312,
				4.7564792633057
			}
		},
		pwe_wizard_trail_illusion_fades_c = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_illusion_fades_c_01",
				"pwe_wizard_trail_illusion_fades_c_02",
				"pwe_wizard_trail_illusion_fades_c_03",
				"pwe_wizard_trail_illusion_fades_c_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_illusion_fades_c_01",
				"pwe_wizard_trail_illusion_fades_c_02",
				"pwe_wizard_trail_illusion_fades_c_03",
				"pwe_wizard_trail_illusion_fades_c_04"
			},
			sound_events_duration = {
				1.5115833282471,
				3.198499917984,
				2.8033542633057,
				3.6384375095367
			}
		},
		pwe_wizard_trail_intro_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_wizards_trail",
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
				[1.0] = "pwe_wizard_trail_intro_b_01",
				[2.0] = "pwe_wizard_trail_intro_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wizard_trail_intro_b_01",
				[2.0] = "pwe_wizard_trail_intro_b_02"
			},
			sound_events_duration = {
				[1.0] = 3.2789790630341,
				[2.0] = 5.2049789428711
			}
		},
		pwe_wizard_trail_intro_c = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_wizards_trail",
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
				[1.0] = "pwe_wizard_trail_intro_c_01",
				[2.0] = "pwe_wizard_trail_intro_c_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wizard_trail_intro_c_01",
				[2.0] = "pwe_wizard_trail_intro_c_02"
			},
			sound_events_duration = {
				[1.0] = 3.7269999980927,
				[2.0] = 6.955979347229
			}
		},
		pwe_wizard_trail_intruders_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_wizards_trail",
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
				[1.0] = "pwe_wizard_trail_intruders_b_01",
				[2.0] = "pwe_wizard_trail_intruders_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wizard_trail_intruders_b_01",
				[2.0] = "pwe_wizard_trail_intruders_b_02"
			},
			sound_events_duration = {
				[1.0] = 4.7609791755676,
				[2.0] = 5.8369793891907
			}
		},
		pwe_wizard_trail_lower_bridge_b = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "wood_elf_dlc_wizards_trail",
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
				[1.0] = "pwe_wizard_trail_lower_bridge_b_01",
				[2.0] = "pwe_wizard_trail_lower_bridge_b_02"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pwe_wizard_trail_lower_bridge_b_01",
				[2.0] = "pwe_wizard_trail_lower_bridge_b_02"
			},
			sound_events_duration = {
				[1.0] = 2.7320001125336,
				[2.0] = 1.9390000104904
			}
		},
		pwe_wizard_trail_olesya_revealed_b = {
			override_awareness = "wizard_trail_olesya_revealed_b_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_olesya_revealed_b_01",
				"pwe_wizard_trail_olesya_revealed_b_02",
				"pwe_wizard_trail_olesya_revealed_b_03",
				"pwe_wizard_trail_olesya_revealed_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_olesya_revealed_b_01",
				"pwe_wizard_trail_olesya_revealed_b_02",
				"pwe_wizard_trail_olesya_revealed_b_03",
				"pwe_wizard_trail_olesya_revealed_b_04"
			},
			sound_events_duration = {
				2.9739792346954,
				2.8980000019074,
				3.2109792232513,
				1.7840000391007
			}
		},
		pwe_wizard_trail_olesya_revealed_b_distance = {
			override_awareness = "wizard_trail_olesya_revealed_b_done",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_olesya_revealed_b_01",
				"pwe_wizard_trail_olesya_revealed_b_02",
				"pwe_wizard_trail_olesya_revealed_b_03",
				"pwe_wizard_trail_olesya_revealed_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_olesya_revealed_b_01",
				"pwe_wizard_trail_olesya_revealed_b_02",
				"pwe_wizard_trail_olesya_revealed_b_03",
				"pwe_wizard_trail_olesya_revealed_b_04"
			},
			sound_events_duration = {
				2.9739792346954,
				2.8980000019074,
				3.2109792232513,
				1.7840000391007
			}
		},
		pwe_wizard_trail_open_crate = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_open_crate_01",
				"pwe_wizard_trail_open_crate_02",
				"pwe_wizard_trail_open_crate_03",
				"pwe_wizard_trail_open_crate_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_open_crate_01",
				"pwe_wizard_trail_open_crate_02",
				"pwe_wizard_trail_open_crate_03",
				"pwe_wizard_trail_open_crate_04"
			},
			sound_events_duration = {
				2.5399792194366,
				4.3800001144409,
				3.3919792175293,
				2.39097905159
			}
		},
		pwe_wizard_trail_shove = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_shove_01",
				"pwe_wizard_trail_shove_02",
				"pwe_wizard_trail_shove_03",
				"pwe_wizard_trail_shove_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_shove_01",
				"pwe_wizard_trail_shove_02",
				"pwe_wizard_trail_shove_03",
				"pwe_wizard_trail_shove_04"
			},
			sound_events_duration = {
				2.154000043869,
				4.7259998321533,
				1.835000038147,
				3.2229790687561
			}
		},
		pwe_wizard_trail_sleigh_found = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_sleigh_found_01",
				"pwe_wizard_trail_sleigh_found_02",
				"pwe_wizard_trail_sleigh_found_03",
				"pwe_wizard_trail_sleigh_found_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_sleigh_found_01",
				"pwe_wizard_trail_sleigh_found_02",
				"pwe_wizard_trail_sleigh_found_03",
				"pwe_wizard_trail_sleigh_found_04"
			},
			sound_events_duration = {
				2.2439999580383,
				3.4769792556763,
				2.204999923706,
				2.966979265213
			}
		},
		pwe_wizard_trail_sleigh_gone = {
			override_awareness = "wizard_trail_sleigh_lost",
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_sleigh_gone_01",
				"pwe_wizard_trail_sleigh_gone_02",
				"pwe_wizard_trail_sleigh_gone_03",
				"pwe_wizard_trail_sleigh_gone_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_sleigh_gone_01",
				"pwe_wizard_trail_sleigh_gone_02",
				"pwe_wizard_trail_sleigh_gone_03",
				"pwe_wizard_trail_sleigh_gone_04"
			},
			sound_events_duration = {
				4.4089789390564,
				2.4449791908264,
				3.864000082016,
				2.2669999599457
			}
		},
		pwe_wizard_trail_stuck_a = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_stuck_a_01",
				"pwe_wizard_trail_stuck_a_02",
				"pwe_wizard_trail_stuck_a_03",
				"pwe_wizard_trail_stuck_a_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_stuck_a_01",
				"pwe_wizard_trail_stuck_a_02",
				"pwe_wizard_trail_stuck_a_03",
				"pwe_wizard_trail_stuck_a_04"
			},
			sound_events_duration = {
				2.2639791965485,
				2.4749999046326,
				2.9679791927338,
				3.0969791412353
			}
		},
		pwe_wizard_trail_stuck_b = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_stuck_b_01",
				"pwe_wizard_trail_stuck_b_02",
				"pwe_wizard_trail_stuck_b_03",
				"pwe_wizard_trail_stuck_b_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_stuck_b_01",
				"pwe_wizard_trail_stuck_b_02",
				"pwe_wizard_trail_stuck_b_03",
				"pwe_wizard_trail_stuck_b_04"
			},
			sound_events_duration = {
				2.7069792747498,
				3.3449790477753,
				3.1809792518616,
				1.8979791402817
			}
		},
		pwe_wizard_trail_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_vista_01",
				"pwe_wizard_trail_vista_02",
				"pwe_wizard_trail_vista_03",
				"pwe_wizard_trail_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_vista_01",
				"pwe_wizard_trail_vista_02",
				"pwe_wizard_trail_vista_03",
				"pwe_wizard_trail_vista_04"
			},
			sound_events_duration = {
				3.1349792480469,
				3.7179791927338,
				2.7960000038147,
				2.8959791660309
			}
		},
		pwe_wizard_trail_vista_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "wood_elf_dlc_wizards_trail",
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
				"pwe_wizard_trail_vista_two_01",
				"pwe_wizard_trail_vista_two_02",
				"pwe_wizard_trail_vista_two_03",
				"pwe_wizard_trail_vista_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_wizard_trail_vista_two_01",
				"pwe_wizard_trail_vista_two_02",
				"pwe_wizard_trail_vista_two_03",
				"pwe_wizard_trail_vista_two_04"
			},
			sound_events_duration = {
				3.7639999389648,
				3.8269791603088,
				2.6470000743866,
				1.7349791526794
			}
		}
	})
end
