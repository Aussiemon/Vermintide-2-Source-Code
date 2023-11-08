return function ()
	define_rule({
		name = "pbw_morris_gorge_cliff_town",
		response = "pbw_morris_gorge_cliff_town",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_cliff_town"
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
				"pbw_morris_gorge_cliff_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_gorge_cliff_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_gorge_effigy",
		response = "pbw_morris_gorge_effigy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_effigy"
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
				"pbw_morris_gorge_effigy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_gorge_effigy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_gorge_river_course",
		response = "pbw_morris_gorge_river_course",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_river_course"
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
				"pbw_morris_gorge_river_course",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_gorge_river_course",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_gorge_settlement",
		response = "pbw_morris_gorge_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_settlement"
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
				"pbw_morris_gorge_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_gorge_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_gorge_skull",
		response = "pbw_morris_gorge_skull",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_skull"
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
				"pbw_morris_gorge_skull",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_gorge_skull",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_morris_gorge_sky",
		response = "pbw_morris_gorge_sky",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_sky"
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
				"pbw_morris_gorge_sky",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pbw_morris_gorge_sky",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_gorge_cliff_town",
		response = "pdr_morris_gorge_cliff_town",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_cliff_town"
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
				"pdr_morris_gorge_cliff_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_gorge_cliff_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_gorge_effigy",
		response = "pdr_morris_gorge_effigy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_effigy"
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
				"pdr_morris_gorge_effigy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_gorge_effigy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_gorge_river_course",
		response = "pdr_morris_gorge_river_course",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_river_course"
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
				"pdr_morris_gorge_river_course",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_gorge_river_course",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_gorge_settlement",
		response = "pdr_morris_gorge_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_settlement"
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
				"pdr_morris_gorge_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_gorge_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_gorge_skull",
		response = "pdr_morris_gorge_skull",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_skull"
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
				"pdr_morris_gorge_skull",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_gorge_skull",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_morris_gorge_sky",
		response = "pdr_morris_gorge_sky",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_sky"
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
				"pdr_morris_gorge_sky",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pdr_morris_gorge_sky",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_gorge_cliff_town",
		response = "pes_morris_gorge_cliff_town",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_cliff_town"
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
				"pes_morris_gorge_cliff_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_gorge_cliff_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_gorge_effigy",
		response = "pes_morris_gorge_effigy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_effigy"
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
				"pes_morris_gorge_effigy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_gorge_effigy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_gorge_river_course",
		response = "pes_morris_gorge_river_course",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_river_course"
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
				"pes_morris_gorge_river_course",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_gorge_river_course",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_gorge_settlement",
		response = "pes_morris_gorge_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_settlement"
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
				"pes_morris_gorge_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_gorge_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_gorge_skull",
		response = "pes_morris_gorge_skull",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_skull"
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
				"pes_morris_gorge_skull",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_gorge_skull",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_morris_gorge_sky",
		response = "pes_morris_gorge_sky",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_sky"
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
				"pes_morris_gorge_sky",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pes_morris_gorge_sky",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_gorge_cliff_town",
		response = "pwe_morris_gorge_cliff_town",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_cliff_town"
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
				"pwe_morris_gorge_cliff_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_gorge_cliff_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_gorge_effigy",
		response = "pwe_morris_gorge_effigy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_effigy"
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
				"pwe_morris_gorge_effigy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_gorge_effigy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_gorge_river_course",
		response = "pwe_morris_gorge_river_course",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_river_course"
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
				"pwe_morris_gorge_river_course",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_gorge_river_course",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_gorge_settlement",
		response = "pwe_morris_gorge_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_settlement"
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
				"pwe_morris_gorge_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_gorge_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_gorge_skull",
		response = "pwe_morris_gorge_skull",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_skull"
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
				"pwe_morris_gorge_skull",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_gorge_skull",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_morris_gorge_sky",
		response = "pwe_morris_gorge_sky",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_sky"
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
				"pwe_morris_gorge_sky",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwe_morris_gorge_sky",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_gorge_cliff_town",
		response = "pwh_morris_gorge_cliff_town",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_cliff_town"
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
				"pwh_morris_gorge_cliff_town",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_gorge_cliff_town",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_gorge_effigy",
		response = "pwh_morris_gorge_effigy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_effigy"
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
				"pwh_morris_gorge_effigy",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_gorge_effigy",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_gorge_river_course",
		response = "pwh_morris_gorge_river_course",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_river_course"
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
				"pwh_morris_gorge_river_course",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_gorge_river_course",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_gorge_settlement",
		response = "pwh_morris_gorge_settlement",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_settlement"
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
				"pwh_morris_gorge_settlement",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_gorge_settlement",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_gorge_skull",
		response = "pwh_morris_gorge_skull",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_skull"
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
				"pwh_morris_gorge_skull",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_gorge_skull",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwh_morris_gorge_sky",
		response = "pwh_morris_gorge_sky",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"sig_gorge_sky"
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
				"pwh_morris_gorge_sky",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwh_morris_gorge_sky",
				OP.ADD,
				1
			}
		}
	})
	add_dialogues({
		pbw_morris_gorge_cliff_town = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pbw_morris_gorge_cliff_town_01",
				"pbw_morris_gorge_cliff_town_02",
				"pbw_morris_gorge_cliff_town_03",
				"pbw_morris_gorge_cliff_town_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_gorge_cliff_town_01",
				"pbw_morris_gorge_cliff_town_02",
				"pbw_morris_gorge_cliff_town_03",
				"pbw_morris_gorge_cliff_town_04"
			},
			sound_events_duration = {
				3.7318124771118,
				4.234395980835,
				6.3191251754761,
				4.1887083053589
			}
		},
		pbw_morris_gorge_effigy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pbw_morris_gorge_effigy_01",
				"pbw_morris_gorge_effigy_02",
				"pbw_morris_gorge_effigy_03",
				"pbw_morris_gorge_effigy_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_gorge_effigy_01",
				"pbw_morris_gorge_effigy_02",
				"pbw_morris_gorge_effigy_03",
				"pbw_morris_gorge_effigy_04"
			},
			sound_events_duration = {
				2.3688333034515,
				3.7674374580383,
				5.366708278656,
				5.1468749046326
			}
		},
		pbw_morris_gorge_river_course = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pbw_morris_gorge_river_course_01",
				"pbw_morris_gorge_river_course_02",
				"pbw_morris_gorge_river_course_03",
				"pbw_morris_gorge_river_course_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_gorge_river_course_01",
				"pbw_morris_gorge_river_course_02",
				"pbw_morris_gorge_river_course_03",
				"pbw_morris_gorge_river_course_04"
			},
			sound_events_duration = {
				3.0588126182556,
				3.2441458702087,
				2.2126667499542,
				5.4422292709351
			}
		},
		pbw_morris_gorge_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pbw_morris_gorge_settlement_01",
				"pbw_morris_gorge_settlement_02",
				"pbw_morris_gorge_settlement_03",
				"pbw_morris_gorge_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_gorge_settlement_01",
				"pbw_morris_gorge_settlement_02",
				"pbw_morris_gorge_settlement_03",
				"pbw_morris_gorge_settlement_04"
			},
			sound_events_duration = {
				2.7391667366028,
				4.5054168701172,
				4.8545207977295,
				4.7492084503174
			}
		},
		pbw_morris_gorge_skull = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pbw_morris_gorge_skull_01",
				"pbw_morris_gorge_skull_02",
				"pbw_morris_gorge_skull_03",
				"pbw_morris_gorge_skull_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_gorge_skull_01",
				"pbw_morris_gorge_skull_02",
				"pbw_morris_gorge_skull_03",
				"pbw_morris_gorge_skull_04"
			},
			sound_events_duration = {
				2.7571458816528,
				4.832603931427,
				3.435729265213,
				4.9084377288818
			}
		},
		pbw_morris_gorge_sky = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pbw_morris_gorge_sky_01",
				"pbw_morris_gorge_sky_02",
				"pbw_morris_gorge_sky_03",
				"pbw_morris_gorge_sky_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_morris_gorge_sky_01",
				"pbw_morris_gorge_sky_02",
				"pbw_morris_gorge_sky_03",
				"pbw_morris_gorge_sky_04"
			},
			sound_events_duration = {
				4.9619793891907,
				1.630041718483,
				3.5332500934601,
				4.9670000076294
			}
		},
		pdr_morris_gorge_cliff_town = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pdr_morris_gorge_cliff_town_01",
				"pdr_morris_gorge_cliff_town_02",
				"pdr_morris_gorge_cliff_town_03",
				"pdr_morris_gorge_cliff_town_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_gorge_cliff_town_01",
				"pdr_morris_gorge_cliff_town_02",
				"pdr_morris_gorge_cliff_town_03",
				"pdr_morris_gorge_cliff_town_04"
			},
			sound_events_duration = {
				2.6274375915527,
				3.0699167251587,
				3.858062505722,
				3.0056667327881
			}
		},
		pdr_morris_gorge_effigy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pdr_morris_gorge_effigy_01",
				"pdr_morris_gorge_effigy_02",
				"pdr_morris_gorge_effigy_03",
				"pdr_morris_gorge_effigy_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_gorge_effigy_01",
				"pdr_morris_gorge_effigy_02",
				"pdr_morris_gorge_effigy_03",
				"pdr_morris_gorge_effigy_04"
			},
			sound_events_duration = {
				2.8332290649414,
				1.9325624704361,
				2.7939999103546,
				4.1963958740234
			}
		},
		pdr_morris_gorge_river_course = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pdr_morris_gorge_river_course_01",
				"pdr_morris_gorge_river_course_02",
				"pdr_morris_gorge_river_course_03",
				"pdr_morris_gorge_river_course_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_gorge_river_course_01",
				"pdr_morris_gorge_river_course_02",
				"pdr_morris_gorge_river_course_03",
				"pdr_morris_gorge_river_course_04"
			},
			sound_events_duration = {
				3.3736667633057,
				1.2608541250229,
				3.6752290725708,
				2.7352917194366
			}
		},
		pdr_morris_gorge_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pdr_morris_gorge_settlement_01",
				"pdr_morris_gorge_settlement_02",
				"pdr_morris_gorge_settlement_03",
				"pdr_morris_gorge_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_gorge_settlement_01",
				"pdr_morris_gorge_settlement_02",
				"pdr_morris_gorge_settlement_03",
				"pdr_morris_gorge_settlement_04"
			},
			sound_events_duration = {
				6.2185206413269,
				2.2531042098999,
				5.0230832099915,
				4.4333543777466
			}
		},
		pdr_morris_gorge_skull = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pdr_morris_gorge_skull_01",
				"pdr_morris_gorge_skull_02",
				"pdr_morris_gorge_skull_03",
				"pdr_morris_gorge_skull_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_gorge_skull_01",
				"pdr_morris_gorge_skull_02",
				"pdr_morris_gorge_skull_03",
				"pdr_morris_gorge_skull_04"
			},
			sound_events_duration = {
				3.427812576294,
				5.859354019165,
				3.625937461853,
				7.512083530426
			}
		},
		pdr_morris_gorge_sky = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pdr_morris_gorge_sky_01",
				"pdr_morris_gorge_sky_02",
				"pdr_morris_gorge_sky_03",
				"pdr_morris_gorge_sky_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_morris_gorge_sky_01",
				"pdr_morris_gorge_sky_02",
				"pdr_morris_gorge_sky_03",
				"pdr_morris_gorge_sky_04"
			},
			sound_events_duration = {
				4.1688122749329,
				5.2684998512268,
				3.9947917461395,
				5.9287085533142
			}
		},
		pes_morris_gorge_cliff_town = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pes_morris_gorge_cliff_town_01",
				"pes_morris_gorge_cliff_town_02",
				"pes_morris_gorge_cliff_town_03",
				"pes_morris_gorge_cliff_town_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_gorge_cliff_town_01",
				"pes_morris_gorge_cliff_town_02",
				"pes_morris_gorge_cliff_town_03",
				"pes_morris_gorge_cliff_town_04"
			},
			sound_events_duration = {
				1.682458281517,
				2.9376666545868,
				3.1937499046326,
				4.0981664657593
			}
		},
		pes_morris_gorge_effigy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pes_morris_gorge_effigy_01",
				"pes_morris_gorge_effigy_02",
				"pes_morris_gorge_effigy_03",
				"pes_morris_gorge_effigy_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_gorge_effigy_01",
				"pes_morris_gorge_effigy_02",
				"pes_morris_gorge_effigy_03",
				"pes_morris_gorge_effigy_04"
			},
			sound_events_duration = {
				1.9835208654404,
				3.5462083816528,
				3.8223540782928,
				2.5858540534973
			}
		},
		pes_morris_gorge_river_course = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pes_morris_gorge_river_course_01",
				"pes_morris_gorge_river_course_02",
				"pes_morris_gorge_river_course_03",
				"pes_morris_gorge_river_course_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_gorge_river_course_01",
				"pes_morris_gorge_river_course_02",
				"pes_morris_gorge_river_course_03",
				"pes_morris_gorge_river_course_04"
			},
			sound_events_duration = {
				2.4538333415985,
				1.6716874837875,
				2.7869999408722,
				1.8781666755676
			}
		},
		pes_morris_gorge_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pes_morris_gorge_settlement_01",
				"pes_morris_gorge_settlement_02",
				"pes_morris_gorge_settlement_03",
				"pes_morris_gorge_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_gorge_settlement_01",
				"pes_morris_gorge_settlement_02",
				"pes_morris_gorge_settlement_03",
				"pes_morris_gorge_settlement_04"
			},
			sound_events_duration = {
				1.9477916955948,
				2.9265415668488,
				3.1789791584015,
				4.0217914581299
			}
		},
		pes_morris_gorge_skull = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pes_morris_gorge_skull_01",
				"pes_morris_gorge_skull_02",
				"pes_morris_gorge_skull_03",
				"pes_morris_gorge_skull_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_gorge_skull_01",
				"pes_morris_gorge_skull_02",
				"pes_morris_gorge_skull_03",
				"pes_morris_gorge_skull_04"
			},
			sound_events_duration = {
				5.4180207252502,
				3.9190833568573,
				2.7941040992737,
				2.156729221344
			}
		},
		pes_morris_gorge_sky = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pes_morris_gorge_sky_01",
				"pes_morris_gorge_sky_02",
				"pes_morris_gorge_sky_03",
				"pes_morris_gorge_sky_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_morris_gorge_sky_01",
				"pes_morris_gorge_sky_02",
				"pes_morris_gorge_sky_03",
				"pes_morris_gorge_sky_04"
			},
			sound_events_duration = {
				4.9554581642151,
				2.0388541221619,
				4.2564792633057,
				3.4395625591278
			}
		},
		pwe_morris_gorge_cliff_town = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwe_morris_gorge_cliff_town_01",
				"pwe_morris_gorge_cliff_town_02",
				"pwe_morris_gorge_cliff_town_03",
				"pwe_morris_gorge_cliff_town_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_gorge_cliff_town_01",
				"pwe_morris_gorge_cliff_town_02",
				"pwe_morris_gorge_cliff_town_03",
				"pwe_morris_gorge_cliff_town_04"
			},
			sound_events_duration = {
				3.6186666488648,
				3.8672082424164,
				4.5668959617615,
				3.1238334178925
			}
		},
		pwe_morris_gorge_effigy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwe_morris_gorge_effigy_01",
				"pwe_morris_gorge_effigy_02",
				"pwe_morris_gorge_effigy_03",
				"pwe_morris_gorge_effigy_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_gorge_effigy_01",
				"pwe_morris_gorge_effigy_02",
				"pwe_morris_gorge_effigy_03",
				"pwe_morris_gorge_effigy_04"
			},
			sound_events_duration = {
				1.862208366394,
				2.5018124580383,
				2.9481041431427,
				5.7638540267944
			}
		},
		pwe_morris_gorge_river_course = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwe_morris_gorge_river_course_01",
				"pwe_morris_gorge_river_course_02",
				"pwe_morris_gorge_river_course_03",
				"pwe_morris_gorge_river_course_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_gorge_river_course_01",
				"pwe_morris_gorge_river_course_02",
				"pwe_morris_gorge_river_course_03",
				"pwe_morris_gorge_river_course_04"
			},
			sound_events_duration = {
				2.8736667633057,
				2.2240834236145,
				2.3269999027252,
				3.8728542327881
			}
		},
		pwe_morris_gorge_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwe_morris_gorge_settlement_01",
				"pwe_morris_gorge_settlement_02",
				"pwe_morris_gorge_settlement_03",
				"pwe_morris_gorge_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_gorge_settlement_01",
				"pwe_morris_gorge_settlement_02",
				"pwe_morris_gorge_settlement_03",
				"pwe_morris_gorge_settlement_04"
			},
			sound_events_duration = {
				3.9771249294281,
				4.6227293014526,
				4.2546873092651,
				3.8682708740234
			}
		},
		pwe_morris_gorge_skull = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwe_morris_gorge_skull_01",
				"pwe_morris_gorge_skull_02",
				"pwe_morris_gorge_skull_03",
				"pwe_morris_gorge_skull_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_gorge_skull_01",
				"pwe_morris_gorge_skull_02",
				"pwe_morris_gorge_skull_03",
				"pwe_morris_gorge_skull_04"
			},
			sound_events_duration = {
				2.6923332214356,
				4.3097710609436,
				5.5187706947327,
				3.538604259491
			}
		},
		pwe_morris_gorge_sky = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwe_morris_gorge_sky_01",
				"pwe_morris_gorge_sky_02",
				"pwe_morris_gorge_sky_03",
				"pwe_morris_gorge_sky_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwe_morris_gorge_sky_01",
				"pwe_morris_gorge_sky_02",
				"pwe_morris_gorge_sky_03",
				"pwe_morris_gorge_sky_04"
			},
			sound_events_duration = {
				3.163229227066,
				4.0972290039063,
				4.1711459159851,
				4.2485208511353
			}
		},
		pwh_morris_gorge_cliff_town = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwh_morris_gorge_cliff_town_01",
				"pwh_morris_gorge_cliff_town_02",
				"pwh_morris_gorge_cliff_town_03",
				"pwh_morris_gorge_cliff_town_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_gorge_cliff_town_01",
				"pwh_morris_gorge_cliff_town_02",
				"pwh_morris_gorge_cliff_town_03",
				"pwh_morris_gorge_cliff_town_04"
			},
			sound_events_duration = {
				4.3058333396912,
				4.437479019165,
				5.4943332672119,
				7.4503750801086
			}
		},
		pwh_morris_gorge_effigy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwh_morris_gorge_effigy_01",
				"pwh_morris_gorge_effigy_02",
				"pwh_morris_gorge_effigy_03",
				"pwh_morris_gorge_effigy_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_gorge_effigy_01",
				"pwh_morris_gorge_effigy_02",
				"pwh_morris_gorge_effigy_03",
				"pwh_morris_gorge_effigy_04"
			},
			sound_events_duration = {
				4.5412917137146,
				4.2555832862854,
				3.9354374408722,
				6.1394581794739
			}
		},
		pwh_morris_gorge_river_course = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwh_morris_gorge_river_course_01",
				"pwh_morris_gorge_river_course_02",
				"pwh_morris_gorge_river_course_03",
				"pwh_morris_gorge_river_course_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_gorge_river_course_01",
				"pwh_morris_gorge_river_course_02",
				"pwh_morris_gorge_river_course_03",
				"pwh_morris_gorge_river_course_04"
			},
			sound_events_duration = {
				4.647020816803,
				3.1141042709351,
				3.7599375247955,
				2.3554792404175
			}
		},
		pwh_morris_gorge_settlement = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwh_morris_gorge_settlement_01",
				"pwh_morris_gorge_settlement_02",
				"pwh_morris_gorge_settlement_03",
				"pwh_morris_gorge_settlement_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_gorge_settlement_01",
				"pwh_morris_gorge_settlement_02",
				"pwh_morris_gorge_settlement_03",
				"pwh_morris_gorge_settlement_04"
			},
			sound_events_duration = {
				3.8809790611267,
				3.7542500495911,
				5.4798331260681,
				2.8465623855591
			}
		},
		pwh_morris_gorge_skull = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwh_morris_gorge_skull_01",
				"pwh_morris_gorge_skull_02",
				"pwh_morris_gorge_skull_03",
				"pwh_morris_gorge_skull_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_gorge_skull_01",
				"pwh_morris_gorge_skull_02",
				"pwh_morris_gorge_skull_03",
				"pwh_morris_gorge_skull_04"
			},
			sound_events_duration = {
				4.8896040916443,
				4.852979183197,
				7.2708539962769,
				4.9777917861939
			}
		},
		pwh_morris_gorge_sky = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "hero_conversations_dlc_morris_sig_gorge",
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
				"pwh_morris_gorge_sky_01",
				"pwh_morris_gorge_sky_02",
				"pwh_morris_gorge_sky_03",
				"pwh_morris_gorge_sky_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pwh_morris_gorge_sky_01",
				"pwh_morris_gorge_sky_02",
				"pwh_morris_gorge_sky_03",
				"pwh_morris_gorge_sky_04"
			},
			sound_events_duration = {
				3.254625082016,
				5.0859375,
				3.8276250362396,
				3.5878748893738
			}
		}
	})
end
