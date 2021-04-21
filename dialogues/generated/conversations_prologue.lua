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
		response = "pdr_level_prologue_reached_surface_bardin",
		name = "pdr_level_prologue_reached_surface_bardin",
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
		response = "pwe_level_prologue_reached_surface_kerillian",
		name = "pwe_level_prologue_reached_surface_kerillian",
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
		response = "pbw_level_prologue_reached_surface_sienna",
		name = "pbw_level_prologue_reached_surface_sienna",
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
		response = "pdr_level_prologue_reached_surface_02",
		name = "pdr_level_prologue_reached_surface_02",
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
		response = "pbw_level_prologue_seeing_crater_sienna",
		name = "pbw_level_prologue_seeing_crater_sienna",
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
		response = "pwe_level_prologue_seeing_crater_kerillian",
		name = "pwe_level_prologue_seeing_crater_kerillian",
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
		response = "pdr_level_prologue_seeing_crater_01",
		name = "pdr_level_prologue_seeing_crater_01",
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
		response = "pwh_prologue_portal_salty_02",
		name = "pwh_prologue_portal_salty_02",
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
		pes_level_prologue_waking_up = {
			face_animations_n = 2,
			database = "conversations_prologue",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_level_prologue_waking_up_01",
				[2.0] = "pes_level_prologue_waking_up_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_waking_up_01",
				[2.0] = "pes_level_prologue_waking_up_02"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.4113750457764,
				[2.0] = 2.4771041870117
			}
		},
		pes_prologue_bardin_dazed_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_bardin_dazed_01"
			},
			sound_events = {
				[1.0] = "pes_prologue_bardin_dazed_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.0529999732971
			}
		},
		egs_prologue_ranting_at_skavens = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "egs_prologue_ranting_at_skavens"
			},
			sound_events = {
				[1.0] = "egs_prologue_ranting_at_skavens"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 12.173500061035
			}
		},
		pdr_prologue_portal_bardin = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_portal_01"
			},
			sound_events = {
				[1.0] = "pdr_prologue_portal_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.1975626945496
			}
		},
		pdr_level_prologue_wizard_down_b = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_wizard_down_b_01"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_wizard_down_b_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.4416666030884
			}
		},
		pes_level_prologue_seeing_crater_kruber = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_seeing_crater_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_seeing_crater_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 7.51016664505
			}
		},
		pes_prologue_meeting_kerillian_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_meeting_kerillian_01"
			},
			sound_events = {
				[1.0] = "pes_prologue_meeting_kerillian_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.5763750076294
			}
		},
		pdr_prologue_meeting_kerillian_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_meeting_kerillian_01"
			},
			sound_events = {
				[1.0] = "pdr_prologue_meeting_kerillian_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.344687461853
			}
		},
		pes_prologue_portal_kruber = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_portal_01"
			},
			sound_events = {
				[1.0] = "pes_prologue_portal_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.9087915420532
			}
		},
		pes_level_prologue_fighting_pit = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_fighting_pit_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_fighting_pit_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.1856458187103
			}
		},
		pdr_level_prologue_bardin_passing_one_00 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_passing_one_00"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_passing_one_00"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 13.418250083923
			}
		},
		pwe_prologue_meeting_kerillian_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_prologue_meeting_kerillian_02"
			},
			sound_events = {
				[1.0] = "pwe_prologue_meeting_kerillian_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.8084374666214
			}
		},
		nfl_prologue_intro_a = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "nfl_level_prologue_hello_kruber_01"
			},
			sound_events = {
				[1.0] = "nfl_level_prologue_hello_kruber_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 9.2159366607666
			}
		},
		pes_level_prologue_bardin_passing_two_03 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_passing_two_03"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_passing_two_03"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.7523124217987
			}
		},
		pbw_level_prologue_elevator_ride_sienna = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_level_prologue_elevator_ride_01"
			},
			sound_events = {
				[1.0] = "pbw_level_prologue_elevator_ride_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.2999167442322
			}
		},
		pwh_prologue_portal = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_prologue_portal_01"
			},
			sound_events = {
				[1.0] = "pwh_prologue_portal_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.1564168930054
			}
		},
		pwe_level_prologue_seeing_crater_kerillian = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_level_prologue_seeing_crater_01"
			},
			sound_events = {
				[1.0] = "pwe_level_prologue_seeing_crater_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 8.842791557312
			}
		},
		pes_prologue_meeting_kerillian_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_meeting_kerillian_02"
			},
			sound_events = {
				[1.0] = "pes_prologue_meeting_kerillian_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.478395819664
			}
		},
		pes_level_prologue_bardin_passing_one_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_passing_one_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_passing_one_01"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.8150625228882
			}
		},
		ecc_prologue_dialogue_answer_lack_of_patience = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene_interrupt_three",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "ecc_prologue_dialogue_answer_lack_of_patience"
			},
			sound_events = {
				[1.0] = "ecc_prologue_dialogue_answer_lack_of_patience"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 8.446249961853
			}
		},
		pwe_level_prologue_elevator_ride_kerillian_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_level_prologue_elevator_ride_02"
			},
			sound_events = {
				[1.0] = "pwe_level_prologue_elevator_ride_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.8933124542236
			}
		},
		pes_level_prologue_elevator_ride_03 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_elevator_ride_03"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_elevator_ride_03"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.9552500247955
			}
		},
		pes_level_prologue_bardin_fallling_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_fallling_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_fallling_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.1619583368301
			}
		},
		pes_prologue_intro_b = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_hello_kruber_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_hello_kruber_01"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.0002193450928
			}
		},
		pes_level_prologue_bardin_passing_two_kruber_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_passing_two_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_passing_two_01"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.9927916526794
			}
		},
		pdr_level_prologue_reached_surface_bardin = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_reached_surface_01"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_reached_surface_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.8339791297913
			}
		},
		pes_prologue_bardin_healed_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_bardin_healed_01"
			},
			sound_events = {
				[1.0] = "pes_prologue_bardin_healed_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.7419583797455
			}
		},
		pdr_prologue_kerillian_fight_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_kerillian_fight_01"
			},
			sound_events = {
				[1.0] = "pdr_prologue_kerillian_fight_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.2952499389648
			}
		},
		pes_level_prologue_skittergate_afar = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_skittergate_afar_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_skittergate_afar_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.183958530426
			}
		},
		pdr_level_prologue_reached_surface_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_reached_surface_02"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_reached_surface_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.3247289657593
			}
		},
		egs_prologue_intro_from_far = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "egs_prologue_intro_from_far"
			},
			sound_events = {
				[1.0] = "egs_prologue_intro_from_far"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.3193960189819
			}
		},
		pes_level_prologue_wizard_sound = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_wizard_sound_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_wizard_sound_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.0069375038147
			}
		},
		pes_level_prologue_fighting_pit_fight = {
			face_animations_n = 3,
			database = "conversations_prologue",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pes_level_prologue_fighting_pit_02",
				"pes_level_prologue_fighting_pit_03",
				"pes_level_prologue_fighting_pit_04"
			},
			sound_events = {
				"pes_level_prologue_fighting_pit_02",
				"pes_level_prologue_fighting_pit_03",
				"pes_level_prologue_fighting_pit_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.6084582805634,
				4.198145866394,
				3.7627770900726
			}
		},
		pdr_prologue_bardin_dazed_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_bardin_dazed_01"
			},
			sound_events = {
				[1.0] = "pdr_prologue_bardin_dazed_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.7509164810181
			}
		},
		pes_level_prologue_elevator_ride_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_elevator_ride_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_elevator_ride_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 9.2886877059937
			}
		},
		pdr_level_prologue_bardin_passing_two_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_passing_two_02"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_passing_two_02"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.2269167900085
			}
		},
		pes_prologue_gate_opens_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_gate_opens_01"
			},
			sound_events = {
				[1.0] = "pes_prologue_gate_opens_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.8380000591278
			}
		},
		pes_level_prologue_supply = {
			face_animations_n = 2,
			database = "conversations_prologue",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_level_prologue_supply_01",
				[2.0] = "pes_level_prologue_supply_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_supply_01",
				[2.0] = "pes_level_prologue_supply_02"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.5100626945496,
				[2.0] = 2.3755624294281
			}
		},
		pes_level_prologue_got_bow = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_got_bow_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_got_bow_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.1498749256134
			}
		},
		pwe_prologue_meeting_kerillian_kerillian_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_prologue_meeting_kerillian_01"
			},
			sound_events = {
				[1.0] = "pwe_prologue_meeting_kerillian_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.4856457710266
			}
		},
		pes_level_prologue_ability = {
			face_animations_n = 2,
			database = "conversations_prologue",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_level_prologue_ability_01",
				[2.0] = "pes_level_prologue_ability_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_ability_01",
				[2.0] = "pes_level_prologue_ability_02"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.0712916851044,
				[2.0] = 1.6363749504089
			}
		},
		pes_level_prologue_strong = {
			face_animations_n = 2,
			database = "conversations_prologue",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_level_prologue_strong_01",
				[2.0] = "pes_level_prologue_strong_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_strong_01",
				[2.0] = "pes_level_prologue_strong_02"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.4305000305176,
				[2.0] = 2.9029166698456
			}
		},
		pdr_prologue_heal_bardin_take_time_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_heal_bardin_take_time_02"
			},
			sound_events = {
				[1.0] = "pdr_prologue_heal_bardin_take_time_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.5300209522247
			}
		},
		pes_level_prologue_dodge = {
			face_animations_n = 2,
			database = "conversations_prologue",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_level_prologue_dodge_01",
				[2.0] = "pes_level_prologue_dodge_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_dodge_01",
				[2.0] = "pes_level_prologue_dodge_02"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.8727083206177,
				[2.0] = 3.2869167327881
			}
		},
		pdr_level_prologue_seeing_crater_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_seeing_crater_01"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_seeing_crater_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 7.5956249237061
			}
		},
		pes_level_prologue_cage_fall = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_cage_fall_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_cage_fall_01"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.9939583539963
			}
		},
		pbw_level_prologue_elevator_ride_sienna_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_level_prologue_elevator_ride_02"
			},
			sound_events = {
				[1.0] = "pbw_level_prologue_elevator_ride_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 11.840250015259
			}
		},
		pdr_level_prologue_bardin_passing_two_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_passing_two_01"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_passing_two_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 17.759729385376
			}
		},
		pes_level_prologue_wizard_down_a = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_wizard_down_a_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_wizard_down_a_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 0.72579169273376
			}
		},
		pes_level_prologue_block = {
			face_animations_n = 2,
			database = "conversations_prologue",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_level_prologue_block_01",
				[2.0] = "pes_level_prologue_block_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_block_01",
				[2.0] = "pes_level_prologue_block_02"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.3343125581741,
				[2.0] = 3.5953540802002
			}
		},
		pes_level_prologue_first_payback = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_first_payback_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_first_payback_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.3966875076294
			}
		},
		pes_level_prologue_grab_weapon = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_grab_weapon_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_grab_weapon_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.9700833559036
			}
		},
		pdr_prologue_heal_bardin_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_heal_bardin_01"
			},
			sound_events = {
				[1.0] = "pdr_prologue_heal_bardin_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.7736248970032
			}
		},
		pes_prologue_kerillian_fight_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_kerillian_fight_01"
			},
			sound_events = {
				[1.0] = "pes_prologue_kerillian_fight_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.4806041717529
			}
		},
		pes_level_prologue_cage_land = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_cage_land_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_cage_land_01"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.1853125095367
			}
		},
		pwh_prologue_portal_salty = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_prologue_portal_02"
			},
			sound_events = {
				[1.0] = "pwh_prologue_portal_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.9052710533142
			}
		},
		pwe_prologue_portal_kerillian = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_prologue_portal_01"
			},
			sound_events = {
				[1.0] = "pwe_prologue_portal_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 10.520792007446
			}
		},
		egs_level_prologue_skittergate_distance_03 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "egs_level_prologue_skittergate_distance_03"
			},
			sound_events = {
				[1.0] = "egs_level_prologue_skittergate_distance_03"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 9.9780626296997
			}
		},
		pes_prologue_heal_bardin_kruber_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_heal_bardin_01"
			},
			sound_events = {
				[1.0] = "pes_prologue_heal_bardin_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.1837499141693
			}
		},
		pbw_level_prologue_sienna_up_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_level_prologue_sienna_up_01"
			},
			sound_events = {
				[1.0] = "pbw_level_prologue_sienna_up_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.0703959465027
			}
		},
		pes_prologue_bardin_revived_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_prologue_bardin_revived_01"
			},
			sound_events = {
				[1.0] = "pes_prologue_bardin_revived_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.745854139328
			}
		},
		pes_level_prologue_travel = {
			face_animations_n = 2,
			database = "conversations_prologue",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pes_level_prologue_travel_01",
				[2.0] = "pes_level_prologue_travel_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_travel_01",
				[2.0] = "pes_level_prologue_travel_02"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.3963124752045,
				[2.0] = 3.7355833053589
			}
		},
		pwh_prologue_portal_salty_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_prologue_portal_02b"
			},
			sound_events = {
				[1.0] = "pwh_prologue_portal_02b"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 9.0685625076294
			}
		},
		nfl_prologue_portal_e = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "npc_talk_interrupt_special",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "nfl_prologue_portal_e_01"
			},
			sound_events = {
				[1.0] = "nfl_prologue_portal_e_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 8.1883335113525
			}
		},
		pbw_level_prologue_seeing_crater_sienna = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_level_prologue_seeing_crater_01"
			},
			sound_events = {
				[1.0] = "pbw_level_prologue_seeing_crater_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 9.379958152771
			}
		},
		pbw_level_prologue_reached_surface_sienna = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_level_prologue_reached_surface_01"
			},
			sound_events = {
				[1.0] = "pbw_level_prologue_reached_surface_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.0113124847412
			}
		},
		ecc_prologue_dialogue_answer_bang = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "ecc_prologue_dialogue_answer_bang"
			},
			sound_events = {
				[1.0] = "ecc_prologue_dialogue_answer_bang"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 8.6133337020874
			}
		},
		egs_level_prologue_skittergate_distance_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "egs_level_prologue_skittergate_distance_02"
			},
			sound_events = {
				[1.0] = "egs_level_prologue_skittergate_distance_02"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 9.0010204315185
			}
		},
		pdr_level_prologue_bardin_passing_one_bardin_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_passing_one_01"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_passing_one_01"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.1193957328796
			}
		},
		pdr_prologue_bardin_healed_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_bardin_healed_01"
			},
			sound_events = {
				[1.0] = "pdr_prologue_bardin_healed_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.7281250953674
			}
		},
		pes_prologue_intro_d = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_hello_kruber_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_hello_kruber_02"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.1038144826889
			}
		},
		pes_level_prologue_reached_surface = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_reached_surface_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_reached_surface_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.7840418815613
			}
		},
		pwe_level_prologue_wizard_sound = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_level_prologue_wizard_sound_01"
			},
			sound_events = {
				[1.0] = "pwe_level_prologue_wizard_sound_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.2356250286102
			}
		},
		egs_level_prologue_skittergate_distance_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "egs_level_prologue_skittergate_distance_01"
			},
			sound_events = {
				[1.0] = "egs_level_prologue_skittergate_distance_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 14.541291236877
			}
		},
		pwe_level_prologue_reached_surface_kerillian = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_level_prologue_reached_surface_01"
			},
			sound_events = {
				[1.0] = "pwe_level_prologue_reached_surface_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.7416458129883
			}
		},
		pbw_level_prologue_skittergate_afar_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_level_prologue_skittergate_afar_01"
			},
			sound_events = {
				[1.0] = "pbw_level_prologue_skittergate_afar_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.4172291755676
			}
		},
		pes_prologue_intro_f = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_hello_kruber_03"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_hello_kruber_03"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.3787322044373
			}
		},
		pdr_level_prologue_elevator_ride_bardin = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_elevator_ride_02"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_elevator_ride_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.1547708511353
			}
		},
		nfl_prologue_intro_e = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "nfl_level_prologue_hello_kruber_03"
			},
			sound_events = {
				[1.0] = "nfl_level_prologue_hello_kruber_03"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 9.2870206832886
			}
		},
		pwe_level_prologue_elevator_ride_kerillian = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_level_prologue_elevator_ride_01"
			},
			sound_events = {
				[1.0] = "pwe_level_prologue_elevator_ride_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.9253125190735
			}
		},
		nfl_prologue_intro_c = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial_interrupt",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "nfl_level_prologue_hello_kruber_02"
			},
			sound_events = {
				[1.0] = "nfl_level_prologue_hello_kruber_02"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 7.8903183937073
			}
		},
		pes_level_prologue_freeing_bardin_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_freeing_bardin_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_freeing_bardin_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.7888749837875
			}
		},
		pwe_level_prologue_sienna_up_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_level_prologue_sienna_up_01"
			},
			sound_events = {
				[1.0] = "pwe_level_prologue_sienna_up_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.0483956336975
			}
		},
		pdr_level_prologue_elevator_ride_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_elevator_ride_01"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_elevator_ride_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 6.8732085227966
			}
		},
		pdr_prologue_bardin_revived_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_bardin_revived_01"
			},
			sound_events = {
				[1.0] = "pdr_prologue_bardin_revived_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.1767916679382
			}
		},
		pes_level_prologue_elevator_ride = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_elevator_ride_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_elevator_ride_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 8.6504583358765
			}
		},
		pdr_level_prologue_freeing_bardin_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_freeing_bardin_01"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_freeing_bardin_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.2649166584015
			}
		},
		pwe_level_prologue_skittergate_afar_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_level_prologue_skittergate_afar_01"
			},
			sound_events = {
				[1.0] = "pwe_level_prologue_skittergate_afar_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 5.0440626144409
			}
		},
		egs_prologue_dialogue_excuse = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene_interrupt_two",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "egs_prologue_dialogue_excuse"
			},
			sound_events = {
				[1.0] = "egs_prologue_dialogue_excuse"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 20.32356262207
			}
		},
		egs_prologue_dialogue_bang = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "cut_scene",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "egs_prologue_dialogue_bang"
			},
			sound_events = {
				[1.0] = "egs_prologue_dialogue_bang"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 16.003479003906
			}
		},
		pdr_prologue_gate_opens_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_prologue_gate_opens_01"
			},
			sound_events = {
				[1.0] = "pdr_prologue_gate_opens_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.3783540725708
			}
		},
		pwe_prologue_kerillian_fight_01 = {
			face_animations_n = 2,
			database = "conversations_prologue",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "level_talk_tutorial",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_prologue_kerillian_fight_01",
				[2.0] = "pwe_prologue_kerillian_fight_02"
			},
			sound_events = {
				[1.0] = "pwe_prologue_kerillian_fight_01",
				[2.0] = "pwe_prologue_kerillian_fight_02"
			},
			face_animations = {
				[1.0] = "face_contempt",
				[2.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.8511250019074,
				[2.0] = 1.9170207977295
			}
		},
		pes_level_prologue_sienna_up = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_sienna_up_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_sienna_up_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 2.6450834274292
			}
		},
		pes_level_prologue_bardin_passing_one_02 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_bardin_passing_one_02"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_bardin_passing_one_02"
			},
			face_animations = {
				[1.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.1177084445953
			}
		},
		pes_level_prologue_cage_see_weapon = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_level_prologue_cage_see_weapon_01"
			},
			sound_events = {
				[1.0] = "pes_level_prologue_cage_see_weapon_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.237583398819
			}
		},
		pdr_level_prologue_bardin_fallling_01 = {
			face_animations_n = 1,
			database = "conversations_prologue",
			sound_events_n = 1,
			sound_distance = 50,
			category = "level_talk_tutorial",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_level_prologue_bardin_fallling_01"
			},
			sound_events = {
				[1.0] = "pdr_level_prologue_bardin_fallling_01"
			},
			face_animations = {
				[1.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 3.8199999332428
			}
		}
	})
end
