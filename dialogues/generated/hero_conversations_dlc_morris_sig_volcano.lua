return function ()
	define_rule({
		name = "pbw_morris_volcano_face",
		response = "pbw_morris_volcano_face",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_face"
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
				"pbw_morris_volcano_face",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_volcano_face",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_volcano_fortress",
		response = "pbw_morris_volcano_fortress",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_fortress"
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
				"pbw_morris_volcano_fortress",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_volcano_fortress",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_volcano_glacier",
		response = "pbw_morris_volcano_glacier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_glacier"
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
				"pbw_morris_volcano_glacier",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_volcano_glacier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_volcano_ice_fire",
		response = "pbw_morris_volcano_ice_fire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_ice_fire"
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
				"pbw_morris_volcano_ice_fire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_volcano_ice_fire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_volcano_lava",
		response = "pbw_morris_volcano_lava",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_lava"
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
				"pbw_morris_volcano_lava",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_volcano_lava",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_volcano_outpost",
		response = "pbw_morris_volcano_outpost",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_outpost"
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
				"pbw_morris_volcano_outpost",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_volcano_outpost",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_volcano_settlement",
		response = "pbw_morris_volcano_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_settlement"
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
				"pbw_morris_volcano_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_volcano_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_volcano_face",
		response = "pdr_morris_volcano_face",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_face"
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
				"pdr_morris_volcano_face",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_volcano_face",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_volcano_fortress",
		response = "pdr_morris_volcano_fortress",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_fortress"
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
				"pdr_morris_volcano_fortress",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_volcano_fortress",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_volcano_glacier",
		response = "pdr_morris_volcano_glacier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_glacier"
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
				"pdr_morris_volcano_glacier",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_volcano_glacier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_volcano_ice_fire",
		response = "pdr_morris_volcano_ice_fire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_ice_fire"
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
				"pdr_morris_volcano_ice_fire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_volcano_ice_fire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_volcano_lava",
		response = "pdr_morris_volcano_lava",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_lava"
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
				"pdr_morris_volcano_lava",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_volcano_lava",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_volcano_outpost",
		response = "pdr_morris_volcano_outpost",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_outpost"
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
				"pdr_morris_volcano_outpost",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_volcano_outpost",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_volcano_settlement",
		response = "pdr_morris_volcano_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_settlement"
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
				"pdr_morris_volcano_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_volcano_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_volcano_face",
		response = "pes_morris_volcano_face",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_face"
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
				"pes_morris_volcano_face",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_volcano_face",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_volcano_fortress",
		response = "pes_morris_volcano_fortress",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_fortress"
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
				"pes_morris_volcano_fortress",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_volcano_fortress",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_volcano_glacier",
		response = "pes_morris_volcano_glacier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_glacier"
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
				"pes_morris_volcano_glacier",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_volcano_glacier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_volcano_ice_fire",
		response = "pes_morris_volcano_ice_fire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_ice_fire"
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
				"pes_morris_volcano_ice_fire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_volcano_ice_fire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_volcano_lava",
		response = "pes_morris_volcano_lava",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_lava"
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
				"pes_morris_volcano_lava",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_volcano_lava",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_volcano_outpost",
		response = "pes_morris_volcano_outpost",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_outpost"
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
				"pes_morris_volcano_outpost",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_volcano_outpost",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_volcano_settlement",
		response = "pes_morris_volcano_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_settlement"
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
				"pes_morris_volcano_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_volcano_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_volcano_face",
		response = "pwe_morris_volcano_face",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_face"
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
				"pwe_morris_volcano_face",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_volcano_face",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_volcano_fortress",
		response = "pwe_morris_volcano_fortress",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_fortress"
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
				"pwe_morris_volcano_fortress",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_volcano_fortress",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_volcano_glacier",
		response = "pwe_morris_volcano_glacier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_glacier"
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
				"pwe_morris_volcano_glacier",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_volcano_glacier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_volcano_ice_fire",
		response = "pwe_morris_volcano_ice_fire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_ice_fire"
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
				"pwe_morris_volcano_ice_fire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_volcano_ice_fire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_volcano_lava",
		response = "pwe_morris_volcano_lava",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_lava"
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
				"pwe_morris_volcano_lava",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_volcano_lava",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_volcano_outpost",
		response = "pwe_morris_volcano_outpost",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_outpost"
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
				"pwe_morris_volcano_outpost",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_volcano_outpost",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_volcano_settlement",
		response = "pwe_morris_volcano_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_settlement"
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
				"pwe_morris_volcano_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_volcano_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_volcano_face",
		response = "pwh_morris_volcano_face",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_face"
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
				"pwh_morris_volcano_face",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_volcano_face",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_volcano_fortress",
		response = "pwh_morris_volcano_fortress",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_fortress"
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
				"pwh_morris_volcano_fortress",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_volcano_fortress",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_volcano_glacier",
		response = "pwh_morris_volcano_glacier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_glacier"
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
				"pwh_morris_volcano_glacier",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_volcano_glacier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_volcano_ice_fire",
		response = "pwh_morris_volcano_ice_fire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_ice_fire"
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
				"pwh_morris_volcano_ice_fire",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_volcano_ice_fire",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_volcano_lava",
		response = "pwh_morris_volcano_lava",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_lava"
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
				"pwh_morris_volcano_lava",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_volcano_lava",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_volcano_outpost",
		response = "pwh_morris_volcano_outpost",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_outpost"
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
				"pwh_morris_volcano_outpost",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_volcano_outpost",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_volcano_settlement",
		response = "pwh_morris_volcano_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_volcano_settlement"
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
				"pwh_morris_volcano_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_volcano_settlement",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_volcano_face = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pbw_morris_volcano_face_01",
				"pbw_morris_volcano_face_02",
				"pbw_morris_volcano_face_03",
				"pbw_morris_volcano_face_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_volcano_face_01",
				"pbw_morris_volcano_face_02",
				"pbw_morris_volcano_face_03",
				"pbw_morris_volcano_face_04"
			},
			sound_events_duration = {
				3.1570415496826,
				3.1538124084473,
				4.9812917709351,
				1.8689583539963
			}
		},
		pbw_morris_volcano_fortress = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pbw_morris_volcano_fortress_01",
				"pbw_morris_volcano_fortress_02",
				"pbw_morris_volcano_fortress_03",
				"pbw_morris_volcano_fortress_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_volcano_fortress_01",
				"pbw_morris_volcano_fortress_02",
				"pbw_morris_volcano_fortress_03",
				"pbw_morris_volcano_fortress_04"
			},
			sound_events_duration = {
				5.9139585494995,
				4.6128540039063,
				3.0610001087189,
				3.0833125114441
			}
		},
		pbw_morris_volcano_glacier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pbw_morris_volcano_glacier_01",
				"pbw_morris_volcano_glacier_02",
				"pbw_morris_volcano_glacier_03",
				"pbw_morris_volcano_glacier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_volcano_glacier_01",
				"pbw_morris_volcano_glacier_02",
				"pbw_morris_volcano_glacier_03",
				"pbw_morris_volcano_glacier_04"
			},
			sound_events_duration = {
				1.9266041517258,
				3.0480000972748,
				5.3651041984558,
				3.7547500133514
			}
		},
		pbw_morris_volcano_ice_fire = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pbw_morris_volcano_ice_fire_01",
				"pbw_morris_volcano_ice_fire_02",
				"pbw_morris_volcano_ice_fire_03",
				"pbw_morris_volcano_ice_fire_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_volcano_ice_fire_01",
				"pbw_morris_volcano_ice_fire_02",
				"pbw_morris_volcano_ice_fire_03",
				"pbw_morris_volcano_ice_fire_04"
			},
			sound_events_duration = {
				3.0170209407806,
				3.7525207996368,
				2.9840416908264,
				4.9293541908264
			}
		},
		pbw_morris_volcano_lava = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pbw_morris_volcano_lava_01",
				"pbw_morris_volcano_lava_02",
				"pbw_morris_volcano_lava_03",
				"pbw_morris_volcano_lava_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_volcano_lava_01",
				"pbw_morris_volcano_lava_02",
				"pbw_morris_volcano_lava_03",
				"pbw_morris_volcano_lava_04"
			},
			sound_events_duration = {
				4.2398958206177,
				4.5095000267029,
				7.0982084274292,
				3.5072915554047
			}
		},
		pbw_morris_volcano_outpost = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pbw_morris_volcano_outpost_01",
				"pbw_morris_volcano_outpost_02",
				"pbw_morris_volcano_outpost_03",
				"pbw_morris_volcano_outpost_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_volcano_outpost_01",
				"pbw_morris_volcano_outpost_02",
				"pbw_morris_volcano_outpost_03",
				"pbw_morris_volcano_outpost_04"
			},
			sound_events_duration = {
				3.5329582691193,
				4.2525835037231,
				2.6986665725708,
				2.9344582557678
			}
		},
		pbw_morris_volcano_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pbw_morris_volcano_settlement_01",
				"pbw_morris_volcano_settlement_02",
				"pbw_morris_volcano_settlement_03",
				"pbw_morris_volcano_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_volcano_settlement_01",
				"pbw_morris_volcano_settlement_02",
				"pbw_morris_volcano_settlement_03",
				"pbw_morris_volcano_settlement_04"
			},
			sound_events_duration = {
				1.9256249666214,
				2.6654999256134,
				3.9020209312439,
				6.1494793891907
			}
		},
		pdr_morris_volcano_face = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pdr_morris_volcano_face_01",
				"pdr_morris_volcano_face_02",
				"pdr_morris_volcano_face_03",
				"pdr_morris_volcano_face_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_volcano_face_01",
				"pdr_morris_volcano_face_02",
				"pdr_morris_volcano_face_03",
				"pdr_morris_volcano_face_04"
			},
			sound_events_duration = {
				2.8808541297913,
				2.2326874732971,
				2.0389165878296,
				2.4572501182556
			}
		},
		pdr_morris_volcano_fortress = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pdr_morris_volcano_fortress_01",
				"pdr_morris_volcano_fortress_02",
				"pdr_morris_volcano_fortress_03",
				"pdr_morris_volcano_fortress_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_volcano_fortress_01",
				"pdr_morris_volcano_fortress_02",
				"pdr_morris_volcano_fortress_03",
				"pdr_morris_volcano_fortress_04"
			},
			sound_events_duration = {
				3.6400001049042,
				3.1691875457764,
				5.6770415306091,
				2.9056665897369
			}
		},
		pdr_morris_volcano_glacier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pdr_morris_volcano_glacier_01",
				"pdr_morris_volcano_glacier_02",
				"pdr_morris_volcano_glacier_03",
				"pdr_morris_volcano_glacier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_volcano_glacier_01",
				"pdr_morris_volcano_glacier_02",
				"pdr_morris_volcano_glacier_03",
				"pdr_morris_volcano_glacier_04"
			},
			sound_events_duration = {
				6.3180623054504,
				2.2322499752045,
				4.328104019165,
				3.4405000209808
			}
		},
		pdr_morris_volcano_ice_fire = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pdr_morris_volcano_ice_fire_01",
				"pdr_morris_volcano_ice_fire_02",
				"pdr_morris_volcano_ice_fire_03",
				"pdr_morris_volcano_ice_fire_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_volcano_ice_fire_01",
				"pdr_morris_volcano_ice_fire_02",
				"pdr_morris_volcano_ice_fire_03",
				"pdr_morris_volcano_ice_fire_04"
			},
			sound_events_duration = {
				3.0808124542236,
				4.4831876754761,
				2.2928750514984,
				4.5100626945496
			}
		},
		pdr_morris_volcano_lava = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pdr_morris_volcano_lava_01",
				"pdr_morris_volcano_lava_02",
				"pdr_morris_volcano_lava_03",
				"pdr_morris_volcano_lava_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_volcano_lava_01",
				"pdr_morris_volcano_lava_02",
				"pdr_morris_volcano_lava_03",
				"pdr_morris_volcano_lava_04"
			},
			sound_events_duration = {
				3.2583749294281,
				4.1341042518616,
				3.9285209178925,
				3.7221667766571
			}
		},
		pdr_morris_volcano_outpost = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pdr_morris_volcano_outpost_01",
				"pdr_morris_volcano_outpost_02",
				"pdr_morris_volcano_outpost_03",
				"pdr_morris_volcano_outpost_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_volcano_outpost_01",
				"pdr_morris_volcano_outpost_02",
				"pdr_morris_volcano_outpost_03",
				"pdr_morris_volcano_outpost_04"
			},
			sound_events_duration = {
				4.0339164733887,
				2.7617707252502,
				4.2619791030884,
				3.3940625190735
			}
		},
		pdr_morris_volcano_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pdr_morris_volcano_settlement_01",
				"pdr_morris_volcano_settlement_02",
				"pdr_morris_volcano_settlement_03",
				"pdr_morris_volcano_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_volcano_settlement_01",
				"pdr_morris_volcano_settlement_02",
				"pdr_morris_volcano_settlement_03",
				"pdr_morris_volcano_settlement_04"
			},
			sound_events_duration = {
				3.6386458873749,
				2.5738749504089,
				3.6478126049042,
				4.8131875991821
			}
		},
		pes_morris_volcano_face = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pes_morris_volcano_face_01",
				"pes_morris_volcano_face_02",
				"pes_morris_volcano_face_03",
				"pes_morris_volcano_face_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_volcano_face_01",
				"pes_morris_volcano_face_02",
				"pes_morris_volcano_face_03",
				"pes_morris_volcano_face_04"
			},
			sound_events_duration = {
				3.1128749847412,
				1.9674166440964,
				2.45347905159,
				3.6070001125336
			}
		},
		pes_morris_volcano_fortress = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pes_morris_volcano_fortress_01",
				"pes_morris_volcano_fortress_02",
				"pes_morris_volcano_fortress_03",
				"pes_morris_volcano_fortress_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_volcano_fortress_01",
				"pes_morris_volcano_fortress_02",
				"pes_morris_volcano_fortress_03",
				"pes_morris_volcano_fortress_04"
			},
			sound_events_duration = {
				3.6397292613983,
				3.5687916278839,
				3.0622498989105,
				2.5866041183472
			}
		},
		pes_morris_volcano_glacier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pes_morris_volcano_glacier_01",
				"pes_morris_volcano_glacier_02",
				"pes_morris_volcano_glacier_03",
				"pes_morris_volcano_glacier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_volcano_glacier_01",
				"pes_morris_volcano_glacier_02",
				"pes_morris_volcano_glacier_03",
				"pes_morris_volcano_glacier_04"
			},
			sound_events_duration = {
				2.7979791164398,
				2.4053542613983,
				2.677791595459,
				3.2067291736603
			}
		},
		pes_morris_volcano_ice_fire = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pes_morris_volcano_ice_fire_01",
				"pes_morris_volcano_ice_fire_02",
				"pes_morris_volcano_ice_fire_03",
				"pes_morris_volcano_ice_fire_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_volcano_ice_fire_01",
				"pes_morris_volcano_ice_fire_02",
				"pes_morris_volcano_ice_fire_03",
				"pes_morris_volcano_ice_fire_04"
			},
			sound_events_duration = {
				2.981062412262,
				2.6725416183472,
				2.749166727066,
				2.4042291641235
			}
		},
		pes_morris_volcano_lava = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pes_morris_volcano_lava_01",
				"pes_morris_volcano_lava_02",
				"pes_morris_volcano_lava_03",
				"pes_morris_volcano_lava_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_volcano_lava_01",
				"pes_morris_volcano_lava_02",
				"pes_morris_volcano_lava_03",
				"pes_morris_volcano_lava_04"
			},
			sound_events_duration = {
				1.3833333253861,
				1.2950208187103,
				1.0724791288376,
				1.782562494278
			}
		},
		pes_morris_volcano_outpost = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pes_morris_volcano_outpost_01",
				"pes_morris_volcano_outpost_02",
				"pes_morris_volcano_outpost_03",
				"pes_morris_volcano_outpost_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_volcano_outpost_01",
				"pes_morris_volcano_outpost_02",
				"pes_morris_volcano_outpost_03",
				"pes_morris_volcano_outpost_04"
			},
			sound_events_duration = {
				1.0904375314713,
				2.2577917575836,
				2.9852499961853,
				3.7340834140778
			}
		},
		pes_morris_volcano_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pes_morris_volcano_settlement_01",
				"pes_morris_volcano_settlement_02",
				"pes_morris_volcano_settlement_03",
				"pes_morris_volcano_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_volcano_settlement_01",
				"pes_morris_volcano_settlement_02",
				"pes_morris_volcano_settlement_03",
				"pes_morris_volcano_settlement_04"
			},
			sound_events_duration = {
				2.6108541488648,
				1.9566041231155,
				2.7579998970032,
				2.6666042804718
			}
		},
		pwe_morris_volcano_face = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwe_morris_volcano_face_01",
				"pwe_morris_volcano_face_02",
				"pwe_morris_volcano_face_03",
				"pwe_morris_volcano_face_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_volcano_face_01",
				"pwe_morris_volcano_face_02",
				"pwe_morris_volcano_face_03",
				"pwe_morris_volcano_face_04"
			},
			sound_events_duration = {
				2.7135000228882,
				2.498125076294,
				3.0594167709351,
				5.1936249732971
			}
		},
		pwe_morris_volcano_fortress = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwe_morris_volcano_fortress_01",
				"pwe_morris_volcano_fortress_02",
				"pwe_morris_volcano_fortress_03",
				"pwe_morris_volcano_fortress_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_volcano_fortress_01",
				"pwe_morris_volcano_fortress_02",
				"pwe_morris_volcano_fortress_03",
				"pwe_morris_volcano_fortress_04"
			},
			sound_events_duration = {
				3.2642707824707,
				3.3368332386017,
				4.3296251296997,
				5.0560417175293
			}
		},
		pwe_morris_volcano_glacier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwe_morris_volcano_glacier_01",
				"pwe_morris_volcano_glacier_02",
				"pwe_morris_volcano_glacier_03",
				"pwe_morris_volcano_glacier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_volcano_glacier_01",
				"pwe_morris_volcano_glacier_02",
				"pwe_morris_volcano_glacier_03",
				"pwe_morris_volcano_glacier_04"
			},
			sound_events_duration = {
				4.2916665077209,
				3.2650001049042,
				2.955958366394,
				2.0983126163483
			}
		},
		pwe_morris_volcano_ice_fire = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwe_morris_volcano_ice_fire_01",
				"pwe_morris_volcano_ice_fire_02",
				"pwe_morris_volcano_ice_fire_03",
				"pwe_morris_volcano_ice_fire_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_volcano_ice_fire_01",
				"pwe_morris_volcano_ice_fire_02",
				"pwe_morris_volcano_ice_fire_03",
				"pwe_morris_volcano_ice_fire_04"
			},
			sound_events_duration = {
				5.0302290916443,
				5.0437707901001,
				9.204291343689,
				6.1331458091736
			}
		},
		pwe_morris_volcano_lava = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwe_morris_volcano_lava_01",
				"pwe_morris_volcano_lava_02",
				"pwe_morris_volcano_lava_03",
				"pwe_morris_volcano_lava_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_volcano_lava_01",
				"pwe_morris_volcano_lava_02",
				"pwe_morris_volcano_lava_03",
				"pwe_morris_volcano_lava_04"
			},
			sound_events_duration = {
				3.3160834312439,
				3.6530001163483,
				5.2505831718445,
				3.1164374351502
			}
		},
		pwe_morris_volcano_outpost = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwe_morris_volcano_outpost_01",
				"pwe_morris_volcano_outpost_02",
				"pwe_morris_volcano_outpost_03",
				"pwe_morris_volcano_outpost_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_volcano_outpost_01",
				"pwe_morris_volcano_outpost_02",
				"pwe_morris_volcano_outpost_03",
				"pwe_morris_volcano_outpost_04"
			},
			sound_events_duration = {
				4.1935415267944,
				3.488979101181,
				4.7648959159851,
				2.3824167251587
			}
		},
		pwe_morris_volcano_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwe_morris_volcano_settlement_01",
				"pwe_morris_volcano_settlement_02",
				"pwe_morris_volcano_settlement_03",
				"pwe_morris_volcano_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_volcano_settlement_01",
				"pwe_morris_volcano_settlement_02",
				"pwe_morris_volcano_settlement_03",
				"pwe_morris_volcano_settlement_04"
			},
			sound_events_duration = {
				1.694416642189,
				2.8524582386017,
				3.6915833950043,
				5.0119581222534
			}
		},
		pwh_morris_volcano_face = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwh_morris_volcano_face_01",
				"pwh_morris_volcano_face_02",
				"pwh_morris_volcano_face_03",
				"pwh_morris_volcano_face_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_volcano_face_01",
				"pwh_morris_volcano_face_02",
				"pwh_morris_volcano_face_03",
				"pwh_morris_volcano_face_04"
			},
			sound_events_duration = {
				5.6058750152588,
				5.0856666564941,
				3.0481667518616,
				4.9502291679382
			}
		},
		pwh_morris_volcano_fortress = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwh_morris_volcano_fortress_01",
				"pwh_morris_volcano_fortress_02",
				"pwh_morris_volcano_fortress_03",
				"pwh_morris_volcano_fortress_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_volcano_fortress_01",
				"pwh_morris_volcano_fortress_02",
				"pwh_morris_volcano_fortress_03",
				"pwh_morris_volcano_fortress_04"
			},
			sound_events_duration = {
				6.2407917976379,
				4.4541668891907,
				5.2281250953674,
				5.0885000228882
			}
		},
		pwh_morris_volcano_glacier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwh_morris_volcano_glacier_01",
				"pwh_morris_volcano_glacier_02",
				"pwh_morris_volcano_glacier_03",
				"pwh_morris_volcano_glacier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_volcano_glacier_01",
				"pwh_morris_volcano_glacier_02",
				"pwh_morris_volcano_glacier_03",
				"pwh_morris_volcano_glacier_04"
			},
			sound_events_duration = {
				2.7328541278839,
				4.9733543395996,
				4.977520942688,
				4.8684792518616
			}
		},
		pwh_morris_volcano_ice_fire = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwh_morris_volcano_ice_fire_01",
				"pwh_morris_volcano_ice_fire_02",
				"pwh_morris_volcano_ice_fire_03",
				"pwh_morris_volcano_ice_fire_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_volcano_ice_fire_01",
				"pwh_morris_volcano_ice_fire_02",
				"pwh_morris_volcano_ice_fire_03",
				"pwh_morris_volcano_ice_fire_04"
			},
			sound_events_duration = {
				3.5157499313355,
				4.0605001449585,
				7.0890417098999,
				6.5910210609436
			}
		},
		pwh_morris_volcano_lava = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwh_morris_volcano_lava_01",
				"pwh_morris_volcano_lava_02",
				"pwh_morris_volcano_lava_03",
				"pwh_morris_volcano_lava_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_volcano_lava_01",
				"pwh_morris_volcano_lava_02",
				"pwh_morris_volcano_lava_03",
				"pwh_morris_volcano_lava_04"
			},
			sound_events_duration = {
				5.1727709770203,
				1.8890000581741,
				2.4948542118073,
				3.662291765213
			}
		},
		pwh_morris_volcano_outpost = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwh_morris_volcano_outpost_01",
				"pwh_morris_volcano_outpost_02",
				"pwh_morris_volcano_outpost_03",
				"pwh_morris_volcano_outpost_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_volcano_outpost_01",
				"pwh_morris_volcano_outpost_02",
				"pwh_morris_volcano_outpost_03",
				"pwh_morris_volcano_outpost_04"
			},
			sound_events_duration = {
				4.1297917366028,
				5.0607709884644,
				4.4191875457764,
				5.5595626831055
			}
		},
		pwh_morris_volcano_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_volcano",
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
				"pwh_morris_volcano_settlement_01",
				"pwh_morris_volcano_settlement_02",
				"pwh_morris_volcano_settlement_03",
				"pwh_morris_volcano_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_volcano_settlement_01",
				"pwh_morris_volcano_settlement_02",
				"pwh_morris_volcano_settlement_03",
				"pwh_morris_volcano_settlement_04"
			},
			sound_events_duration = {
				5.4253540039063,
				4.7865414619446,
				2.8773124217987,
				5.0292706489563
			}
		}
	})
end
