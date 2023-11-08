return function ()
	define_rule({
		name = "pbw_morris_snare_a_one",
		response = "pbw_morris_snare_a_one",
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
				"sig_snare_a_one"
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
				"pbw_morris_snare_a_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_a_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_a_three",
		response = "pbw_morris_snare_a_three",
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
				"sig_snare_a_three"
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
				"pbw_morris_snare_a_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_a_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_a_two",
		response = "pbw_morris_snare_a_two",
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
				"sig_snare_a_two"
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
				"pbw_morris_snare_a_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_a_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_b_one",
		response = "pbw_morris_snare_b_one",
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
				"sig_snare_b_one"
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
				"pbw_morris_snare_b_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_b_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_b_three",
		response = "pbw_morris_snare_b_three",
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
				"sig_snare_b_three"
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
				"pbw_morris_snare_b_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_b_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_b_two",
		response = "pbw_morris_snare_b_two",
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
				"sig_snare_b_two"
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
				"pbw_morris_snare_b_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_b_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_c_one",
		response = "pbw_morris_snare_c_one",
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
				"sig_snare_c_one"
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
				"pbw_morris_snare_c_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_c_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_c_three",
		response = "pbw_morris_snare_c_three",
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
				"sig_snare_c_three"
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
				"pbw_morris_snare_c_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_c_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_c_two",
		response = "pbw_morris_snare_c_two",
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
				"sig_snare_c_two"
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
				"pbw_morris_snare_c_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_c_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_d_one",
		response = "pbw_morris_snare_d_one",
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
				"sig_snare_d_one"
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
				"pbw_morris_snare_d_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_d_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_d_three",
		response = "pbw_morris_snare_d_three",
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
				"sig_snare_d_three"
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
				"pbw_morris_snare_d_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_d_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_d_two",
		response = "pbw_morris_snare_d_two",
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
				"sig_snare_d_two"
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
				"pbw_morris_snare_d_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_d_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_e_one",
		response = "pbw_morris_snare_e_one",
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
				"sig_snare_e_one"
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
				"pbw_morris_snare_e_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_e_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_e_three",
		response = "pbw_morris_snare_e_three",
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
				"sig_snare_e_three"
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
				"pbw_morris_snare_e_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_e_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_snare_e_two",
		response = "pbw_morris_snare_e_two",
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
				"sig_snare_e_two"
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
				"pbw_morris_snare_e_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_snare_e_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_a_one",
		response = "pdr_morris_snare_a_one",
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
				"sig_snare_a_one"
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
				"pdr_morris_snare_a_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_a_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_a_three",
		response = "pdr_morris_snare_a_three",
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
				"sig_snare_a_three"
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
				"pdr_morris_snare_a_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_a_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_a_two",
		response = "pdr_morris_snare_a_two",
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
				"sig_snare_a_two"
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
				"pdr_morris_snare_a_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_a_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_b_one",
		response = "pdr_morris_snare_b_one",
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
				"sig_snare_b_one"
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
				"pdr_morris_snare_b_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_b_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_b_three",
		response = "pdr_morris_snare_b_three",
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
				"sig_snare_b_three"
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
				"pdr_morris_snare_b_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_b_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_b_two",
		response = "pdr_morris_snare_b_two",
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
				"sig_snare_b_two"
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
				"pdr_morris_snare_b_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_b_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_c_one",
		response = "pdr_morris_snare_c_one",
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
				"sig_snare_c_one"
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
				"pdr_morris_snare_c_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_c_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_c_three",
		response = "pdr_morris_snare_c_three",
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
				"sig_snare_c_three"
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
				"pdr_morris_snare_c_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_c_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_c_two",
		response = "pdr_morris_snare_c_two",
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
				"sig_snare_c_two"
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
				"pdr_morris_snare_c_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_c_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_d_one",
		response = "pdr_morris_snare_d_one",
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
				"sig_snare_d_one"
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
				"pdr_morris_snare_d_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_d_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_d_three",
		response = "pdr_morris_snare_d_three",
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
				"sig_snare_d_three"
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
				"pdr_morris_snare_d_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_d_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_d_two",
		response = "pdr_morris_snare_d_two",
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
				"sig_snare_d_two"
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
				"pdr_morris_snare_d_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_d_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_e_one",
		response = "pdr_morris_snare_e_one",
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
				"sig_snare_e_one"
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
				"pdr_morris_snare_e_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_e_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_e_three",
		response = "pdr_morris_snare_e_three",
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
				"sig_snare_e_three"
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
				"pdr_morris_snare_e_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_e_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_snare_e_two",
		response = "pdr_morris_snare_e_two",
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
				"sig_snare_e_two"
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
				"pdr_morris_snare_e_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_snare_e_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_a_one",
		response = "pes_morris_snare_a_one",
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
				"sig_snare_a_one"
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
				"pes_morris_snare_a_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_a_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_a_three",
		response = "pes_morris_snare_a_three",
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
				"sig_snare_a_three"
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
				"pes_morris_snare_a_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_a_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_a_two",
		response = "pes_morris_snare_a_two",
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
				"sig_snare_a_two"
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
				"pes_morris_snare_a_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_a_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_b_one",
		response = "pes_morris_snare_b_one",
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
				"sig_snare_b_one"
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
				"pes_morris_snare_b_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_b_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_b_three",
		response = "pes_morris_snare_b_three",
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
				"sig_snare_b_three"
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
				"pes_morris_snare_b_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_b_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_b_two",
		response = "pes_morris_snare_b_two",
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
				"sig_snare_b_two"
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
				"pes_morris_snare_b_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_b_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_c_one",
		response = "pes_morris_snare_c_one",
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
				"sig_snare_c_one"
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
				"pes_morris_snare_c_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_c_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_c_three",
		response = "pes_morris_snare_c_three",
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
				"sig_snare_c_three"
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
				"pes_morris_snare_c_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_c_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_c_two",
		response = "pes_morris_snare_c_two",
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
				"sig_snare_c_two"
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
				"pes_morris_snare_c_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_c_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_d_one",
		response = "pes_morris_snare_d_one",
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
				"sig_snare_d_one"
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
				"pes_morris_snare_d_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_d_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_d_three",
		response = "pes_morris_snare_d_three",
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
				"sig_snare_d_three"
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
				"pes_morris_snare_d_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_d_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_d_two",
		response = "pes_morris_snare_d_two",
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
				"sig_snare_d_two"
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
				"pes_morris_snare_d_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_d_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_e_one",
		response = "pes_morris_snare_e_one",
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
				"sig_snare_e_one"
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
				"pes_morris_snare_e_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_e_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_e_three",
		response = "pes_morris_snare_e_three",
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
				"sig_snare_e_three"
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
				"pes_morris_snare_e_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_e_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_snare_e_two",
		response = "pes_morris_snare_e_two",
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
				"sig_snare_e_two"
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
				"pes_morris_snare_e_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_snare_e_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_a_one",
		response = "pwe_morris_snare_a_one",
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
				"sig_snare_a_one"
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
				"pwe_morris_snare_a_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_a_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_a_three",
		response = "pwe_morris_snare_a_three",
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
				"sig_snare_a_three"
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
				"pwe_morris_snare_a_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_a_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_a_two",
		response = "pwe_morris_snare_a_two",
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
				"sig_snare_a_two"
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
				"pwe_morris_snare_a_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_a_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_b_one",
		response = "pwe_morris_snare_b_one",
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
				"sig_snare_b_one"
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
				"pwe_morris_snare_b_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_b_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_b_three",
		response = "pwe_morris_snare_b_three",
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
				"sig_snare_b_three"
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
				"pwe_morris_snare_b_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_b_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_b_two",
		response = "pwe_morris_snare_b_two",
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
				"sig_snare_b_two"
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
				"pwe_morris_snare_b_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_b_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_c_one",
		response = "pwe_morris_snare_c_one",
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
				"sig_snare_c_one"
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
				"pwe_morris_snare_c_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_c_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_c_three",
		response = "pwe_morris_snare_c_three",
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
				"sig_snare_c_three"
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
				"pwe_morris_snare_c_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_c_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_c_two",
		response = "pwe_morris_snare_c_two",
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
				"sig_snare_c_two"
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
				"pwe_morris_snare_c_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_c_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_d_one",
		response = "pwe_morris_snare_d_one",
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
				"sig_snare_d_one"
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
				"pwe_morris_snare_d_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_d_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_d_three",
		response = "pwe_morris_snare_d_three",
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
				"sig_snare_d_three"
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
				"pwe_morris_snare_d_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_d_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_d_two",
		response = "pwe_morris_snare_d_two",
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
				"sig_snare_d_two"
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
				"pwe_morris_snare_d_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_d_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_e_one",
		response = "pwe_morris_snare_e_one",
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
				"sig_snare_e_one"
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
				"pwe_morris_snare_e_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_e_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_e_three",
		response = "pwe_morris_snare_e_three",
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
				"sig_snare_e_three"
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
				"pwe_morris_snare_e_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_e_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_snare_e_two",
		response = "pwe_morris_snare_e_two",
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
				"sig_snare_e_two"
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
				"pwe_morris_snare_e_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_snare_e_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_a_one",
		response = "pwh_morris_snare_a_one",
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
				"sig_snare_a_one"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_a_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_a_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_a_three",
		response = "pwh_morris_snare_a_three",
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
				"sig_snare_a_three"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_a_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_a_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_a_two",
		response = "pwh_morris_snare_a_two",
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
				"sig_snare_a_two"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_a_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_a_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_b_one",
		response = "pwh_morris_snare_b_one",
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
				"sig_snare_b_one"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_b_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_b_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_b_three",
		response = "pwh_morris_snare_b_three",
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
				"sig_snare_b_three"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_b_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_b_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_b_two",
		response = "pwh_morris_snare_b_two",
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
				"sig_snare_b_two"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_b_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_b_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_c_one",
		response = "pwh_morris_snare_c_one",
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
				"sig_snare_c_one"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_c_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_c_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_c_three",
		response = "pwh_morris_snare_c_three",
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
				"sig_snare_c_three"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_c_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_c_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_c_two",
		response = "pwh_morris_snare_c_two",
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
				"sig_snare_c_two"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_c_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_c_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_d_one",
		response = "pwh_morris_snare_d_one",
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
				"sig_snare_d_one"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_d_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_d_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_d_three",
		response = "pwh_morris_snare_d_three",
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
				"sig_snare_d_three"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_d_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_d_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_d_two",
		response = "pwh_morris_snare_d_two",
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
				"sig_snare_d_two"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_d_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_d_two",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_e_one",
		response = "pwh_morris_snare_e_one",
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
				"sig_snare_e_one"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_e_one",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_e_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_e_three",
		response = "pwh_morris_snare_e_three",
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
				"sig_snare_e_three"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_e_three",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_e_three",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_snare_e_two",
		response = "pwh_morris_snare_e_two",
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
				"sig_snare_e_two"
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
			},
			{
				"faction_memory",
				"pwh_morris_snare_e_two",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_snare_e_two",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_snare_a_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_a_one_01",
				"pbw_morris_snare_a_one_02",
				"pbw_morris_snare_a_one_03",
				"pbw_morris_snare_a_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_a_one_01",
				"pbw_morris_snare_a_one_02",
				"pbw_morris_snare_a_one_03",
				"pbw_morris_snare_a_one_04"
			},
			sound_events_duration = {
				1.5647708177566,
				1.1566250324249,
				4.1974167823792,
				2.612687587738
			}
		},
		pbw_morris_snare_a_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_a_three_01",
				"pbw_morris_snare_a_three_02",
				"pbw_morris_snare_a_three_03",
				"pbw_morris_snare_a_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_a_three_01",
				"pbw_morris_snare_a_three_02",
				"pbw_morris_snare_a_three_03",
				"pbw_morris_snare_a_three_04"
			},
			sound_events_duration = {
				2.4396250247955,
				2.2838749885559,
				3.3677291870117,
				5.9044585227966
			}
		},
		pbw_morris_snare_a_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_a_two_01",
				"pbw_morris_snare_a_two_02",
				"pbw_morris_snare_a_two_03",
				"pbw_morris_snare_a_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_a_two_01",
				"pbw_morris_snare_a_two_02",
				"pbw_morris_snare_a_two_03",
				"pbw_morris_snare_a_two_04"
			},
			sound_events_duration = {
				2.0992708206177,
				5.5379791259766,
				2.1439583301544,
				3.4628541469574
			}
		},
		pbw_morris_snare_b_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_b_one_01",
				"pbw_morris_snare_b_one_02",
				"pbw_morris_snare_b_one_03",
				"pbw_morris_snare_b_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_b_one_01",
				"pbw_morris_snare_b_one_02",
				"pbw_morris_snare_b_one_03",
				"pbw_morris_snare_b_one_04"
			},
			sound_events_duration = {
				5.0307083129883,
				2.2596666812897,
				6.2660627365112,
				3.1113541126251
			}
		},
		pbw_morris_snare_b_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_b_three_01",
				"pbw_morris_snare_b_three_02",
				"pbw_morris_snare_b_three_03",
				"pbw_morris_snare_b_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_b_three_01",
				"pbw_morris_snare_b_three_02",
				"pbw_morris_snare_b_three_03",
				"pbw_morris_snare_b_three_04"
			},
			sound_events_duration = {
				7.982458114624,
				3.6776249408722,
				4.1104168891907,
				3.8892707824707
			}
		},
		pbw_morris_snare_b_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_b_two_01",
				"pbw_morris_snare_b_two_02",
				"pbw_morris_snare_b_two_03",
				"pbw_morris_snare_b_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_b_two_01",
				"pbw_morris_snare_b_two_02",
				"pbw_morris_snare_b_two_03",
				"pbw_morris_snare_b_two_04"
			},
			sound_events_duration = {
				5.2430834770203,
				5.409583568573,
				2.9142291545868,
				3.1741666793823
			}
		},
		pbw_morris_snare_c_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_c_one_01",
				"pbw_morris_snare_c_one_02",
				"pbw_morris_snare_c_one_03",
				"pbw_morris_snare_c_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_c_one_01",
				"pbw_morris_snare_c_one_02",
				"pbw_morris_snare_c_one_03",
				"pbw_morris_snare_c_one_04"
			},
			sound_events_duration = {
				3.190333366394,
				2.0018541812897,
				2.8637499809265,
				3.7388124465942
			}
		},
		pbw_morris_snare_c_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_c_three_01",
				"pbw_morris_snare_c_three_02",
				"pbw_morris_snare_c_three_03",
				"pbw_morris_snare_c_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_c_three_01",
				"pbw_morris_snare_c_three_02",
				"pbw_morris_snare_c_three_03",
				"pbw_morris_snare_c_three_04"
			},
			sound_events_duration = {
				2.0058124065399,
				4.7905831336975,
				3.3590624332428,
				3.995395898819
			}
		},
		pbw_morris_snare_c_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_c_two_01",
				"pbw_morris_snare_c_two_02",
				"pbw_morris_snare_c_two_03",
				"pbw_morris_snare_c_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_c_two_01",
				"pbw_morris_snare_c_two_02",
				"pbw_morris_snare_c_two_03",
				"pbw_morris_snare_c_two_04"
			},
			sound_events_duration = {
				3.0054376125336,
				1.8294166326523,
				2.6716248989105,
				1.6361666917801
			}
		},
		pbw_morris_snare_d_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_d_one_01",
				"pbw_morris_snare_d_one_02",
				"pbw_morris_snare_d_one_03",
				"pbw_morris_snare_d_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_d_one_01",
				"pbw_morris_snare_d_one_02",
				"pbw_morris_snare_d_one_03",
				"pbw_morris_snare_d_one_04"
			},
			sound_events_duration = {
				4.2690210342407,
				3.3323540687561,
				3.651270866394,
				4.3175415992737
			}
		},
		pbw_morris_snare_d_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_d_three_01",
				"pbw_morris_snare_d_three_02",
				"pbw_morris_snare_d_three_03",
				"pbw_morris_snare_d_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_d_three_01",
				"pbw_morris_snare_d_three_02",
				"pbw_morris_snare_d_three_03",
				"pbw_morris_snare_d_three_04"
			},
			sound_events_duration = {
				2.0979375839233,
				5.5714998245239,
				1.6564166545868,
				2.6684374809265
			}
		},
		pbw_morris_snare_d_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_d_two_01",
				"pbw_morris_snare_d_two_02",
				"pbw_morris_snare_d_two_03",
				"pbw_morris_snare_d_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_d_two_01",
				"pbw_morris_snare_d_two_02",
				"pbw_morris_snare_d_two_03",
				"pbw_morris_snare_d_two_04"
			},
			sound_events_duration = {
				2.9684791564941,
				5.1720418930054,
				5.118625164032,
				3.231166601181
			}
		},
		pbw_morris_snare_e_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_e_one_01",
				"pbw_morris_snare_e_one_02",
				"pbw_morris_snare_e_one_03",
				"pbw_morris_snare_e_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_e_one_01",
				"pbw_morris_snare_e_one_02",
				"pbw_morris_snare_e_one_03",
				"pbw_morris_snare_e_one_04"
			},
			sound_events_duration = {
				4.0929164886475,
				2.4525833129883,
				3.3808124065399,
				5.040479183197
			}
		},
		pbw_morris_snare_e_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_e_three_01",
				"pbw_morris_snare_e_three_02",
				"pbw_morris_snare_e_three_03",
				"pbw_morris_snare_e_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_e_three_01",
				"pbw_morris_snare_e_three_02",
				"pbw_morris_snare_e_three_03",
				"pbw_morris_snare_e_three_04"
			},
			sound_events_duration = {
				1.6072499752045,
				2.3487708568573,
				2.6237082481384,
				3.236166715622
			}
		},
		pbw_morris_snare_e_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pbw_morris_snare_e_two_01",
				"pbw_morris_snare_e_two_02",
				"pbw_morris_snare_e_two_03",
				"pbw_morris_snare_e_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_snare_e_two_01",
				"pbw_morris_snare_e_two_02",
				"pbw_morris_snare_e_two_03",
				"pbw_morris_snare_e_two_04"
			},
			sound_events_duration = {
				1.2214167118073,
				1.8532916307449,
				1.9617291688919,
				2.8113541603088
			}
		},
		pdr_morris_snare_a_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_a_one_01",
				"pdr_morris_snare_a_one_02",
				"pdr_morris_snare_a_one_03",
				"pdr_morris_snare_a_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_a_one_01",
				"pdr_morris_snare_a_one_02",
				"pdr_morris_snare_a_one_03",
				"pdr_morris_snare_a_one_04"
			},
			sound_events_duration = {
				2.8094167709351,
				4.434666633606,
				2.7863957881927,
				4.8611249923706
			}
		},
		pdr_morris_snare_a_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_a_three_01",
				"pdr_morris_snare_a_three_02",
				"pdr_morris_snare_a_three_03",
				"pdr_morris_snare_a_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_a_three_01",
				"pdr_morris_snare_a_three_02",
				"pdr_morris_snare_a_three_03",
				"pdr_morris_snare_a_three_04"
			},
			sound_events_duration = {
				4.1845626831055,
				4.5281872749329,
				3.7338750362396,
				1.7929999828339
			}
		},
		pdr_morris_snare_a_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_a_two_01",
				"pdr_morris_snare_a_two_02",
				"pdr_morris_snare_a_two_03",
				"pdr_morris_snare_a_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_a_two_01",
				"pdr_morris_snare_a_two_02",
				"pdr_morris_snare_a_two_03",
				"pdr_morris_snare_a_two_04"
			},
			sound_events_duration = {
				5.2712917327881,
				4.2771458625794,
				5.3669166564941,
				4.8456249237061
			}
		},
		pdr_morris_snare_b_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_b_one_01",
				"pdr_morris_snare_b_one_02",
				"pdr_morris_snare_b_one_03",
				"pdr_morris_snare_b_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_b_one_01",
				"pdr_morris_snare_b_one_02",
				"pdr_morris_snare_b_one_03",
				"pdr_morris_snare_b_one_04"
			},
			sound_events_duration = {
				1.8703541755676,
				1.5917083024979,
				4.6110415458679,
				2.4334790706634
			}
		},
		pdr_morris_snare_b_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_b_three_01",
				"pdr_morris_snare_b_three_02",
				"pdr_morris_snare_b_three_03",
				"pdr_morris_snare_b_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_b_three_01",
				"pdr_morris_snare_b_three_02",
				"pdr_morris_snare_b_three_03",
				"pdr_morris_snare_b_three_04"
			},
			sound_events_duration = {
				6.4210209846497,
				3.7288749217987,
				7.0450000762939,
				5.9850206375122
			}
		},
		pdr_morris_snare_b_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_b_two_01",
				"pdr_morris_snare_b_two_02",
				"pdr_morris_snare_b_two_03",
				"pdr_morris_snare_b_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_b_two_01",
				"pdr_morris_snare_b_two_02",
				"pdr_morris_snare_b_two_03",
				"pdr_morris_snare_b_two_04"
			},
			sound_events_duration = {
				2.7886874675751,
				2.494062423706,
				3.3538959026337,
				3.2361874580383
			}
		},
		pdr_morris_snare_c_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_c_one_01",
				"pdr_morris_snare_c_one_02",
				"pdr_morris_snare_c_one_03",
				"pdr_morris_snare_c_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_c_one_01",
				"pdr_morris_snare_c_one_02",
				"pdr_morris_snare_c_one_03",
				"pdr_morris_snare_c_one_04"
			},
			sound_events_duration = {
				6.2377710342407,
				4.2774376869202,
				3.4322292804718,
				6.1772708892822
			}
		},
		pdr_morris_snare_c_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_c_three_01",
				"pdr_morris_snare_c_three_02",
				"pdr_morris_snare_c_three_03",
				"pdr_morris_snare_c_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_c_three_01",
				"pdr_morris_snare_c_three_02",
				"pdr_morris_snare_c_three_03",
				"pdr_morris_snare_c_three_04"
			},
			sound_events_duration = {
				3.2694792747498,
				4.7978959083557,
				6.0133123397827,
				4.6034998893738
			}
		},
		pdr_morris_snare_c_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_c_two_01",
				"pdr_morris_snare_c_two_02",
				"pdr_morris_snare_c_two_03",
				"pdr_morris_snare_c_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_c_two_01",
				"pdr_morris_snare_c_two_02",
				"pdr_morris_snare_c_two_03",
				"pdr_morris_snare_c_two_04"
			},
			sound_events_duration = {
				3.2991042137146,
				4.1387500762939,
				3.1126248836517,
				4.6996459960938
			}
		},
		pdr_morris_snare_d_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_d_one_01",
				"pdr_morris_snare_d_one_02",
				"pdr_morris_snare_d_one_03",
				"pdr_morris_snare_d_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_d_one_01",
				"pdr_morris_snare_d_one_02",
				"pdr_morris_snare_d_one_03",
				"pdr_morris_snare_d_one_04"
			},
			sound_events_duration = {
				4.8004999160767,
				6.9584584236145,
				3.583104133606,
				3.8084583282471
			}
		},
		pdr_morris_snare_d_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_d_three_01",
				"pdr_morris_snare_d_three_02",
				"pdr_morris_snare_d_three_03",
				"pdr_morris_snare_d_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_d_three_01",
				"pdr_morris_snare_d_three_02",
				"pdr_morris_snare_d_three_03",
				"pdr_morris_snare_d_three_04"
			},
			sound_events_duration = {
				3.2087917327881,
				3.5559792518616,
				3.1508541107178,
				5.5547914505005
			}
		},
		pdr_morris_snare_d_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_d_two_01",
				"pdr_morris_snare_d_two_02",
				"pdr_morris_snare_d_two_03",
				"pdr_morris_snare_d_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_d_two_01",
				"pdr_morris_snare_d_two_02",
				"pdr_morris_snare_d_two_03",
				"pdr_morris_snare_d_two_04"
			},
			sound_events_duration = {
				3.5838124752045,
				2.6210832595825,
				2.7715833187103,
				5.0461459159851
			}
		},
		pdr_morris_snare_e_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_e_one_01",
				"pdr_morris_snare_e_one_02",
				"pdr_morris_snare_e_one_03",
				"pdr_morris_snare_e_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_e_one_01",
				"pdr_morris_snare_e_one_02",
				"pdr_morris_snare_e_one_03",
				"pdr_morris_snare_e_one_04"
			},
			sound_events_duration = {
				5.068416595459,
				3.6666250228882,
				4.7299165725708,
				4.4992499351502
			}
		},
		pdr_morris_snare_e_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_e_three_01",
				"pdr_morris_snare_e_three_02",
				"pdr_morris_snare_e_three_03",
				"pdr_morris_snare_e_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_e_three_01",
				"pdr_morris_snare_e_three_02",
				"pdr_morris_snare_e_three_03",
				"pdr_morris_snare_e_three_04"
			},
			sound_events_duration = {
				2.0468332767487,
				3.1209790706634,
				2.3243334293366,
				2.3782916069031
			}
		},
		pdr_morris_snare_e_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pdr_morris_snare_e_two_01",
				"pdr_morris_snare_e_two_02",
				"pdr_morris_snare_e_two_03",
				"pdr_morris_snare_e_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_snare_e_two_01",
				"pdr_morris_snare_e_two_02",
				"pdr_morris_snare_e_two_03",
				"pdr_morris_snare_e_two_04"
			},
			sound_events_duration = {
				2.4735832214356,
				2.2514998912811,
				4.5545415878296,
				6.2728748321533
			}
		},
		pes_morris_snare_a_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_a_one_01",
				"pes_morris_snare_a_one_02",
				"pes_morris_snare_a_one_03",
				"pes_morris_snare_a_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_a_one_01",
				"pes_morris_snare_a_one_02",
				"pes_morris_snare_a_one_03",
				"pes_morris_snare_a_one_04"
			},
			sound_events_duration = {
				1.8914999961853,
				3.3490624427795,
				1.8240000009537,
				1.2725207805634
			}
		},
		pes_morris_snare_a_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_a_three_01",
				"pes_morris_snare_a_three_02",
				"pes_morris_snare_a_three_03",
				"pes_morris_snare_a_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_a_three_01",
				"pes_morris_snare_a_three_02",
				"pes_morris_snare_a_three_03",
				"pes_morris_snare_a_three_04"
			},
			sound_events_duration = {
				2.8027708530426,
				3.2188959121704,
				2.9111874103546,
				6.0281667709351
			}
		},
		pes_morris_snare_a_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_a_two_01",
				"pes_morris_snare_a_two_02",
				"pes_morris_snare_a_two_03",
				"pes_morris_snare_a_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_a_two_01",
				"pes_morris_snare_a_two_02",
				"pes_morris_snare_a_two_03",
				"pes_morris_snare_a_two_04"
			},
			sound_events_duration = {
				3.1282708644867,
				4.0269374847412,
				3.9046459197998,
				2.7502291202545
			}
		},
		pes_morris_snare_b_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_b_one_01",
				"pes_morris_snare_b_one_02",
				"pes_morris_snare_b_one_03",
				"pes_morris_snare_b_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_b_one_01",
				"pes_morris_snare_b_one_02",
				"pes_morris_snare_b_one_03",
				"pes_morris_snare_b_one_04"
			},
			sound_events_duration = {
				2.0309166908264,
				2.0740416049957,
				2.3013334274292,
				4.6255626678467
			}
		},
		pes_morris_snare_b_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_b_three_01",
				"pes_morris_snare_b_three_02",
				"pes_morris_snare_b_three_03",
				"pes_morris_snare_b_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_b_three_01",
				"pes_morris_snare_b_three_02",
				"pes_morris_snare_b_three_03",
				"pes_morris_snare_b_three_04"
			},
			sound_events_duration = {
				3.9326040744781,
				2.6599583625794,
				3.789520740509,
				1.5045000314713
			}
		},
		pes_morris_snare_b_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_b_two_01",
				"pes_morris_snare_b_two_02",
				"pes_morris_snare_b_two_03",
				"pes_morris_snare_b_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_b_two_01",
				"pes_morris_snare_b_two_02",
				"pes_morris_snare_b_two_03",
				"pes_morris_snare_b_two_04"
			},
			sound_events_duration = {
				3.6254167556763,
				3.1140625476837,
				1.5242708921433,
				1.8570417165756
			}
		},
		pes_morris_snare_c_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_c_one_01",
				"pes_morris_snare_c_one_02",
				"pes_morris_snare_c_one_03",
				"pes_morris_snare_c_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_c_one_01",
				"pes_morris_snare_c_one_02",
				"pes_morris_snare_c_one_03",
				"pes_morris_snare_c_one_04"
			},
			sound_events_duration = {
				4.1222081184387,
				1.7775000333786,
				1.3255000114441,
				2.6254167556763
			}
		},
		pes_morris_snare_c_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_c_three_01",
				"pes_morris_snare_c_three_02",
				"pes_morris_snare_c_three_03",
				"pes_morris_snare_c_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_c_three_01",
				"pes_morris_snare_c_three_02",
				"pes_morris_snare_c_three_03",
				"pes_morris_snare_c_three_04"
			},
			sound_events_duration = {
				2.3138749599457,
				3.0671458244324,
				2.0125625133514,
				2.9522082805634
			}
		},
		pes_morris_snare_c_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_c_two_01",
				"pes_morris_snare_c_two_02",
				"pes_morris_snare_c_two_03",
				"pes_morris_snare_c_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_c_two_01",
				"pes_morris_snare_c_two_02",
				"pes_morris_snare_c_two_03",
				"pes_morris_snare_c_two_04"
			},
			sound_events_duration = {
				2.0434792041779,
				2.7417707443237,
				1.9785208702087,
				1.8751041889191
			}
		},
		pes_morris_snare_d_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_d_one_01",
				"pes_morris_snare_d_one_02",
				"pes_morris_snare_d_one_03",
				"pes_morris_snare_d_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_d_one_01",
				"pes_morris_snare_d_one_02",
				"pes_morris_snare_d_one_03",
				"pes_morris_snare_d_one_04"
			},
			sound_events_duration = {
				3.6246249675751,
				1.6185624599457,
				2.4258959293366,
				3.1053540706634
			}
		},
		pes_morris_snare_d_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_d_three_01",
				"pes_morris_snare_d_three_02",
				"pes_morris_snare_d_three_03",
				"pes_morris_snare_d_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_d_three_01",
				"pes_morris_snare_d_three_02",
				"pes_morris_snare_d_three_03",
				"pes_morris_snare_d_three_04"
			},
			sound_events_duration = {
				4.2797498703003,
				2.5004167556763,
				4.8511877059936,
				3.4627916812897
			}
		},
		pes_morris_snare_d_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_d_two_01",
				"pes_morris_snare_d_two_02",
				"pes_morris_snare_d_two_03",
				"pes_morris_snare_d_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_d_two_01",
				"pes_morris_snare_d_two_02",
				"pes_morris_snare_d_two_03",
				"pes_morris_snare_d_two_04"
			},
			sound_events_duration = {
				1.8044999837875,
				1.7897291183472,
				2.5070209503174,
				2.6900000572205
			}
		},
		pes_morris_snare_e_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_e_one_01",
				"pes_morris_snare_e_one_02",
				"pes_morris_snare_e_one_03",
				"pes_morris_snare_e_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_e_one_01",
				"pes_morris_snare_e_one_02",
				"pes_morris_snare_e_one_03",
				"pes_morris_snare_e_one_04"
			},
			sound_events_duration = {
				3.618145942688,
				4.8336248397827,
				4.1132497787476,
				2.0417082309723
			}
		},
		pes_morris_snare_e_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_e_three_01",
				"pes_morris_snare_e_three_02",
				"pes_morris_snare_e_three_03",
				"pes_morris_snare_e_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_e_three_01",
				"pes_morris_snare_e_three_02",
				"pes_morris_snare_e_three_03",
				"pes_morris_snare_e_three_04"
			},
			sound_events_duration = {
				3.3460624217987,
				3.2003126144409,
				2.9665625095367,
				2.5996041297913
			}
		},
		pes_morris_snare_e_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pes_morris_snare_e_two_01",
				"pes_morris_snare_e_two_02",
				"pes_morris_snare_e_two_03",
				"pes_morris_snare_e_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_snare_e_two_01",
				"pes_morris_snare_e_two_02",
				"pes_morris_snare_e_two_03",
				"pes_morris_snare_e_two_04"
			},
			sound_events_duration = {
				3.7310833930969,
				3.3808124065399,
				2.2851042747498,
				2.5631458759308
			}
		},
		pwe_morris_snare_a_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_a_one_01",
				"pwe_morris_snare_a_one_02",
				"pwe_morris_snare_a_one_03",
				"pwe_morris_snare_a_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_a_one_01",
				"pwe_morris_snare_a_one_02",
				"pwe_morris_snare_a_one_03",
				"pwe_morris_snare_a_one_04"
			},
			sound_events_duration = {
				3.7014374732971,
				2.8334791660309,
				4.781270980835,
				2.861270904541
			}
		},
		pwe_morris_snare_a_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_a_three_01",
				"pwe_morris_snare_a_three_02",
				"pwe_morris_snare_a_three_03",
				"pwe_morris_snare_a_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_a_three_01",
				"pwe_morris_snare_a_three_02",
				"pwe_morris_snare_a_three_03",
				"pwe_morris_snare_a_three_04"
			},
			sound_events_duration = {
				3.9555833339691,
				3.9978542327881,
				4.0793123245239,
				2.6784584522247
			}
		},
		pwe_morris_snare_a_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_a_two_01",
				"pwe_morris_snare_a_two_02",
				"pwe_morris_snare_a_two_03",
				"pwe_morris_snare_a_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_a_two_01",
				"pwe_morris_snare_a_two_02",
				"pwe_morris_snare_a_two_03",
				"pwe_morris_snare_a_two_04"
			},
			sound_events_duration = {
				4.0999999046326,
				3.6365833282471,
				2.7135000228882,
				5.0168747901917
			}
		},
		pwe_morris_snare_b_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_b_one_01",
				"pwe_morris_snare_b_one_02",
				"pwe_morris_snare_b_one_03",
				"pwe_morris_snare_b_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_b_one_01",
				"pwe_morris_snare_b_one_02",
				"pwe_morris_snare_b_one_03",
				"pwe_morris_snare_b_one_04"
			},
			sound_events_duration = {
				3.6183125972748,
				4.8743543624878,
				3.2655208110809,
				3.3134270906448
			}
		},
		pwe_morris_snare_b_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_b_three_01",
				"pwe_morris_snare_b_three_02",
				"pwe_morris_snare_b_three_03",
				"pwe_morris_snare_b_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_b_three_01",
				"pwe_morris_snare_b_three_02",
				"pwe_morris_snare_b_three_03",
				"pwe_morris_snare_b_three_04"
			},
			sound_events_duration = {
				3.5115208625794,
				3.5071249008179,
				4.4671459197998,
				6.5431456565857
			}
		},
		pwe_morris_snare_b_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_b_two_01",
				"pwe_morris_snare_b_two_02",
				"pwe_morris_snare_b_two_03",
				"pwe_morris_snare_b_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_b_two_01",
				"pwe_morris_snare_b_two_02",
				"pwe_morris_snare_b_two_03",
				"pwe_morris_snare_b_two_04"
			},
			sound_events_duration = {
				2.8766667842865,
				5.999041557312,
				3.5621666908264,
				2.9533751010895
			}
		},
		pwe_morris_snare_c_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_c_one_01",
				"pwe_morris_snare_c_one_02",
				"pwe_morris_snare_c_one_03",
				"pwe_morris_snare_c_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_c_one_01",
				"pwe_morris_snare_c_one_02",
				"pwe_morris_snare_c_one_03",
				"pwe_morris_snare_c_one_04"
			},
			sound_events_duration = {
				3.0499792098999,
				3.9524791240692,
				4.5487499237061,
				4.0220832824707
			}
		},
		pwe_morris_snare_c_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_c_three_01",
				"pwe_morris_snare_c_three_02",
				"pwe_morris_snare_c_three_03",
				"pwe_morris_snare_c_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_c_three_01",
				"pwe_morris_snare_c_three_02",
				"pwe_morris_snare_c_three_03",
				"pwe_morris_snare_c_three_04"
			},
			sound_events_duration = {
				3.3293540477753,
				3.3770000934601,
				8.4791040420532,
				4.0399374961853
			}
		},
		pwe_morris_snare_c_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_c_two_01",
				"pwe_morris_snare_c_two_02",
				"pwe_morris_snare_c_two_03",
				"pwe_morris_snare_c_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_c_two_01",
				"pwe_morris_snare_c_two_02",
				"pwe_morris_snare_c_two_03",
				"pwe_morris_snare_c_two_04"
			},
			sound_events_duration = {
				3.1575417518616,
				2.6061251163483,
				4.2202081680298,
				5.4234375953674
			}
		},
		pwe_morris_snare_d_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_d_one_01",
				"pwe_morris_snare_d_one_02",
				"pwe_morris_snare_d_one_03",
				"pwe_morris_snare_d_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_d_one_01",
				"pwe_morris_snare_d_one_02",
				"pwe_morris_snare_d_one_03",
				"pwe_morris_snare_d_one_04"
			},
			sound_events_duration = {
				2.9346041679382,
				1.6883541345596,
				3.8182709217072,
				4.2440414428711
			}
		},
		pwe_morris_snare_d_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_d_three_01",
				"pwe_morris_snare_d_three_02",
				"pwe_morris_snare_d_three_03",
				"pwe_morris_snare_d_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_d_three_01",
				"pwe_morris_snare_d_three_02",
				"pwe_morris_snare_d_three_03",
				"pwe_morris_snare_d_three_04"
			},
			sound_events_duration = {
				2.5538125038147,
				2.8793125152588,
				4.8914375305176,
				2.4645624160767
			}
		},
		pwe_morris_snare_d_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_d_two_01",
				"pwe_morris_snare_d_two_02",
				"pwe_morris_snare_d_two_03",
				"pwe_morris_snare_d_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_d_two_01",
				"pwe_morris_snare_d_two_02",
				"pwe_morris_snare_d_two_03",
				"pwe_morris_snare_d_two_04"
			},
			sound_events_duration = {
				4.2194790840149,
				3.4580833911896,
				4.0880417823792,
				3.4480624198914
			}
		},
		pwe_morris_snare_e_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_e_one_01",
				"pwe_morris_snare_e_one_02",
				"pwe_morris_snare_e_one_03",
				"pwe_morris_snare_e_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_e_one_01",
				"pwe_morris_snare_e_one_02",
				"pwe_morris_snare_e_one_03",
				"pwe_morris_snare_e_one_04"
			},
			sound_events_duration = {
				3.0381457805634,
				3.1955626010895,
				3.649270772934,
				3.1877708435059
			}
		},
		pwe_morris_snare_e_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_e_three_01",
				"pwe_morris_snare_e_three_02",
				"pwe_morris_snare_e_three_03",
				"pwe_morris_snare_e_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_e_three_01",
				"pwe_morris_snare_e_three_02",
				"pwe_morris_snare_e_three_03",
				"pwe_morris_snare_e_three_04"
			},
			sound_events_duration = {
				3.638750076294,
				2.425187587738,
				2.2507500648499,
				2.244083404541
			}
		},
		pwe_morris_snare_e_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwe_morris_snare_e_two_01",
				"pwe_morris_snare_e_two_02",
				"pwe_morris_snare_e_two_03",
				"pwe_morris_snare_e_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_snare_e_two_01",
				"pwe_morris_snare_e_two_02",
				"pwe_morris_snare_e_two_03",
				"pwe_morris_snare_e_two_04"
			},
			sound_events_duration = {
				3.926854133606,
				2.8329792022705,
				5.4416251182556,
				3.6326458454132
			}
		},
		pwh_morris_snare_a_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_a_one_01",
				"pwh_morris_snare_a_one_02",
				"pwh_morris_snare_a_one_03",
				"pwh_morris_snare_a_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_a_one_01",
				"pwh_morris_snare_a_one_02",
				"pwh_morris_snare_a_one_03",
				"pwh_morris_snare_a_one_04"
			},
			sound_events_duration = {
				3.1041042804718,
				1.9309791326523,
				2.3723957538605,
				4.0174374580383
			}
		},
		pwh_morris_snare_a_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_a_three_01",
				"pwh_morris_snare_a_three_02",
				"pwh_morris_snare_a_three_03",
				"pwh_morris_snare_a_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_a_three_01",
				"pwh_morris_snare_a_three_02",
				"pwh_morris_snare_a_three_03",
				"pwh_morris_snare_a_three_04"
			},
			sound_events_duration = {
				5.0240206718445,
				7.0778331756592,
				7.1196250915527,
				5.1000833511353
			}
		},
		pwh_morris_snare_a_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_a_two_01",
				"pwh_morris_snare_a_two_02",
				"pwh_morris_snare_a_two_03",
				"pwh_morris_snare_a_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_a_two_01",
				"pwh_morris_snare_a_two_02",
				"pwh_morris_snare_a_two_03",
				"pwh_morris_snare_a_two_04"
			},
			sound_events_duration = {
				4.2077083587647,
				4.062041759491,
				3.2309792041779,
				4.9859580993652
			}
		},
		pwh_morris_snare_b_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_b_one_01",
				"pwh_morris_snare_b_one_02",
				"pwh_morris_snare_b_one_03",
				"pwh_morris_snare_b_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_b_one_01",
				"pwh_morris_snare_b_one_02",
				"pwh_morris_snare_b_one_03",
				"pwh_morris_snare_b_one_04"
			},
			sound_events_duration = {
				4.0501251220703,
				5.9620623588562,
				4.1571664810181,
				4.1554374694824
			}
		},
		pwh_morris_snare_b_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_b_three_01",
				"pwh_morris_snare_b_three_02",
				"pwh_morris_snare_b_three_03",
				"pwh_morris_snare_b_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_b_three_01",
				"pwh_morris_snare_b_three_02",
				"pwh_morris_snare_b_three_03",
				"pwh_morris_snare_b_three_04"
			},
			sound_events_duration = {
				2.7732915878296,
				6.670937538147,
				2.0914375782013,
				4.5323333740234
			}
		},
		pwh_morris_snare_b_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_b_two_01",
				"pwh_morris_snare_b_two_02",
				"pwh_morris_snare_b_two_03",
				"pwh_morris_snare_b_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_b_two_01",
				"pwh_morris_snare_b_two_02",
				"pwh_morris_snare_b_two_03",
				"pwh_morris_snare_b_two_04"
			},
			sound_events_duration = {
				5.4986457824707,
				4.260645866394,
				4.9110832214356,
				4.0048542022705
			}
		},
		pwh_morris_snare_c_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_c_one_01",
				"pwh_morris_snare_c_one_02",
				"pwh_morris_snare_c_one_03",
				"pwh_morris_snare_c_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_c_one_01",
				"pwh_morris_snare_c_one_02",
				"pwh_morris_snare_c_one_03",
				"pwh_morris_snare_c_one_04"
			},
			sound_events_duration = {
				3.9826250076294,
				3.9428124427795,
				3.7470207214356,
				3.7686667442322
			}
		},
		pwh_morris_snare_c_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_c_three_01",
				"pwh_morris_snare_c_three_02",
				"pwh_morris_snare_c_three_03",
				"pwh_morris_snare_c_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_c_three_01",
				"pwh_morris_snare_c_three_02",
				"pwh_morris_snare_c_three_03",
				"pwh_morris_snare_c_three_04"
			},
			sound_events_duration = {
				3.9546041488648,
				4.9341249465942,
				2.3615207672119,
				5.603479385376
			}
		},
		pwh_morris_snare_c_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_c_two_01",
				"pwh_morris_snare_c_two_02",
				"pwh_morris_snare_c_two_03",
				"pwh_morris_snare_c_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_c_two_01",
				"pwh_morris_snare_c_two_02",
				"pwh_morris_snare_c_two_03",
				"pwh_morris_snare_c_two_04"
			},
			sound_events_duration = {
				2.982958316803,
				5.2521877288818,
				3.9792499542236,
				3.3161458969116
			}
		},
		pwh_morris_snare_d_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_d_one_01",
				"pwh_morris_snare_d_one_02",
				"pwh_morris_snare_d_one_03",
				"pwh_morris_snare_d_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_d_one_01",
				"pwh_morris_snare_d_one_02",
				"pwh_morris_snare_d_one_03",
				"pwh_morris_snare_d_one_04"
			},
			sound_events_duration = {
				3.9150624275208,
				4.2763957977295,
				5.3873543739319,
				3.1618542671204
			}
		},
		pwh_morris_snare_d_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_d_three_01",
				"pwh_morris_snare_d_three_02",
				"pwh_morris_snare_d_three_03",
				"pwh_morris_snare_d_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_d_three_01",
				"pwh_morris_snare_d_three_02",
				"pwh_morris_snare_d_three_03",
				"pwh_morris_snare_d_three_04"
			},
			sound_events_duration = {
				5.3635625839233,
				4.0131459236145,
				4.8117289543152,
				2.9452917575836
			}
		},
		pwh_morris_snare_d_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_d_two_01",
				"pwh_morris_snare_d_two_02",
				"pwh_morris_snare_d_two_03",
				"pwh_morris_snare_d_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_d_two_01",
				"pwh_morris_snare_d_two_02",
				"pwh_morris_snare_d_two_03",
				"pwh_morris_snare_d_two_04"
			},
			sound_events_duration = {
				4.8372082710266,
				2.2570624351502,
				3.3159999847412,
				3.3280625343323
			}
		},
		pwh_morris_snare_e_one = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_e_one_01",
				"pwh_morris_snare_e_one_02",
				"pwh_morris_snare_e_one_03",
				"pwh_morris_snare_e_one_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_e_one_01",
				"pwh_morris_snare_e_one_02",
				"pwh_morris_snare_e_one_03",
				"pwh_morris_snare_e_one_04"
			},
			sound_events_duration = {
				2.2703125476837,
				1.6412291526794,
				3.734854221344,
				4.2171669006348
			}
		},
		pwh_morris_snare_e_three = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_e_three_01",
				"pwh_morris_snare_e_three_02",
				"pwh_morris_snare_e_three_03",
				"pwh_morris_snare_e_three_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_e_three_01",
				"pwh_morris_snare_e_three_02",
				"pwh_morris_snare_e_three_03",
				"pwh_morris_snare_e_three_04"
			},
			sound_events_duration = {
				2.7903542518616,
				4.3954792022705,
				4.8789792060852,
				2.6651875972748
			}
		},
		pwh_morris_snare_e_two = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_snare",
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
				"pwh_morris_snare_e_two_01",
				"pwh_morris_snare_e_two_02",
				"pwh_morris_snare_e_two_03",
				"pwh_morris_snare_e_two_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_snare_e_two_01",
				"pwh_morris_snare_e_two_02",
				"pwh_morris_snare_e_two_03",
				"pwh_morris_snare_e_two_04"
			},
			sound_events_duration = {
				4.2066249847412,
				2.9621665477753,
				6.6232500076294,
				2.6474165916443
			}
		}
	})
end
