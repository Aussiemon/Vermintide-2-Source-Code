return function ()
	define_rule({
		response = "egs_level_prologue_skittergate_distance_01",
		name = "egs_level_prologue_skittergate_distance_01",
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
				"egs_level_prologue_skittergate_distance_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_prologue_skittergate_distance_02",
		name = "egs_level_prologue_skittergate_distance_02",
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
				"egs_level_prologue_skittergate_distance_02"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_level_prologue_skittergate_distance_03",
		name = "egs_level_prologue_skittergate_distance_03",
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
				"egs_level_prologue_skittergate_distance_03"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_prologue_intro_from_far",
		name = "egs_prologue_intro_from_far",
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
				"egs_prologue_intro_from_far"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "egs_prologue_dialogue_bang",
		name = "egs_prologue_dialogue_bang",
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
				"egs_prologue_dialogue_bang"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "ecc_prologue_dialogue_answer_bang",
		name = "ecc_prologue_dialogue_answer_bang",
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
				"ecc_prologue_dialogue_answer_bang"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion"
			}
		}
	})
	define_rule({
		response = "egs_prologue_dialogue_excuse",
		name = "egs_prologue_dialogue_excuse",
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
				"egs_prologue_dialogue_excuse"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "ecc_prologue_dialogue_answer_lack_of_patience",
		name = "ecc_prologue_dialogue_answer_lack_of_patience",
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
				"ecc_prologue_dialogue_answer_lack_of_patience"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_exalted_champion"
			}
		}
	})
	define_rule({
		response = "egs_prologue_ranting_at_skavens",
		name = "egs_prologue_ranting_at_skavens",
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
				"egs_prologue_ranting_at_skavens"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_grey_seer"
			}
		}
	})
	define_rule({
		response = "nfl_prologue_intro_a",
		name = "nfl_prologue_intro_a",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_level_prologue_hello_kruber_01"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		response = "pes_prologue_intro_b",
		name = "pes_prologue_intro_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_hello_kruber_01"
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
		name = "nfl_prologue_intro_c",
		response = "nfl_prologue_intro_c",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_level_prologue_hello_kruber_02"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			},
			{
				"user_memory",
				"nfl_level_prologue_hello_kruber_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"nfl_level_prologue_hello_kruber_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_prologue_intro_d",
		name = "pes_prologue_intro_d",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_hello_kruber_02"
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
		response = "nfl_prologue_intro_e",
		name = "nfl_prologue_intro_e",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"nfl_level_prologue_hello_kruber_03"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		response = "pes_prologue_intro_f",
		name = "pes_prologue_intro_f",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_hello_kruber_03"
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
		name = "pdr_level_prologue_bardin_passing_one_00",
		response = "pdr_level_prologue_bardin_passing_one_00",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_level_prologue_bardin_passing_one_00"
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
				"pdr_level_prologue_bardin_passing_one_00",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_one_00",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_prologue_bardin_passing_one_01",
		response = "pes_level_prologue_bardin_passing_one_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_bardin_passing_one_01"
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
				"user_memory",
				"pes_level_prologue_bardin_passing_one_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"pes_level_prologue_bardin_passing_one_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_prologue_bardin_passing_one_bardin_01",
		response = "pdr_level_prologue_bardin_passing_one_bardin_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_level_prologue_bardin_passing_one_01"
			},
			{
				"user_context",
				"player_profile",
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
				"pdr_level_prologue_bardin_passing_one_bardin_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_one_bardin_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_level_prologue_bardin_passing_one_02",
		response = "pes_level_prologue_bardin_passing_one_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_bardin_passing_one_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"pes_level_prologue_bardin_passing_one_02",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"pes_level_prologue_bardin_passing_one_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_level_prologue_bardin_passing_two_01",
		response = "pdr_level_prologue_bardin_passing_two_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_level_prologue_bardin_passing_two_01"
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
				"pdr_level_prologue_bardin_passing_two_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"pdr_level_prologue_bardin_passing_two_02",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_level_prologue_bardin_passing_two_kruber_01",
		name = "pes_level_prologue_bardin_passing_two_kruber_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_bardin_passing_two_01"
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
		response = "pdr_level_prologue_bardin_passing_two_02",
		name = "pdr_level_prologue_bardin_passing_two_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pdr_level_prologue_bardin_passing_two_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_level_prologue_bardin_passing_two_03",
		name = "pes_level_prologue_bardin_passing_two_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pes_level_prologue_bardin_passing_two_03"
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
		response = "pdr_level_prologue_freeing_bardin_01",
		name = "pdr_level_prologue_freeing_bardin_01",
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
				"pdr_level_prologue_freeing_bardin"
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
			}
		}
	})
	define_rule({
		response = "pes_level_prologue_freeing_bardin_01",
		name = "pes_level_prologue_freeing_bardin_01",
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
				"pes_level_prologue_freeing_bardin"
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
		response = "pdr_level_prologue_bardin_fallling_01",
		name = "pdr_level_prologue_bardin_fallling_01",
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
				"prologue_bardin_fallling"
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
			}
		}
	})
	define_rule({
		response = "pes_level_prologue_bardin_fallling_01",
		name = "pes_level_prologue_bardin_fallling_01",
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
				"level_prologue_bardin_fallling_01"
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
		response = "pdr_prologue_bardin_dazed_01",
		name = "pdr_prologue_bardin_dazed_01",
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
				"prologue_bardin_dazed"
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
			}
		}
	})
	define_rule({
		response = "pes_prologue_bardin_dazed_01",
		name = "pes_prologue_bardin_dazed_01",
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
				"prologue_bardin_dazed_01"
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
		response = "pdr_prologue_bardin_revived_01",
		name = "pdr_prologue_bardin_revived_01",
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
				"prologue_bardin_revived"
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
			}
		}
	})
	define_rule({
		response = "pes_prologue_bardin_revived_01",
		name = "pes_prologue_bardin_revived_01",
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
				"prologue_bardin_revived_01"
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
		response = "pdr_prologue_heal_bardin_01",
		name = "pdr_prologue_heal_bardin_01",
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
				"prologue_heal_bardin"
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
			}
		}
	})
	define_rule({
		response = "pes_prologue_heal_bardin_kruber_01",
		name = "pes_prologue_heal_bardin_kruber_01",
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
				"prologue_heal_bardin_01"
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
		response = "pdr_prologue_heal_bardin_take_time_02",
		name = "pdr_prologue_heal_bardin_take_time_02",
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
				"prologue_heal_bardin_kruber_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_prologue_bardin_healed_01",
		name = "pdr_prologue_bardin_healed_01",
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
				"prologue_bardin_healed"
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
			}
		}
	})
	define_rule({
		response = "pes_prologue_bardin_healed_01",
		name = "pes_prologue_bardin_healed_01",
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
				"prologue_bardin_healed_01"
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
		response = "pes_prologue_gate_opens_01",
		name = "pes_prologue_gate_opens_01",
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
				"prologue_gate_opens"
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
		response = "pdr_prologue_gate_opens_01",
		name = "pdr_prologue_gate_opens_01",
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
				"prologue_gate_opens_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_prologue_kerillian_fight_01",
		name = "pwe_prologue_kerillian_fight_01",
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
				"pwe_prologue_kerillian_fight"
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
		response = "pes_prologue_kerillian_fight_01",
		name = "pes_prologue_kerillian_fight_01",
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
				"prologue_kerillian_fight"
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
		response = "pdr_prologue_kerillian_fight_01",
		name = "pdr_prologue_kerillian_fight_01",
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
				"prologue_kerillian_fight_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		name = "pes_prologue_meeting_kerillian_01",
		response = "pes_prologue_meeting_kerillian_01",
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
				"prologue_meeting_kerillian"
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
				"user_memory",
				"prologue_meeting_kerillian",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"prologue_meeting_kerillian",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_prologue_meeting_kerillian_kerillian_01",
		response = "pwe_prologue_meeting_kerillian_kerillian_01",
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
				"prologue_meeting_kerillian_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"prologue_meeting_kerillian_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"prologue_meeting_kerillian_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_prologue_meeting_kerillian_02",
		response = "pes_prologue_meeting_kerillian_02",
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
				"prologue_meeting_kerillian_kerillian_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"prologue_meeting_kerillian_kerillian_01",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"prologue_meeting_kerillian_kerillian_01",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_prologue_meeting_kerillian_02",
		name = "pwe_prologue_meeting_kerillian_02",
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
				"prologue_meeting_kerillian_02"
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
		response = "pdr_prologue_meeting_kerillian_01",
		name = "pdr_prologue_meeting_kerillian_01",
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
				"prologue_meeting_kerillian_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_level_prologue_wizard_sound",
		name = "pes_level_prologue_wizard_sound",
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
				"prologue_wizard_sound"
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
		response = "pwe_level_prologue_wizard_sound",
		name = "pwe_level_prologue_wizard_sound",
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
				"level_prologue_wizard_sound"
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
		response = "pes_level_prologue_wizard_down_a",
		name = "pes_level_prologue_wizard_down_a",
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
				"prologue_wizard_down_a"
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
		response = "pdr_level_prologue_wizard_down_b",
		name = "pdr_level_prologue_wizard_down_b",
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
				"level_prologue_wizard_down_a"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_level_prologue_sienna_up",
		name = "pes_level_prologue_sienna_up",
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
				"prologue_sienna_up"
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
		response = "pbw_level_prologue_sienna_up_01",
		name = "pbw_level_prologue_sienna_up_01",
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
				"level_prologue_sienna_up"
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
		response = "pwe_level_prologue_sienna_up_01",
		name = "pwe_level_prologue_sienna_up_01",
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
				"level_prologue_sienna_up_01"
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
		response = "pes_level_prologue_skittergate_afar",
		name = "pes_level_prologue_skittergate_afar",
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
				"prologue_skittergate_afar"
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
		response = "pbw_level_prologue_skittergate_afar_01",
		name = "pbw_level_prologue_skittergate_afar_01",
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
				"level_prologue_skittergate_afar"
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
		response = "pwe_level_prologue_skittergate_afar_01",
		name = "pwe_level_prologue_skittergate_afar_01",
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
				"level_prologue_skittergate_afar_01"
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
		response = "pes_level_prologue_elevator_ride",
		name = "pes_level_prologue_elevator_ride",
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
				"prologue_elevator_ride"
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
		response = "pdr_level_prologue_elevator_ride_01",
		name = "pdr_level_prologue_elevator_ride_01",
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
				"level_prologue_elevator_ride"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_level_prologue_elevator_ride_sienna",
		name = "pbw_level_prologue_elevator_ride_sienna",
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
				"level_prologue_elevator_ride_01"
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
		response = "pes_level_prologue_elevator_ride_02",
		name = "pes_level_prologue_elevator_ride_02",
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
				"level_prologue_elevator_ride_sienna"
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
		response = "pwe_level_prologue_elevator_ride_kerillian",
		name = "pwe_level_prologue_elevator_ride_kerillian",
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
				"level_prologue_elevator_ride_02"
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
		response = "pdr_level_prologue_elevator_ride_bardin",
		name = "pdr_level_prologue_elevator_ride_bardin",
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
				"level_prologue_elevator_ride_kerillian"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pbw_level_prologue_elevator_ride_sienna_02",
		name = "pbw_level_prologue_elevator_ride_sienna_02",
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
				"level_prologue_elevator_ride_bardin"
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
		response = "pwe_level_prologue_elevator_ride_kerillian_02",
		name = "pwe_level_prologue_elevator_ride_kerillian_02",
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
				"level_prologue_elevator_ride_sienna_02"
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
		response = "pes_level_prologue_elevator_ride_03",
		name = "pes_level_prologue_elevator_ride_03",
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
				"level_prologue_elevator_ride_kerillian_02"
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
		response = "pes_level_prologue_reached_surface",
		name = "pes_level_prologue_reached_surface",
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
				"prologue_reached_surface"
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
		response = "pdr_level_ prologue_reached_surface_bardin",
		name = "pdr_level_ prologue_reached_surface_bardin",
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
				"level_prologue_reached_surface"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwe_level_ prologue_reached_surface_kerillian",
		name = "pwe_level_ prologue_reached_surface_kerillian",
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
				"level_ prologue_reached_surface_bardin"
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
		response = "pbw_level_ prologue_reached_surface_sienna",
		name = "pbw_level_ prologue_reached_surface_sienna",
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
				"level_ prologue_reached_surface_kerillian"
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
		response = "pdr_level_ prologue_reached_surface_02",
		name = "pdr_level_ prologue_reached_surface_02",
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
				"level_ prologue_reached_surface_sienna"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pes_level_prologue_seeing_crater_kruber",
		name = "pes_level_prologue_seeing_crater_kruber",
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
				"prologue_seeing_crater"
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
		response = "pbw_level_ prologue_seeing_crater_sienna",
		name = "pbw_level_ prologue_seeing_crater_sienna",
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
				"level_prologue_seeing_crater_kruber"
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
		response = "pwe_level_ prologue_seeing_crater_kerillian",
		name = "pwe_level_ prologue_seeing_crater_kerillian",
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
				"level_ prologue_seeing_crater_sienna"
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
		response = "pdr_level_ prologue_seeing_crater_01",
		name = "pdr_level_ prologue_seeing_crater_01",
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
				"level_ prologue_seeing_crater_kerillian"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_prologue_portal",
		name = "pwh_prologue_portal",
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
				"prologue_portal"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pdr_prologue_portal_bardin",
		name = "pdr_prologue_portal_bardin",
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
				"prologue_portal"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pwh_prologue_portal_salty",
		name = "pwh_prologue_portal_salty",
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
				"prologue_portal_bardin"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwe_prologue_portal_kerillian",
		name = "pwe_prologue_portal_kerillian",
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
				"prologue_portal_salty"
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
		response = "pes_prologue_portal_kruber",
		name = "pes_prologue_portal_kruber",
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
				"prologue_portal_kerillian"
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
		response = "pwh_prologue_portal_03",
		name = "pwh_prologue_portal_03",
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
				"prologue_portal_kruber"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "nfl_prologue_portal_e",
		name = "nfl_prologue_portal_e",
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
				"nfl_prologue_portal_e"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"ferry_lady"
			}
		}
	})
	define_rule({
		response = "pes_level_prologue_waking_up",
		name = "pes_level_prologue_waking_up",
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
				"pes_level_prologue_waking_up"
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
		response = "pes_level_prologue_travel",
		name = "pes_level_prologue_travel",
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
				"pes_level_prologue_travel"
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
		response = "pes_level_prologue_cage_fall",
		name = "pes_level_prologue_cage_fall",
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
				"pes_level_prologue_cage_fall"
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
		response = "pes_level_prologue_cage_land",
		name = "pes_level_prologue_cage_land",
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
				"pes_level_prologue_cage_land"
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
		response = "pes_level_prologue_cage_see_weapon",
		name = "pes_level_prologue_cage_see_weapon",
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
				"pes_level_prologue_cage_see_weapon"
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
		response = "pes_level_prologue_grab_weapon",
		name = "pes_level_prologue_grab_weapon",
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
				"pes_level_prologue_grab_weapon"
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
		response = "pes_level_prologue_first_payback",
		name = "pes_level_prologue_first_payback",
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
				"pes_level_prologue_first_payback"
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
		response = "pes_level_prologue_fighting_pit",
		name = "pes_level_prologue_fighting_pit",
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
				"pes_level_prologue_fighting_pit"
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
		response = "pes_level_prologue_fighting_pit_fight",
		name = "pes_level_prologue_fighting_pit_fight",
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
				"pes_level_prologue_fighting_pit_fight"
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
		response = "pes_level_prologue_block",
		name = "pes_level_prologue_block",
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
				"pes_level_prologue_block"
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
		response = "pes_level_prologue_dodge",
		name = "pes_level_prologue_dodge",
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
				"pes_level_prologue_dodge"
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
		response = "pes_level_prologue_strong",
		name = "pes_level_prologue_strong",
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
				"pes_level_prologue_strong"
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
		response = "pes_level_prologue_ability",
		name = "pes_level_prologue_ability",
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
				"pes_level_prologue_ability"
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
		response = "pes_level_prologue_got_bow",
		name = "pes_level_prologue_got_bow",
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
				"pes_level_prologue_got_bow"
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
		response = "pes_level_prologue_supply",
		name = "pes_level_prologue_supply",
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
				"pes_level_prologue_supply"
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
	add_dialogues({
		pes_level_prologue_wizard_down_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_wizard_down_a_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_wizard_down_a_01"
			}
		},
		pes_level_prologue_bardin_passing_two_kruber_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_passing_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_passing_two_01"
			}
		},
		pes_prologue_gate_opens_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_gate_opens_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_gate_opens_01"
			}
		},
		["pbw_level_ prologue_seeing_crater_sienna"] = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_ prologue_seeing_crater_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pbw_level_ prologue_seeing_crater_01"
			}
		},
		pbw_level_prologue_skittergate_afar_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_prologue_skittergate_afar_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pbw_level_prologue_skittergate_afar_01"
			}
		},
		pes_level_prologue_bardin_passing_one_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_passing_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_passing_one_01"
			}
		},
		nfl_prologue_intro_e = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_level_prologue_hello_kruber_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "nfl_level_prologue_hello_kruber_03"
			}
		},
		nfl_prologue_intro_c = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_level_prologue_hello_kruber_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "nfl_level_prologue_hello_kruber_02"
			}
		},
		pwe_prologue_kerillian_fight_01 = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_prologue_kerillian_fight_01",
				[2.0] = "pwe_prologue_kerillian_fight_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt",
				[2.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_prologue_kerillian_fight_01",
				[2.0] = "pwe_prologue_kerillian_fight_02"
			},
			randomize_indexes = {}
		},
		pes_prologue_intro_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_hello_kruber_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_hello_kruber_01"
			}
		},
		pes_level_prologue_fighting_pit = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_fighting_pit_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_fighting_pit_01"
			}
		},
		pbw_level_prologue_elevator_ride_sienna_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_prologue_elevator_ride_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pbw_level_prologue_elevator_ride_02"
			}
		},
		pdr_prologue_kerillian_fight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_kerillian_fight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_kerillian_fight_01"
			}
		},
		pbw_level_prologue_elevator_ride_sienna = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_prologue_elevator_ride_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pbw_level_prologue_elevator_ride_01"
			}
		},
		pes_level_prologue_elevator_ride_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_elevator_ride_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_elevator_ride_02"
			}
		},
		egs_prologue_dialogue_excuse = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene_interrupt_two",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_prologue_dialogue_excuse"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_prologue_dialogue_excuse"
			}
		},
		pes_level_prologue_first_payback = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_first_payback_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_first_payback_01"
			}
		},
		pdr_level_prologue_elevator_ride_bardin = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_elevator_ride_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_elevator_ride_02"
			}
		},
		egs_prologue_ranting_at_skavens = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_prologue_ranting_at_skavens"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_prologue_ranting_at_skavens"
			}
		},
		["pdr_level_ prologue_seeing_crater_01"] = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_ prologue_seeing_crater_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_ prologue_seeing_crater_01"
			}
		},
		pwe_prologue_portal_kerillian = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_prologue_portal_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_prologue_portal_01"
			}
		},
		pdr_level_prologue_bardin_passing_one_00 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_passing_one_00"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_passing_one_00"
			}
		},
		pwe_level_prologue_sienna_up_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_prologue_sienna_up_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_level_prologue_sienna_up_01"
			}
		},
		pes_prologue_meeting_kerillian_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_meeting_kerillian_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_meeting_kerillian_01"
			}
		},
		pdr_prologue_meeting_kerillian_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_meeting_kerillian_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_meeting_kerillian_01"
			}
		},
		pes_level_prologue_cage_see_weapon = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_cage_see_weapon_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_cage_see_weapon_01"
			}
		},
		pes_level_prologue_reached_surface = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_reached_surface_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_reached_surface_01"
			}
		},
		nfl_prologue_portal_e = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "npc_talk_interrupt_special",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_prologue_portal_e_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "nfl_prologue_portal_e_01"
			}
		},
		pwh_prologue_portal_salty = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_prologue_portal_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwh_prologue_portal_02"
			}
		},
		pdr_level_prologue_freeing_bardin_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_freeing_bardin_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_freeing_bardin_01"
			}
		},
		pes_level_prologue_freeing_bardin_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_freeing_bardin_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_freeing_bardin_01"
			}
		},
		pes_level_prologue_cage_land = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_cage_land_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_cage_land_01"
			}
		},
		pes_prologue_bardin_dazed_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_bardin_dazed_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_bardin_dazed_01"
			}
		},
		pdr_prologue_bardin_revived_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_bardin_revived_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_bardin_revived_01"
			}
		},
		egs_prologue_intro_from_far = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_prologue_intro_from_far"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_prologue_intro_from_far"
			}
		},
		pdr_prologue_heal_bardin_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_heal_bardin_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_heal_bardin_01"
			}
		},
		pdr_prologue_portal_bardin = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_portal_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_portal_01"
			}
		},
		pdr_prologue_gate_opens_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_gate_opens_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_gate_opens_01"
			}
		},
		pes_prologue_portal_kruber = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_portal_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_portal_01"
			}
		},
		pes_level_prologue_bardin_passing_one_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_passing_one_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_passing_one_02"
			}
		},
		pwe_prologue_meeting_kerillian_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_prologue_meeting_kerillian_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_prologue_meeting_kerillian_02"
			}
		},
		pes_level_prologue_grab_weapon = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_grab_weapon_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_grab_weapon_01"
			}
		},
		egs_prologue_dialogue_bang = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_prologue_dialogue_bang"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_prologue_dialogue_bang"
			}
		},
		pwe_level_prologue_elevator_ride_kerillian_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_prologue_elevator_ride_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_level_prologue_elevator_ride_02"
			}
		},
		nfl_prologue_intro_a = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "nfl_level_prologue_hello_kruber_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "nfl_level_prologue_hello_kruber_01"
			}
		},
		pdr_level_prologue_wizard_down_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_wizard_down_b_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_wizard_down_b_01"
			}
		},
		pwe_level_prologue_wizard_sound = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_prologue_wizard_sound_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_level_prologue_wizard_sound_01"
			}
		},
		pes_level_prologue_supply = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_prologue_supply_01",
				[2.0] = "pes_level_prologue_supply_02"
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
				[1.0] = "pes_level_prologue_supply_01",
				[2.0] = "pes_level_prologue_supply_02"
			},
			randomize_indexes = {}
		},
		pes_level_prologue_cage_fall = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_cage_fall_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_cage_fall_01"
			}
		},
		pes_level_prologue_got_bow = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_got_bow_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_got_bow_01"
			}
		},
		pes_level_prologue_ability = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_prologue_ability_01",
				[2.0] = "pes_level_prologue_ability_02"
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
				[1.0] = "pes_level_prologue_ability_01",
				[2.0] = "pes_level_prologue_ability_02"
			},
			randomize_indexes = {}
		},
		pes_level_prologue_strong = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_prologue_strong_01",
				[2.0] = "pes_level_prologue_strong_02"
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
				[1.0] = "pes_level_prologue_strong_01",
				[2.0] = "pes_level_prologue_strong_02"
			},
			randomize_indexes = {}
		},
		pes_level_prologue_dodge = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_prologue_dodge_01",
				[2.0] = "pes_level_prologue_dodge_02"
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
				[1.0] = "pes_level_prologue_dodge_01",
				[2.0] = "pes_level_prologue_dodge_02"
			},
			randomize_indexes = {}
		},
		pes_level_prologue_block = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_prologue_block_01",
				[2.0] = "pes_level_prologue_block_02"
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
				[1.0] = "pes_level_prologue_block_01",
				[2.0] = "pes_level_prologue_block_02"
			},
			randomize_indexes = {}
		},
		pdr_prologue_bardin_healed_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_bardin_healed_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_bardin_healed_01"
			}
		},
		pes_level_prologue_elevator_ride = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_elevator_ride_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_elevator_ride_01"
			}
		},
		pes_prologue_bardin_healed_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_bardin_healed_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_bardin_healed_01"
			}
		},
		pes_prologue_bardin_revived_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_bardin_revived_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_bardin_revived_01"
			}
		},
		pes_prologue_intro_f = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_hello_kruber_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_hello_kruber_03"
			}
		},
		["pwe_level_ prologue_seeing_crater_kerillian"] = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_ prologue_seeing_crater_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_level_ prologue_seeing_crater_01"
			}
		},
		pes_level_prologue_elevator_ride_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_elevator_ride_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_elevator_ride_03"
			}
		},
		pes_level_prologue_bardin_fallling_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_fallling_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_fallling_01"
			}
		},
		pdr_level_prologue_bardin_fallling_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_fallling_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_fallling_01"
			}
		},
		pes_level_prologue_travel = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_prologue_travel_01",
				[2.0] = "pes_level_prologue_travel_02"
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
				[1.0] = "pes_level_prologue_travel_01",
				[2.0] = "pes_level_prologue_travel_02"
			},
			randomize_indexes = {}
		},
		pes_level_prologue_waking_up = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_level_prologue_waking_up_01",
				[2.0] = "pes_level_prologue_waking_up_02"
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
				[1.0] = "pes_level_prologue_waking_up_01",
				[2.0] = "pes_level_prologue_waking_up_02"
			},
			randomize_indexes = {}
		},
		pwh_prologue_portal_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_prologue_portal_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwh_prologue_portal_03"
			}
		},
		pbw_level_prologue_sienna_up_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_prologue_sienna_up_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pbw_level_prologue_sienna_up_01"
			}
		},
		pwe_level_prologue_skittergate_afar_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_prologue_skittergate_afar_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_level_prologue_skittergate_afar_01"
			}
		},
		["pdr_level_ prologue_reached_surface_02"] = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_ prologue_reached_surface_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_ prologue_reached_surface_02"
			}
		},
		["pbw_level_ prologue_reached_surface_sienna"] = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_level_ prologue_reached_surface_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pbw_level_ prologue_reached_surface_01"
			}
		},
		pes_level_prologue_sienna_up = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_sienna_up_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_sienna_up_01"
			}
		},
		ecc_prologue_dialogue_answer_bang = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecc_prologue_dialogue_answer_bang"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "ecc_prologue_dialogue_answer_bang"
			}
		},
		pdr_prologue_bardin_dazed_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_bardin_dazed_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_bardin_dazed_01"
			}
		},
		pes_level_prologue_skittergate_afar = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_skittergate_afar_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_skittergate_afar_01"
			}
		},
		egs_level_prologue_skittergate_distance_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_level_prologue_skittergate_distance_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_level_prologue_skittergate_distance_01"
			}
		},
		pdr_level_prologue_bardin_passing_one_bardin_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_passing_one_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_passing_one_01"
			}
		},
		["pdr_level_ prologue_reached_surface_bardin"] = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_ prologue_reached_surface_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_ prologue_reached_surface_01"
			}
		},
		ecc_prologue_dialogue_answer_lack_of_patience = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene_interrupt_three",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecc_prologue_dialogue_answer_lack_of_patience"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "ecc_prologue_dialogue_answer_lack_of_patience"
			}
		},
		egs_level_prologue_skittergate_distance_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_level_prologue_skittergate_distance_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_level_prologue_skittergate_distance_03"
			}
		},
		pes_prologue_meeting_kerillian_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_meeting_kerillian_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_meeting_kerillian_02"
			}
		},
		pdr_prologue_heal_bardin_take_time_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_prologue_heal_bardin_take_time_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_prologue_heal_bardin_take_time_02"
			}
		},
		pwh_prologue_portal = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_prologue_portal_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwh_prologue_portal_01"
			}
		},
		pes_prologue_heal_bardin_kruber_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_heal_bardin_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_heal_bardin_01"
			}
		},
		pdr_level_prologue_elevator_ride_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_elevator_ride_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_elevator_ride_01"
			}
		},
		pes_level_prologue_seeing_crater_kruber = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_seeing_crater_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_seeing_crater_01"
			}
		},
		["pwe_level_ prologue_reached_surface_kerillian"] = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_ prologue_reached_surface_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_level_ prologue_reached_surface_01"
			}
		},
		pes_prologue_intro_d = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_hello_kruber_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_hello_kruber_02"
			}
		},
		pwe_prologue_meeting_kerillian_kerillian_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_prologue_meeting_kerillian_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_prologue_meeting_kerillian_01"
			}
		},
		pes_level_prologue_bardin_passing_two_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_passing_two_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_passing_two_03"
			}
		},
		pwe_level_prologue_elevator_ride_kerillian = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_level_prologue_elevator_ride_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pwe_level_prologue_elevator_ride_01"
			}
		},
		pes_level_prologue_wizard_sound = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_level_prologue_wizard_sound_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_level_prologue_wizard_sound_01"
			}
		},
		egs_level_prologue_skittergate_distance_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "cut_scene",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "egs_level_prologue_skittergate_distance_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "egs_level_prologue_skittergate_distance_02"
			}
		},
		pes_level_prologue_fighting_pit_fight = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "conversations_prologue",
			category = "level_talk_tutorial",
			dialogue_animations_n = 3,
			sound_events = {
				"pes_level_prologue_fighting_pit_02",
				"pes_level_prologue_fighting_pit_03",
				"pes_level_prologue_fighting_pit_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_level_prologue_fighting_pit_02",
				"pes_level_prologue_fighting_pit_03",
				"pes_level_prologue_fighting_pit_04"
			},
			randomize_indexes = {}
		},
		pdr_level_prologue_bardin_passing_two_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_passing_two_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_passing_two_01"
			}
		},
		pes_prologue_kerillian_fight_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_prologue_kerillian_fight_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			localization_strings = {
				[1.0] = "pes_prologue_kerillian_fight_01"
			}
		},
		pdr_level_prologue_bardin_passing_two_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "conversations_prologue",
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_passing_two_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_passing_two_02"
			}
		}
	})

	return 
end
