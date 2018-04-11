return function ()
	define_rule({
		name = "pdr_gameplay_i_will_tank",
		response = "pdr_gameplay_i_will_tank",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"surrounded"
			},
			{
				"query_context",
				"has_shield",
				OP.EQ,
				1
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				7
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
				"time_since_i_will_tank",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_i_will_tank",
		response = "pes_gameplay_i_will_tank",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"surrounded"
			},
			{
				"query_context",
				"has_shield",
				OP.EQ,
				1
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				7
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
				"time_since_i_will_tank",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_i_will_tank",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hanging_help",
		response = "pdr_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hanging_help",
		response = "pbw_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hanging_help",
		response = "pwh_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hanging_help",
		response = "pwe_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
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
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hanging_help",
		response = "pes_gameplay_hanging_help",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
				"time_since_ledge_hanging",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ledge_hanging",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_03",
		response = "pbw_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_02",
		response = "pbw_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_01",
		response = "pbw_gameplay_elf_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_06",
		response = "pbw_gameplay_elf_potions_above_half_health_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_06_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_06"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_06_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_02",
		response = "pbw_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
		response = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_ameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pes_ameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_03",
		response = "pbw_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_reply_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_02",
		response = "pbw_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_elf_potions_above_half_health_04",
		response = "pdr_gameplay_elf_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_response_056",
		response = "pwe_gameplay_response_056",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_046",
		response = "pdr_gameplay_response_046",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_056"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_elf_potions_above_half_health_03",
		response = "pdr_gameplay_elf_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_response_055",
		response = "pwe_gameplay_response_055",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_045",
		response = "pdr_gameplay_response_045",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_055"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_elf_potions_above_half_health_02",
		response = "pdr_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_response_054",
		response = "pwe_gameplay_response_054",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_044",
		response = "pdr_gameplay_response_044",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_054"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_04",
		response = "pdr_gameplay_hunter_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_reply_01",
		response = "pdr_gameplay_hunter_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_03",
		response = "pdr_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_response_044",
		response = "pwh_gameplay_response_044",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_054",
		response = "pdr_gameplay_response_054",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_044"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_potions_above_half_health_02",
		response = "pdr_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_response_043",
		response = "pwh_gameplay_response_043",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_053",
		response = "pdr_gameplay_response_053",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_043"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pes_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_03",
		response = "pdr_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_02",
		response = "pdr_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02",
		response = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_01",
		response = "pdr_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_response_043",
		response = "pbw_gameplay_response_043",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_response_050",
		response = "pdr_gameplay_response_050",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_043"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_03",
		response = "pdr_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_02",
		response = "pdr_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_potions_above_half_health_04",
		response = "pdr_gameplay_wizard_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_01",
		response = "pes_gameplay_elf_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_01_reply_02",
		response = "pwe_gameplay_elf_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_01_reply_02",
		response = "pes_gameplay_elf_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_03",
		response = "pes_gameplay_elf_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_elf_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_elf_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_02",
		response = "pes_gameplay_elf_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_potions_above_half_health_02_reply_02",
		response = "pwe_gameplay_elf_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_elf_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_01",
		response = "pes_gameplay_hunter_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_01_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_03",
		response = "pes_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_02",
		response = "pes_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_01",
		response = "pes_gameplay_ranger_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_03",
		response = "pes_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_02",
		response = "pes_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_01",
		response = "pes_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_03",
		response = "pes_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		response = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_02",
		response = "pes_gameplay_wizard_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
		response = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_potions_above_half_health_02_reply_01",
		response = "pes_gameplay_wizard_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health__reply_02",
		response = "pwe_gameplay_hunter_potions_above_half_health__reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_03",
		response = "pwe_gameplay_hunter_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_02",
		response = "pwe_gameplay_hunter_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
		response = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_04",
		response = "pwe_gameplay_ranger_potions_above_half_health_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
		response = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_04"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_03",
		response = "pwe_gameplay_ranger_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
		response = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_02",
		response = "pwe_gameplay_ranger_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
		response = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_potions_above_half_health_02_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_01_reply_02",
		response = "pes_gameplay_soldier_potions_above_half_health_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_03",
		response = "pwe_gameplay_soldier_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_03_reply_03",
		response = "pes_gameplay_soldier_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_02",
		response = "pwe_gameplay_soldier_potions_above_half_health_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_potions_above_half_health_02_reply_03",
		response = "pes_gameplay_soldier_potions_above_half_health_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_potions_above_half_health_02"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01",
		response = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_potions_above_half_health_02_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_01",
		response = "pwe_gameplay_wizard_potions_above_half_health_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_potions_above_half_health_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01",
		response = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_01_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_03",
		response = "pwe_gameplay_wizard_potions_above_half_health_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"early_healing_draught"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMEDIFF,
				OP.GT,
				3000
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
		response = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_potions_above_half_health_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02",
		response = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_potions_above_half_health_03_reply_03"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_early_healing_draught",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_dwarf_picks_up_a_bomb",
		response = "pwe_gameplay_dwarf_picks_up_a_bomb",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_other_pickup"
			},
			{
				"query_context",
				"pickup_name",
				OP.EQ,
				"pickup_frag_grenade_t2"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_memory",
				"time_since_dwarf_picks_up_a_bomb",
				OP.TIMEDIFF,
				OP.GT,
				480
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_dwarf_picks_up_a_bomb",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_3_special_kills_in_a_row_02",
		response = "pdr_gameplay_soldier_3_special_kills_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_02",
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_3_special_kills_in_a_row_02"
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
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1",
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_02"
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
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_3_special_kills_in_a_row_01"
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
		response = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
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
		name = "pbw_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_071",
		name = "pwh_gameplay_response_071",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_3_special_kills_in_a_row_01"
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
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_071"
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
		name = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
		response = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		name = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
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
		response = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		name = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
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
		name = "pbw_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_3_special_kills_in_a_row_01"
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
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
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
		name = "pbw_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pbw_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_3_special_kills_in_a_row_01"
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
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03"
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
		name = "pdr_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_3_special_kills_in_a_row_01"
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
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
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
		name = "pdr_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_3_special_kills_in_a_row_01"
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
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02",
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
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
		name = "pdr_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pdr_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_3_special_kills_in_a_row_01"
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
		response = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		name = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
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
		name = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
		response = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		name = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
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
		response = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		name = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
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
		name = "pes_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pes_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01",
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_3_special_kills_in_a_row_01"
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
		response = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		name = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01"
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
		name = "pes_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pes_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_01",
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_3_special_kills_in_a_row_01"
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
		response = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_01"
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
		name = "pes_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pes_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_3_special_kills_in_a_row_01"
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
		response = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		name = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
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
		name = "pwe_gameplay_hunter_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_hunter_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		name = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_3_special_kills_in_a_row_01"
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
		response = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		name = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
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
		name = "pwe_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_3_special_kills_in_a_row_01"
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
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
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
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_3_special_kills_in_a_row_01"
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
		response = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
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
		name = "pwe_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pwe_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_3_special_kills_in_a_row_01"
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
		response = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		name = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
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
		name = "pwh_gameplay_elf_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_elf_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		name = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_3_special_kills_in_a_row_01"
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
		response = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		name = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
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
		name = "pwh_gameplay_ranger_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_ranger_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
		name = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_3_special_kills_in_a_row_01"
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
		response = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		name = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
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
		name = "pwh_gameplay_soldier_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_soldier_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"wood_elf",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		name = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_3_special_kills_in_a_row_01"
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
		response = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		name = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
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
		name = "pwh_gameplay_wizard_3_special_kills_in_a_row_01",
		response = "pwh_gameplay_wizard_3_special_kills_in_a_row_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
		name = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_3_special_kills_in_a_row_01"
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
		response = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		name = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03"
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
		name = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
		response = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.GT,
				3
			},
			{
				"global_context",
				"empire_soldier",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.EQ,
				0
			}
		},
		on_done = {
			{
				"user_memory",
				"once_special_kills_in_a_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		name = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
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
		response = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		name = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
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
		name = "pes_gameplay_elf_downed_3_times_08",
		response = "pes_gameplay_elf_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_elf_downed_3_times_08_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_08"
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
		response = "pes_gameplay_elf_downed_3_times_08_reply_01",
		name = "pes_gameplay_elf_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_08_reply_01"
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
		name = "pbr_gameplay_elf_downed_3_times_11",
		response = "pbr_gameplay_elf_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_11_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbr_gameplay_elf_downed_3_times_11"
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
		response = "pwh_gameplay_elf_downed_3_times_11_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_11_reply_01"
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
		name = "pwh_gameplay_elf_downed_3_times_05",
		response = "pwh_gameplay_elf_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_05_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_05"
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
		response = "pbw_gameplay_elf_downed_3_times_05_reply_01",
		name = "pbw_gameplay_elf_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_05_reply_01"
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
		name = "pwh_gameplay_elf_downed_3_times_04",
		response = "pwh_gameplay_elf_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_04_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_04"
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
		response = "pwh_gameplay_elf_downed_3_times_04_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_04_reply_01"
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
		name = "pes_gameplay_elf_downed_3_times_09",
		response = "pes_gameplay_elf_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_09_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_09"
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
		response = "pes_gameplay_elf_downed_3_times_09_reply_01",
		name = "pes_gameplay_elf_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_09_reply_01"
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
		name = "pbw_gameplay_elf_downed_3_times_07",
		response = "pbw_gameplay_elf_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_downed_3_times_07_reply_01",
		name = "pes_gameplay_elf_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_07"
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
		response = "pbw_gameplay_elf_downed_3_times_07_reply_01",
		name = "pbw_gameplay_elf_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_07_reply_01"
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
		name = "pbw_gameplay_elf_downed_3_times_06",
		response = "pbw_gameplay_elf_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_06_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_06"
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
		response = "pbw_gameplay_elf_downed_3_times_06_reply_01",
		name = "pbw_gameplay_elf_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_06_reply_01"
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
		name = "pes_gameplay_elf_downed_3_times_10",
		response = "pes_gameplay_elf_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_10_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_10"
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
		response = "pwh_gameplay_elf_downed_3_times_10_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_10_reply_01"
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
		name = "pdr_gameplay_elf_downed_3_times_13",
		response = "pdr_gameplay_elf_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_13_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_downed_3_times_13"
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
		response = "pdr_gameplay_elf_downed_3_times_13_reply_01",
		name = "pdr_gameplay_elf_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_13_reply_01"
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
		name = "pwh_gameplay_elf_downed_3_times_03_azsd",
		response = "pwh_gameplay_elf_downed_3_times_03_azsd",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_elf_downed_3_times_03_reply_01",
		name = "pes_gameplay_elf_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_downed_3_times_03_azsd"
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
		response = "pwh_gameplay_elf_downed_3_times_03_reply_01",
		name = "pwh_gameplay_elf_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_downed_3_times_03_reply_01"
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
		name = "pdr_gameplay_elf_downed_3_times_12",
		response = "pdr_gameplay_elf_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_12_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_downed_3_times_12"
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
		response = "pdr_gameplay_elf_downed_3_times_12_reply_01",
		name = "pdr_gameplay_elf_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_12_reply_01"
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
		name = "pbw_gameplay_elf_downed_3_times_02",
		response = "pbw_gameplay_elf_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_downed_3_times_02_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_downed_3_times_02"
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
		response = "pbw_gameplay_elf_downed_3_times_02_reply_01",
		name = "pbw_gameplay_elf_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_downed_3_times_02_reply_01"
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
		name = "pdr_gameplay_hunter_downed_3_times_08",
		response = "pdr_gameplay_hunter_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_08_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_08"
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
		response = "pdr_gameplay_hunter_downed_3_times_08_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_08_reply_01"
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
		name = "pwe_gameplay_hunter_downed_3_times_11",
		response = "pwe_gameplay_hunter_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_11_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_11"
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
		response = "pwe_gameplay_hunter_downed_3_times_11_reply_01",
		name = "pwe_gameplay_hunter_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_11_reply_01"
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
		name = "pes_gameplay_hunter_downed_3_times_05",
		response = "pes_gameplay_hunter_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_05_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_05"
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
		response = "pes_gameplay_hunter_downed_3_times_05_reply_01",
		name = "pes_gameplay_hunter_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_05_reply_01"
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
		name = "pbw_gameplay_hunter_downed_3_times_04",
		response = "pbw_gameplay_hunter_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_04_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_04"
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
		response = "pdr_gameplay_hunter_downed_3_times_04_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_04_reply_01"
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
		name = "pdr_gameplay_hunter_downed_3_times_09",
		response = "pdr_gameplay_hunter_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_09_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_09"
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
		response = "pdr_gameplay_hunter_downed_3_times_09_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_09_reply_01"
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
		name = "pes_gameplay_hunter_downed_3_times_07",
		response = "pes_gameplay_hunter_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_07_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_07"
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
		response = "pes_gameplay_hunter_downed_3_times_07_reply_01",
		name = "pes_gameplay_hunter_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_07_reply_01"
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
		name = "pes_gameplay_hunter_downed_3_times_06",
		response = "pes_gameplay_hunter_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_06_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_downed_3_times_06"
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
		response = "pes_gameplay_hunter_downed_3_times_06_reply_01",
		name = "pes_gameplay_hunter_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_06_reply_01"
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
		name = "pdr_gameplay_hunter_downed_3_times_10",
		response = "pdr_gameplay_hunter_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_10_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_downed_3_times_10"
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
		response = "pdr_gameplay_hunter_downed_3_times_10_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_10_reply_01"
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
		name = "pwe_gameplay_hunter_downed_3_times_13",
		response = "pwe_gameplay_hunter_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_13_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_13"
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
		response = "pwe_gameplay_hunter_downed_3_times_13_reply_01",
		name = "pwe_gameplay_hunter_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_13_reply_01"
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
		name = "pbw_gameplay_hunter_downed_3_times_03",
		response = "pbw_gameplay_hunter_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_03_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_03"
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
		response = "pdr_gameplay_hunter_downed_3_times_03_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_03_reply_01"
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
		name = "pwe_gameplay_hunter_downed_3_times_12",
		response = "pwe_gameplay_hunter_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_11_reply_02",
		name = "pwh_gameplay_hunter_downed_3_times_11_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_downed_3_times_12"
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
		response = "pdr_gameplay_hunter_downed_3_times_11_reply_02",
		name = "pdr_gameplay_hunter_downed_3_times_11_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_11_reply_02"
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
		name = "pbw_gameplay_hunter_downed_3_times_02",
		response = "pbw_gameplay_hunter_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_witch_hunter",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_downed_3_times_02_reply_01",
		name = "pwh_gameplay_hunter_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_downed_3_times_02"
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
		response = "pdr_gameplay_hunter_downed_3_times_02_reply_01",
		name = "pdr_gameplay_hunter_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_downed_3_times_02_reply_01"
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
		name = "pbw_gameplay_ranger_downed_3_times_08",
		response = "pbw_gameplay_ranger_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_08_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_08"
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
		response = "pbw_gameplay_ranger_downed_3_times_08_reply_01",
		name = "pbw_gameplay_ranger_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_08_reply_01"
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
		name = "pwe_gameplay_ranger_downed_3_times_11",
		response = "pwe_gameplay_ranger_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_11_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_11"
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
		response = "pbw_gameplay_ranger_downed_3_times_11_reply_01",
		name = "pbw_gameplay_ranger_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_11_reply_01"
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
		name = "pwh_gameplay_ranger_downed_3_times_04",
		response = "pwh_gameplay_ranger_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_04_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_times_04"
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
		response = "pwe_gameplay_ranger_downed_3_times_04_reply_01",
		name = "pwe_gameplay_ranger_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_04_reply_01"
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
		name = "pbw_gameplay_ranger_downed_3_times_09",
		response = "pbw_gameplay_ranger_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_09_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_09"
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
		response = "pes_gameplay_ranger_downed_3_times_09_reply_01",
		name = "pes_gameplay_ranger_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_09_reply_01"
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
		name = "pbw_gameplay_ranger_downed_3_times_07",
		response = "pbw_gameplay_ranger_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_07_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_downed_3_times_07"
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
		response = "pbw_gameplay_ranger_downed_3_times_07_reply_01",
		name = "pbw_gameplay_ranger_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_07_reply_01"
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
		name = "pes_gameplay_ranger_downed_3_times_10",
		response = "pes_gameplay_ranger_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_10_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_downed_3_times_10"
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
		response = "pwe_gameplay_ranger_downed_3_times_10_reply_01",
		name = "pwe_gameplay_ranger_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_10_reply_01"
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
		name = "pwe_gameplay_ranger_downed_3_times_13",
		response = "pwe_gameplay_ranger_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_13_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_13"
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
		response = "pwe_gameplay_ranger_downed_3_times_13_reply_01",
		name = "pwe_gameplay_ranger_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_13_reply_01"
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
		name = "pwh_gameplay_ranger_downed_3_times_03",
		response = "pwh_gameplay_ranger_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_03_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_times_03"
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
		response = "pwh_gameplay_ranger_downed_3_times_03_reply_01",
		name = "pwh_gameplay_ranger_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_03_reply_01"
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
		name = "pwe_gameplay_ranger_downed_3_times_12",
		response = "pwe_gameplay_ranger_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_12_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_downed_3_times_12"
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
		response = "pwe_gameplay_ranger_downed_3_times_12_reply_01",
		name = "pwe_gameplay_ranger_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_12_reply_01"
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
		name = "pwh_gameplay_ranger_downed_3_time_02",
		response = "pwh_gameplay_ranger_downed_3_time_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_downed_3_times_02_reply_01",
		name = "pdr_gameplay_ranger_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_downed_3_time_02"
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
		response = "pwh_gameplay_ranger_downed_3_times_02_reply_01",
		name = "pwh_gameplay_ranger_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_downed_3_times_02_reply_01"
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
		name = "pbw_gameplay_soldier_downed_3_times_08",
		response = "pbw_gameplay_soldier_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_08_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_08"
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
		response = "pwe_gameplay_soldier_downed_3_times_08_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_08_reply_01"
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
		name = "pdr_gameplay_soldier_downed_3_times_11",
		response = "pdr_gameplay_soldier_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_11_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_11"
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
		response = "pwe_gameplay_soldier_downed_3_times_11_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_11_reply_01"
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
		name = "pwh_gameplay_soldier_downed_3_times_05",
		response = "pwh_gameplay_soldier_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_soldier_downed_3_times_05_reply_01",
		name = "pbw_gameplay_soldier_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_05"
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
		response = "pwh_gameplay_soldier_downed_3_times_05_reply_01",
		name = "pwh_gameplay_soldier_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_05_reply_01"
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
		name = "pwh_gameplay_soldier_downed_3_times_04",
		response = "pwh_gameplay_soldier_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_04_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_04"
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
		response = "pwh_gameplay_soldier_downed_3_times_04_reply_01",
		name = "pwh_gameplay_soldier_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_04_reply_01"
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
		name = "pdr_gameplay_soldier_downed_3_times_09",
		response = "pdr_gameplay_soldier_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_09_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_09"
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
		response = "pwe_gameplay_soldier_downed_3_times_09_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_09_reply_01"
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
		name = "pbw_gameplay_soldier_downed_3_times_07",
		response = "pbw_gameplay_soldier_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_07_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_07"
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
		response = "pbw_gameplay_soldier_downed_3_times_07_reply_01",
		name = "pbw_gameplay_soldier_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_07_reply_01"
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
		name = "pbw_gameplay_soldier_downed_3_times_06",
		response = "pbw_gameplay_soldier_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_06_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_downed_3_times_06"
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
		response = "pwe_gameplay_soldier_downed_3_times_06_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_06_reply_01"
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
		name = "pdr_gameplay_soldier_downed_3_times_10",
		response = "pdr_gameplay_soldier_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_10_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_downed_3_times_10"
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
		response = "pwe_gameplay_soldier_downed_3_times_10_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_10_reply_01"
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
		name = "pwe_gameplay_soldier_downed_3_times_13",
		response = "pwe_gameplay_soldier_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_13_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_13"
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
		response = "pwe_gameplay_soldier_downed_3_times_13_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_13_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_13_reply_01"
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
		name = "pwh_gameplay_soldier_downed_3_times_03",
		response = "pwh_gameplay_soldier_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_downed_3_times_03"
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
		response = "pwh_gameplay_soldier_downed_3_times_reply_01",
		name = "pwh_gameplay_soldier_downed_3_times_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_reply_01"
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
		name = "pwe_gameplay_soldier_downed_3_times_12",
		response = "pwe_gameplay_soldier_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_12_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_12"
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
		response = "pwe_gameplay_soldier_downed_3_times_12_reply_01",
		name = "pwe_gameplay_soldier_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_12_reply_01"
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
		name = "pwe_gameplay_soldier_downed_3_times_02",
		response = "pwe_gameplay_soldier_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_downed_3_times_02_reply_01",
		name = "pes_gameplay_soldier_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_downed_3_times_02"
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
		response = "pwh_gameplay_soldier_downed_3_times_02_reply_01",
		name = "pwh_gameplay_soldier_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_downed_3_times_02_reply_01"
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
		name = "pdr_gameplay_wizard_downed_3_times_08",
		response = "pdr_gameplay_wizard_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_08_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_08_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_08"
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
		response = "pdr_gameplay_wizard_downed_3_times_07_reply_01",
		name = "pdr_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_08_reply_01"
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
		name = "pwe_gameplay_wizard_downed_3_times_11",
		response = "pwe_gameplay_wizard_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_11_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_downed_3_times_11"
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
		response = "pwe_gameplay_wizard_downed_3_times_11_reply_01",
		name = "pwe_gameplay_wizard_downed_3_times_11_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_11_reply_01"
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
		name = "pes_gameplay_wizard_downed_3_times_05",
		response = "pes_gameplay_wizard_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_05_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_05"
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
		response = "pdr_gameplay_wizard_downed_3_times_05_reply_01",
		name = "pdr_gameplay_wizard_downed_3_times_05_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_05_reply_01"
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
		name = "pwh_gameplay_wizard_downed_3_times_04",
		response = "pwh_gameplay_wizard_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_04_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_04"
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
		response = "pes_gameplay_wizard_downed_3_times_04_reply_01",
		name = "pes_gameplay_wizard_downed_3_times_04_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_04_reply_01"
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
		name = "pwh_gameplay_wizard_downed_3_times_14",
		response = "pwh_gameplay_wizard_downed_3_times_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_14_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_14_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_14"
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
		response = "pwh_gameplay_wizard_downed_3_times_14_reply_01",
		name = "pwh_gameplay_wizard_downed_3_times_14_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_14_reply_01"
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
		name = "pdr_gameplay_wizard_downed_3_times_09",
		response = "pdr_gameplay_wizard_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_09_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_09"
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
		response = "pdr_gameplay_wizard_downed_3_times_09_reply_01",
		name = "pdr_gameplay_wizard_downed_3_times_09_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_09_reply_01"
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
		name = "pes_gameplay_wizard_downed_3_times_07",
		response = "pes_gameplay_wizard_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_07_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_07"
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
		response = "pes_gameplay_wizard_downed_3_times_07_reply_01",
		name = "pes_gameplay_wizard_downed_3_times_07_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_07_reply_01"
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
		name = "pes_gameplay_wizard_downed_3_times_06",
		response = "pes_gameplay_wizard_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_06_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_downed_3_times_06"
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
		response = "pdr_gameplay_wizard_downed_3_times_06_reply_01",
		name = "pdr_gameplay_wizard_downed_3_times_06_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_06_reply_01"
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
		name = "pdr_gameplay_wizard_downed_3_times_10",
		response = "pdr_gameplay_wizard_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_10_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_downed_3_times_10"
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
		response = "pwh_gameplay_wizard_downed_3_times_10_reply_01",
		name = "pwh_gameplay_wizard_downed_3_times_10_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_10_reply_01"
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
		name = "pwh_gameplay_wizard_downed_3_times_03",
		response = "pwh_gameplay_wizard_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_03_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_03"
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
		response = "pwh_gameplay_wizard_downed_3_times_03_reply_01",
		name = "pwh_gameplay_wizard_downed_3_times_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_03_reply_01"
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
		name = "pwe_gameplay_wizard_downed_3_times_12",
		response = "pwe_gameplay_wizard_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_downed_3_times_12_reply_01",
		name = "pbw_gameplay_wizard_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_downed_3_times_12"
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
		response = "pes_gameplay_wizard_downed_3_times_12_reply_01",
		name = "pes_gameplay_wizard_downed_3_times_12_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_downed_3_times_12_reply_01"
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
		name = "pwh_gameplay_wizard_downed_3_times_02",
		response = "pwh_gameplay_wizard_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.EQ,
				2
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wizard_downed_3_times_02_reply_01",
		name = "pwh_gameplay_wizard_downed_3_times_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_02"
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
		response = "pwh_gameplay_wizard_downed_3_times_02_reply_02",
		name = "pwh_gameplay_wizard_downed_3_times_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_downed_3_times_02_reply_01"
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
		response = "pbw_gameplay_elf_hit_by_goo_thrice_02",
		name = "pbw_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_hit_by_goo_thrice_02"
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
		response = "pdr_gameplay_elf_hit_by_goo_thrice_02",
		name = "pdr_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_hit_by_goo_thrice_02"
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
		response = "pes_gameplay_elf_hit_by_goo_thrice_02",
		name = "pes_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_hit_by_goo_thrice_02"
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
		response = "pwh_gameplay_elf_hit_by_goo_thrice_02",
		name = "pwh_gameplay_elf_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_hit_by_goo_thrice_02"
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
		response = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
		name = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_hit_by_goo_thrice_02"
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
		response = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
		name = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_hit_by_goo_thrice_02"
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
		response = "pes_gameplay_hunter_hit_by_goo_thrice",
		name = "pes_gameplay_hunter_hit_by_goo_thrice",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
		name = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_hit_by_goo_thrice"
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
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
		name = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_hit_by_goo_thrice_03"
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
		response = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
		name = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_hit_by_goo_thrice_02"
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
		response = "pes_gameplay_ranger_hit_by_goo_thrice_02",
		name = "pes_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_hit_by_goo_thrice_02"
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
		response = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
		name = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_hit_by_goo_thrice_00"
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
		response = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
		name = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_hit_by_goo_thrice_02"
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
		response = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
		name = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_hit_by_goo_thrice_02"
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
		response = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
		name = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_hit_by_goo_thrice_02"
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
		response = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
		name = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_hit_by_goo_thrice_02"
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
		response = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
		name = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_hit_by_goo_thrice_02"
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
		response = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
		name = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_hit_by_goo_thrice_02"
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
		response = "pes_gameplay_wizard_hit_by_goo_thrice_02",
		name = "pes_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_hit_by_goo_thrice_02"
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
		response = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
		name = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_hit_by_goo_thrice_02"
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
		response = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
		name = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"was_hit_by_goo"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"times_poisoned",
				OP.EQ,
				3
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
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_hit_by_goo_thrice_02"
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
		name = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
		response = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_grabbed_wood_elf",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_wood_elf",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_23",
		name = "pwh_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_caught_by_slaver_3_times_02"
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
		response = "pes_gameplay_response_117",
		name = "pes_gameplay_response_117",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_23"
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
		name = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
		response = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_grabbed_wood_elf",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_wood_elf",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_124",
		name = "pwe_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_caught_by_slaver_3_times_02"
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
		response = "pes_gameplay_response_113",
		name = "pes_gameplay_response_113",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_124"
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
		name = "pes_gameplay_elf_caught_by_slaver_3_times_02",
		response = "pes_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_grabbed_wood_elf",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_wood_elf",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_125",
		name = "pwe_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_caught_by_slaver_3_times_02"
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
		response = "pdr_gameplay_response_126",
		name = "pdr_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_125"
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
		name = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
		response = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_grabbed_wood_elf",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_wood_elf",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_130",
		name = "pwe_gameplay_response_130",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_caught_by_slaver_3_times_02"
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
		response = "pdr_gameplay_response_132",
		name = "pdr_gameplay_response_132",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_130"
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
		name = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
		response = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_grabbed_witch_hunter",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_witch_hunter",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_128",
		name = "pwh_gameplay_response_128",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_caught_by_slaver_3_times_02"
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
		response = "pdr_gameplay_response_130",
		name = "pdr_gameplay_response_130",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_128"
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
		name = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
		response = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_grabbed_witch_hunter",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_witch_hunter",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_123",
		name = "pwh_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_caught_by_slaver_3_times_02"
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
		response = "pbw_gameplay_response_117",
		name = "pbw_gameplay_response_117",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_123"
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
		name = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
		response = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_grabbed_witch_hunter",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_witch_hunter",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_124",
		name = "pwh_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_caught_by_slaver_3_times_02"
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
		response = "pbw_gameplay_response_120",
		name = "pbw_gameplay_response_120",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_124"
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
		name = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
		response = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_grabbed_witch_hunter",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_witch_hunter",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_126",
		name = "pwh_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_caught_by_slaver_3_times_02"
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
		response = "pdr_gameplay_response_128",
		name = "pdr_gameplay_response_128",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_126"
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
		name = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
		response = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_129",
		name = "pdr_gameplay_response_129",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_caught_by_slaver_3_times_02"
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
		response = "pwe_gameplay_response_127",
		name = "pwe_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_129"
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
		name = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
		response = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_125",
		name = "pdr_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_caught_by_slaver_3_times_02"
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
		response = "pbw_gameplay_response_118",
		name = "pbw_gameplay_response_118",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_125"
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
		name = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
		response = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_127",
		name = "pdr_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_caught_by_slaver_3_times_02"
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
		response = "pbw_gameplay_response_121",
		name = "pbw_gameplay_response_121",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_127"
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
		name = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
		response = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_131",
		name = "pdr_gameplay_response_131",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_caught_by_slaver_3_times_02"
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
		response = "pbw_gameplay_response_123",
		name = "pbw_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_131"
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
		name = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
		response = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"times_grabbed_empire_soldier",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_empire_soldier",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_116",
		name = "pes_gameplay_response_116",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_caught_by_slaver_3_times_02"
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
		response = "pwh_gameplay_response_127",
		name = "pwh_gameplay_response_127",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_116"
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
		name = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
		response = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_grabbed_empire_soldier",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_empire_soldier",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_112",
		name = "pes_gameplay_response_112",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_caught_by_slaver_3_times_two"
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
		response = "pwe_gameplay_response_123",
		name = "pwe_gameplay_response_123",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_112"
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
		name = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
		response = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_grabbed_empire_soldier",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_empire_soldier",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_114",
		name = "pes_gameplay_response_114",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_caught_by_slaver_3_times_02"
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
		response = "pwh_gameplay_response_125",
		name = "pwh_gameplay_response_125",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_114"
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
		name = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
		response = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_grabbed_empire_soldier",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_empire_soldier",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_118",
		name = "pes_gameplay_response_118",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_caught_by_slaver_3_times_02"
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
		response = "pwe_gameplay_response_129",
		name = "pwe_gameplay_response_129",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_118"
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
		name = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
		response = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"times_grabbed_bright_wizard",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_bright_wizard",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_116",
		name = "pbw_gameplay_response_116",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_caught_by_slaver_3_times_02"
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
		response = "pwh_gameplay_response_122",
		name = "pwh_gameplay_response_122",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_116"
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
		name = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
		response = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"times_grabbed_bright_wizard",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_bright_wizard",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_119",
		name = "pbw_gameplay_response_119",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_caught_by_slaver_3_times_02"
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
		response = "pwe_gameplay_response_126",
		name = "pwe_gameplay_response_126",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_119"
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
		name = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
		response = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"times_grabbed_bright_wizard",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_bright_wizard",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_122",
		name = "pbw_gameplay_response_122",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_caught_by_slaver_3_times_02"
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
		response = "pes_gameplay_response_115",
		name = "pes_gameplay_response_115",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_122"
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
		name = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
		response = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"un_grabbed"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"times_grabbed_bright_wizard",
				OP.EQ,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_grabbed_bright_wizard",
				OP.SUB,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_124",
		name = "pbw_gameplay_response_124",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_caught_by_slaver_3_times_02"
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
		response = "pes_gameplay_response_119",
		name = "pes_gameplay_response_119",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_124"
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
		response = "pdr_gameplay_killing_a_second_rat_ogre_01",
		name = "pdr_gameplay_killing_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_killing_a_second_rat_ogre_01",
		name = "pwh_gameplay_killing_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_37",
		name = "pbw_gameplay_response_37",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_second_rat_ogre_01"
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
		response = "pwh_gameplay_response_37_alt1",
		name = "pwh_gameplay_response_37_alt1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_37"
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
		response = "pdr_gameplay_killing_a_second_rat_ogre_02",
		name = "pdr_gameplay_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_30",
		name = "pes_gameplay_response_30",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_killing_a_second_rat_ogre_02"
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
		response = "pdr_gameplay_response_38",
		name = "pdr_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_30"
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
		response = "pwe_gameplay_kiling_a_second_rat_ogre_01",
		name = "pwe_gameplay_kiling_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_31",
		name = "pes_gameplay_response_31",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_kiling_a_second_rat_ogre_01"
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
		response = "pwe_gameplay_killing_a_second_rat_ogre_02",
		name = "pwe_gameplay_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_36",
		name = "pwh_gameplay_response_36",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_killing_a_second_rat_ogre_02"
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
		response = "pwe_gameplay_response_39",
		name = "pwe_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_36"
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
		response = "pwh_gameplay_killing_a_second_rat_ogre_02",
		name = "pwh_gameplay_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_39",
		name = "pdr_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_second_rat_ogre_02"
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
		response = "pbw_gameplay_killing_a_second_rat_ogre_01",
		name = "pbw_gameplay_killing_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_40",
		name = "pwe_gameplay_response_40",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_killing_a_second_rat_ogre_01"
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
		response = "pbw_gameplay_response_38",
		name = "pbw_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_40"
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
		response = "pbw_killing_a_second_rat_ogre_02",
		name = "pbw_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"user_memory",
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_38",
		name = "pwh_gameplay_response_38",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_killing_a_second_rat_ogre_02"
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
		response = "pbw_gameplay_response_39",
		name = "pbw_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_38"
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
		response = "pwh_gameplay_response_39",
		name = "pwh_gameplay_response_39",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_39"
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
		response = "pes_gameplay_killing_a_second_rat_ogre_01",
		name = "pes_gameplay_killing_a_second_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_41",
		name = "pwe_gameplay_response_41",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_a_second_rat_ogre_01"
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
		response = "pes_gameplay_response_32",
		name = "pes_gameplay_response_32",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_41"
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
		response = "pes_gameplay_killing_a_second_rat_ogre_02",
		name = "pes_gameplay_killing_a_second_rat_ogre_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"times_killed_rat_ogre",
				OP.EQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_40",
		name = "pdr_gameplay_response_40",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_a_second_rat_ogre_02"
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
		name = "pwe_gameplay_another_is_bunnyjumping_01",
		response = "pwe_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_another_is_bunnyjumping_01",
		response = "pes_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_another_is_bunnyjumping_01_alt1",
		response = "pwh_gameplay_another_is_bunnyjumping_01_alt1",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_another_is_bunnyjumping_01",
		response = "pbw_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_another_is_bunnyjumping_01",
		response = "pdr_gameplay_another_is_bunnyjumping_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"bunny_trigger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_bunny_jumping",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hanging_help_ping",
		name = "pwh_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
		response = "pwh_gameplay_knocked_down_ping",
		name = "pwh_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
		response = "pwh_gameplay_player_pounced_ping",
		name = "pwh_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
		response = "pwh_gameplay_empire_soldier_grabbed_ping",
		name = "pwh_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pwh_gameplay_bright_wizard_grabbed_ping",
		name = "pwh_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pwh_gameplay_dwarf_ranger_grabbed_ping",
		name = "pwh_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pwh_gameplay_wood_elf_grabbed_ping",
		name = "pwh_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pwh_gameplay_grabbed_ping",
		name = "pwh_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"target_name",
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
		response = "pwh_gameplay_heard_empire_soldier_in_trouble_ping",
		name = "pwh_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pwh_gameplay_heard_bright_wizard_in_trouble_ping",
		name = "pwh_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pwh_gameplay_heard_wood_elf_in_trouble_ping",
		name = "pwh_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pwh_gameplay_heard_dwarf_ranger_in_trouble_ping",
		name = "pwh_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pwh_gameplay_spots_ammo_ping",
		name = "pwh_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
		response = "pwh_gameplay_spots_health_ping",
		name = "pwh_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
		response = "pwh_gameplay_healing_draught_ping",
		name = "pwh_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
		response = "pwh_gameplay_spots_potion_ping",
		name = "pwh_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
		response = "pwh_gameplay_spots_bomb_ping",
		name = "pwh_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
		response = "pwh_gameplay_seeing_a_stormvermin_ping",
		name = "pwh_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
		response = "pwh_gameplay_seeing_a_gutter_runner_ping",
		name = "pwh_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
		response = "pwh_gameplay_seeing_a_globadier_ping",
		name = "pwh_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
		response = "pwh_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pwh_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pwh_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		name = "pwh_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
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
		response = "pwh_gameplay_seeing_a_skaven_slaver_ping",
		name = "pwh_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
		response = "pwh_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pwh_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
		response = "pdr_gameplay_hanging_help_ping",
		name = "pdr_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
		response = "pdr_gameplay_knocked_down_ping",
		name = "pdr_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
		response = "pdr_gameplay_player_pounced_ping",
		name = "pdr_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
		response = "pdr_gameplay_empire_soldier_grabbed_ping",
		name = "pdr_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pdr_gameplay_witch_hunter_grabbed_ping",
		name = "pdr_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pdr_gameplay_bright_wizard_grabbed_ping",
		name = "pdr_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pdr_gameplay_wood_elf_grabbed_ping",
		name = "pdr_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pdr_gameplay_grabbed_ping",
		name = "pdr_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"target_name",
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
		response = "pdr_gameplay_heard_empire_soldier_in_trouble_ping",
		name = "pdr_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pdr_gameplay_heard_witch_hunter_in_trouble_ping",
		name = "pdr_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pdr_gameplay_heard_wood_elf_in_trouble_ping",
		name = "pdr_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pdr_gameplay_heard_bright_wizard_in_trouble_ping",
		name = "pdr_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pdr_gameplay_spots_ammo_ping",
		name = "pdr_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
		response = "pdr_gameplay_spots_health_ping",
		name = "pdr_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
		response = "pdr_gameplay_healing_draught_ping",
		name = "pdr_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
		response = "pdr_gameplay_spots_potion_ping",
		name = "pdr_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
		response = "pdr_gameplay_spots_bomb_ping",
		name = "pdr_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
		response = "pdr_gameplay_seeing_a_stormvermin_ping",
		name = "pdr_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
		response = "pdr_gameplay_seeing_a_gutter_runner_ping",
		name = "pdr_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
		response = "pdr_gameplay_seeing_a_globadier_ping",
		name = "pdr_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
		response = "pdr_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pdr_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pdr_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		name = "pdr_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
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
		response = "pdr_gameplay_seeing_a_skaven_slaver_ping",
		name = "pdr_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
		response = "pdr_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pdr_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
		response = "pwe_gameplay_hanging_help_ping",
		name = "pwe_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
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
		response = "pwe_gameplay_knocked_down_ping",
		name = "pwe_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
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
		response = "pwe_gameplay_player_pounced_ping",
		name = "pwe_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
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
		response = "pwe_gameplay_empire_soldier_grabbed_ping",
		name = "pwe_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pwe_gameplay_witch_hunter_grabbed_ping",
		name = "pwe_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pwe_gameplay_bright_wizard_grabbed_ping",
		name = "pwe_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pwe_gameplay_dwarf_ranger_grabbed_ping",
		name = "pwe_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pwe_gameplay_grabbed_ping",
		name = "pwe_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"target_name",
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
		response = "pwe_gameplay_heard_empire_soldier_in_trouble_ping",
		name = "pwe_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pwe_gameplay_heard_witch_hunter_in_trouble_ping",
		name = "pwe_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pwe_gameplay_heard_dwarf_ranger_in_trouble_ping",
		name = "pwe_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pwe_gameplay_heard_bright_wizard_in_trouble_ping",
		name = "pwe_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pwe_gameplay_spots_ammo_ping",
		name = "pwe_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
		response = "pwe_gameplay_spots_health_ping",
		name = "pwe_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
		response = "pwe_gameplay_healing_draught_ping",
		name = "pwe_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
		response = "pwe_gameplay_spots_potion_ping",
		name = "pwe_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
		response = "pwe_gameplay_spots_bomb_ping",
		name = "pwe_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
		response = "pwe_gameplay_seeing_a_stormvermin_ping",
		name = "pwe_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
		response = "pwe_gameplay_seeing_a_gutter_runner_ping",
		name = "pwe_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
		response = "pwe_gameplay_seeing_a_globadier_ping",
		name = "pwe_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
		response = "pwe_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pwe_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pwe_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		name = "pwe_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
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
		response = "pwe_gameplay_seeing_a_skaven_slaver_ping",
		name = "pwe_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
		response = "pwe_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pwe_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
		response = "pes_gameplay_hanging_help_ping",
		name = "pes_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
		response = "pes_gameplay_knocked_down_ping",
		name = "pes_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
		response = "pes_gameplay_player_pounced_ping",
		name = "pes_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
		response = "pes_gameplay_witch_hunter_grabbed_ping",
		name = "pes_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pes_gameplay_bright_wizard_grabbed_ping",
		name = "pes_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pes_gameplay_dwarf_ranger_grabbed_ping",
		name = "pes_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pes_gameplay_wood_elf_grabbed_ping",
		name = "pes_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pes_gameplay_grabbed_ping",
		name = "pes_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"target_name",
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
		response = "pes_gameplay_heard_witch_hunter_in_trouble_ping",
		name = "pes_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pes_gameplay_heard_bright_wizard_in_trouble_ping",
		name = "pes_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
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
		response = "pes_gameplay_heard_wood_elf_in_trouble_ping",
		name = "pes_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pes_gameplay_heard_dwarf_ranger_in_trouble_ping",
		name = "pes_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pes_gameplay_spots_ammo_ping",
		name = "pes_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
		response = "pes_gameplay_spots_health_ping",
		name = "pes_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
		response = "pes_gameplay_healing_draught_ping",
		name = "pes_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
		response = "pes_gameplay_spots_potion_ping",
		name = "pes_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
		response = "pes_gameplay_spots_bomb_ping",
		name = "pes_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
		response = "pes_gameplay_seeing_a_stormvermin_ping",
		name = "pes_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
		response = "pes_gameplay_seeing_a_gutter_runner_ping",
		name = "pes_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
		response = "pes_gameplay_seeing_a_globadier_ping",
		name = "pes_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
		response = "pes_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pes_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pes_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		name = "pes_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
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
		response = "pes_gameplay_seeing_a_skaven_slaver_ping",
		name = "pes_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
		response = "pes_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pes_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
		response = "pbw_gameplay_hanging_help_ping",
		name = "pbw_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
		response = "pbw_gameplay_knocked_down_ping",
		name = "pbw_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
		response = "pbw_gameplay_player_pounced_ping",
		name = "pbw_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
		response = "pbw_gameplay_empire_soldier_grabbed_ping",
		name = "pbw_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pbw_gameplay_witch_hunter_grabbed_ping",
		name = "pbw_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pbw_gameplay_dwarf_ranger_grabbed_ping",
		name = "pbw_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pbw_gameplay_wood_elf_grabbed_ping",
		name = "pbw_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pbw_gameplay_grabbed_ping",
		name = "pbw_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"target_name",
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
		response = "pbw_gameplay_heard_empire_soldier_in_trouble_ping",
		name = "pbw_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
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
		response = "pbw_gameplay_heard_witch_hunter_in_trouble_ping",
		name = "pbw_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
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
		response = "pbw_gameplay_heard_wood_elf_in_trouble_ping",
		name = "pbw_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
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
		response = "pbw_gameplay_heard_dwarf_ranger_in_trouble_ping",
		name = "pbw_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
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
		response = "pbw_gameplay_spots_ammo_ping",
		name = "pbw_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
		response = "pbw_gameplay_spots_health_ping",
		name = "pbw_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health"
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
		response = "pbw_gameplay_healing_draught_ping",
		name = "pbw_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"health_flask"
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
		response = "pbw_gameplay_spots_potion_ping",
		name = "pbw_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"potion"
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
		response = "pbw_gameplay_spots_bomb_ping",
		name = "pbw_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"bomb"
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
		response = "pbw_gameplay_seeing_a_stormvermin_ping",
		name = "pbw_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_commander"
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
		response = "pbw_gameplay_seeing_a_gutter_runner_ping",
		name = "pbw_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
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
		response = "pbw_gameplay_seeing_a_globadier_ping",
		name = "pbw_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
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
		response = "pbw_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pbw_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pbw_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		name = "pbw_gameplay_seeing_a_skaven_patrol_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
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
		response = "pbw_gameplay_seeing_a_skaven_slaver_ping",
		name = "pbw_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_pack_master"
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
		response = "pbw_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pbw_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
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
	add_dialogues({
		pes_gameplay_elf_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pdr_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01"
			}
		},
		pbw_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pes_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pwe_gameplay_response_40 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_40"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_40"
			}
		},
		pwe_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_125"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_01"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_wood_elf_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_03",
				"pes_gameplay_wood_elf_grabbed_05",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_03",
				"pes_gameplay_wood_elf_grabbed_05",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09"
			}
		},
		pwh_gameplay_hunter_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_09_reply_01"
			}
		},
		pbw_gameplay_wood_elf_grabbed_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_wood_elf_grabbed_03",
				"pbw_gameplay_wood_elf_grabbed_06",
				"pbw_gameplay_wood_elf_grabbed_07",
				"pbw_gameplay_wood_elf_grabbed_08",
				"pbw_gameplay_wood_elf_grabbed_09",
				"pbw_gameplay_wood_elf_grabbed_10",
				"pbw_gameplay_wood_elf_grabbed_11",
				"pbw_gameplay_wood_elf_grabbed_12"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_wood_elf_grabbed_03",
				"pbw_gameplay_wood_elf_grabbed_06",
				"pbw_gameplay_wood_elf_grabbed_07",
				"pbw_gameplay_wood_elf_grabbed_08",
				"pbw_gameplay_wood_elf_grabbed_09",
				"pbw_gameplay_wood_elf_grabbed_10",
				"pbw_gameplay_wood_elf_grabbed_11",
				"pbw_gameplay_wood_elf_grabbed_12"
			},
			randomize_indexes = {}
		},
		pes_gameplay_elf_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01_reply_02"
			}
		},
		pdr_gameplay_soldier_caught_by_slaver_3_times_two = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two"
			}
		},
		pes_gameplay_hunter_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			}
		},
		pbw_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_123"
			}
		},
		pes_gameplay_response_32 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_32"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_32"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pes_gameplay_heard_bright_wizard_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_03",
				"pes_gameplay_heard_bright_wizard_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_03",
				"pes_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_rat_ogre_01",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_04",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_06",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_02",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_03",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_rat_ogre_01",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_04",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_06",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_02",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_03",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_knocked_down_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_03",
				"pwh_gameplay_seeing_a_globadier_04",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_05",
				"pwh_gameplay_seeing_a_globadier_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_03",
				"pwh_gameplay_seeing_a_globadier_04",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_05",
				"pwh_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02"
			}
		},
		pbw_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_healing_draught_01",
				"pbw_gameplay_healing_draught_02",
				"pbw_gameplay_healing_draught_03",
				"pbw_gameplay_healing_draught_04",
				"pbw_gameplay_healing_draught_05",
				"pbw_gameplay_healing_draught_06",
				"pbw_gameplay_healing_draught_07",
				"pbw_gameplay_healing_draught_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_healing_draught_01",
				"pbw_gameplay_healing_draught_02",
				"pbw_gameplay_healing_draught_03",
				"pbw_gameplay_healing_draught_04",
				"pbw_gameplay_healing_draught_05",
				"pbw_gameplay_healing_draught_06",
				"pbw_gameplay_healing_draught_07",
				"pbw_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_soldier_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_reply_01"
			}
		},
		pes_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_03",
				"pes_gameplay_healing_draught_04",
				"pes_gameplay_healing_draught_05",
				"pes_gameplay_healing_draught_06",
				"pes_gameplay_healing_draught_07",
				"pes_gameplay_healing_draught_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_03",
				"pes_gameplay_healing_draught_04",
				"pes_gameplay_healing_draught_05",
				"pes_gameplay_healing_draught_06",
				"pes_gameplay_healing_draught_07",
				"pes_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pes_gameplay_elf_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_03"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_response_131 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_131"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_131"
			}
		},
		pwh_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_healing_draught_01",
				"pwh_gameplay_healing_draught_02",
				"pwh_gameplay_healing_draught_03",
				"pwh_gameplay_healing_draught_04",
				"pwh_gameplay_healing_draught_05",
				"pwh_gameplay_healing_draught_06",
				"pwh_gameplay_healing_draught_07",
				"pwh_gameplay_healing_draught_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_healing_draught_01",
				"pwh_gameplay_healing_draught_02",
				"pwh_gameplay_healing_draught_03",
				"pwh_gameplay_healing_draught_04",
				"pwh_gameplay_healing_draught_05",
				"pwh_gameplay_healing_draught_06",
				"pwh_gameplay_healing_draught_07",
				"pwh_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_healing_draught_01",
				"pwe_gameplay_healing_draught_02",
				"pwe_gameplay_healing_draught_03",
				"pwe_gameplay_healing_draught_04",
				"pwe_gameplay_healing_draught_05",
				"pwe_gameplay_healing_draught_06",
				"pwe_gameplay_healing_draught_07",
				"pwe_gameplay_healing_draught_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_healing_draught_01",
				"pwe_gameplay_healing_draught_02",
				"pwe_gameplay_healing_draught_03",
				"pwe_gameplay_healing_draught_04",
				"pwe_gameplay_healing_draught_05",
				"pwe_gameplay_healing_draught_06",
				"pwe_gameplay_healing_draught_07",
				"pwe_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_03_azsd = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_azsd"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_azsd"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pwh_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_126"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pbw_gameplay_another_is_bunnyjumping_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_another_is_bunnyjumping_01"
			}
		},
		pes_gameplay_response_119 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_119"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_119"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02"
			}
		},
		pbw_gameplay_elf_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			}
		},
		pes_gameplay_player_pounced_ping = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 10,
			sound_events = {
				"pes_gameplay_player_pounced_01",
				"pes_gameplay_player_pounced_07",
				"pes_gameplay_player_pounced_08",
				"pes_gameplay_player_pounced_09",
				"pes_gameplay_player_pounced_10",
				"pes_gameplay_player_pounced_11",
				"pes_gameplay_player_pounced_13",
				"pes_gameplay_player_pounced_14",
				"pes_gameplay_player_pounced_15",
				"pes_gameplay_player_pounced_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_player_pounced_01",
				"pes_gameplay_player_pounced_07",
				"pes_gameplay_player_pounced_08",
				"pes_gameplay_player_pounced_09",
				"pes_gameplay_player_pounced_10",
				"pes_gameplay_player_pounced_11",
				"pes_gameplay_player_pounced_13",
				"pes_gameplay_player_pounced_14",
				"pes_gameplay_player_pounced_15",
				"pes_gameplay_player_pounced_16"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02"
			}
		},
		pwe_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_39"
			}
		},
		pwh_gameplay_ranger_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_04"
			}
		},
		pwh_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_wizard_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_12"
			}
		},
		pwe_gameplay_wizard_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11_reply_01"
			}
		},
		pwh_gameplay_player_pounced_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_player_pounced_06",
				"pwh_gameplay_player_pounced_07",
				"pwh_gameplay_player_pounced_08",
				"pwh_gameplay_player_pounced_09",
				"pwh_gameplay_player_pounced_10",
				"pwh_gameplay_player_pounced_11",
				"pwh_gameplay_player_pounced_12",
				"pwh_gameplay_player_pounced_13",
				"pwh_gameplay_player_pounced_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_player_pounced_06",
				"pwh_gameplay_player_pounced_07",
				"pwh_gameplay_player_pounced_08",
				"pwh_gameplay_player_pounced_09",
				"pwh_gameplay_player_pounced_10",
				"pwh_gameplay_player_pounced_11",
				"pwh_gameplay_player_pounced_12",
				"pwh_gameplay_player_pounced_13",
				"pwh_gameplay_player_pounced_14"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_another_is_bunnyjumping_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_another_is_bunnyjumping_01"
			}
		},
		pdr_gameplay_another_is_bunnyjumping_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_another_is_bunnyjumping_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02"
			}
		},
		pbw_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_seeing_a_globadier_01",
				"pbw_gameplay_seeing_a_globadier_02",
				"pbw_gameplay_seeing_a_globadier_03",
				"pbw_gameplay_seeing_a_globadier_06",
				"pbw_gameplay_seeing_a_globadier_07",
				"pbw_gameplay_seeing_a_globadier_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_globadier_01",
				"pbw_gameplay_seeing_a_globadier_02",
				"pbw_gameplay_seeing_a_globadier_03",
				"pbw_gameplay_seeing_a_globadier_06",
				"pbw_gameplay_seeing_a_globadier_07",
				"pbw_gameplay_seeing_a_globadier_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_07",
				"pes_gameplay_seeing_a_globadier_08",
				"pes_gameplay_seeing_a_globadier_09",
				"pes_gameplay_seeing_a_globadier_10",
				"pes_gameplay_seeing_a_globadier_11"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_07",
				"pes_gameplay_seeing_a_globadier_08",
				"pes_gameplay_seeing_a_globadier_09",
				"pes_gameplay_seeing_a_globadier_10",
				"pes_gameplay_seeing_a_globadier_11"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_seeing_a_globadier_01",
				"pdr_gameplay_seeing_a_globadier_03",
				"pdr_gameplay_seeing_a_globadier_04",
				"pdr_gameplay_seeing_a_globadier_02",
				"pdr_gameplay_seeing_a_globadier_05",
				"pdr_gameplay_seeing_a_globadier_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_globadier_01",
				"pdr_gameplay_seeing_a_globadier_03",
				"pdr_gameplay_seeing_a_globadier_04",
				"pdr_gameplay_seeing_a_globadier_02",
				"pdr_gameplay_seeing_a_globadier_05",
				"pdr_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_bright_wizard_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_bright_wizard_in_trouble_01",
				"pwh_gameplay_heard_bright_wizard_in_trouble_02",
				"pwh_gameplay_heard_bright_wizard_in_trouble_03",
				"pwh_gameplay_heard_bright_wizard_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_heard_bright_wizard_in_trouble_01",
				"pwh_gameplay_heard_bright_wizard_in_trouble_02",
				"pwh_gameplay_heard_bright_wizard_in_trouble_03",
				"pwh_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_39"
			}
		},
		pes_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pes_gameplay_response_116 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_116"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_116"
			}
		},
		pwh_gameplay_spots_potion_ping = {
			sound_events_n = 15,
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 15,
			sound_events = {
				"pwh_gameplay_spots_potion_01",
				"pwh_gameplay_spots_potion_07",
				"pwh_gameplay_spots_potion_08",
				"pwh_gameplay_spots_potion_09",
				"pwh_gameplay_spots_potion_10",
				"pwh_gameplay_spots_potion_11",
				"pwh_gameplay_spots_potion_12",
				"pwh_gameplay_spots_potion_13",
				"pwh_gameplay_spots_potion_14",
				"pwh_gameplay_spots_potion_15",
				"pwh_gameplay_spots_potion_16",
				"pwh_gameplay_spots_potion_17",
				"pwh_gameplay_spots_potion_18",
				"pwh_gameplay_spots_potion_19",
				"pwh_gameplay_spots_potion_20"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_potion_01",
				"pwh_gameplay_spots_potion_07",
				"pwh_gameplay_spots_potion_08",
				"pwh_gameplay_spots_potion_09",
				"pwh_gameplay_spots_potion_10",
				"pwh_gameplay_spots_potion_11",
				"pwh_gameplay_spots_potion_12",
				"pwh_gameplay_spots_potion_13",
				"pwh_gameplay_spots_potion_14",
				"pwh_gameplay_spots_potion_15",
				"pwh_gameplay_spots_potion_16",
				"pwh_gameplay_spots_potion_17",
				"pwh_gameplay_spots_potion_18",
				"pwh_gameplay_spots_potion_19",
				"pwh_gameplay_spots_potion_20"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_soldier_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pbw_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_slaver_01",
				"pbw_gameplay_seeing_a_skaven_slaver_02",
				"pbw_gameplay_seeing_a_skaven_slaver_07",
				"pbw_gameplay_seeing_a_skaven_slaver_03",
				"pbw_gameplay_seeing_a_skaven_slaver_04",
				"pbw_gameplay_seeing_a_skaven_slaver_05",
				"pbw_gameplay_seeing_a_skaven_slaver_06",
				"pbw_gameplay_seeing_a_skaven_slaver_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_slaver_01",
				"pbw_gameplay_seeing_a_skaven_slaver_02",
				"pbw_gameplay_seeing_a_skaven_slaver_07",
				"pbw_gameplay_seeing_a_skaven_slaver_03",
				"pbw_gameplay_seeing_a_skaven_slaver_04",
				"pbw_gameplay_seeing_a_skaven_slaver_05",
				"pbw_gameplay_seeing_a_skaven_slaver_06",
				"pbw_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_127"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pes_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_07",
				"pes_gameplay_seeing_a_skaven_slaver_03",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_05",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_skaven_slaver_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_07",
				"pes_gameplay_seeing_a_skaven_slaver_03",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_05",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_slaver_01",
				"pdr_gameplay_seeing_a_skaven_slaver_02",
				"pdr_gameplay_seeing_a_skaven_slaver_07",
				"pdr_gameplay_seeing_a_skaven_slaver_03",
				"pdr_gameplay_seeing_a_skaven_slaver_04",
				"pdr_gameplay_seeing_a_skaven_slaver_05",
				"pdr_gameplay_seeing_a_skaven_slaver_06",
				"pdr_gameplay_seeing_a_skaven_slaver_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_slaver_01",
				"pdr_gameplay_seeing_a_skaven_slaver_02",
				"pdr_gameplay_seeing_a_skaven_slaver_07",
				"pdr_gameplay_seeing_a_skaven_slaver_03",
				"pdr_gameplay_seeing_a_skaven_slaver_04",
				"pdr_gameplay_seeing_a_skaven_slaver_05",
				"pdr_gameplay_seeing_a_skaven_slaver_06",
				"pdr_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_potion_ping = {
			sound_events_n = 11,
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 11,
			sound_events = {
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_02",
				"pwe_gameplay_spots_potion_03",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_02",
				"pwe_gameplay_spots_potion_03",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_ranger_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01"
			}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_04"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_01"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pwh_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_slaver_01",
				"pwh_gameplay_seeing_a_skaven_slaver_02",
				"pwh_gameplay_seeing_a_skaven_slaver_07",
				"pwh_gameplay_seeing_a_skaven_slaver_03",
				"pwh_gameplay_seeing_a_skaven_slaver_04",
				"pwh_gameplay_seeing_a_skaven_slaver_05",
				"pwh_gameplay_seeing_a_skaven_slaver_06",
				"pwh_gameplay_seeing_a_skaven_slaver_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_slaver_01",
				"pwh_gameplay_seeing_a_skaven_slaver_02",
				"pwh_gameplay_seeing_a_skaven_slaver_07",
				"pwh_gameplay_seeing_a_skaven_slaver_03",
				"pwh_gameplay_seeing_a_skaven_slaver_04",
				"pwh_gameplay_seeing_a_skaven_slaver_05",
				"pwh_gameplay_seeing_a_skaven_slaver_06",
				"pwh_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_053 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_053"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_053"
			}
		},
		pes_gameplay_wizard_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_12_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03"
			}
		},
		pdr_gameplay_soldier_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11"
			}
		},
		pwe_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_124"
			}
		},
		pbw_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01"
			}
		},
		pbw_gameplay_heard_witch_hunter_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_heard_witch_hunter_in_trouble_04",
				"pbw_gameplay_heard_witch_hunter_in_trouble_05",
				"pbw_gameplay_heard_witch_hunter_in_trouble_06",
				"pbw_gameplay_heard_witch_hunter_in_trouble_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_heard_witch_hunter_in_trouble_04",
				"pbw_gameplay_heard_witch_hunter_in_trouble_05",
				"pbw_gameplay_heard_witch_hunter_in_trouble_06",
				"pbw_gameplay_heard_witch_hunter_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03"
			}
		},
		pwh_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_response_044 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_044"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_044"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pwe_gameplay_heard_witch_hunter_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_witch_hunter_in_trouble_01",
				"pwe_gameplay_heard_witch_hunter_in_trouble_02",
				"pwe_gameplay_heard_witch_hunter_in_trouble_03",
				"pwe_gameplay_heard_witch_hunter_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_heard_witch_hunter_in_trouble_01",
				"pwe_gameplay_heard_witch_hunter_in_trouble_02",
				"pwe_gameplay_heard_witch_hunter_in_trouble_03",
				"pwe_gameplay_heard_witch_hunter_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwe_gameplay_hunter_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pbw_gameplay_hunter_kills_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
			}
		},
		pwe_gameplay_spots_health_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_02",
				"pwe_gameplay_spots_health_03",
				"pwe_gameplay_spots_health_04",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_01"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_02",
				"pwe_gameplay_spots_health_03",
				"pwe_gameplay_spots_health_04",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_hanging_help_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_soldier_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_08_reply_01"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pwe_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_elf_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12_reply_01"
			}
		},
		pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			}
		},
		pbw_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_hunter_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05"
			}
		},
		pbw_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_seeing_a_gutter_runner_01",
				"pbw_gameplay_seeing_a_gutter_runner_02",
				"pbw_gameplay_seeing_a_gutter_runner_03",
				"pbw_gameplay_seeing_a_gutter_runner_04",
				"pbw_gameplay_seeing_a_gutter_runner_05",
				"pbw_gameplay_seeing_a_gutter_runner_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_gutter_runner_01",
				"pbw_gameplay_seeing_a_gutter_runner_02",
				"pbw_gameplay_seeing_a_gutter_runner_03",
				"pbw_gameplay_seeing_a_gutter_runner_04",
				"pbw_gameplay_seeing_a_gutter_runner_05",
				"pbw_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_ranger_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12"
			}
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_126"
			}
		},
		pbw_gameplay_ranger_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_09"
			}
		},
		pes_gameplay_soldier_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_08_reply_01"
			}
		},
		pdr_gameplay_wizard_kills_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01"
			}
		},
		pes_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hunter_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02"
			}
		},
		pwe_gameplay_dwarf_picks_up_a_bomb = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_dwarf_picks_up_a_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_dwarf_picks_up_a_bomb_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07"
			}
		},
		pbw_gameplay_hunter_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_02"
			}
		},
		pdr_gameplay_response_132 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_132"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_132"
			}
		},
		pwe_gameplay_hunter_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_12"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_05"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pwh_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pwe_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_02"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02"
			}
		},
		pbw_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_hunter_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08"
			}
		},
		pwh_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_123"
			}
		},
		pwh_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_bomb_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_02",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_04",
				"pwe_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_02",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_04",
				"pwe_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_heard_empire_soldier_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_heard_empire_soldier_in_trouble_03",
				"pbw_gameplay_heard_empire_soldier_in_trouble_05",
				"pbw_gameplay_heard_empire_soldier_in_trouble_06",
				"pbw_gameplay_heard_empire_soldier_in_trouble_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_heard_empire_soldier_in_trouble_03",
				"pbw_gameplay_heard_empire_soldier_in_trouble_05",
				"pbw_gameplay_heard_empire_soldier_in_trouble_06",
				"pbw_gameplay_heard_empire_soldier_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_heard_empire_soldier_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_heard_empire_soldier_in_trouble_01",
				"pdr_gameplay_heard_empire_soldier_in_trouble_02",
				"pdr_gameplay_heard_empire_soldier_in_trouble_03",
				"pdr_gameplay_heard_empire_soldier_in_trouble_04",
				"pdr_gameplay_heard_empire_soldier_in_trouble_05",
				"pdr_gameplay_heard_empire_soldier_in_trouble_06",
				"pdr_gameplay_heard_empire_soldier_in_trouble_07",
				"pdr_gameplay_heard_empire_soldier_in_trouble_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_heard_empire_soldier_in_trouble_01",
				"pdr_gameplay_heard_empire_soldier_in_trouble_02",
				"pdr_gameplay_heard_empire_soldier_in_trouble_03",
				"pdr_gameplay_heard_empire_soldier_in_trouble_04",
				"pdr_gameplay_heard_empire_soldier_in_trouble_05",
				"pdr_gameplay_heard_empire_soldier_in_trouble_06",
				"pdr_gameplay_heard_empire_soldier_in_trouble_07",
				"pdr_gameplay_heard_empire_soldier_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_downed_3_times_11_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_11_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_11_reply_02"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			}
		},
		pwe_gameplay_heard_empire_soldier_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_empire_soldier_in_trouble_01",
				"pwe_gameplay_heard_empire_soldier_in_trouble_02",
				"pwe_gameplay_heard_empire_soldier_in_trouble_03",
				"pwe_gameplay_heard_empire_soldier_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_heard_empire_soldier_in_trouble_01",
				"pwe_gameplay_heard_empire_soldier_in_trouble_02",
				"pwe_gameplay_heard_empire_soldier_in_trouble_03",
				"pwe_gameplay_heard_empire_soldier_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_empire_soldier_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_02",
				"pwh_gameplay_heard_empire_soldier_in_trouble_03",
				"pwh_gameplay_heard_empire_soldier_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_02",
				"pwh_gameplay_heard_empire_soldier_in_trouble_03",
				"pwh_gameplay_heard_empire_soldier_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hunter_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07"
			}
		},
		pes_gameplay_spots_ammo_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_03",
				"pes_gameplay_spots_ammo_04",
				"pes_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_03",
				"pes_gameplay_spots_ammo_04",
				"pes_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hunter_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_03"
			}
		},
		pdr_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pdr_gameplay_spots_ammo_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_spots_ammo_01",
				"pdr_gameplay_spots_ammo_02",
				"pdr_gameplay_spots_ammo_03",
				"pdr_gameplay_spots_ammo_04",
				"pdr_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_ammo_01",
				"pdr_gameplay_spots_ammo_02",
				"pdr_gameplay_spots_ammo_03",
				"pdr_gameplay_spots_ammo_04",
				"pdr_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_045 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_045"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_045"
			}
		},
		pdr_gameplay_grabbed_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_elf_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13"
			}
		},
		pwe_gameplay_hunter_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13"
			}
		},
		pbw_gameplay_soldier_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_08"
			}
		},
		pes_gameplay_wizard_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_06"
			}
		},
		pdr_gameplay_wizard_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_10"
			}
		},
		pbw_gameplay_response_37 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_37"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_37"
			}
		},
		pwh_gameplay_response_044 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_044"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_044"
			}
		},
		pdr_gameplay_ranger_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_08_reply_01"
			}
		},
		pes_gameplay_ranger_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_09_reply_01"
			}
		},
		pbw_gameplay_ranger_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07_reply_01"
			}
		},
		pwe_gameplay_response_054 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_054"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_054"
			}
		},
		pbw_gameplay_hanging_help_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hunter_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			}
		},
		pwh_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_stormvermin_01",
				"pwh_gameplay_seeing_a_stormvermin_02",
				"pwh_gameplay_seeing_a_stormvermin_03",
				"pwh_gameplay_seeing_a_stormvermin_04",
				"pwh_gameplay_seeing_a_stormvermin_05",
				"pwh_gameplay_seeing_a_stormvermin_06",
				"pwh_gameplay_seeing_a_stormvermin_07",
				"pwh_gameplay_seeing_a_stormvermin_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_stormvermin_01",
				"pwh_gameplay_seeing_a_stormvermin_02",
				"pwh_gameplay_seeing_a_stormvermin_03",
				"pwh_gameplay_seeing_a_stormvermin_04",
				"pwh_gameplay_seeing_a_stormvermin_05",
				"pwh_gameplay_seeing_a_stormvermin_06",
				"pwh_gameplay_seeing_a_stormvermin_07",
				"pwh_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			}
		},
		pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pbw_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_seeing_a_stormvermin_01",
				"pbw_gameplay_seeing_a_stormvermin_02",
				"pbw_gameplay_seeing_a_stormvermin_03",
				"pbw_gameplay_seeing_a_stormvermin_04",
				"pbw_gameplay_seeing_a_stormvermin_05",
				"pbw_gameplay_seeing_a_stormvermin_06",
				"pbw_gameplay_seeing_a_stormvermin_07",
				"pbw_gameplay_seeing_a_stormvermin_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_stormvermin_01",
				"pbw_gameplay_seeing_a_stormvermin_02",
				"pbw_gameplay_seeing_a_stormvermin_03",
				"pbw_gameplay_seeing_a_stormvermin_04",
				"pbw_gameplay_seeing_a_stormvermin_05",
				"pbw_gameplay_seeing_a_stormvermin_06",
				"pbw_gameplay_seeing_a_stormvermin_07",
				"pbw_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_stormvermin_01",
				"pes_gameplay_seeing_a_stormvermin_02",
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_04",
				"pes_gameplay_seeing_a_stormvermin_05",
				"pes_gameplay_seeing_a_stormvermin_06",
				"pes_gameplay_seeing_a_stormvermin_07",
				"pes_gameplay_seeing_a_stormvermin_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_stormvermin_01",
				"pes_gameplay_seeing_a_stormvermin_02",
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_04",
				"pes_gameplay_seeing_a_stormvermin_05",
				"pes_gameplay_seeing_a_stormvermin_06",
				"pes_gameplay_seeing_a_stormvermin_07",
				"pes_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pbw_gameplay_spots_potion_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_spots_potion_01",
				"pbw_gameplay_spots_potion_02",
				"pbw_gameplay_spots_potion_03",
				"pbw_gameplay_spots_potion_04",
				"pbw_gameplay_spots_potion_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_potion_01",
				"pbw_gameplay_spots_potion_02",
				"pbw_gameplay_spots_potion_03",
				"pbw_gameplay_spots_potion_04",
				"pbw_gameplay_spots_potion_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_116 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_116"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_116"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_04"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pdr_gameplay_soldier_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_09"
			}
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03"
			}
		},
		pes_gameplay_hunter_hit_by_goo_thrice = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_hit_by_goo_thrice"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_hit_by_goo_thrice"
			}
		},
		pwe_gameplay_soldier_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13_reply_01"
			}
		},
		pes_gameplay_knocked_down_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_knocked_down_02",
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_knocked_down_02",
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_soldier_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_02"
			}
		},
		pes_gameplay_response_114 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_114"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_114"
			}
		},
		pbw_gameplay_hunter_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pdr_gameplay_hunter_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_ranger_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06"
			}
		},
		pbw_gameplay_soldier_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_06"
			}
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_02"
			}
		},
		pwe_gameplay_response_056 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_056"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_056"
			}
		},
		pdr_gameplay_wizard_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_08"
			}
		},
		pes_gameplay_elf_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_10"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pbw_gameplay_hunter_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_04"
			}
		},
		pes_gameplay_grabbed_ping = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 3,
			sound_events = {
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_response_117 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_117"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_117"
			}
		},
		pwh_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pdr_gameplay_knocked_down_ping = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pdr_gameplay_knocked_down_01",
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_03",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_05",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pdr_gameplay_knocked_down_01",
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_03",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_05",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wizard_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			}
		},
		pbw_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_rat_ogre_01",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_04",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_06",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_02",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_03",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_rat_ogre_01",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_04",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_06",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_02",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_03",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_spots_bomb_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_spots_bomb_01",
				"pbw_gameplay_spots_bomb_02",
				"pbw_gameplay_spots_bomb_03",
				"pbw_gameplay_spots_bomb_04",
				"pbw_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_bomb_01",
				"pbw_gameplay_spots_bomb_02",
				"pbw_gameplay_spots_bomb_03",
				"pbw_gameplay_spots_bomb_04",
				"pbw_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_117 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_117"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_117"
			}
		},
		pbw_gameplay_spots_health_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_spots_health_01",
				"pbw_gameplay_spots_health_02",
				"pbw_gameplay_spots_health_03",
				"pbw_gameplay_spots_health_04",
				"pbw_gameplay_spots_health_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_health_01",
				"pbw_gameplay_spots_health_02",
				"pbw_gameplay_spots_health_03",
				"pbw_gameplay_spots_health_04",
				"pbw_gameplay_spots_health_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_spots_ammo_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_spots_ammo_01",
				"pbw_gameplay_spots_ammo_02",
				"pbw_gameplay_spots_ammo_03",
				"pbw_gameplay_spots_ammo_04",
				"pbw_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_ammo_01",
				"pbw_gameplay_spots_ammo_02",
				"pbw_gameplay_spots_ammo_03",
				"pbw_gameplay_spots_ammo_04",
				"pbw_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_response_113 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_113"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_113"
			}
		},
		pbw_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_127"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pwh_gameplay_spots_ammo_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_02",
				"pwh_gameplay_spots_ammo_03",
				"pwh_gameplay_spots_ammo_04",
				"pwh_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_02",
				"pwh_gameplay_spots_ammo_03",
				"pwh_gameplay_spots_ammo_04",
				"pwh_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_elf_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pbw_gameplay_empire_soldier_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_empire_soldier_grabbed_01",
				"pbw_gameplay_empire_soldier_grabbed_02",
				"pbw_gameplay_empire_soldier_grabbed_03",
				"pbw_gameplay_empire_soldier_grabbed_04",
				"pbw_gameplay_empire_soldier_grabbed_05",
				"pbw_gameplay_empire_soldier_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_empire_soldier_grabbed_01",
				"pbw_gameplay_empire_soldier_grabbed_02",
				"pbw_gameplay_empire_soldier_grabbed_03",
				"pbw_gameplay_empire_soldier_grabbed_04",
				"pbw_gameplay_empire_soldier_grabbed_05",
				"pbw_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_player_pounced_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_player_pounced_05",
				"pbw_gameplay_player_pounced_07",
				"pbw_gameplay_player_pounced_08",
				"pbw_gameplay_player_pounced_09",
				"pbw_gameplay_player_pounced_10",
				"pbw_gameplay_player_pounced_11",
				"pbw_gameplay_player_pounced_12",
				"pbw_gameplay_player_pounced_13"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_player_pounced_05",
				"pbw_gameplay_player_pounced_07",
				"pbw_gameplay_player_pounced_08",
				"pbw_gameplay_player_pounced_09",
				"pbw_gameplay_player_pounced_10",
				"pbw_gameplay_player_pounced_11",
				"pbw_gameplay_player_pounced_12",
				"pbw_gameplay_player_pounced_13"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_ranger_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_04_reply_01"
			}
		},
		pwh_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_38"
			}
		},
		pes_gameplay_seeing_a_skaven_patrol_stormvermin_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_concerned",
				"face_concerned",
				"face_contempt",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_skaven_rat_ogre_04",
				"pes_gameplay_seeing_a_skaven_rat_ogre_06",
				"pes_gameplay_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_seeing_a_skaven_rat_ogre_03",
				"pes_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_skaven_rat_ogre_04",
				"pes_gameplay_seeing_a_skaven_rat_ogre_06",
				"pes_gameplay_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_seeing_a_skaven_rat_ogre_03",
				"pes_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_seeing_a_gutter_runner_01",
				"pes_gameplay_seeing_a_gutter_runner_02",
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_04",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_gutter_runner_01",
				"pes_gameplay_seeing_a_gutter_runner_02",
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_04",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_wizard_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02"
			}
		},
		pdr_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_38"
			}
		},
		pes_gameplay_spots_health_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_02",
				"pes_gameplay_spots_health_03",
				"pes_gameplay_spots_health_04",
				"pes_gameplay_spots_health_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_02",
				"pes_gameplay_spots_health_03",
				"pes_gameplay_spots_health_04",
				"pes_gameplay_spots_health_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_wood_elf_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_wood_elf_in_trouble_01",
				"pes_gameplay_heard_wood_elf_in_trouble_02",
				"pes_gameplay_heard_wood_elf_in_trouble_03",
				"pes_gameplay_heard_wood_elf_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_heard_wood_elf_in_trouble_01",
				"pes_gameplay_heard_wood_elf_in_trouble_02",
				"pes_gameplay_heard_wood_elf_in_trouble_03",
				"pes_gameplay_heard_wood_elf_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_witch_hunter_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_02",
				"pes_gameplay_heard_witch_hunter_in_trouble_03",
				"pes_gameplay_heard_witch_hunter_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_02",
				"pes_gameplay_heard_witch_hunter_in_trouble_03",
				"pes_gameplay_heard_witch_hunter_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_wizard_downed_3_times_14_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_14_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_14_reply_01"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_14 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14"
			}
		},
		pbw_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pwh_gameplay_spots_health_ping = {
			sound_events_n = 22,
			randomize_indexes_n = 0,
			face_animations_n = 22,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 22,
			sound_events = {
				"pwh_gameplay_spots_health_01",
				"pwh_gameplay_spots_health_02",
				"pwh_gameplay_spots_health_03",
				"pwh_gameplay_spots_health_04",
				"pwh_gameplay_spots_health_05",
				"pwh_gameplay_spots_health_06",
				"pwh_gameplay_spots_health_07",
				"pwh_gameplay_spots_health_08",
				"pwh_gameplay_spots_health_09",
				"pwh_gameplay_spots_health_10",
				"pwh_gameplay_spots_health_11",
				"pwh_gameplay_spots_health_12",
				"pwh_gameplay_spots_health_13",
				"pwh_gameplay_spots_health_14",
				"pwh_gameplay_spots_health_15",
				"pwh_gameplay_spots_health_16",
				"pwh_gameplay_spots_health_17",
				"pwh_gameplay_spots_health_18",
				"pwh_gameplay_spots_health_19",
				"pwh_gameplay_spots_health_20",
				"pwh_gameplay_spots_health_21",
				"pwh_gameplay_spots_health_22"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_health_01",
				"pwh_gameplay_spots_health_02",
				"pwh_gameplay_spots_health_03",
				"pwh_gameplay_spots_health_04",
				"pwh_gameplay_spots_health_05",
				"pwh_gameplay_spots_health_06",
				"pwh_gameplay_spots_health_07",
				"pwh_gameplay_spots_health_08",
				"pwh_gameplay_spots_health_09",
				"pwh_gameplay_spots_health_10",
				"pwh_gameplay_spots_health_11",
				"pwh_gameplay_spots_health_12",
				"pwh_gameplay_spots_health_13",
				"pwh_gameplay_spots_health_14",
				"pwh_gameplay_spots_health_15",
				"pwh_gameplay_spots_health_16",
				"pwh_gameplay_spots_health_17",
				"pwh_gameplay_spots_health_18",
				"pwh_gameplay_spots_health_19",
				"pwh_gameplay_spots_health_20",
				"pwh_gameplay_spots_health_21",
				"pwh_gameplay_spots_health_22"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hanging_help_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_elf_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_05"
			}
		},
		pdr_gameplay_hanging_help_ping = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_130 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_130"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_130"
			}
		},
		pwe_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_slaver_01",
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_skaven_slaver_07",
				"pwe_gameplay_seeing_a_skaven_slaver_03",
				"pwe_gameplay_seeing_a_skaven_slaver_04",
				"pwe_gameplay_seeing_a_skaven_slaver_05",
				"pwe_gameplay_seeing_a_skaven_slaver_06",
				"pwe_gameplay_seeing_a_skaven_slaver_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_slaver_01",
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_skaven_slaver_07",
				"pwe_gameplay_seeing_a_skaven_slaver_03",
				"pwe_gameplay_seeing_a_skaven_slaver_04",
				"pwe_gameplay_seeing_a_skaven_slaver_05",
				"pwe_gameplay_seeing_a_skaven_slaver_06",
				"pwe_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_skaven_patrol_stormvermin_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_concerned",
				"face_concerned",
				"face_contempt",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_empire_soldier_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_empire_soldier_grabbed_01",
				"pdr_gameplay_empire_soldier_grabbed_02",
				"pdr_gameplay_empire_soldier_grabbed_03",
				"pdr_gameplay_empire_soldier_grabbed_04",
				"pdr_gameplay_empire_soldier_grabbed_05",
				"pdr_gameplay_empire_soldier_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_empire_soldier_grabbed_01",
				"pdr_gameplay_empire_soldier_grabbed_02",
				"pdr_gameplay_empire_soldier_grabbed_03",
				"pdr_gameplay_empire_soldier_grabbed_04",
				"pdr_gameplay_empire_soldier_grabbed_05",
				"pdr_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_ranger_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13_reply_01"
			}
		},
		pbw_gameplay_ranger_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_01"
			}
		},
		pwe_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_03",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_05",
				"pwe_gameplay_seeing_a_globadier_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_03",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_05",
				"pwe_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_123"
			}
		},
		pes_gameplay_response_118 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_118"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_118"
			}
		},
		pdr_gameplay_wizard_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09_reply_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pwe_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_02",
				"pwe_gameplay_seeing_a_gutter_runner_03",
				"pwe_gameplay_seeing_a_gutter_runner_04",
				"pwe_gameplay_seeing_a_gutter_runner_05",
				"pwe_gameplay_seeing_a_gutter_runner_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_02",
				"pwe_gameplay_seeing_a_gutter_runner_03",
				"pwe_gameplay_seeing_a_gutter_runner_04",
				"pwe_gameplay_seeing_a_gutter_runner_05",
				"pwe_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_128 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_128"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_128"
			}
		},
		pwe_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_stormvermin_01",
				"pwe_gameplay_seeing_a_stormvermin_02",
				"pwe_gameplay_seeing_a_stormvermin_03",
				"pwe_gameplay_seeing_a_stormvermin_04",
				"pwe_gameplay_seeing_a_stormvermin_05",
				"pwe_gameplay_seeing_a_stormvermin_06",
				"pwe_gameplay_seeing_a_stormvermin_07",
				"pwe_gameplay_seeing_a_stormvermin_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_stormvermin_01",
				"pwe_gameplay_seeing_a_stormvermin_02",
				"pwe_gameplay_seeing_a_stormvermin_03",
				"pwe_gameplay_seeing_a_stormvermin_04",
				"pwe_gameplay_seeing_a_stormvermin_05",
				"pwe_gameplay_seeing_a_stormvermin_06",
				"pwe_gameplay_seeing_a_stormvermin_07",
				"pwe_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_i_will_tank = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 12,
			sound_events = {
				"pes_gameplay_i_will_tank_05",
				"pes_gameplay_i_will_tank_06",
				"pes_gameplay_i_will_tank_07",
				"pes_gameplay_i_will_tank_08",
				"pes_gameplay_i_will_tank_09",
				"pes_gameplay_i_will_tank_10",
				"pes_gameplay_i_will_tank_11",
				"pes_gameplay_i_will_tank_12",
				"pes_gameplay_i_will_tank_13",
				"pes_gameplay_i_will_tank_14",
				"pes_gameplay_i_will_tank_15",
				"pes_gameplay_i_will_tank_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_i_will_tank_05",
				"pes_gameplay_i_will_tank_06",
				"pes_gameplay_i_will_tank_07",
				"pes_gameplay_i_will_tank_08",
				"pes_gameplay_i_will_tank_09",
				"pes_gameplay_i_will_tank_10",
				"pes_gameplay_i_will_tank_11",
				"pes_gameplay_i_will_tank_12",
				"pes_gameplay_i_will_tank_13",
				"pes_gameplay_i_will_tank_14",
				"pes_gameplay_i_will_tank_15",
				"pes_gameplay_i_will_tank_16"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wizard_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_05_reply_01"
			}
		},
		pwe_gameplay_spots_ammo_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_03",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_04",
				"pwe_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_03",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_04",
				"pwe_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_elf_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_heard_bright_wizard_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_bright_wizard_in_trouble_01",
				"pwe_gameplay_heard_bright_wizard_in_trouble_02",
				"pwe_gameplay_heard_bright_wizard_in_trouble_03",
				"pwe_gameplay_heard_bright_wizard_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_heard_bright_wizard_in_trouble_01",
				"pwe_gameplay_heard_bright_wizard_in_trouble_02",
				"pwe_gameplay_heard_bright_wizard_in_trouble_03",
				"pwe_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_empire_soldier_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_empire_soldier_grabbed_01",
				"pwh_gameplay_empire_soldier_grabbed_02",
				"pwh_gameplay_empire_soldier_grabbed_03",
				"pwh_gameplay_empire_soldier_grabbed_04",
				"pwh_gameplay_empire_soldier_grabbed_05",
				"pwh_gameplay_empire_soldier_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_empire_soldier_grabbed_01",
				"pwh_gameplay_empire_soldier_grabbed_02",
				"pwh_gameplay_empire_soldier_grabbed_03",
				"pwh_gameplay_empire_soldier_grabbed_04",
				"pwh_gameplay_empire_soldier_grabbed_05",
				"pwh_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_elf_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_grabbed_ping = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 3,
			sound_events = {
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dwarf_ranger_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_dwarf_ranger_grabbed_01",
				"pwe_gameplay_dwarf_ranger_grabbed_02",
				"pwe_gameplay_dwarf_ranger_grabbed_03",
				"pwe_gameplay_dwarf_ranger_grabbed_04",
				"pwe_gameplay_dwarf_ranger_grabbed_05",
				"pwe_gameplay_dwarf_ranger_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_dwarf_ranger_grabbed_01",
				"pwe_gameplay_dwarf_ranger_grabbed_02",
				"pwe_gameplay_dwarf_ranger_grabbed_03",
				"pwe_gameplay_dwarf_ranger_grabbed_04",
				"pwe_gameplay_dwarf_ranger_grabbed_05",
				"pwe_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_spots_health_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_spots_health_01",
				"pdr_gameplay_spots_health_02",
				"pdr_gameplay_spots_health_03",
				"pdr_gameplay_spots_health_04",
				"pdr_gameplay_spots_health_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_health_01",
				"pdr_gameplay_spots_health_02",
				"pdr_gameplay_spots_health_03",
				"pdr_gameplay_spots_health_04",
				"pdr_gameplay_spots_health_05"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_response_122 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_122"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_122"
			}
		},
		pwh_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_hit_by_goo_thrice_02"
			}
		},
		pwe_gameplay_empire_soldier_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_empire_soldier_grabbed_01",
				"pwe_gameplay_empire_soldier_grabbed_02",
				"pwe_gameplay_empire_soldier_grabbed_03",
				"pwe_gameplay_empire_soldier_grabbed_04",
				"pwe_gameplay_empire_soldier_grabbed_05",
				"pwe_gameplay_empire_soldier_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_empire_soldier_grabbed_01",
				"pwe_gameplay_empire_soldier_grabbed_02",
				"pwe_gameplay_empire_soldier_grabbed_03",
				"pwe_gameplay_empire_soldier_grabbed_04",
				"pwe_gameplay_empire_soldier_grabbed_05",
				"pwe_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_player_pounced_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_player_pounced_07",
				"pwe_gameplay_player_pounced_08",
				"pwe_gameplay_player_pounced_09",
				"pwe_gameplay_player_pounced_10",
				"pwe_gameplay_player_pounced_11",
				"pwe_gameplay_player_pounced_12",
				"pwe_gameplay_player_pounced_13",
				"pwe_gameplay_player_pounced_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_player_pounced_07",
				"pwe_gameplay_player_pounced_08",
				"pwe_gameplay_player_pounced_09",
				"pwe_gameplay_player_pounced_10",
				"pwe_gameplay_player_pounced_11",
				"pwe_gameplay_player_pounced_12",
				"pwe_gameplay_player_pounced_13",
				"pwe_gameplay_player_pounced_14"
			},
			randomize_indexes = {}
		},
		pes_gameplay_soldier_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_hanging_help_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pdr_gameplay_seeing_a_skaven_patrol_stormvermin_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_concerned",
				"face_concerned",
				"face_contempt",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_seeing_a_gutter_runner_01",
				"pdr_gameplay_seeing_a_gutter_runner_02",
				"pdr_gameplay_seeing_a_gutter_runner_03",
				"pdr_gameplay_seeing_a_gutter_runner_04",
				"pdr_gameplay_seeing_a_gutter_runner_05",
				"pdr_gameplay_seeing_a_gutter_runner_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_gutter_runner_01",
				"pdr_gameplay_seeing_a_gutter_runner_02",
				"pdr_gameplay_seeing_a_gutter_runner_03",
				"pdr_gameplay_seeing_a_gutter_runner_04",
				"pdr_gameplay_seeing_a_gutter_runner_05",
				"pdr_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_seeing_a_stormvermin_01",
				"pdr_gameplay_seeing_a_stormvermin_02",
				"pdr_gameplay_seeing_a_stormvermin_03",
				"pdr_gameplay_seeing_a_stormvermin_04",
				"pdr_gameplay_seeing_a_stormvermin_05",
				"pdr_gameplay_seeing_a_stormvermin_06",
				"pdr_gameplay_seeing_a_stormvermin_07",
				"pdr_gameplay_seeing_a_stormvermin_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_stormvermin_01",
				"pdr_gameplay_seeing_a_stormvermin_02",
				"pdr_gameplay_seeing_a_stormvermin_03",
				"pdr_gameplay_seeing_a_stormvermin_04",
				"pdr_gameplay_seeing_a_stormvermin_05",
				"pdr_gameplay_seeing_a_stormvermin_06",
				"pdr_gameplay_seeing_a_stormvermin_07",
				"pdr_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_spots_bomb_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_spots_bomb_01",
				"pdr_gameplay_spots_bomb_02",
				"pdr_gameplay_spots_bomb_03",
				"pdr_gameplay_spots_bomb_04",
				"pdr_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_bomb_01",
				"pdr_gameplay_spots_bomb_02",
				"pdr_gameplay_spots_bomb_03",
				"pdr_gameplay_spots_bomb_04",
				"pdr_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_spots_potion_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_spots_potion_01",
				"pdr_gameplay_spots_potion_02",
				"pdr_gameplay_spots_potion_03",
				"pdr_gameplay_spots_potion_04",
				"pdr_gameplay_spots_potion_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_potion_01",
				"pdr_gameplay_spots_potion_02",
				"pdr_gameplay_spots_potion_03",
				"pdr_gameplay_spots_potion_04",
				"pdr_gameplay_spots_potion_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_healing_draught_01",
				"pdr_gameplay_healing_draught_02",
				"pdr_gameplay_healing_draught_03",
				"pdr_gameplay_healing_draught_04",
				"pdr_gameplay_healing_draught_05",
				"pdr_gameplay_healing_draught_06",
				"pdr_gameplay_healing_draught_07",
				"pdr_gameplay_healing_draught_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_healing_draught_01",
				"pdr_gameplay_healing_draught_02",
				"pdr_gameplay_healing_draught_03",
				"pdr_gameplay_healing_draught_04",
				"pdr_gameplay_healing_draught_05",
				"pdr_gameplay_healing_draught_06",
				"pdr_gameplay_healing_draught_07",
				"pdr_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bright_wizard_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_bright_wizard_grabbed_01",
				"pwe_gameplay_bright_wizard_grabbed_02",
				"pwe_gameplay_bright_wizard_grabbed_03",
				"pwe_gameplay_bright_wizard_grabbed_04",
				"pwe_gameplay_bright_wizard_grabbed_05",
				"pwe_gameplay_bright_wizard_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_bright_wizard_grabbed_01",
				"pwe_gameplay_bright_wizard_grabbed_02",
				"pwe_gameplay_bright_wizard_grabbed_03",
				"pwe_gameplay_bright_wizard_grabbed_04",
				"pwe_gameplay_bright_wizard_grabbed_05",
				"pwe_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_heard_bright_wizard_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_heard_bright_wizard_in_trouble_01",
				"pdr_gameplay_heard_bright_wizard_in_trouble_02",
				"pdr_gameplay_heard_bright_wizard_in_trouble_03",
				"pdr_gameplay_heard_bright_wizard_in_trouble_04",
				"pdr_gameplay_heard_bright_wizard_in_trouble_05",
				"pdr_gameplay_heard_bright_wizard_in_trouble_06",
				"pdr_gameplay_heard_bright_wizard_in_trouble_07",
				"pdr_gameplay_heard_bright_wizard_in_trouble_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_heard_bright_wizard_in_trouble_01",
				"pdr_gameplay_heard_bright_wizard_in_trouble_02",
				"pdr_gameplay_heard_bright_wizard_in_trouble_03",
				"pdr_gameplay_heard_bright_wizard_in_trouble_04",
				"pdr_gameplay_heard_bright_wizard_in_trouble_05",
				"pdr_gameplay_heard_bright_wizard_in_trouble_06",
				"pdr_gameplay_heard_bright_wizard_in_trouble_07",
				"pdr_gameplay_heard_bright_wizard_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hunter_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_05_reply_01"
			}
		},
		pwh_gameplay_bright_wizard_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_bright_wizard_grabbed_01",
				"pwh_gameplay_bright_wizard_grabbed_02",
				"pwh_gameplay_bright_wizard_grabbed_03",
				"pwh_gameplay_bright_wizard_grabbed_04",
				"pwh_gameplay_bright_wizard_grabbed_05",
				"pwh_gameplay_bright_wizard_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_bright_wizard_grabbed_01",
				"pwh_gameplay_bright_wizard_grabbed_02",
				"pwh_gameplay_bright_wizard_grabbed_03",
				"pwh_gameplay_bright_wizard_grabbed_04",
				"pwh_gameplay_bright_wizard_grabbed_05",
				"pwh_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_heard_witch_hunter_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_heard_witch_hunter_in_trouble_01",
				"pdr_gameplay_heard_witch_hunter_in_trouble_02",
				"pdr_gameplay_heard_witch_hunter_in_trouble_03",
				"pdr_gameplay_heard_witch_hunter_in_trouble_04",
				"pdr_gameplay_heard_witch_hunter_in_trouble_05",
				"pdr_gameplay_heard_witch_hunter_in_trouble_06",
				"pdr_gameplay_heard_witch_hunter_in_trouble_07",
				"pdr_gameplay_heard_witch_hunter_in_trouble_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_heard_witch_hunter_in_trouble_01",
				"pdr_gameplay_heard_witch_hunter_in_trouble_02",
				"pdr_gameplay_heard_witch_hunter_in_trouble_03",
				"pdr_gameplay_heard_witch_hunter_in_trouble_04",
				"pdr_gameplay_heard_witch_hunter_in_trouble_05",
				"pdr_gameplay_heard_witch_hunter_in_trouble_06",
				"pdr_gameplay_heard_witch_hunter_in_trouble_07",
				"pdr_gameplay_heard_witch_hunter_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ranger_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_10"
			}
		},
		pdr_gameplay_wood_elf_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_wood_elf_grabbed_01",
				"pdr_gameplay_wood_elf_grabbed_03",
				"pdr_gameplay_wood_elf_grabbed_05",
				"pdr_gameplay_wood_elf_grabbed_02",
				"pdr_gameplay_wood_elf_grabbed_04",
				"pdr_gameplay_wood_elf_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_wood_elf_grabbed_01",
				"pdr_gameplay_wood_elf_grabbed_03",
				"pdr_gameplay_wood_elf_grabbed_05",
				"pdr_gameplay_wood_elf_grabbed_02",
				"pdr_gameplay_wood_elf_grabbed_04",
				"pdr_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pwh_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pwh_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_39"
			}
		},
		pdr_gameplay_player_pounced_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_player_pounced_01",
				"pdr_gameplay_player_pounced_02",
				"pdr_gameplay_player_pounced_03",
				"pdr_gameplay_player_pounced_04",
				"pdr_gameplay_player_pounced_05",
				"pdr_gameplay_player_pounced_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_player_pounced_01",
				"pdr_gameplay_player_pounced_02",
				"pdr_gameplay_player_pounced_03",
				"pdr_gameplay_player_pounced_04",
				"pdr_gameplay_player_pounced_05",
				"pdr_gameplay_player_pounced_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_23"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_10_reply_01"
			}
		},
		pbw_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_124"
			}
		},
		pwh_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_02",
				"pwh_gameplay_seeing_a_gutter_runner_03",
				"pwh_gameplay_seeing_a_gutter_runner_04",
				"pwh_gameplay_seeing_a_gutter_runner_05",
				"pwh_gameplay_seeing_a_gutter_runner_06"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_02",
				"pwh_gameplay_seeing_a_gutter_runner_03",
				"pwh_gameplay_seeing_a_gutter_runner_04",
				"pwh_gameplay_seeing_a_gutter_runner_05",
				"pwh_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09"
			}
		},
		pwe_gameplay_elf_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_10_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01"
			}
		},
		pwe_gameplay_wizard_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11"
			}
		},
		pbw_gameplay_elf_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07"
			}
		},
		pwh_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_wood_elf_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_wood_elf_in_trouble_01",
				"pwh_gameplay_heard_wood_elf_in_trouble_02",
				"pwh_gameplay_heard_wood_elf_in_trouble_03",
				"pwh_gameplay_heard_wood_elf_in_trouble_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_gameplay_heard_wood_elf_in_trouble_01",
				"pwh_gameplay_heard_wood_elf_in_trouble_02",
				"pwh_gameplay_heard_wood_elf_in_trouble_03",
				"pwh_gameplay_heard_wood_elf_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_soldier_downed_3_times_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_reply_01"
			}
		},
		pdr_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_wood_elf_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_wood_elf_grabbed_01",
				"pwh_gameplay_wood_elf_grabbed_03",
				"pwh_gameplay_wood_elf_grabbed_05",
				"pwh_gameplay_wood_elf_grabbed_02",
				"pwh_gameplay_wood_elf_grabbed_04",
				"pwh_gameplay_wood_elf_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_wood_elf_grabbed_01",
				"pwh_gameplay_wood_elf_grabbed_03",
				"pwh_gameplay_wood_elf_grabbed_05",
				"pwh_gameplay_wood_elf_grabbed_02",
				"pwh_gameplay_wood_elf_grabbed_04",
				"pwh_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_elf_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01"
			}
		},
		pes_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pwe_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_08",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_09",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_10",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_11",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_12",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_13"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_08",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_09",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_10",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_11",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_12",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_13"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03"
			}
		},
		pdr_gameplay_response_054 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_054"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_054"
			}
		},
		pwh_gameplay_response_071 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_071"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_071"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_02"
			}
		},
		pwh_gameplay_another_is_bunnyjumping_01_alt1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_another_is_bunnyjumping_01_alt1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_another_is_bunnyjumping_01_alt1"
			}
		},
		pes_gameplay_another_is_bunnyjumping_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_another_is_bunnyjumping_01"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02"
			}
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_spots_potion_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_03",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_03",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_ranger_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08_reply_01"
			}
		},
		pwe_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pbw_gameplay_ranger_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_11_reply_01"
			}
		},
		pdr_gameplay_i_will_tank = {
			sound_events_n = 14,
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 14,
			sound_events = {
				"pdr_gameplay_i_will_tank_05",
				"pdr_gameplay_i_will_tank_06",
				"pdr_gameplay_i_will_tank_07",
				"pdr_gameplay_i_will_tank_08",
				"pdr_gameplay_i_will_tank_09",
				"pdr_gameplay_i_will_tank_10",
				"pdr_gameplay_i_will_tank_11",
				"pdr_gameplay_i_will_tank_12",
				"pdr_gameplay_i_will_tank_13",
				"pdr_gameplay_i_will_tank_14",
				"pdr_gameplay_i_will_tank_19",
				"pdr_gameplay_i_will_tank_20",
				"pdr_gameplay_i_will_tank_21",
				"pdr_gameplay_i_will_tank_22"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_i_will_tank_05",
				"pdr_gameplay_i_will_tank_06",
				"pdr_gameplay_i_will_tank_07",
				"pdr_gameplay_i_will_tank_08",
				"pdr_gameplay_i_will_tank_09",
				"pdr_gameplay_i_will_tank_10",
				"pdr_gameplay_i_will_tank_11",
				"pdr_gameplay_i_will_tank_12",
				"pdr_gameplay_i_will_tank_13",
				"pdr_gameplay_i_will_tank_14",
				"pdr_gameplay_i_will_tank_19",
				"pdr_gameplay_i_will_tank_20",
				"pdr_gameplay_i_will_tank_21",
				"pdr_gameplay_i_will_tank_22"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_ranger_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01"
			}
		},
		pwe_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pwe_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_skaven_ratling_gun_04",
				"pes_gameplay_seeing_a_skaven_ratling_gun_05",
				"pes_gameplay_seeing_a_skaven_ratling_gun_06",
				"pes_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_skaven_ratling_gun_04",
				"pes_gameplay_seeing_a_skaven_ratling_gun_05",
				"pes_gameplay_seeing_a_skaven_ratling_gun_06",
				"pes_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
		},
		pbw_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_38"
			}
		},
		pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_ratling_gun_01",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_02",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_03",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_04",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_05",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_06",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_ratling_gun_01",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_02",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_03",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_04",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_05",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_06",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_witch_hunter_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_witch_hunter_grabbed_01",
				"pwe_gameplay_witch_hunter_grabbed_02",
				"pwe_gameplay_witch_hunter_grabbed_03",
				"pwe_gameplay_witch_hunter_grabbed_04",
				"pwe_gameplay_witch_hunter_grabbed_05",
				"pwe_gameplay_witch_hunter_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwe_gameplay_witch_hunter_grabbed_01",
				"pwe_gameplay_witch_hunter_grabbed_02",
				"pwe_gameplay_witch_hunter_grabbed_03",
				"pwe_gameplay_witch_hunter_grabbed_04",
				"pwe_gameplay_witch_hunter_grabbed_05",
				"pwe_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_127"
			}
		},
		pbw_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_ratling_gun_01",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_02",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_03",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_04",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_05",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_06",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_ratling_gun_01",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_02",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_03",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_04",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_05",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_06",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pes_gameplay_elf_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_02"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_reply_01"
			}
		},
		pwe_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_39"
			}
		},
		pwh_gameplay_response_36 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_36"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_36"
			}
		},
		pdr_gameplay_soldier_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10"
			}
		},
		pwh_gameplay_hunter_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_08_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_09_reply_01"
			}
		},
		pwe_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_126"
			}
		},
		pbw_gameplay_heard_wood_elf_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_heard_wood_elf_in_trouble_01",
				"pbw_gameplay_heard_wood_elf_in_trouble_03",
				"pbw_gameplay_heard_wood_elf_in_trouble_05",
				"pbw_gameplay_heard_wood_elf_in_trouble_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_heard_wood_elf_in_trouble_01",
				"pbw_gameplay_heard_wood_elf_in_trouble_03",
				"pbw_gameplay_heard_wood_elf_in_trouble_05",
				"pbw_gameplay_heard_wood_elf_in_trouble_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_03"
			}
		},
		pwe_gameplay_soldier_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_kiling_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_kiling_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_kiling_a_second_rat_ogre_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12"
			}
		},
		pes_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pes_gameplay_hunter_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			}
		},
		pdr_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pwe_gameplay_soldier_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_10_reply_01"
			}
		},
		pbw_gameplay_ranger_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07"
			}
		},
		pwe_gameplay_ranger_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_04_reply_01"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_reply_01"
			}
		},
		pwh_gameplay_response_37_alt1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_37_alt1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_37_alt1"
			}
		},
		pbw_gameplay_witch_hunter_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_witch_hunter_grabbed_01",
				"pbw_gameplay_witch_hunter_grabbed_02",
				"pbw_gameplay_witch_hunter_grabbed_03",
				"pbw_gameplay_witch_hunter_grabbed_04",
				"pbw_gameplay_witch_hunter_grabbed_05",
				"pbw_gameplay_witch_hunter_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_witch_hunter_grabbed_01",
				"pbw_gameplay_witch_hunter_grabbed_02",
				"pbw_gameplay_witch_hunter_grabbed_03",
				"pbw_gameplay_witch_hunter_grabbed_04",
				"pbw_gameplay_witch_hunter_grabbed_05",
				"pbw_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_witch_hunter_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_witch_hunter_grabbed_01",
				"pes_gameplay_witch_hunter_grabbed_02",
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_04",
				"pes_gameplay_witch_hunter_grabbed_05",
				"pes_gameplay_witch_hunter_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_witch_hunter_grabbed_01",
				"pes_gameplay_witch_hunter_grabbed_02",
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_04",
				"pes_gameplay_witch_hunter_grabbed_05",
				"pes_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_witch_hunter_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_witch_hunter_grabbed_01",
				"pdr_gameplay_witch_hunter_grabbed_02",
				"pdr_gameplay_witch_hunter_grabbed_03",
				"pdr_gameplay_witch_hunter_grabbed_04",
				"pdr_gameplay_witch_hunter_grabbed_05",
				"pdr_gameplay_witch_hunter_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_witch_hunter_grabbed_01",
				"pdr_gameplay_witch_hunter_grabbed_02",
				"pdr_gameplay_witch_hunter_grabbed_03",
				"pdr_gameplay_witch_hunter_grabbed_04",
				"pdr_gameplay_witch_hunter_grabbed_05",
				"pdr_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_elf_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_response_115 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_115"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_115"
			}
		},
		pwe_gameplay_response_41 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_41"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_41"
			}
		},
		pes_gameplay_response_31 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_31"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_31"
			}
		},
		pwe_gameplay_ranger_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_10_reply_01"
			}
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02"
			}
		},
		pwe_gameplay_response_129 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_129"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_129"
			}
		},
		pdr_gameplay_response_046 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_046"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_046"
			}
		},
		pwe_gameplay_hunter_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_knocked_down_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_knocked_down_01",
				"pwe_gameplay_knocked_down_02",
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05",
				"pwe_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwe_gameplay_knocked_down_01",
				"pwe_gameplay_knocked_down_02",
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05",
				"pwe_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_ranger_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_11"
			}
		},
		pbr_gameplay_elf_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbr_gameplay_elf_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbr_gameplay_elf_downed_3_times_11"
			}
		},
		pbw_gameplay_hanging_help = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02"
			}
		},
		pes_gameplay_elf_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01"
			}
		},
		pwh_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_125"
			}
		},
		pwe_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02"
			}
		},
		pwh_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01"
			}
		},
		pes_gameplay_response_112 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_112"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_112"
			}
		},
		pbw_gameplay_response_118 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_118"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_118"
			}
		},
		pdr_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_02"
			}
		},
		pbw_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_03"
			}
		},
		pes_gameplay_elf_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_04_reply_01"
			}
		},
		pwh_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_09_reply_01"
			}
		},
		pwe_gameplay_response_055 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_055"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_055"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pdr_gameplay_heard_wood_elf_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_heard_wood_elf_in_trouble_01",
				"pdr_gameplay_heard_wood_elf_in_trouble_02",
				"pdr_gameplay_heard_wood_elf_in_trouble_03",
				"pdr_gameplay_heard_wood_elf_in_trouble_04",
				"pdr_gameplay_heard_wood_elf_in_trouble_05",
				"pdr_gameplay_heard_wood_elf_in_trouble_06",
				"pdr_gameplay_heard_wood_elf_in_trouble_07",
				"pdr_gameplay_heard_wood_elf_in_trouble_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_heard_wood_elf_in_trouble_01",
				"pdr_gameplay_heard_wood_elf_in_trouble_02",
				"pdr_gameplay_heard_wood_elf_in_trouble_03",
				"pdr_gameplay_heard_wood_elf_in_trouble_04",
				"pdr_gameplay_heard_wood_elf_in_trouble_05",
				"pdr_gameplay_heard_wood_elf_in_trouble_06",
				"pdr_gameplay_heard_wood_elf_in_trouble_07",
				"pdr_gameplay_heard_wood_elf_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_ranger_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03"
			}
		},
		pbw_gameplay_grabbed_ping = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_reply_01"
			}
		},
		pdr_gameplay_bright_wizard_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_bright_wizard_grabbed_01",
				"pdr_gameplay_bright_wizard_grabbed_02",
				"pdr_gameplay_bright_wizard_grabbed_03",
				"pdr_gameplay_bright_wizard_grabbed_04",
				"pdr_gameplay_bright_wizard_grabbed_05",
				"pdr_gameplay_bright_wizard_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_bright_wizard_grabbed_01",
				"pdr_gameplay_bright_wizard_grabbed_02",
				"pdr_gameplay_bright_wizard_grabbed_03",
				"pdr_gameplay_bright_wizard_grabbed_04",
				"pdr_gameplay_bright_wizard_grabbed_05",
				"pdr_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bright_wizard_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_bright_wizard_grabbed_01",
				"pes_gameplay_bright_wizard_grabbed_02",
				"pes_gameplay_bright_wizard_grabbed_03",
				"pes_gameplay_bright_wizard_grabbed_04",
				"pes_gameplay_bright_wizard_grabbed_05",
				"pes_gameplay_bright_wizard_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_bright_wizard_grabbed_01",
				"pes_gameplay_bright_wizard_grabbed_02",
				"pes_gameplay_bright_wizard_grabbed_03",
				"pes_gameplay_bright_wizard_grabbed_04",
				"pes_gameplay_bright_wizard_grabbed_05",
				"pes_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pwh_gameplay_elf_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_reply_01"
			}
		},
		pwh_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_124"
			}
		},
		pes_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pwh_gameplay_response_128 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_128"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_128"
			}
		},
		pes_gameplay_elf_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_response_121 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_121"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_121"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pwe_gameplay_response_130 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_130"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_130"
			}
		},
		pdr_gameplay_elf_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12"
			}
		},
		pdr_gameplay_hunter_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_reply_01"
			}
		},
		pes_ameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_04"
			}
		},
		pes_gameplay_hunter_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06"
			}
		},
		pbw_gameplay_response_119 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_119"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_119"
			}
		},
		pdr_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_hunter_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pes_gameplay_wizard_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_04_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03"
			}
		},
		pbw_gameplay_wizard_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_08_reply_01"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_11_reply_01"
			}
		},
		pbw_ameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_03"
			}
		},
		pdr_gameplay_response_050 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_050"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_050"
			}
		},
		pbw_gameplay_wizard_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_11_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_07_reply_01"
			}
		},
		pwe_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01"
			}
		},
		pwe_gameplay_ranger_hit_by_goo_thrice_00 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_hit_by_goo_thrice_00"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_hit_by_goo_thrice_00"
			}
		},
		pbw_gameplay_wizard_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_04_reply_01"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04"
			}
		},
		pdr_gameplay_wizard_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_05_reply_01"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01"
			}
		},
		pes_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_125"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_02"
			}
		},
		pwh_gameplay_wizard_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_01"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_response_043 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_043"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_043"
			}
		},
		pbw_gameplay_wizard_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_06_reply_01"
			}
		},
		pbw_gameplay_response_043 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_043"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_043"
			}
		},
		pbw_gameplay_wizard_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_03_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_10_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_10_reply_01"
			}
		},
		pes_gameplay_spots_bomb_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_spots_bomb_01",
				"pes_gameplay_spots_bomb_02",
				"pes_gameplay_spots_bomb_03",
				"pes_gameplay_spots_bomb_04",
				"pes_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_bomb_01",
				"pes_gameplay_spots_bomb_02",
				"pes_gameplay_spots_bomb_03",
				"pes_gameplay_spots_bomb_04",
				"pes_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_06_reply_01"
			}
		},
		pbw_gameplay_dwarf_ranger_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_dwarf_ranger_grabbed_01",
				"pbw_gameplay_dwarf_ranger_grabbed_02",
				"pbw_gameplay_dwarf_ranger_grabbed_03",
				"pbw_gameplay_dwarf_ranger_grabbed_04",
				"pbw_gameplay_dwarf_ranger_grabbed_05",
				"pbw_gameplay_dwarf_ranger_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_dwarf_ranger_grabbed_01",
				"pbw_gameplay_dwarf_ranger_grabbed_02",
				"pbw_gameplay_dwarf_ranger_grabbed_03",
				"pbw_gameplay_dwarf_ranger_grabbed_04",
				"pbw_gameplay_dwarf_ranger_grabbed_05",
				"pbw_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_elf_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_02"
			}
		},
		pdr_gameplay_ranger_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02"
			}
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pbw_gameplay_wizard_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_09_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_14_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14_reply_01"
			}
		},
		pes_gameplay_dwarf_ranger_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_dwarf_ranger_grabbed_01",
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_04",
				"pes_gameplay_dwarf_ranger_grabbed_05",
				"pes_gameplay_dwarf_ranger_grabbed_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dwarf_ranger_grabbed_01",
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_04",
				"pes_gameplay_dwarf_ranger_grabbed_05",
				"pes_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_bomb_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "special_occasions_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_spots_bomb_01",
				"pwh_gameplay_spots_bomb_02",
				"pwh_gameplay_spots_bomb_03",
				"pwh_gameplay_spots_bomb_04",
				"pwh_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_bomb_01",
				"pwh_gameplay_spots_bomb_02",
				"pwh_gameplay_spots_bomb_03",
				"pwh_gameplay_spots_bomb_04",
				"pwh_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hunter_potions_above_half_health__reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health__reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health__reply_02"
			}
		},
		pwh_gameplay_soldier_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_03"
			}
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04"
			}
		},
		pbw_gameplay_response_120 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_120"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_120"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13"
			}
		},
		pes_gameplay_soldier_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_06_reply_01"
			}
		},
		pbw_gameplay_soldier_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07_reply_01"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03"
			}
		},
		pbw_gameplay_soldier_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_09_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04_reply_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_04_reply_01"
			}
		},
		pwe_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_elf_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06"
			}
		},
		pwh_gameplay_soldier_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04"
			}
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_soldier_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_05_reply_01"
			}
		},
		pwh_gameplay_ranger_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_ranger_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "help_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_response_129 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_129"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_129"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_dwarf_ranger_grabbed_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_dwarf_ranger_grabbed_07",
				"pwh_gameplay_dwarf_ranger_grabbed_08",
				"pwh_gameplay_dwarf_ranger_grabbed_09",
				"pwh_gameplay_dwarf_ranger_grabbed_10",
				"pwh_gameplay_dwarf_ranger_grabbed_11",
				"pwh_gameplay_dwarf_ranger_grabbed_12",
				"pwh_gameplay_dwarf_ranger_grabbed_13",
				"pwh_gameplay_dwarf_ranger_grabbed_14"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pwh_gameplay_dwarf_ranger_grabbed_07",
				"pwh_gameplay_dwarf_ranger_grabbed_08",
				"pwh_gameplay_dwarf_ranger_grabbed_09",
				"pwh_gameplay_dwarf_ranger_grabbed_10",
				"pwh_gameplay_dwarf_ranger_grabbed_11",
				"pwh_gameplay_dwarf_ranger_grabbed_12",
				"pwh_gameplay_dwarf_ranger_grabbed_13",
				"pwh_gameplay_dwarf_ranger_grabbed_14"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_03_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_13_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_07_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_09_reply_01"
			}
		},
		pbw_gameplay_knocked_down_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_02",
				"pbw_gameplay_knocked_down_03",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_05",
				"pbw_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_02",
				"pbw_gameplay_knocked_down_03",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_05",
				"pbw_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_03_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_03_reply_01"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			}
		},
		pwe_gameplay_hunter_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_seeing_a_skaven_patrol_stormvermin_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_concerned",
				"face_concerned",
				"face_contempt",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pwh_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10"
			}
		},
		pes_gameplay_hunter_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_response_30 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_30"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_30"
			}
		},
		pwh_gameplay_hunter_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_06_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_04_reply_01"
			}
		},
		pdr_gameplay_elf_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01"
			}
		},
		pwh_gameplay_ranger_downed_3_time_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_time_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_time_02"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02_reply_01"
			}
		},
		pbw_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_killing_a_second_rat_ogre_02"
			}
		},
		pwe_gameplay_elf_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_02_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			}
		},
		pwe_gameplay_elf_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_12_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pes_gameplay_elf_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08_reply_01"
			}
		},
		pdr_gameplay_response_40 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_40"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_40"
			}
		},
		pwe_gameplay_elf_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_04_reply_01"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_04"
			}
		},
		pwe_gameplay_elf_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01"
			}
		},
		pes_gameplay_elf_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04_reply_01"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_08_reply_01"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_ranger_killing_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
			}
		},
		pwe_gameplay_elf_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_05_reply_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			}
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			}
		},
		pbw_gameplay_response_122 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "default",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_122"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_122"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pbw_gameplay_seeing_a_skaven_patrol_stormvermin_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "special_occasions_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_calm",
				"face_concerned",
				"face_concerned",
				"face_contempt",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pes_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "knocked_down_override",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_05_reply_01"
			}
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "casual_talk",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04"
			}
		}
	})

	return 
end
