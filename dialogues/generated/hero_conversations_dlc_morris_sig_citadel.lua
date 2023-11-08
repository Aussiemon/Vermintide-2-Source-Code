return function ()
	define_rule({
		name = "pbw_morris_citadel_fall",
		response = "pbw_morris_citadel_fall",
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
				"sig_citadel_fall"
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
				"pbw_morris_citadel_fall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_citadel_fall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_citadel_gateway",
		response = "pbw_morris_citadel_gateway",
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
				"sig_citadel_gateway"
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
				"pbw_morris_citadel_gateway",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_citadel_gateway",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_citadel_offering",
		response = "pbw_morris_citadel_offering",
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
				"sig_citadel_offering"
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
				"pbw_morris_citadel_offering",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_citadel_offering",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_citadel_second_vista",
		response = "pbw_morris_citadel_second_vista",
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
				"sig_citadel_second_vista"
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
				"pbw_morris_citadel_second_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_citadel_second_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_citadel_third_vista",
		response = "pbw_morris_citadel_third_vista",
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
				"sig_citadel_third_vista"
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
				"pbw_morris_citadel_third_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_citadel_third_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_citadel_throne",
		response = "pbw_morris_citadel_throne",
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
				"sig_citadel_throne"
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
				"pbw_morris_citadel_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_citadel_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_citadel_vista",
		response = "pbw_morris_citadel_vista",
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
				"sig_citadel_vista"
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
				"pbw_morris_citadel_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_citadel_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_citadel_fall",
		response = "pdr_morris_citadel_fall",
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
				"sig_citadel_fall"
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
				"pdr_morris_citadel_fall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_citadel_fall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_citadel_gateway",
		response = "pdr_morris_citadel_gateway",
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
				"sig_citadel_gateway"
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
				"pdr_morris_citadel_gateway",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_citadel_gateway",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_citadel_offering",
		response = "pdr_morris_citadel_offering",
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
				"sig_citadel_offering"
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
				"pdr_morris_citadel_offering",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_citadel_offering",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_citadel_second_vista",
		response = "pdr_morris_citadel_second_vista",
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
				"sig_citadel_second_vista"
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
				"pdr_morris_citadel_second_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_citadel_second_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_citadel_third_vista",
		response = "pdr_morris_citadel_third_vista",
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
				"sig_citadel_third_vista"
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
				"pdr_morris_citadel_third_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_citadel_third_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_citadel_throne",
		response = "pdr_morris_citadel_throne",
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
				"sig_citadel_throne"
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
				"pdr_morris_citadel_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_citadel_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_citadel_vista",
		response = "pdr_morris_citadel_vista",
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
				"sig_citadel_vista"
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
				"pdr_morris_citadel_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_citadel_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_citadel_fall",
		response = "pes_morris_citadel_fall",
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
				"sig_citadel_fall"
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
				"pes_morris_citadel_fall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_citadel_fall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_citadel_gateway",
		response = "pes_morris_citadel_gateway",
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
				"sig_citadel_gateway"
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
				"pes_morris_citadel_gateway",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_citadel_gateway",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_citadel_offering",
		response = "pes_morris_citadel_offering",
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
				"sig_citadel_offering"
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
				"pes_morris_citadel_offering",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_citadel_offering",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_citadel_second_vista",
		response = "pes_morris_citadel_second_vista",
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
				"sig_citadel_second_vista"
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
				"pes_morris_citadel_second_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_citadel_second_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_citadel_third_vista",
		response = "pes_morris_citadel_third_vista",
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
				"sig_citadel_third_vista"
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
				"pes_morris_citadel_third_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_citadel_third_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_citadel_throne",
		response = "pes_morris_citadel_throne",
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
				"sig_citadel_throne"
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
				"pes_morris_citadel_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_citadel_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_citadel_vista",
		response = "pes_morris_citadel_vista",
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
				"sig_citadel_vista"
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
				"pes_morris_citadel_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_citadel_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_citadel_fall",
		response = "pwe_morris_citadel_fall",
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
				"sig_citadel_fall"
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
				"pwe_morris_citadel_fall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_citadel_fall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_citadel_gateway",
		response = "pwe_morris_citadel_gateway",
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
				"sig_citadel_gateway"
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
				"pwe_morris_citadel_gateway",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_citadel_gateway",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_citadel_offering",
		response = "pwe_morris_citadel_offering",
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
				"sig_citadel_offering"
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
				"pwe_morris_citadel_offering",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_citadel_offering",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_citadel_second_vista",
		response = "pwe_morris_citadel_second_vista",
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
				"sig_citadel_second_vista"
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
				"pwe_morris_citadel_second_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_citadel_second_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_citadel_third_vista",
		response = "pwe_morris_citadel_third_vista",
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
				"sig_citadel_third_vista"
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
				"pwe_morris_citadel_third_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_citadel_third_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_citadel_throne",
		response = "pwe_morris_citadel_throne",
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
				"sig_citadel_throne"
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
				"pwe_morris_citadel_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_citadel_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_citadel_vista",
		response = "pwe_morris_citadel_vista",
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
				"sig_citadel_vista"
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
				"pwe_morris_citadel_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_citadel_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_citadel_fall",
		response = "pwh_morris_citadel_fall",
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
				"sig_citadel_fall"
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
				"pwh_morris_citadel_fall",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_citadel_fall",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_citadel_gateway",
		response = "pwh_morris_citadel_gateway",
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
				"sig_citadel_gateway"
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
				"pwh_morris_citadel_gateway",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_citadel_gateway",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_citadel_offering",
		response = "pwh_morris_citadel_offering",
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
				"sig_citadel_offering"
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
				"pwh_morris_citadel_offering",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_citadel_offering",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_citadel_second_vista",
		response = "pwh_morris_citadel_second_vista",
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
				"sig_citadel_second_vista"
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
				"pwh_morris_citadel_second_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_citadel_second_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_citadel_third_vista",
		response = "pwh_morris_citadel_third_vista",
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
				"sig_citadel_third_vista"
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
				"pwh_morris_citadel_third_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_citadel_third_vista",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_citadel_throne",
		response = "pwh_morris_citadel_throne",
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
				"sig_citadel_throne"
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
				"pwh_morris_citadel_throne",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_citadel_throne",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_citadel_vista",
		response = "pwh_morris_citadel_vista",
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
				"sig_citadel_vista"
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
				"pwh_morris_citadel_vista",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_citadel_vista",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_citadel_fall = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pbw_morris_citadel_fall_01",
				"pbw_morris_citadel_fall_02",
				"pbw_morris_citadel_fall_03",
				"pbw_morris_citadel_fall_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_citadel_fall_01",
				"pbw_morris_citadel_fall_02",
				"pbw_morris_citadel_fall_03",
				"pbw_morris_citadel_fall_04"
			},
			sound_events_duration = {
				2.893458366394,
				3.4973332881927,
				1.7737708091736,
				1.5533541440964
			}
		},
		pbw_morris_citadel_gateway = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pbw_morris_citadel_gateway_01",
				"pbw_morris_citadel_gateway_02",
				"pbw_morris_citadel_gateway_03",
				"pbw_morris_citadel_gateway_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_citadel_gateway_01",
				"pbw_morris_citadel_gateway_02",
				"pbw_morris_citadel_gateway_03",
				"pbw_morris_citadel_gateway_04"
			},
			sound_events_duration = {
				1.5424791574478,
				2.914999961853,
				2.8278958797455,
				2.5039792060852
			}
		},
		pbw_morris_citadel_offering = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pbw_morris_citadel_offering_01",
				"pbw_morris_citadel_offering_02",
				"pbw_morris_citadel_offering_03",
				"pbw_morris_citadel_offering_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_citadel_offering_01",
				"pbw_morris_citadel_offering_02",
				"pbw_morris_citadel_offering_03",
				"pbw_morris_citadel_offering_04"
			},
			sound_events_duration = {
				2.3131666183472,
				2.9096040725708,
				2.9422500133514,
				2.9578332901001
			}
		},
		pbw_morris_citadel_second_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pbw_morris_citadel_second_vista_01",
				"pbw_morris_citadel_second_vista_02",
				"pbw_morris_citadel_second_vista_03",
				"pbw_morris_citadel_second_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_citadel_second_vista_01",
				"pbw_morris_citadel_second_vista_02",
				"pbw_morris_citadel_second_vista_03",
				"pbw_morris_citadel_second_vista_04"
			},
			sound_events_duration = {
				3.2216665744781,
				1.9245624542236,
				3.0844583511352,
				2.7957916259766
			}
		},
		pbw_morris_citadel_third_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pbw_morris_citadel_third_vista_01",
				"pbw_morris_citadel_third_vista_02",
				"pbw_morris_citadel_third_vista_03",
				"pbw_morris_citadel_third_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_citadel_third_vista_01",
				"pbw_morris_citadel_third_vista_02",
				"pbw_morris_citadel_third_vista_03",
				"pbw_morris_citadel_third_vista_04"
			},
			sound_events_duration = {
				4.4811873435974,
				1.7776875495911,
				3.6931457519531,
				4.2291460037231
			}
		},
		pbw_morris_citadel_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pbw_morris_citadel_throne_01",
				"pbw_morris_citadel_throne_02",
				"pbw_morris_citadel_throne_03",
				"pbw_morris_citadel_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_citadel_throne_01",
				"pbw_morris_citadel_throne_02",
				"pbw_morris_citadel_throne_03",
				"pbw_morris_citadel_throne_04"
			},
			sound_events_duration = {
				2.4405624866486,
				3.4866459369659,
				3.2358748912811,
				4.8761248588562
			}
		},
		pbw_morris_citadel_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pbw_morris_citadel_vista_01",
				"pbw_morris_citadel_vista_02",
				"pbw_morris_citadel_vista_03",
				"pbw_morris_citadel_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_citadel_vista_01",
				"pbw_morris_citadel_vista_02",
				"pbw_morris_citadel_vista_03",
				"pbw_morris_citadel_vista_04"
			},
			sound_events_duration = {
				1.4418333768845,
				2.388375043869,
				3.6622083187103,
				3.3374791145325
			}
		},
		pdr_morris_citadel_fall = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pdr_morris_citadel_fall_01",
				"pdr_morris_citadel_fall_02",
				"pdr_morris_citadel_fall_03",
				"pdr_morris_citadel_fall_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_citadel_fall_01",
				"pdr_morris_citadel_fall_02",
				"pdr_morris_citadel_fall_03",
				"pdr_morris_citadel_fall_04"
			},
			sound_events_duration = {
				2.2617707252502,
				3.5586667060852,
				3.5428540706634,
				3.2038958072662
			}
		},
		pdr_morris_citadel_gateway = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pdr_morris_citadel_gateway_01",
				"pdr_morris_citadel_gateway_02",
				"pdr_morris_citadel_gateway_03",
				"pdr_morris_citadel_gateway_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_citadel_gateway_01",
				"pdr_morris_citadel_gateway_02",
				"pdr_morris_citadel_gateway_03",
				"pdr_morris_citadel_gateway_04"
			},
			sound_events_duration = {
				2.9549584388733,
				3.0220625400543,
				4.2091460227966,
				6.390604019165
			}
		},
		pdr_morris_citadel_offering = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pdr_morris_citadel_offering_01",
				"pdr_morris_citadel_offering_02",
				"pdr_morris_citadel_offering_03",
				"pdr_morris_citadel_offering_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_citadel_offering_01",
				"pdr_morris_citadel_offering_02",
				"pdr_morris_citadel_offering_03",
				"pdr_morris_citadel_offering_04"
			},
			sound_events_duration = {
				4.2550415992737,
				3.496687412262,
				6.6773543357849,
				3.7171874046326
			}
		},
		pdr_morris_citadel_second_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pdr_morris_citadel_second_vista_01",
				"pdr_morris_citadel_second_vista_02",
				"pdr_morris_citadel_second_vista_03",
				"pdr_morris_citadel_second_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_citadel_second_vista_01",
				"pdr_morris_citadel_second_vista_02",
				"pdr_morris_citadel_second_vista_03",
				"pdr_morris_citadel_second_vista_04"
			},
			sound_events_duration = {
				2.5407083034515,
				7.5266041755676,
				5.6359376907349,
				2.7862708568573
			}
		},
		pdr_morris_citadel_third_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pdr_morris_citadel_third_vista_01",
				"pdr_morris_citadel_third_vista_02",
				"pdr_morris_citadel_third_vista_03",
				"pdr_morris_citadel_third_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_citadel_third_vista_01",
				"pdr_morris_citadel_third_vista_02",
				"pdr_morris_citadel_third_vista_03",
				"pdr_morris_citadel_third_vista_04"
			},
			sound_events_duration = {
				4.3532710075378,
				5.046374797821,
				2.8210000991821,
				3.2043957710266
			}
		},
		pdr_morris_citadel_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pdr_morris_citadel_throne_01",
				"pdr_morris_citadel_throne_02",
				"pdr_morris_citadel_throne_03",
				"pdr_morris_citadel_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_citadel_throne_01",
				"pdr_morris_citadel_throne_02",
				"pdr_morris_citadel_throne_03",
				"pdr_morris_citadel_throne_04"
			},
			sound_events_duration = {
				1.9995000362396,
				2.4885416030884,
				3.0573749542236,
				4.5877499580383
			}
		},
		pdr_morris_citadel_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pdr_morris_citadel_vista_01",
				"pdr_morris_citadel_vista_02",
				"pdr_morris_citadel_vista_03",
				"pdr_morris_citadel_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_citadel_vista_01",
				"pdr_morris_citadel_vista_02",
				"pdr_morris_citadel_vista_03",
				"pdr_morris_citadel_vista_04"
			},
			sound_events_duration = {
				2.7532498836517,
				3.3105626106262,
				2.5182917118073,
				3.5678541660309
			}
		},
		pes_morris_citadel_fall = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pes_morris_citadel_fall_01",
				"pes_morris_citadel_fall_02",
				"pes_morris_citadel_fall_03",
				"pes_morris_citadel_fall_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_citadel_fall_01",
				"pes_morris_citadel_fall_02",
				"pes_morris_citadel_fall_03",
				"pes_morris_citadel_fall_04"
			},
			sound_events_duration = {
				1.5712708234787,
				2.9620625972748,
				2.3250625133514,
				1.6251250505447
			}
		},
		pes_morris_citadel_gateway = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pes_morris_citadel_gateway_01",
				"pes_morris_citadel_gateway_02",
				"pes_morris_citadel_gateway_03",
				"pes_morris_citadel_gateway_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_citadel_gateway_01",
				"pes_morris_citadel_gateway_02",
				"pes_morris_citadel_gateway_03",
				"pes_morris_citadel_gateway_04"
			},
			sound_events_duration = {
				2.2532708644867,
				2.1280417442322,
				1.8837916851044,
				1.8651666641235
			}
		},
		pes_morris_citadel_offering = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pes_morris_citadel_offering_01",
				"pes_morris_citadel_offering_02",
				"pes_morris_citadel_offering_03",
				"pes_morris_citadel_offering_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_citadel_offering_01",
				"pes_morris_citadel_offering_02",
				"pes_morris_citadel_offering_03",
				"pes_morris_citadel_offering_04"
			},
			sound_events_duration = {
				1.2013541460037,
				3.0720207691193,
				2.1641249656677,
				4.8805832862854
			}
		},
		pes_morris_citadel_second_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pes_morris_citadel_second_vista_01",
				"pes_morris_citadel_second_vista_02",
				"pes_morris_citadel_second_vista_03",
				"pes_morris_citadel_second_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_citadel_second_vista_01",
				"pes_morris_citadel_second_vista_02",
				"pes_morris_citadel_second_vista_03",
				"pes_morris_citadel_second_vista_04"
			},
			sound_events_duration = {
				1.6303958892822,
				4.2745208740234,
				2.7226042747498,
				3.9667499065399
			}
		},
		pes_morris_citadel_third_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pes_morris_citadel_third_vista_01",
				"pes_morris_citadel_third_vista_02",
				"pes_morris_citadel_third_vista_03",
				"pes_morris_citadel_third_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_citadel_third_vista_01",
				"pes_morris_citadel_third_vista_02",
				"pes_morris_citadel_third_vista_03",
				"pes_morris_citadel_third_vista_04"
			},
			sound_events_duration = {
				2.441999912262,
				2.4892082214356,
				4.0852708816528,
				3.931562423706
			}
		},
		pes_morris_citadel_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pes_morris_citadel_throne_01",
				"pes_morris_citadel_throne_02",
				"pes_morris_citadel_throne_03",
				"pes_morris_citadel_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_citadel_throne_01",
				"pes_morris_citadel_throne_02",
				"pes_morris_citadel_throne_03",
				"pes_morris_citadel_throne_04"
			},
			sound_events_duration = {
				2.267520904541,
				2.5525624752045,
				4.6092915534973,
				2.9774792194366
			}
		},
		pes_morris_citadel_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pes_morris_citadel_vista_01",
				"pes_morris_citadel_vista_02",
				"pes_morris_citadel_vista_03",
				"pes_morris_citadel_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_citadel_vista_01",
				"pes_morris_citadel_vista_02",
				"pes_morris_citadel_vista_03",
				"pes_morris_citadel_vista_04"
			},
			sound_events_duration = {
				3.3244376182556,
				3.7515625953674,
				3.0254375934601,
				5.5057082176208
			}
		},
		pwe_morris_citadel_fall = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwe_morris_citadel_fall_01",
				"pwe_morris_citadel_fall_02",
				"pwe_morris_citadel_fall_03",
				"pwe_morris_citadel_fall_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_citadel_fall_01",
				"pwe_morris_citadel_fall_02",
				"pwe_morris_citadel_fall_03",
				"pwe_morris_citadel_fall_04"
			},
			sound_events_duration = {
				3.2765417098999,
				4.4603748321533,
				3.3159061670303,
				3.741229057312
			}
		},
		pwe_morris_citadel_gateway = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwe_morris_citadel_gateway_01",
				"pwe_morris_citadel_gateway_02",
				"pwe_morris_citadel_gateway_03",
				"pwe_morris_citadel_gateway_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_citadel_gateway_01",
				"pwe_morris_citadel_gateway_02",
				"pwe_morris_citadel_gateway_03",
				"pwe_morris_citadel_gateway_04"
			},
			sound_events_duration = {
				3.2853124141693,
				2.7818334102631,
				4.0611042976379,
				2.3489167690277
			}
		},
		pwe_morris_citadel_offering = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwe_morris_citadel_offering_01",
				"pwe_morris_citadel_offering_02",
				"pwe_morris_citadel_offering_03",
				"pwe_morris_citadel_offering_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_citadel_offering_01",
				"pwe_morris_citadel_offering_02",
				"pwe_morris_citadel_offering_03",
				"pwe_morris_citadel_offering_04"
			},
			sound_events_duration = {
				2.9140625,
				1.4439791440964,
				2.3687083721161,
				3.0544687509537
			}
		},
		pwe_morris_citadel_second_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwe_morris_citadel_second_vista_01",
				"pwe_morris_citadel_second_vista_02",
				"pwe_morris_citadel_second_vista_03",
				"pwe_morris_citadel_second_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_citadel_second_vista_01",
				"pwe_morris_citadel_second_vista_02",
				"pwe_morris_citadel_second_vista_03",
				"pwe_morris_citadel_second_vista_04"
			},
			sound_events_duration = {
				1.7063125371933,
				2.7266249656677,
				2.2109999656677,
				5.4387917518616
			}
		},
		pwe_morris_citadel_third_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwe_morris_citadel_third_vista_01",
				"pwe_morris_citadel_third_vista_02",
				"pwe_morris_citadel_third_vista_03",
				"pwe_morris_citadel_third_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_citadel_third_vista_01",
				"pwe_morris_citadel_third_vista_02",
				"pwe_morris_citadel_third_vista_03",
				"pwe_morris_citadel_third_vista_04"
			},
			sound_events_duration = {
				4.2213540077209,
				2.0832917690277,
				2.9124166965485,
				2.4686875343323
			}
		},
		pwe_morris_citadel_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwe_morris_citadel_throne_01",
				"pwe_morris_citadel_throne_02",
				"pwe_morris_citadel_throne_03",
				"pwe_morris_citadel_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_citadel_throne_01",
				"pwe_morris_citadel_throne_02",
				"pwe_morris_citadel_throne_03",
				"pwe_morris_citadel_throne_04"
			},
			sound_events_duration = {
				2.7933125495911,
				2.2940626144409,
				4.2903122901917,
				2.9468541145325
			}
		},
		pwe_morris_citadel_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwe_morris_citadel_vista_01",
				"pwe_morris_citadel_vista_02",
				"pwe_morris_citadel_vista_03",
				"pwe_morris_citadel_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_citadel_vista_01",
				"pwe_morris_citadel_vista_02",
				"pwe_morris_citadel_vista_03",
				"pwe_morris_citadel_vista_04"
			},
			sound_events_duration = {
				2.5262498855591,
				2.0217499732971,
				3.4388542175293,
				2.2118332386017
			}
		},
		pwh_morris_citadel_fall = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwh_morris_citadel_fall_01",
				"pwh_morris_citadel_fall_02",
				"pwh_morris_citadel_fall_03",
				"pwh_morris_citadel_fall_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_citadel_fall_01",
				"pwh_morris_citadel_fall_02",
				"pwh_morris_citadel_fall_03",
				"pwh_morris_citadel_fall_04"
			},
			sound_events_duration = {
				5.0560417175293,
				5.0407710075378,
				3.4584374427795,
				2.5240833759308
			}
		},
		pwh_morris_citadel_gateway = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwh_morris_citadel_gateway_01",
				"pwh_morris_citadel_gateway_02",
				"pwh_morris_citadel_gateway_03",
				"pwh_morris_citadel_gateway_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_citadel_gateway_01",
				"pwh_morris_citadel_gateway_02",
				"pwh_morris_citadel_gateway_03",
				"pwh_morris_citadel_gateway_04"
			},
			sound_events_duration = {
				5.6095418930054,
				7.054666519165,
				2.8204791545868,
				3.8022499084473
			}
		},
		pwh_morris_citadel_offering = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwh_morris_citadel_offering_01",
				"pwh_morris_citadel_offering_02",
				"pwh_morris_citadel_offering_03",
				"pwh_morris_citadel_offering_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_citadel_offering_01",
				"pwh_morris_citadel_offering_02",
				"pwh_morris_citadel_offering_03",
				"pwh_morris_citadel_offering_04"
			},
			sound_events_duration = {
				2.2743542194366,
				4.6277709007263,
				3.6823542118073,
				3.5818541049957
			}
		},
		pwh_morris_citadel_second_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwh_morris_citadel_second_vista_01",
				"pwh_morris_citadel_second_vista_02",
				"pwh_morris_citadel_second_vista_03",
				"pwh_morris_citadel_second_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_citadel_second_vista_01",
				"pwh_morris_citadel_second_vista_02",
				"pwh_morris_citadel_second_vista_03",
				"pwh_morris_citadel_second_vista_04"
			},
			sound_events_duration = {
				3.8583958148956,
				5.7999792098999,
				3.5166666507721,
				2.996687412262
			}
		},
		pwh_morris_citadel_third_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwh_morris_citadel_third_vista_01",
				"pwh_morris_citadel_third_vista_02",
				"pwh_morris_citadel_third_vista_03",
				"pwh_morris_citadel_third_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_citadel_third_vista_01",
				"pwh_morris_citadel_third_vista_02",
				"pwh_morris_citadel_third_vista_03",
				"pwh_morris_citadel_third_vista_04"
			},
			sound_events_duration = {
				4.5555834770203,
				5.8671875,
				5.0467915534973,
				6.5654582977295
			}
		},
		pwh_morris_citadel_throne = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwh_morris_citadel_throne_01",
				"pwh_morris_citadel_throne_02",
				"pwh_morris_citadel_throne_03",
				"pwh_morris_citadel_throne_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_citadel_throne_01",
				"pwh_morris_citadel_throne_02",
				"pwh_morris_citadel_throne_03",
				"pwh_morris_citadel_throne_04"
			},
			sound_events_duration = {
				3.9078125953674,
				5.2335414886475,
				4.3746252059936,
				5.0415000915527
			}
		},
		pwh_morris_citadel_vista = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_citadel",
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
				"pwh_morris_citadel_vista_01",
				"pwh_morris_citadel_vista_02",
				"pwh_morris_citadel_vista_03",
				"pwh_morris_citadel_vista_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_citadel_vista_01",
				"pwh_morris_citadel_vista_02",
				"pwh_morris_citadel_vista_03",
				"pwh_morris_citadel_vista_04"
			},
			sound_events_duration = {
				4.5717916488647,
				2.1956458091736,
				2.4146249294281,
				3.8738958835602
			}
		}
	})
end
