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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				900
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
				1800
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.EQ,
				2
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
				"empire_soldier"
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				"witch_hunter_special_kills_in_row",
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
				OP.EQ,
				2
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
		response = "pes_gameplay_elf_downed_3_times_08",
		name = "pes_gameplay_elf_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbr_gameplay_elf_downed_3_times_11",
		name = "pbr_gameplay_elf_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_elf_downed_3_times_05",
		name = "pwh_gameplay_elf_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_elf_downed_3_times_04",
		name = "pwh_gameplay_elf_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pes_gameplay_elf_downed_3_times_09",
		name = "pes_gameplay_elf_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_elf_downed_3_times_07",
		name = "pbw_gameplay_elf_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_elf_downed_3_times_06",
		name = "pbw_gameplay_elf_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pes_gameplay_elf_downed_3_times_10",
		name = "pes_gameplay_elf_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_elf_downed_3_times_13",
		name = "pdr_gameplay_elf_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_elf_downed_3_times_03_azsd",
		name = "pwh_gameplay_elf_downed_3_times_03_azsd",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_elf_downed_3_times_12",
		name = "pdr_gameplay_elf_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_elf_downed_3_times_02",
		name = "pbw_gameplay_elf_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_hunter_downed_3_times_08",
		name = "pdr_gameplay_hunter_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_hunter_downed_3_times_11",
		name = "pwe_gameplay_hunter_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pes_gameplay_hunter_downed_3_times_05",
		name = "pes_gameplay_hunter_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_hunter_downed_3_times_04",
		name = "pbw_gameplay_hunter_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_hunter_downed_3_times_09",
		name = "pdr_gameplay_hunter_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pes_gameplay_hunter_downed_3_times_07",
		name = "pes_gameplay_hunter_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pes_gameplay_hunter_downed_3_times_06",
		name = "pes_gameplay_hunter_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_downed_3_times_10",
		name = "pdr_gameplay_hunter_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_hunter_downed_3_times_13",
		name = "pwe_gameplay_hunter_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_hunter_downed_3_times_03",
		name = "pbw_gameplay_hunter_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_hunter_downed_3_times_12",
		name = "pwe_gameplay_hunter_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_hunter_downed_3_times_02",
		name = "pbw_gameplay_hunter_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_ranger_downed_3_times_08",
		name = "pbw_gameplay_ranger_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_ranger_downed_3_times_11",
		name = "pwe_gameplay_ranger_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_ranger_downed_3_times_04",
		name = "pwh_gameplay_ranger_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_ranger_downed_3_times_09",
		name = "pbw_gameplay_ranger_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_ranger_downed_3_times_07",
		name = "pbw_gameplay_ranger_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pes_gameplay_ranger_downed_3_times_10",
		name = "pes_gameplay_ranger_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_ranger_downed_3_times_13",
		name = "pwe_gameplay_ranger_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_ranger_downed_3_times_03",
		name = "pwh_gameplay_ranger_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_ranger_downed_3_times_12",
		name = "pwe_gameplay_ranger_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_ranger_downed_3_time_02",
		name = "pwh_gameplay_ranger_downed_3_time_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_soldier_downed_3_times_11",
		name = "pdr_gameplay_soldier_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_soldier_downed_3_times_05",
		name = "pwh_gameplay_soldier_downed_3_times_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_soldier_downed_3_times_04",
		name = "pwh_gameplay_soldier_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_soldier_downed_3_times_09",
		name = "pdr_gameplay_soldier_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_soldier_downed_3_times_07",
		name = "pbw_gameplay_soldier_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pbw_gameplay_soldier_downed_3_times_06",
		name = "pbw_gameplay_soldier_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_soldier_downed_3_times_10",
		name = "pdr_gameplay_soldier_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_soldier_downed_3_times_13",
		name = "pwe_gameplay_soldier_downed_3_times_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_soldier_downed_3_times_12",
		name = "pwe_gameplay_soldier_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_soldier_downed_3_times_02",
		name = "pwe_gameplay_soldier_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_wizard_downed_3_times_08",
		name = "pdr_gameplay_wizard_downed_3_times_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_wizard_downed_3_times_11",
		name = "pwe_gameplay_wizard_downed_3_times_11",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_wizard_downed_3_times_04",
		name = "pwh_gameplay_wizard_downed_3_times_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_wizard_downed_3_times_14",
		name = "pwh_gameplay_wizard_downed_3_times_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_wizard_downed_3_times_09",
		name = "pdr_gameplay_wizard_downed_3_times_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pes_gameplay_wizard_downed_3_times_07",
		name = "pes_gameplay_wizard_downed_3_times_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pes_gameplay_wizard_downed_3_times_06",
		name = "pes_gameplay_wizard_downed_3_times_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pdr_gameplay_wizard_downed_3_times_10",
		name = "pdr_gameplay_wizard_downed_3_times_10",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_wizard_downed_3_times_03",
		name = "pwh_gameplay_wizard_downed_3_times_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwe_gameplay_wizard_downed_3_times_12",
		name = "pwe_gameplay_wizard_downed_3_times_12",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
		response = "pwh_gameplay_wizard_downed_3_times_02",
		name = "pwh_gameplay_wizard_downed_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
				"hit_by_goo_multiple_times"
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
		response = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
		name = "pbw_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
		name = "pdr_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pes_gameplay_elf_caught_by_slaver_3_times_02",
		name = "pes_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
		name = "pwh_gameplay_elf_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
		name = "pbw_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
		name = "pdr_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
		name = "pes_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
		name = "pwe_gameplay_hunter_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
		name = "pbw_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
		name = "pes_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
		name = "pwe_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
		name = "pwh_gameplay_ranger_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
		name = "pbw_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
		name = "pdr_gameplay_soldier_caught_by_slaver_3_times_two",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
		name = "pwe_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
		name = "pwh_gameplay_soldier_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
		name = "pdr_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
		name = "pes_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
		name = "pwe_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
		name = "pwh_gameplay_wizard_caught_by_slaver_3_times_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed_multiple_times"
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
		response = "pbw_gameplay_elf_killing_spawn_melee_01",
		name = "pbw_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_185",
		name = "pwe_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_183",
		name = "pwh_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_185"
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
		response = "pdr_gameplay_elf_killing_spawn_melee_01",
		name = "pdr_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_180",
		name = "pwe_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_177",
		name = "pwh_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_180"
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
		response = "pes_gameplay_elf_killing_spawn_melee_01",
		name = "pes_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_182",
		name = "pwe_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_spawn_melee_01"
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
		response = "pdr_gameplay_response_181",
		name = "pdr_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_182"
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
		response = "pwh_gameplay_elf_killing_spawn_melee_01",
		name = "pwh_gameplay_elf_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_187",
		name = "pwe_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_175",
		name = "pes_gameplay_response_175",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_187"
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
		response = "pbw_gameplay_hunter_killing_spawn_melee_01",
		name = "pbw_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_184",
		name = "pwh_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_spawn_melee_01"
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
		response = "pdr_gameplay_response_185",
		name = "pdr_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_184"
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
		response = "pdr_gameplay_hunter_killing_spawn_melee_01",
		name = "pdr_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_178",
		name = "pwh_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_168",
		name = "pes_gameplay_response_168",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_178"
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
		response = "pes_gameplay_hunter_killing_spawn_melee_01",
		name = "pes_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_chaos_spawn",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_180",
		name = "pwh_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_spawn_melee_01"
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
		response = "pbw_gameplay_response_177",
		name = "pbw_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_180"
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
		response = "pwe_gameplay_hunter_killing_spawn_melee_01",
		name = "pwe_gameplay_hunter_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_182",
		name = "pwh_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_171",
		name = "pes_gameplay_response_171",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_182"
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
		response = "pbw_gameplay_ranger_killing_spawn_melee_01",
		name = "pbw_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_184",
		name = "pdr_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_172",
		name = "pes_gameplay_response_172",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_184"
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
		response = "pes_gameplay_ranger_killing_spawn_melee_01",
		name = "pes_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_180",
		name = "pdr_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_179",
		name = "pwh_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_180"
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
		response = "pwe_gameplay_ranger_killing_spawn_melee_01",
		name = "pwe_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_182",
		name = "pdr_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_spawn_melee_01"
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
		response = "pes_gameplay_response_169",
		name = "pes_gameplay_response_169",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_182"
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
		response = "pwh_gameplay_ranger_killing_spawn_melee_01",
		name = "pwh_gameplay_ranger_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_186",
		name = "pdr_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_spawn_melee_01"
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
		response = "pbw_gameplay_response_179",
		name = "pbw_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_186"
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
		response = "pbw_gameplay_soldier_killing_spawn_melee_01",
		name = "pbw_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_173",
		name = "pes_gameplay_response_173",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_184",
		name = "pwe_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_173"
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
		response = "pdr_gameplay_soldier_killing_spawn_melee_01",
		name = "pdr_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_167",
		name = "pes_gameplay_response_167",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pbw_gameplay_response_174",
		name = "pbw_gameplay_response_174",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_167"
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
		response = "pwe_gameplay_soldier_killing_spawn_melee_01",
		name = "pwe_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_170",
		name = "pes_gameplay_response_170",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwh_gameplay_response_181",
		name = "pwh_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_170"
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
		response = "pwh_gameplay_soldier_killing_spawn_melee_01",
		name = "pwh_gameplay_soldier_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_174",
		name = "pes_gameplay_response_174",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_186",
		name = "pwe_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_174"
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
		response = "pdr_gameplay_wizard_killing_spawn_melee_01",
		name = "pdr_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_175",
		name = "pbw_gameplay_response_175",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_181",
		name = "pwe_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_175"
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
		response = "pes_gameplay_wizard_killing_spawn_melee_01",
		name = "pes_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_176",
		name = "pbw_gameplay_response_176",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_spawn_melee_01"
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
		response = "pwe_gameplay_response_183",
		name = "pwe_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_176"
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
		response = "pwe_gameplay_wizard_killing_spawn_melee_01",
		name = "pwe_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_178",
		name = "pbw_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_spawn_melee_01"
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
		response = "pdr_gameplay_response_183",
		name = "pdr_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_178"
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
		response = "pwh_gameplay_wizard_killing_spawn_melee_01",
		name = "pwh_gameplay_wizard_killing_spawn_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_180",
		name = "pbw_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_spawn_melee_01"
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
		response = "pdr_gameplay_response_187",
		name = "pdr_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_180"
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
		response = "pbw_gameplay_elf_killing_spawn_ranged_01",
		name = "pbw_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_192",
		name = "pwe_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_193",
		name = "pdr_gameplay_response_193",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_192"
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
		response = "pdr_gameplay_elf_killing_spawn_ranged_01",
		name = "pdr_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_188",
		name = "pwe_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_spawn_ranged_01"
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
		response = "pes_gameplay_response_177",
		name = "pes_gameplay_response_177",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_188"
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
		response = "pes_gameplay_elf_killing_spawn_ranged_01",
		name = "pes_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_191",
		name = "pwe_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_187",
		name = "pwh_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_191"
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
		response = "pwh_gameplay_elf_killing_spawn_ranged_01",
		name = "pwh_gameplay_elf_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_195",
		name = "pwe_gameplay_response_195",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_187",
		name = "pbw_gameplay_response_187",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_195"
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
		response = "pbw_gameplay_hunter_killing_spawn_ranged_01",
		name = "pbw_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_192",
		name = "pwh_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_193",
		name = "pwe_gameplay_response_193",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_192"
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
		response = "pdr_gameplay_hunter_killing_spawn_ranged_01",
		name = "pdr_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_186",
		name = "pwh_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_189",
		name = "pwe_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_186"
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
		response = "pes_gameplay_hunter_killing_spawn_ranged_01",
		name = "pes_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_188",
		name = "pwh_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_184",
		name = "pbw_gameplay_response_184",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_188"
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
		response = "pwe_gameplay_hunter_killing_spawn_ranged_01",
		name = "pwe_gameplay_hunter_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_190",
		name = "pwh_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_186",
		name = "pbw_gameplay_response_186",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_190"
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
		response = "pbw_gameplay_ranger_killing_spawn_ranged_01",
		name = "pbw_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_192",
		name = "pdr_gameplay_response_192",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_spawn_ranged_01"
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
		response = "pes_gameplay_response_180",
		name = "pes_gameplay_response_180",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_192"
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
		response = "pes_gameplay_ranger_killing_spawn_ranged_01",
		name = "pes_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_188",
		name = "pdr_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_190",
		name = "pwe_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_188"
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
		response = "pwe_gameplay_ranger_killing_spawn_ranged_01",
		name = "pwe_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_190",
		name = "pdr_gameplay_response_190",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_189",
		name = "pwh_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_190"
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
		response = "pwh_gameplay_ranger_killing_spawn_ranged_01",
		name = "pwh_gameplay_ranger_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_194",
		name = "pdr_gameplay_response_194",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_spawn_ranged_01"
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
		response = "pes_gameplay_response_182",
		name = "pes_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_194"
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
		response = "pbw_gameplay_soldier_killing_spawn_ranged_01",
		name = "pbw_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_181",
		name = "pes_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_191",
		name = "pwh_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_181"
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
		response = "pdr_gameplay_soldier_killing_spawn_ranged_01",
		name = "pdr_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_176",
		name = "pes_gameplay_response_176",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pbw_gameplay_response_181",
		name = "pbw_gameplay_response_181",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_176"
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
		response = "pwe_gameplay_soldier_killing_spawn_ranged_01",
		name = "pwe_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_178",
		name = "pes_gameplay_response_178",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_191",
		name = "pdr_gameplay_response_191",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_178"
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
		response = "pwh_gameplay_soldier_killing_spawn_ranged_01",
		name = "pwh_gameplay_soldier_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_183",
		name = "pes_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_spawn_ranged_01"
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
		response = "pwe_gameplay_response_194",
		name = "pwe_gameplay_response_194",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_183"
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
		response = "pdr_gameplay_wizard_killing_spawn_ranged_01",
		name = "pdr_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_182",
		name = "pbw_gameplay_response_182",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_spawn_ranged_01"
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
		response = "pwh_gameplay_response_185",
		name = "pwh_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_182"
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
		response = "pes_gameplay_wizard_killing_spawn_ranged_01",
		name = "pes_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_183",
		name = "pbw_gameplay_response_183",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_189",
		name = "pdr_gameplay_response_189",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_183"
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
		response = "pwe_gameplay_wizard_killing_spawn_ranged_01",
		name = "pwe_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_185",
		name = "pbw_gameplay_response_185",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_spawn_ranged_01"
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
		response = "pes_gameplay_response_179",
		name = "pes_gameplay_response_179",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_185"
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
		response = "pwh_gameplay_wizard_killing_spawn_ranged_01",
		name = "pwh_gameplay_wizard_killing_spawn_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_188",
		name = "pbw_gameplay_response_188",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_spawn_ranged_01"
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
		response = "pdr_gameplay_response_195",
		name = "pdr_gameplay_response_195",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_188"
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
		response = "pbw_gameplay_elf_killing_troll_melee_01",
		name = "pbw_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_152",
		name = "pwe_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_151",
		name = "pwh_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_152"
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
		response = "pdr_gameplay_elf_killing_troll_melee_01",
		name = "pdr_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_147",
		name = "pwe_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_troll_melee_01"
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
		response = "pes_gameplay_response_137",
		name = "pes_gameplay_response_137",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_147"
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
		response = "pes_gameplay_elf_killing_troll_melee_01",
		name = "pes_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_149",
		name = "pwe_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_troll_melee_01"
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
		response = "pdr_gameplay_response_150",
		name = "pdr_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
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
		response = "pwh_gameplay_elf_killing_troll_melee_01",
		name = "pwh_gameplay_elf_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_154",
		name = "pwe_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_147",
		name = "pbw_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
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
		response = "pbw_gameplay_hunter_killing_troll_melee_01",
		name = "pbw_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_152",
		name = "pwh_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_troll_melee_01"
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
		response = "pdr_gameplay_response_154",
		name = "pdr_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_149"
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
		response = "pdr_gameplay_hunter_killing_troll_melee_01",
		name = "pdr_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_146",
		name = "pwh_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_142",
		name = "pbw_gameplay_response_142",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_146"
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
		response = "pes_gameplay_hunter_killing_troll_melee_01",
		name = "pes_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_148",
		name = "pwh_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_troll_melee_01"
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
		response = "pwe_gameplay_response_150",
		name = "pwe_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_148"
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
		response = "pwe_gameplay_hunter_killing_troll_melee_01",
		name = "pwe_gameplay_hunter_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_150",
		name = "pwh_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_troll_melee_01"
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
		response = "pdr_gameplay_response_152",
		name = "pdr_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_150"
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
		response = "pbw_gameplay_ranger_killing_troll_melee_01",
		name = "pbw_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_153",
		name = "pdr_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_troll_melee_01"
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
		response = "pes_gameplay_response_140",
		name = "pes_gameplay_response_140",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_153"
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
		response = "pwe_gameplay_ranger_killing_troll_melee_01",
		name = "pwe_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_151",
		name = "pdr_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_149",
		name = "pwh_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_151"
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
		response = "pwh_gameplay_ranger_killing_troll_melee_01",
		name = "pwh_gameplay_ranger_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_155",
		name = "pdr_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_troll_melee_01"
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
		response = "pes_gameplay_response_142",
		name = "pes_gameplay_response_142",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_155"
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
		response = "pbw_gameplay_soldier_killing_troll_melee_01",
		name = "pbw_gameplay_soldier_killing_troll_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_141",
		name = "pes_gameplay_response_141",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_troll_melee_01"
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
		response = "pwe_gameplay_response_151",
		name = "pwe_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_141"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_136",
		name = "pes_gameplay_response_136",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_145",
		name = "pwh_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_136"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_138",
		name = "pes_gameplay_response_138",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_145",
		name = "pbw_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_138"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_143",
		name = "pes_gameplay_response_143",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_troll_melee_01"
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
		response = "pbw_gameplay_response_199",
		name = "pbw_gameplay_response_199",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_143"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_141",
		name = "pbw_gameplay_response_141",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_troll_melee_01"
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
		response = "pwe_gameplay_response_148",
		name = "pwe_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_141"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_144",
		name = "pbw_gameplay_response_144",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_troll_melee_01"
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
		response = "pwh_gameplay_response_147",
		name = "pwh_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_144"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_146",
		name = "pbw_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_troll_melee_01"
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
		response = "pes_gameplay_response_139",
		name = "pes_gameplay_response_139",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_146"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_148",
		name = "pbw_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_troll_melee_01"
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
		response = "pes_gameplay_response_144",
		name = "pes_gameplay_response_144",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_148"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_159",
		name = "pwe_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_troll_ranged_01"
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
		response = "pdr_gameplay_response_161",
		name = "pdr_gameplay_response_161",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_159"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_155",
		name = "pwe_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_troll_ranged_01"
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
		response = "pes_gameplay_response_146",
		name = "pes_gameplay_response_146",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_155"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_157",
		name = "pwe_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_155",
		name = "pwh_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_157"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_162",
		name = "pwe_gameplay_response_162",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_156",
		name = "pbw_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_162"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_160",
		name = "pwh_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_160",
		name = "pwe_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_160"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_154",
		name = "pwh_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_150",
		name = "pbw_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_154"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_156",
		name = "pwh_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_troll_ranged_01"
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
		response = "pdr_gameplay_response_157",
		name = "pdr_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_156"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_158",
		name = "pwh_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_troll_ranged_01"
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
		response = "pes_gameplay_response_148",
		name = "pes_gameplay_response_148",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_158"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_160",
		name = "pdr_gameplay_response_160",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_troll_ranged_01"
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
		response = "pes_gameplay_response_149",
		name = "pes_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_160"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_156",
		name = "pdr_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_151",
		name = "pbw_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_156"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_158",
		name = "pdr_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_157",
		name = "pwh_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_158"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_162",
		name = "pdr_gameplay_response_162",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_155",
		name = "pbw_gameplay_response_155",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_162"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_150",
		name = "pes_gameplay_response_150",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_159",
		name = "pwh_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_150"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_145",
		name = "pes_gameplay_response_145",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwh_gameplay_response_153",
		name = "pwh_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_145"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_147",
		name = "pes_gameplay_response_147",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_153",
		name = "pbw_gameplay_response_153",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_147"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_151",
		name = "pes_gameplay_response_151",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_161",
		name = "pwe_gameplay_response_161",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_151"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_149",
		name = "pbw_gameplay_response_149",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_156",
		name = "pwe_gameplay_response_156",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_149"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_152",
		name = "pbw_gameplay_response_152",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_troll_ranged_01"
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
		response = "pwe_gameplay_response_158",
		name = "pwe_gameplay_response_158",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_152"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_159",
		name = "pdr_gameplay_response_159",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_troll_ranged_01"
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
		response = "pbw_gameplay_response_154",
		name = "pbw_gameplay_response_154",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_159"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_157",
		name = "pbw_gameplay_response_157",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_troll_ranged_01"
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
		response = "pdr_gameplay_response_163",
		name = "pdr_gameplay_response_163",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_157"
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
		response = "pbw_gameplay_killing_rat_ogre_01",
		name = "pbw_gameplay_killing_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
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
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_04",
		name = "pes_gameplay_response_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_killing_rat_ogre_01"
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
		response = "pes_gameplay_killing_rat_ogre_01",
		name = "pes_gameplay_killing_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_07",
		name = "pdr_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_killing_rat_ogre_01"
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
		response = "pdr_hunter_shoots_rat_ogre_01",
		name = "pdr_hunter_shoots_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
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
		response = "pwh_gameplay_response_08",
		name = "pwh_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_hunter_shoots_rat_ogre_01"
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
		response = "pbw_gameplay_response_08",
		name = "pbw_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_08"
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
		response = "pwh_gameplay_killing_a_rat_ogre_01",
		name = "pwh_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
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
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_08",
		name = "pwe_gameplay_response_08",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_killing_a_rat_ogre_01"
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
		response = "pes_gameplay_elf_shoots_a_rat_ogre_01",
		name = "pes_gameplay_elf_shoots_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
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
		response = "pwe_gameplay_response_09",
		name = "pwe_gameplay_response_09",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_shoots_a_rat_ogre_01"
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
		response = "pwe_gameplay_killing_a_rat_ogre_01",
		name = "pwe_gameplay_killing_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_05",
		name = "pes_gameplay_response_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_killing_a_rat_ogre_01"
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
		response = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
		name = "pdr_gameplay_killing_a_rat_ogre_crossbow_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_kill"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_type",
				OP.EQ,
				"dr_crossbow"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_07",
		name = "pwe_gameplay_response_07",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_killing_a_rat_ogre_crossbow_01"
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
		response = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
		name = "pdr_gameplay_wizard_fires_a_rat_ogre_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"killer_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
			},
			{
				"query_context",
				"dot_type",
				OP.EQ,
				"burning_dot"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"global_context",
				"bright_wizard",
				OP.EQ,
				1
			},
			{
				"global_context",
				"witch_hunter",
				OP.EQ,
				1
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_response_06",
		name = "pwh_gameplay_response_06",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_fires_a_rat_ogre_01"
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
		response = "pbw_gameplay_response_07_b",
		name = "pbw_gameplay_response_07_b",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_06"
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
		response = "pbw_gameplay_elf_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_killing_rat_ogre_melee_01"
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
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_07"
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
		response = "pbw_gameplay_hunter_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_rat_ogre_melee_01"
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
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
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
		response = "pbw_gameplay_ranger_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_rat_ogre_melee_01"
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
		response = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01",
		name = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01"
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
		response = "pbw_gameplay_soldier_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		name = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_rat_ogre_melee_01"
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
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
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
		response = "pdr_gameplay_elf_killing_rat_ogre_melee_01",
		name = "pdr_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_rat_ogre_melee_01"
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
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
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
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01",
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_melee_01"
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
		response = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		name = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01",
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		name = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_rat_ogre_melee_01"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
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
		response = "pdr_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pdr_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_rat_ogre_melee_01"
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
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
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
		response = "pes_gameplay_elf_killing_rat_ogre_melee_01",
		name = "pes_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
		name = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_rat_ogre_melee_01"
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
		response = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		name = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03"
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
		response = "pes_gameplay_ranger_killing_rat_ogre_melee_01",
		name = "pes_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_rat_ogre_melee_01"
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
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02",
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
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
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_rat_ogre_melee_01"
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
		response = "pwe_gameplay_hunter_killing_rat_ogre_melee_01",
		name = "pwe_gameplay_hunter_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"killer_name",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
		name = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_rat_ogre_melee_01"
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
		response = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		name = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04"
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
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_01",
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
		name = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_rat_ogre_melee_01"
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
		response = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		name = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03"
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
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01",
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"global_context",
				"dwarf_ranger",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		name = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_melee_01"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		name = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
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
		response = "pwe_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pwe_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		name = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_rat_ogre_melee_01"
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
		response = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		name = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
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
		response = "pwh_gameplay_elf_killing_rat_ogre_melee_01",
		name = "pwh_gameplay_elf_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_response_082",
		name = "pwe_gameplay_response_082",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_rat_ogre_melee_01"
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
		response = "pbw_gameplay_response_078",
		name = "pbw_gameplay_response_078",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_response_082"
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
		response = "pwh_gameplay_ranger_killing_rat_ogre_melee_01",
		name = "pwh_gameplay_ranger_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_response_079",
		name = "pdr_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_melee_01"
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
		response = "pwh_gameplay_response_079",
		name = "pwh_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_079"
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
		response = "pwh_gameplay_soldier_killing_rat_ogre_melee_01",
		name = "pwh_gameplay_soldier_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_response_071",
		name = "pes_gameplay_response_071",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_rat_ogre_melee_01"
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
		response = "pwe_gameplay_response_081",
		name = "pwe_gameplay_response_081",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_071"
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
		response = "pwh_gameplay_wizard_killing_rat_ogre_melee_01",
		name = "pwh_gameplay_wizard_killing_rat_ogre_melee_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_response_079",
		name = "pbw_gameplay_response_079",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_rat_ogre_melee_01"
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
		response = "pdr_gameplay_response_080",
		name = "pdr_gameplay_response_080",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_079"
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
		response = "pbw_gameplay_elf_killing_rat_ogre_ranged_01",
		name = "pbw_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_rat_ogre_melee_01"
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
		response = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		name = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_response_079"
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
		response = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
		name = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_killing_rat_ogre_ranged_01"
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
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
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
		response = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
		name = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_killing_rat_ogre_ranged_01"
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
		response = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
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
		response = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
		name = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_killing_rat_ogre_ranged_01"
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
		response = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		name = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
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
		response = "pdr_gameplay_elf_killing_rat_ogre_ranged_01",
		name = "pdr_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_killing_rat_ogre_ranged_01"
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
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
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
		response = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
		name = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_ranged_01"
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
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_killing_rat_ogre_ranged_01"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
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
		response = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
		name = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_killing_rat_ogre_ranged_01"
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
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01",
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01"
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
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01",
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_killing_rat_ogre_ranged_01"
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
		response = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		name = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03"
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
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01",
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		name = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_killing_rat_ogre_ranged_01"
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
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
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
		response = "pes_gameplay_ranger_killing_rat_ogre_ranged_01",
		name = "pes_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_killing_rat_ogre_ranged_01"
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
		response = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
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
		response = "pes_gameplay_wizard_killing_rat_ogre_ranged_01",
		name = "pes_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_killing_rat_ogre_ranged_01"
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
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
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
		response = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
		name = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"killer_name",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
		name = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_killing_rat_ogre_ranged_01"
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
		response = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		name = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03"
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
		response = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
		name = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_killing_rat_ogre_ranged_01"
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
		response = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		name = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02"
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
		response = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
		name = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_killing_rat_ogre_ranged_01"
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
		response = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		name = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03"
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
		response = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
		name = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_killing_rat_ogre_ranged_01"
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
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04",
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03"
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
		response = "pwh_gameplay_elf_killing_rat_ogre_ranged_01",
		name = "pwh_gameplay_elf_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
		name = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_killing_rat_ogre_ranged_01"
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
		response = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		name = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04"
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
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		name = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_killing_rat_ogre_ranged_01"
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
		response = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		name = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
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
		response = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
		name = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
		name = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_soldier_killing_rat_ogre_ranged_01"
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
		response = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		name = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04"
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
		response = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
		name = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"enemy_tag",
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
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_ranged"
			},
			{
				"user_memory",
				"times_killed_rat_ogre",
				OP.NEQ,
				2
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		name = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_killing_rat_ogre_ranged_01"
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
		response = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		name = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
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
		response = "pwe_gameplay_hunter_misses_bomb_01",
		name = "pwe_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_19",
		name = "pwh_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_hunter_misses_bomb_01"
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
		response = "pwe_gameplay_response_20",
		name = "pwe_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_19"
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
		response = "pdr_gameplay_hunter_misses_bomb_01",
		name = "pdr_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_20",
		name = "pwh_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_hunter_misses_bomb_01"
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
		response = "pdr_gameplay_response_17",
		name = "pdr_gameplay_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_response_20"
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
		response = "pbw_gameplay_hunter_misses_bomb_01",
		name = "pbw_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_21",
		name = "pwh_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_hunter_misses_bomb_01"
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
		response = "pes_gameplay_hunter_misses_bomb_01",
		name = "pes_gameplay_hunter_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"witch_hunter"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwh_gameplay_response_22",
		name = "pwh_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_hunter_misses_bomb_01"
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
		response = "pwh_gameplay_elf_misses_bomb_01",
		name = "pwh_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_21",
		name = "pwe_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_elf_misses_bomb_01"
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
		response = "pdr_gameplay_elf_misses_bomb_01",
		name = "pdr_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_22",
		name = "pwe_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_elf_misses_bomb_01"
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
		response = "pbw_gameplay_elf_misses_bomb_01",
		name = "pbw_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_23",
		name = "pwe_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_elf_misses_bomb_01"
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
		response = "pes_gameplay_elf_misses_bomb_01",
		name = "pes_gameplay_elf_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"wood_elf"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwe_gameplay_response_24",
		name = "pwe_gameplay_response_24",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_elf_misses_bomb_01"
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
		response = "pwh_gameplay_wizard_misses_bomb_01",
		name = "pwh_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pbw_gameplay_response_21",
		name = "pbw_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_wizard_misses_bomb_01"
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
		response = "pdr_gameplay_wizard_misses_bomb_01",
		name = "pdr_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pwb_gameplay_response_18",
		name = "pwb_gameplay_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_wizard_misses_bomb_01"
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
		response = "pwe_gameplay_wizard_misses_bomb_01",
		name = "pwe_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pbw_gameplay_response_19",
		name = "pbw_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_wizard_misses_bomb_01"
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
		response = "pes_gameplay_wizard_misses_bomb_01",
		name = "pes_gameplay_wizard_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pbw_gameplay_response_20",
		name = "pbw_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_wizard_misses_bomb_01"
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
		response = "pwh_gameplay_solider_misses_bomb_01",
		name = "pwh_gameplay_solider_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pes_gameplay_response_16",
		name = "pes_gameplay_response_16",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_solider_misses_bomb_01"
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
		response = "pdr_gameplay_soldier_misses_bomb_01",
		name = "pdr_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pes_gameplay_response_13",
		name = "pes_gameplay_response_13",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_soldier_misses_bomb_01"
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
		response = "pdr_gameplay_response_18",
		name = "pdr_gameplay_response_18",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_13"
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
		response = "pwe_gameplay_soldier_misses_bomb_01",
		name = "pwe_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pes_gameplay_response_14",
		name = "pes_gameplay_response_14",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_soldier_misses_bomb_01"
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
		response = "pbw_gameplay_soldier_misses_bomb_01",
		name = "pbw_gameplay_soldier_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pes_gameplay_response_15",
		name = "pes_gameplay_response_15",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_soldier_misses_bomb_01"
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
		response = "pwh_gameplay_ranger_misses_bomb_01",
		name = "pwh_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_19",
		name = "pdr_gameplay_response_19",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwh_gameplay_ranger_misses_bomb_01"
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
		response = "pes_gameplay_ranger_misses_bomb_01",
		name = "pes_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_22",
		name = "pdr_gameplay_response_22",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_ranger_misses_bomb_01"
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
		response = "pes_gameplay_response_17",
		name = "pes_gameplay_response_17",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pdr_gameplay_response_22"
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
		response = "pdr_gameplay_response_23",
		name = "pdr_gameplay_response_23",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pes_gameplay_response_17"
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
		response = "pwe_gameplay_ranger_misses_bomb_01",
		name = "pwe_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_20",
		name = "pdr_gameplay_response_20",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pwe_gameplay_ranger_misses_bomb_01"
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
		response = "pbw_gameplay_ranger_misses_bomb_01",
		name = "pbw_gameplay_ranger_misses_bomb_01",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grenade_exp"
			},
			{
				"query_context",
				"grenade_owner",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"query_context",
				"hit",
				OP.EQ,
				0
			},
			{
				"user_context",
				"friends_close",
				OP.GTEQ,
				1
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
		response = "pdr_gameplay_response_21",
		name = "pdr_gameplay_response_21",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"pbw_gameplay_ranger_misses_bomb_01"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	add_dialogues({
		pes_gameplay_elf_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.3461666107178
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
			sound_events_duration = {
				[1.0] = 4.3262915611267
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6843333244324
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3102707862854
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
			sound_events_duration = {
				[1.0] = 5.2136664390564
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
			sound_events_duration = {
				[1.0] = 5.8331665992737
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01"
			}
		},
		pbw_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.4454793930054
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_killing_a_second_rat_ogre_01"
			}
		},
		pes_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.8738125562668
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
			sound_events_duration = {
				[1.0] = 4.520124912262
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pwe_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9731457233429
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pwe_gameplay_response_40 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.6742081642151
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_40"
			}
		},
		pwe_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0792915821075
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_125"
			}
		},
		pes_gameplay_response_174 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_174"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.470999956131
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_174"
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
			sound_events_duration = {
				[1.0] = 3.3839166164398
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
			sound_events_duration = {
				[1.0] = 3.4156250953674
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_01"
			}
		},
		pwh_gameplay_response_160 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_160"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9597709178925
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_160"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6094167232513
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
			sound_events_duration = {
				[1.0] = 3.2464375495911
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_killing_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1709792613983
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
			sound_events_duration = {
				[1.0] = 3.6907708644867
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
			sound_events_duration = {
				[1.0] = 1.3627916574478
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8180208206177
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.277708530426
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01"
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
			sound_events_duration = {
				[1.0] = 3.3643124103546
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.026166677475
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5237708091736
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_188"
			}
		},
		pdr_gameplay_hunter_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.3679165840149
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09"
			}
		},
		pwh_gameplay_hunter_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1684167385101
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_09_reply_01"
			}
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
			sound_events_duration = {
				[1.0] = 3.0903332233429
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01_reply_02"
			}
		},
		pbw_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5409166812897
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_soldier_caught_by_slaver_3_times_two = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0596458911896
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two"
			}
		},
		pdr_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4206874370575
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pes_gameplay_hunter_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6652500629425
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.4067707061768
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
			sound_events_duration = {
				[1.0] = 3.0702500343323
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			}
		},
		pbw_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6128542423248
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_123"
			}
		},
		pes_gameplay_response_32 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2151041030884
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
			sound_events_duration = {
				[1.0] = 2.4939167499542
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pwe_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8743541240692
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_191"
			}
		},
		pwe_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0973958969116
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_08"
			}
		},
		pwe_gameplay_response_161 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_161",
				[2.0] = "pdr_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.3709998130798,
				[2.0] = 3.7340624332428
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_161",
				[2.0] = "pdr_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4060416221619
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6352915763855
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01"
			}
		},
		pwe_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.3161250352859
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7350000143051
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_response_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9708333015442
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_05"
			}
		},
		pdr_gameplay_response_161 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_gameplay_response_161",
				[2.0] = "pdr_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.8654789924622,
				[2.0] = 2.8445208072662
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_161",
				[2.0] = "pdr_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_174 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_174"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0672917366028
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_174"
			}
		},
		pbw_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7755208015442
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pwh_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 5.2872290611267
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_misses_bomb_01"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02"
			}
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
			sound_events_duration = {
				[1.0] = 5.6083126068115
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_reply_01"
			}
		},
		pes_gameplay_response_148 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_148",
				[2.0] = "pbw_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8157291412354,
				[2.0] = 2.2381875514984
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_148",
				[2.0] = "pbw_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_162 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_162"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6843957901001
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_162"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6928958892822
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
			sound_events_duration = {
				[1.0] = 3.2446458339691
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
			sound_events_duration = {
				[1.0] = 3.4214792251587
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_03"
			}
		},
		pwh_gameplay_response_155 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_155",
				[2.0] = "pwh_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0076456069946,
				[2.0] = 3.8949999809265
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_155",
				[2.0] = "pwh_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6792917251587
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1117708683014
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_response_131 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0816457271576
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_131"
			}
		},
		pes_gameplay_response_171 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_171"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7205208539963
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_171"
			}
		},
		pes_gameplay_response_139 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_139",
				[2.0] = "pwh_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3132915496826,
				[2.0] = 5.0317916870117
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_139",
				[2.0] = "pwh_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 8.637770652771
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.9196872711182
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_03_azsd = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5489375591278
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
			sound_events_duration = {
				[1.0] = 2.2182083129883
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02"
			}
		},
		pwh_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3977084159851
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_126"
			}
		},
		pes_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.3357915878296
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_misses_bomb_01"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.7639789581299
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pbw_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.56014585495
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_misses_bomb_01"
			}
		},
		pwh_gameplay_response_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5328125953674
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_06"
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
			sound_events_duration = {
				[1.0] = 2.9307708740234
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_another_is_bunnyjumping_01"
			}
		},
		pes_gameplay_response_119 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 0.90125000476837
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_119"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.9522914886475
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02"
			}
		},
		pbw_gameplay_elf_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.7866666316986
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
			sound_events_duration = {
				[1.0] = 1.6365833282471
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			}
		},
		pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.1630001068115
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
			sound_events_duration = {
				[1.0] = 3.8580832481384
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02"
			}
		},
		pwe_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.0933332443237
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.0286664962769
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pbw_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2757709026337
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_39"
			}
		},
		pwh_gameplay_ranger_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4168124198914
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_04"
			}
		},
		pwh_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6046874523163
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_wizard_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6698334217072
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_12"
			}
		},
		pwe_gameplay_wizard_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1935832500458
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_response_082 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_082"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6281249523163
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_082"
			}
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
			sound_events_duration = {
				[1.0] = 5.4828124046326
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
			sound_events_duration = {
				[1.0] = 3.8214375972748
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_another_is_bunnyjumping_01"
			}
		},
		pwe_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1438331604004
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_182"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4063749313355
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02"
			}
		},
		pwh_gameplay_response_156 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_156"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2740626335144
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_156"
			}
		},
		pes_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5299792289734
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_178"
			}
		},
		pwe_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9388542175293
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_149"
			}
		},
		pbw_gameplay_response_141 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_141"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7555416822434
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_141"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5759167671204
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pdr_gameplay_response_194 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_194"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0926876068115
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_194"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5128126144409
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.368958234787
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_39"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2286250591278
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6797082424164
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_151"
			}
		},
		pes_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2868332862854
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_wizard_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.9252500534058
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02"
			}
		},
		pes_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5023334026337
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_150"
			}
		},
		pwe_gameplay_response_155 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_155"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0507500171661
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_155"
			}
		},
		pwh_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7859165668488
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_191"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7451875209808
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pes_gameplay_response_138 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_138"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.1015207767487
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_138"
			}
		},
		pes_gameplay_response_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_04"
			}
		},
		pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2331666946411
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pes_gameplay_response_116 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.661812543869
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_116"
			}
		},
		pwe_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 0.80291664600372
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_21"
			}
		},
		pbw_gameplay_response_155 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_155",
				[2.0] = "pbw_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2663540840149,
				[2.0] = 1.6343749761581
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_155",
				[2.0] = "pbw_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8832502365112
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			}
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
			sound_events_duration = {
				[1.0] = 2.231645822525
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pdr_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0931665897369
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.221604347229
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5852708816528
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
			sound_events_duration = {
				[1.0] = 3.6204373836517
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pwe_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8485207557678
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_20"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.7169585227966
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2191457748413
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			}
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
			sound_events_duration = {
				[1.0] = 1.7590416669846
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01"
			}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4194791316986
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
			sound_events_duration = {
				[1.0] = 2.0555417537689
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_04"
			}
		},
		pbw_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.178750038147
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_180"
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
			sound_events_duration = {
				[1.0] = 2.3760416507721
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
			sound_events_duration = {
				[1.0] = 0.67268747091293
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03"
			}
		},
		pdr_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0369167327881
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_150"
			}
		},
		pwh_gameplay_response_159 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_159",
				[2.0] = "pdr_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3045415878296,
				[2.0] = 3.1486666202545
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_159",
				[2.0] = "pdr_gameplay_soldier_killing_troll_ranged_01"
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
			sound_events_duration = {
				[1.0] = 2.8137500286102
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_053"
			}
		},
		pwh_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.736624956131
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 9.8933334350586
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.0928750038147
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_12_reply_01"
			}
		},
		pes_gameplay_response_172 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_172"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9857083559036
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_172"
			}
		},
		pbw_gameplay_wizard_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8894584178925
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5193123817444
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_184"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.0725002288818
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.8318958282471
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04"
			}
		},
		pwh_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2531249523163
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_178"
			}
		},
		pdr_gameplay_soldier_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5148541927338
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11"
			}
		},
		pwe_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7338540554047
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_124"
			}
		},
		pwh_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9971041679382
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_179"
			}
		},
		pbw_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6776249408722
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5426459312439
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_183"
			}
		},
		pdr_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0450832843781
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_21"
			}
		},
		pdr_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.9240000247955
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_20"
			}
		},
		pwe_gameplay_ranger_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.726583480835
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_misses_bomb_01"
			}
		},
		pdr_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 0.49114581942558
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_23"
			}
		},
		pwh_gameplay_hanging_help = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.4445834159851,
				1.726083278656,
				1.9011458158493,
				1.6703333854675,
				2.4530000686645,
				3.1792917251587
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
			sound_events_duration = {
				[1.0] = 3.2707707881927
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
			sound_events_duration = {
				[1.0] = 4.5426459312439
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
			sound_events_duration = {
				[1.0] = 3.2187917232513
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01"
			}
		},
		pwe_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0745000839233
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_192"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.6179790496826
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03"
			}
		},
		pwe_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0631041526794
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.9409790039063
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_misses_bomb_01"
			}
		},
		pes_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.0859167575836
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_misses_bomb_01"
			}
		},
		pdr_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.7102916240692
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_19"
			}
		},
		pes_gameplay_response_15 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_15"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 0.59985417127609
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_15"
			}
		},
		pwh_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1761040687561
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
			sound_events_duration = {
				[1.0] = 3.8440208435059
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_044"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6820416450501
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_response_14 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_14"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7819374799728
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_14"
			}
		},
		pdr_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3210833072662
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_22"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2337501049042
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8996040821075
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.03870844841
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_18"
			}
		},
		pes_gameplay_response_167 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_167"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1003959178925
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_167"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3893332481384
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.1999998092651
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.2964375019074
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pdr_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.8095417022705
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_misses_bomb_01"
			}
		},
		pes_gameplay_response_16 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_16"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.0083541870117
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_16"
			}
		},
		pwh_gameplay_solider_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_solider_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 1.8142499923706
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_solider_misses_bomb_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8851666450501
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_04_reply_01"
			}
		},
		pdr_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9362709522247
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pwh_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2000000476837
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_192"
			}
		},
		pwe_gameplay_hunter_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.7410624027252
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7977709770203
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwh_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.2771874666214
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_124"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.4446458816528
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwe_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.6887917518616
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_misses_bomb_01"
			}
		},
		pbw_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5723123550415
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_187"
			}
		},
		pwb_gameplay_response_18 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwb_gameplay_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.3848748207092
			},
			localization_strings = {
				[1.0] = "pwb_gameplay_response_18"
			}
		},
		pdr_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7575626373291
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_misses_bomb_01"
			}
		},
		pbw_gameplay_hunter_kills_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9089374542236
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
			}
		},
		pwh_gameplay_wizard_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.9468123912811
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_misses_bomb_01"
			}
		},
		pbw_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.6679792404175
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_21"
			}
		},
		pwe_gameplay_response_24 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_24"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.723729133606
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_24"
			}
		},
		pbw_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6131250858307
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pes_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5488125085831
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pdr_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9719791412353
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2016665935516
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pes_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.2866249084473
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_misses_bomb_01"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.5475206375122
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pwe_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 1.6683332920075
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_23"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4954373836517
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.197562456131
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_reply_01"
			}
		},
		pwe_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 1.2649375200272
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_22"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8371665477753
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pes_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0599167346954
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 4.140124797821
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_misses_bomb_01"
			}
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.9008123874664
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			}
		},
		pwh_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.9102499485016
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_misses_bomb_01"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.8522915840149
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0534999370575
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_177"
			}
		},
		pwh_gameplay_response_22 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.9586040973663
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_22"
			}
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6641874313355
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01"
			}
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
			sound_events_duration = {
				[1.0] = 1.4179999828339
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_response_21 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.3809583187103
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_21"
			}
		},
		pwh_gameplay_response_157 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_157",
				[2.0] = "pwh_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8428750038147,
				[2.0] = 2.9807915687561
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_157",
				[2.0] = "pwh_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_response_141 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_141"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7400624752045
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_141"
			}
		},
		pdr_gameplay_response_159 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_159"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.9873123168945
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_159"
			}
		},
		pbw_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2646458148956
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_177"
			}
		},
		pwh_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.1216042041779
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_20"
			}
		},
		pwe_gameplay_soldier_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4639375209808
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_08_reply_01"
			}
		},
		pwh_gameplay_response_158 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_158"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9046459197998
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_158"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.3000001907349
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pwe_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9366042613983
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.7909791469574
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_38"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.3587498664856
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pes_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2053959369659
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_elf_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0698957443237
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12_reply_01"
			}
		},
		pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.7884166240692
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			}
		},
		pbw_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.6358125209808
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_caught_by_slaver_3_times_02"
			}
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
			sound_events_duration = {
				[1.0] = 2.0899584293366
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5248334407806
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5350208282471
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9073750972748
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			}
		},
		pes_gameplay_response_144 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_144",
				[2.0] = "pbw_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5143959522247,
				[2.0] = 1.246749997139
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_144",
				[2.0] = "pbw_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.956333398819
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.7193331718445
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.2738122940064
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3086874485016
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04"
			}
		},
		pwh_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6085624694824
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_hunter_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.663229227066
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05"
			}
		},
		pwe_gameplay_response_156 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_156",
				[2.0] = "pes_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7527084350586,
				[2.0] = 2.239458322525
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_156",
				[2.0] = "pes_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5530834197998
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0772082805634
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1788959503174
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2052083015442
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1682915687561
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_ranged_01"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6903749704361
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.2524583339691
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2474999427795
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5913958549499
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pwe_gameplay_ranger_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4539792537689
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7711873054504
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5020208358765
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.1999998092651
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8635416030884
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2573747634888
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3830208778381
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_126"
			}
		},
		pwe_gameplay_response_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6161665916443
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_09"
			}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.539520740509
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pbw_gameplay_ranger_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.8851873874664
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_09"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.923708319664
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pes_gameplay_soldier_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.9910207986832
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_08_reply_01"
			}
		},
		pbw_gameplay_soldier_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.8350625038147
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_misses_bomb_01"
			}
		},
		pwh_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.0958333015442
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_19"
			}
		},
		pwe_gameplay_response_195 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_195"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1313126087189
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_195"
			}
		},
		pdr_gameplay_wizard_kills_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.8113541603088
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6400625705719
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_ranged_01"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8038332462311
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
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
			sound_events_duration = {
				[1.0] = 4.8168540000916
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01"
			}
		},
		pes_gameplay_hanging_help = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.7967916727066,
				1.9630000591278,
				2.0131666660309,
				1.4808541536331,
				2.4451458454132,
				2.6665208339691
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
		pwe_gameplay_response_157 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_157"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5322916507721
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_157"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7981040477753
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pes_gameplay_response_137 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_137"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6364583969116
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_137"
			}
		},
		pwe_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3766875267029
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_185"
			}
		},
		pwh_gameplay_response_145 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_145",
				[2.0] = "pwe_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5002915859222,
				[2.0] = 5.2760210037231
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_145",
				[2.0] = "pwe_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9027292728424
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			}
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
			sound_events_duration = {
				[1.0] = 3.3083333969116
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02"
			}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.654833316803
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01"
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
			sound_events_duration = {
				[1.0] = 4.1708331108093
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_dwarf_picks_up_a_bomb_01"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4417500495911
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwe_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5692291259766
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_elf_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7075417041779
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7438333034515
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7106041908264
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07"
			}
		},
		pbw_gameplay_hunter_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6360416412353
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_02"
			}
		},
		pes_gameplay_response_140 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_140"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2160415649414
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_140"
			}
		},
		pdr_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0040001869202
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_154"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3073334693909
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01"
			}
		},
		pwh_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8351666927338
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1680417060852
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pbw_gameplay_response_19 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4829165935516
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_19"
			}
		},
		pes_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6865000724792
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_180"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 8.8636665344238
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pwe_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8144791126251
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6016042232513
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_183"
			}
		},
		pwe_gameplay_response_159 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_159"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9488334655762
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_159"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7419791221619
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pdr_gameplay_response_132 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4652082920074
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_132"
			}
		},
		pwe_gameplay_hunter_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.5054166316986
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_12"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7551875114441
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.3812294006348
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1301875114441
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01"
			}
		},
		pbw_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9483957290649
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8722500801086
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8025417327881
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_05"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.149875164032
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pwh_gameplay_response_079 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2911250591278
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_079"
			}
		},
		pwh_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6257083415985
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_hit_by_goo_thrice_02"
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
			sound_events_duration = {
				[1.0] = 2.1974582672119
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pdr_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8858542442322
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.5630831718445
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pes_gameplay_response_170 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_170"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3319582939148
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_170"
			}
		},
		pwe_gameplay_hanging_help = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.2326250076294,
				3.2326250076294,
				1.8696249723434,
				1.6470416784286,
				1.9007707834244,
				3.8779792785645
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
			sound_events_duration = {
				[1.0] = 2.1261665821075
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
			sound_events_duration = {
				[1.0] = 3.0716667175293
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02"
			}
		},
		pwh_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.170104265213
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pbw_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4932084083557
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_response_079 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2222292423248
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_079"
			}
		},
		pdr_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4021875858307
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pes_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5680832862854
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_response_081 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_081"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0006248950958
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_081"
			}
		},
		pbw_gameplay_response_175 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_175"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2624583244324
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_175"
			}
		},
		pes_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.86416667699814
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_181"
			}
		},
		pwh_gameplay_soldier_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3372502326965
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_melee_01"
			}
		},
		pbw_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4821457862854
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_186"
			}
		},
		pdr_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5512082576752
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_182"
			}
		},
		pwe_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9452707767487
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_079 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8851873874664
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_079"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1121039390564
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.6560626029968
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08"
			}
		},
		pwh_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3809790611267
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_187"
			}
		},
		pbw_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7862708568573
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4564166069031
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_123"
			}
		},
		pes_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1620626449585
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_troll_melee_01"
			}
		},
		pbw_gameplay_response_150 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_150",
				[2.0] = "pes_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4987082481384,
				[2.0] = 3.040833234787
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_150",
				[2.0] = "pes_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3619999885559
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2539792060852
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_01"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6143126487732
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pwh_gameplay_elf_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9188542366028
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_caught_by_slaver_3_times_02"
			}
		},
		pwh_gameplay_hunter_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.8912916183472
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_08_reply_01"
			}
		},
		pwh_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4117293357849
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_190"
			}
		},
		pwe_gameplay_response_126 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.0455832481384
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_126"
			}
		},
		pwh_gameplay_hunter_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8827290534973
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_06_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.5591459274292
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_06_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7938332557678
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_04_reply_01"
			}
		},
		pwe_gameplay_soldier_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.704062461853
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_hunter_downed_3_times_11_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5777292251587
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_11_reply_02"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2459583282471
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.184187412262
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.9866456985474
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8136665821075
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02"
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
			sound_events_duration = {
				[1.0] = 0.53977084159851
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_043"
			}
		},
		pdr_gameplay_hunter_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1288542747498
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10"
			}
		},
		pdr_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1394376754761
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_185"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.092916727066
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01"
			}
		},
		pwe_gameplay_killing_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5700833797455
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_killing_a_rat_ogre_01"
			}
		},
		pes_gameplay_response_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.0902707576752
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_13"
			}
		},
		pwe_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.045437335968
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_181"
			}
		},
		pes_gameplay_hunter_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.0278749465942
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0380001068115
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.0801043510437
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.2518539428711
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4712500572205
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3647084236145
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9467916488648
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_melee_01"
			}
		},
		pwh_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2036666870117
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3932082653046
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4140417575836
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9051458835602
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_02_reply_01"
			}
		},
		pbw_gameplay_soldier_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0608959197998
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07"
			}
		},
		pbw_gameplay_hunter_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.4993958473206
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_03"
			}
		},
		pdr_gameplay_hanging_help = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
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
			sound_events_duration = {
				3.2312500476837,
				2.1472499370575,
				3.9923958778381,
				4.2404165267944,
				3.0713124275208,
				4.147979259491
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
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.2821249961853
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pdr_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6384999752045
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_190"
			}
		},
		pbw_gameplay_response_148 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_148"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1942291259766
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_148"
			}
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
			sound_events_duration = {
				[1.0] = 2.4719998836517
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_045"
			}
		},
		pbw_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7217292785645
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_38"
			}
		},
		pwe_gameplay_soldier_downed_3_times_12 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5231459140778
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12"
			}
		},
		pes_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6711459159851
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_182"
			}
		},
		pdr_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6752083301544
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_troll_melee_01"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7904584407806
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
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
			sound_events_duration = {
				[1.0] = 5.4451456069946
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			}
		},
		pbw_gameplay_hunter_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8324167728424
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_elf_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.8666042089462
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9681458473206
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9346458911896
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pbw_gameplay_response_07_b = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_07_b"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9031875133514
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_07_b"
			}
		},
		pdr_gameplay_wizard_fires_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_fires_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0513334274292
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_fires_a_rat_ogre_01"
			}
		},
		pwe_gameplay_hunter_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.2966876029968
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13"
			}
		},
		pbw_gameplay_soldier_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.9855208396912
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_08"
			}
		},
		pwh_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4189167022705
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_149"
			}
		},
		pes_gameplay_wizard_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.1784374713898
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_06"
			}
		},
		pwe_gameplay_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7749581336975
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_07"
			}
		},
		pdr_gameplay_wizard_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.9230208396912
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_10"
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
			sound_events_duration = {
				[1.0] = 6.4049792289734
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.82847905159
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03"
			}
		},
		pbw_gameplay_response_37 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.7976666688919
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
			sound_events_duration = {
				[1.0] = 3.5562291145325
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_044"
			}
		},
		pes_gameplay_elf_shoots_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_shoots_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0554165840149
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_shoots_a_rat_ogre_01"
			}
		},
		pwh_gameplay_killing_a_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6248958110809
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_rat_ogre_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5422084331513
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_08_reply_01"
			}
		},
		pes_gameplay_ranger_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2741458415985
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_09_reply_01"
			}
		},
		pbw_gameplay_ranger_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.8213124275208
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_08"
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
			sound_events_duration = {
				[1.0] = 1.8282916545868
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_054"
			}
		},
		pwh_gameplay_response_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3361041545868
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_08"
			}
		},
		pwh_gameplay_wizard_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.6729583740234
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_04"
			}
		},
		pwe_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4689373970032
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_147"
			}
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
			sound_events_duration = {
				[1.0] = 5.1656875610352
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			}
		},
		pbw_gameplay_ranger_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.7990416288376
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07"
			}
		},
		pwh_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8480625152588
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5013333559036
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_08_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5737916231155
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_response_154 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_154",
				[2.0] = "pwh_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3548958301544,
				[2.0] = 6.673291683197
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_154",
				[2.0] = "pwh_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.7887916564941
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_misses_bomb_01"
			}
		},
		pwe_gameplay_response_158 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_158",
				[2.0] = "pwe_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7744791507721,
				[2.0] = 2.8671040534973
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_158",
				[2.0] = "pwe_gameplay_wizard_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2174792289734
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_152"
			}
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
			sound_events_duration = {
				[1.0] = 1.9025624990463
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pbw_gameplay_response_149 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.00816655159
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_149"
			}
		},
		pwe_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6328959465027
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02"
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
			sound_events_duration = {
				[1.0] = 3.8599584102631
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			}
		},
		pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.7826042175293
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pbw_gameplay_response_153 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_153",
				[2.0] = "pwh_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.164083480835,
				[2.0] = 1.3996249437332
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_153",
				[2.0] = "pwh_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
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
			sound_events_duration = {
				[1.0] = 2.746791601181
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.5513124465942
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_response_153 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_153",
				[2.0] = "pwe_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2950832843781,
				[2.0] = 4.4217500686645
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_153",
				[2.0] = "pwe_gameplay_soldier_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8754374980927
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_response_145 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_145"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.694000005722
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_145"
			}
		},
		pbw_gameplay_response_116 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.5398540496826
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_116"
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
			sound_events_duration = {
				[1.0] = 5.3559165000916
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
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
			sound_events_duration = {
				[1.0] = 2.6435208320618
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
			sound_events_duration = {
				[1.0] = 5.1474165916443
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_04"
			}
		},
		pbw_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.997270822525
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_ranged_01"
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
			sound_events_duration = {
				[1.0] = 2.4668333530426
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pbw_gameplay_response_151 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_151",
				[2.0] = "pwe_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1344165802002,
				[2.0] = 4.4044165611267
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_151",
				[2.0] = "pwe_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_soldier_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8972084522247
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_09"
			}
		},
		pes_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6683332920075
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7967500686645
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_response_149 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_149",
				[2.0] = "pes_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6704375743866,
				[2.0] = 3.9827499389648
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_149",
				[2.0] = "pes_gameplay_ranger_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4483957290649
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
			sound_events_duration = {
				[1.0] = 2.3513541221619
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03"
			}
		},
		pes_gameplay_hunter_hit_by_goo_thrice = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.9989166259766
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_hit_by_goo_thrice"
			}
		},
		pwe_gameplay_soldier_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.383749961853
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7956042289734
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pdr_gameplay_response_157 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pdr_gameplay_response_157",
				[2.0] = "pwe_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.120374917984,
				[2.0] = 2.0093333721161
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_157",
				[2.0] = "pwe_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_soldier_downed_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0639584064484
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_02"
			}
		},
		pdr_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9574167728424
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_186"
			}
		},
		pes_gameplay_response_114 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.005083322525
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_114"
			}
		},
		pbw_gameplay_hunter_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8500626087189
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.761833190918
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			}
		},
		pes_gameplay_response_168 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_168"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7227292060852
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_168"
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
			sound_events_duration = {
				[1.0] = 4.4614791870117
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pwe_gameplay_response_160 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_160",
				[2.0] = "pdr_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9625415802002,
				[2.0] = 3.7712917327881
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_160",
				[2.0] = "pdr_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6178125143051
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_184"
			}
		},
		pdr_gameplay_hunter_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.0454998016357
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_ranger_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.4722291231155
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.0216457843781
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_response_144 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_144"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9440834522247
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_144"
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
			sound_events_duration = {
				[1.0] = 2.3719792366028
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06"
			}
		},
		pbw_gameplay_soldier_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.9446874856949
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_06"
			}
		},
		pwe_gameplay_response_162 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_162"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5483748912811
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_162"
			}
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.6430000066757
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_02"
			}
		},
		pbw_gameplay_soldier_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0032708644867
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_troll_melee_01"
			}
		},
		pes_gameplay_response_146 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pes_gameplay_response_146",
				[2.0] = "pes_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7487291097641,
				[2.0] = 3.5201041698456
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_146",
				[2.0] = "pes_gameplay_elf_killing_troll_ranged_01"
			},
			randomize_indexes = {}
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
			sound_events_duration = {
				[1.0] = 3.1098749637604
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_056"
			}
		},
		pdr_gameplay_response_160 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_160"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3836874961853
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_160"
			}
		},
		pwe_gameplay_elf_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4436457157135
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_response_148 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_148",
				[2.0] = "pes_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3911666870117,
				[2.0] = 1.8489583730698
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_148",
				[2.0] = "pes_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_response_199 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_199",
				[2.0] = "pdr_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5523958206177,
				[2.0] = 3.3403542041779
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_199",
				[2.0] = "pdr_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_wizard_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.8218958377838
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_08"
			}
		},
		pes_gameplay_elf_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.8644165992737
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_10"
			}
		},
		pes_gameplay_response_143 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_143"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2452917098999
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_143"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 7.0646247863769
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04"
			}
		},
		pwe_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2207708358765
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_ranger_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4751250743866
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_ranged_01"
			}
		},
		pbw_gameplay_soldier_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.9615416526794
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07_reply_01"
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
			sound_events_duration = {
				[1.0] = 1.7240833044052
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7340625524521
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_melee_01"
			}
		},
		pwh_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5112500190735
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_150"
			}
		},
		pes_gameplay_response_175 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_175"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9420208930969
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_175"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2192499637604
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01"
			}
		},
		pdr_gameplay_response_155 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_155"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8284165859222
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_155"
			}
		},
		pbw_gameplay_hunter_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.6534376144409
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_04"
			}
		},
		pwh_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5898332595825
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pbw_gameplay_response_146 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_146"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8703124523163
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_146"
			}
		},
		pdr_gameplay_response_153 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_153"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4233541488648
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_153"
			}
		},
		pbw_gameplay_ranger_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6492916345596
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_troll_melee_01"
			}
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 7.660749912262
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01"
			}
		},
		pdr_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8269166946411
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_152"
			}
		},
		pwe_gameplay_response_151 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwe_gameplay_response_151",
				[2.0] = "pdr_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5986042022705,
				[2.0] = 6.2466039657593
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_151",
				[2.0] = "pdr_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hunter_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9165832996368
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_troll_melee_01"
			}
		},
		pwe_gameplay_response_150 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.2469375133514
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_150"
			}
		},
		pwh_gameplay_response_148 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_148"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3770415782928
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_148"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.9079790115356
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04"
			}
		},
		pbw_gameplay_response_142 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_142"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.090562582016
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_142"
			}
		},
		pes_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6269166469574
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7526042461395
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwh_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.249979019165
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_152"
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
			sound_events_duration = {
				[1.0] = 3.7039999961853
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_response_117 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.8982917070389
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_117"
			}
		},
		pwh_gameplay_hunter_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1791875362396
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.796875
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwh_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9789375066757
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_troll_melee_01"
			}
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
			sound_events_duration = {
				[1.0] = 2.943437576294
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6368541717529
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pdr_gameplay_response_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4634585380554
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_07"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9573333263397
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pbw_gameplay_response_117 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5924167633057
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_117"
			}
		},
		pwh_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9551458358765
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_151"
			}
		},
		pwe_gameplay_response_152 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9021458625794
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_152"
			}
		},
		pes_gameplay_response_113 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.037145614624
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_113"
			}
		},
		pbw_gameplay_elf_killing_troll_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2810208797455
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_troll_melee_01"
			}
		},
		pwe_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.51597905159
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_127"
			}
		},
		pwe_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6091666221619
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_188"
			}
		},
		pdr_gameplay_response_195 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_195"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0526666641235
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_195"
			}
		},
		pbw_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2879791259766
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_188"
			}
		},
		pes_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8786250352859
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_179"
			}
		},
		pes_gameplay_ranger_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9082708358765
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_response_156 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_156"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9440417289734
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_156"
			}
		},
		pdr_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8605624437332
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_189"
			}
		},
		pbw_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4175624847412
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_183"
			}
		},
		pes_gameplay_wizard_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0062084197998
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_ranged_01"
			}
		},
		pwh_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.7577500343323
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_185"
			}
		},
		pbw_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6414375305176
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_182"
			}
		},
		pwe_gameplay_response_194 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_194"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5059585571289
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_194"
			}
		},
		pdr_gameplay_response_080 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_080"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.802791595459
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_080"
			}
		},
		pdr_gameplay_response_191 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9091458320618
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_191"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8450000286102
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_response_176 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_176"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2354791164398
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_176"
			}
		},
		pes_gameplay_response_071 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_071"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9802498817444
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_071"
			}
		},
		pbw_gameplay_soldier_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8342916965485
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4855415821075
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02"
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
			sound_events_duration = {
				[1.0] = 4.6303958892822
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pwe_gameplay_response_190 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2688748836517
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_190"
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
			sound_events_duration = {
				[1.0] = 2.0364375114441
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_14 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4786875247955
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14"
			}
		},
		pbw_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.0480625629425
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8759167194366
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2776875495911
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_03_reply_01"
			}
		},
		pes_gameplay_response_142 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_142"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.839604139328
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_142"
			}
		},
		pwh_gameplay_elf_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8679583072662
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_05"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2498333454132
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwh_gameplay_response_188 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0986042022705
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_188"
			}
		},
		pwe_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1987500190735
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_189"
			}
		},
		pwh_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0481877326965
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_186"
			}
		},
		pdr_gameplay_hunter_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2255001068115
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1627707481384
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13_reply_01"
			}
		},
		pbw_gameplay_ranger_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.4792292118073
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
			sound_events_duration = {
				[1.0] = 5.4133543968201
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_01"
			}
		},
		pbw_gameplay_soldier_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5707499980927
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.5161457061768
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwe_gameplay_response_123 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.3896040916443
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_123"
			}
		},
		pes_gameplay_response_118 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.4777292013168
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_118"
			}
		},
		pdr_gameplay_wizard_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.4147500991821
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09_reply_01"
			}
		},
		pes_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5121666193008
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pwh_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0333125591278
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_response_128 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.9133543968201
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_128"
			}
		},
		pbw_gameplay_response_078 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_078"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1641666889191
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_078"
			}
		},
		pes_gameplay_i_will_tank = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
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
			sound_events_duration = {
				2.2811040878296,
				4.3625831604004,
				2.618979215622,
				1.9424166679382,
				4.6153960227966,
				1.0561666488648,
				3.5016250610352,
				2.1384375095367,
				2.952166557312,
				1.8544374704361,
				2.060604095459,
				1.960000038147
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
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.3056458234787
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_05_reply_01"
			}
		},
		pwh_gameplay_ranger_killing_3_specials_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.5193333625794
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
			}
		},
		pwe_gameplay_elf_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.2945833206177
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_13_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8117709159851
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_09_reply_01"
			}
		},
		pdr_gameplay_response_193 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_193"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3872082233429
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_193"
			}
		},
		pwh_gameplay_elf_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.6025208234787
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_10_reply_01"
			}
		},
		pes_gameplay_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4541457891464
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_17"
			}
		},
		pwh_gameplay_wizard_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7556874752045
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5497500896454
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_187"
			}
		},
		pwh_gameplay_response_122 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.9498543739319
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_122"
			}
		},
		pbw_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6302083730698
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pes_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6365833282471
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pdr_gameplay_elf_killing_spawn_ranged_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1032083034515
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_ranged_01"
			}
		},
		pwe_gameplay_response_130 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.9252917766571
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_130"
			}
		},
		pbw_gameplay_response_176 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_176"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0192084312439
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_176"
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
			sound_events_duration = {
				[1.0] = 6
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7417500019074
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pes_gameplay_killing_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_killing_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1504166126251
			},
			localization_strings = {
				[1.0] = "pes_gameplay_killing_rat_ogre_01"
			}
		},
		pwe_gameplay_soldier_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1433124542236
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_melee_01"
			}
		},
		pwe_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7992498874664
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_184"
			}
		},
		pes_gameplay_response_173 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_173"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2980208396912
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_173"
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
			sound_events_duration = {
				[1.0] = 4.5487289428711
			},
			localization_strings = {
				[1.0] = "pes_gameplay_another_is_bunnyjumping_01"
			}
		},
		pbw_gameplay_killing_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_killing_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1148540973663
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_killing_rat_ogre_01"
			}
		},
		pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1709792613983
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			}
		},
		pdr_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2374999523163
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_180"
			}
		},
		pbw_gameplay_response_185 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7092914581299
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_185"
			}
		},
		pbw_gameplay_response_156 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_156",
				[2.0] = "pbw_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4592082500458,
				[2.0] = 2.3018333911896
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_156",
				[2.0] = "pbw_gameplay_hunter_killing_troll_ranged_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_ranger_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5859999656677
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_10"
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
			sound_events_duration = {
				[1.0] = 2.7698125839233
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pwe_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9666666984558
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_response_17 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.3195209503174
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_17"
			}
		},
		pwh_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5932500362396
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_39"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8407502174377
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01"
			}
		},
		pwh_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6566667556763
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_response_23 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9874792098999
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
			sound_events_duration = {
				[1.0] = 1.48672914505
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8023750782013
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_154"
			}
		},
		pbw_gameplay_response_124 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.7425625324249
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_124"
			}
		},
		pdr_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4523334503174
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pdr_gameplay_wizard_downed_3_times_09 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5728125572205
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09"
			}
		},
		pwh_gameplay_response_184 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.754625082016
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_184"
			}
		},
		pwh_gameplay_soldier_downed_3_times_05 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.3004999160767
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
			sound_events_duration = {
				[1.0] = 1.8532291650772
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01"
			}
		},
		pwe_gameplay_wizard_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.5652916431427
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11"
			}
		},
		pbw_gameplay_elf_downed_3_times_07 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.3509166240692
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07"
			}
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.8379373550415
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.0172915458679
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01"
			}
		},
		pwh_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6921665668488
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_181"
			}
		},
		pes_gameplay_soldier_downed_3_times_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9089167118073
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_reply_01"
			}
		},
		pdr_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7175834178925
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pwh_gameplay_response_177 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2476458549499
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_177"
			}
		},
		pwe_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5412292480469
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_180"
			}
		},
		pes_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1359374523163
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_elf_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5475833415985
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_melee_01"
			}
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
			sound_events_duration = {
				[1.0] = 2.9191875457764
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
			sound_events_duration = {
				[1.0] = 4.6996040344238
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_054"
			}
		},
		pwh_gameplay_response_071 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.6868124008179
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
			sound_events_duration = {
				[1.0] = 2.0294582843781
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
			sound_events_duration = {
				[1.0] = 3.3018751144409
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_another_is_bunnyjumping_01_alt1"
			}
		},
		pbw_gameplay_response_179 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1684582233429
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_179"
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
			sound_events_duration = {
				[1.0] = 4.1514792442322
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pbw_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5760624408722
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_181"
			}
		},
		pwh_gameplay_soldier_downed_3_times_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.9974792003632
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
			sound_events_duration = {
				[1.0] = 3.9818959236145
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02"
			}
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.4872916936874
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_response_38 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.7488958835602
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_38"
			}
		},
		pbw_gameplay_ranger_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.853395819664
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08_reply_01"
			}
		},
		pdr_gameplay_response_130 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.3040418624878
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_130"
			}
		},
		pwe_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.9340415000916
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_misses_bomb_01"
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
			sound_events_duration = {
				[1.0] = 1.090020775795
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pbw_gameplay_ranger_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0680415630341
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_11_reply_01"
			}
		},
		pdr_gameplay_i_will_tank = {
			sound_events_n = 14,
			face_animations_n = 14,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
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
			sound_events_duration = {
				0.9707083106041,
				1.3009999990463,
				1.5660624504089,
				1.6919374465942,
				2.0709583759308,
				3.6010000705719,
				3.1816875934601,
				0.99308335781097,
				2.6746459007263,
				3.3945624828339,
				3.4331667423248,
				2.8991458415985,
				5.2690415382385,
				2.5870416164398
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
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6377291679382
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
			sound_events_duration = {
				[1.0] = 3.0106875896454
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.2274789810181
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01"
			}
		},
		pwe_gameplay_wizard_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.1773748397827
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
			sound_events_duration = {
				[1.0] = 3.814374923706
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
			sound_events_duration = {
				[1.0] = 2.9986040592194
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01"
			}
		},
		pwe_gameplay_wizard_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.3591458797455
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
			sound_events_duration = {
				[1.0] = 0.66906249523163
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
			sound_events_duration = {
				[1.0] = 4.6509585380554
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			}
		},
		pdr_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9068748950958
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_misses_bomb_01"
			}
		},
		pes_gameplay_hunter_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.8433332443237
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_misses_bomb_01"
			}
		},
		pes_gameplay_response_136 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_136"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1050000190735
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_136"
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
			sound_events_duration = {
				[1.0] = 3.2809584140778
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
			sound_events_duration = {
				[1.0] = 1.5335208177566
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.3396666049957
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_hit_by_goo_thrice_02"
			}
		},
		pbw_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1665625572205
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_hit_by_goo_thrice_02"
			}
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
			sound_events_duration = {
				[1.0] = 3.0086250305176
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_ranger_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1285207271576
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_hit_by_goo_thrice_02"
			}
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
			sound_events_duration = {
				[1.0] = 5.1782917976379
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
			sound_events_duration = {
				[1.0] = 3.557416677475
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_response_127 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2607290744781
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_127"
			}
		},
		pwh_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5244584083557
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pes_gameplay_elf_downed_3_times_08 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0694375038147
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
			sound_events_duration = {
				[1.0] = 3.8659167289734
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
			sound_events_duration = {
				[1.0] = 4.182062625885
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
			sound_events_duration = {
				[1.0] = 4.9445209503174
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_reply_01"
			}
		},
		pwe_gameplay_response_39 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5257084369659
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_39"
			}
		},
		pwh_gameplay_response_36 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.0851874351502
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_36"
			}
		},
		pdr_gameplay_soldier_downed_3_times_10 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8430624008179
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0039374828339
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pwe_gameplay_soldier_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.425541639328
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_09_reply_01"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1765832901001
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6334373950958
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			}
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
			sound_events_duration = {
				[1.0] = 3.5346667766571
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_03"
			}
		},
		pwe_gameplay_soldier_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6749792098999
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_kiling_a_second_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.511833190918
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_kiling_a_second_rat_ogre_01"
			}
		},
		pwh_gameplay_response_180 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5721874237061
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_180"
			}
		},
		pes_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.780291557312
			},
			localization_strings = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pes_gameplay_hunter_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5021874904633
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
			sound_events_duration = {
				[1.0] = 3.0328333377838
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			}
		},
		pdr_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.6186456680298
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_02"
			}
		},
		pwe_gameplay_soldier_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.9329791069031
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_10_reply_01"
			}
		},
		pdr_gameplay_response_181 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5275626182556
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_181"
			}
		},
		pwe_gameplay_ranger_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4090416431427
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
			sound_events_duration = {
				[1.0] = 3.1266875267029
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_reply_01"
			}
		},
		pwh_gameplay_response_37_alt1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7279999256134
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_37_alt1"
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
			sound_events_duration = {
				[1.0] = 2.9589791297913
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6185417175293
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1979999542236
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			}
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
			sound_events_duration = {
				[1.0] = 2.5083749294281
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.7848334312439
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.7440209388733
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
			sound_events_duration = {
				[1.0] = 2.0552499294281
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02"
			}
		},
		pes_gameplay_response_115 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.3047292232513
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_115"
			}
		},
		pwe_gameplay_response_41 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4262707233429
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_41"
			}
		},
		pes_gameplay_response_31 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.2017292976379
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_31"
			}
		},
		pwe_gameplay_ranger_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.9157290458679
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_10_reply_01"
			}
		},
		pbw_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8561458587647
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_melee_01"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.3284583091736
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02"
			}
		},
		pwe_gameplay_response_129 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.069479227066
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
			sound_events_duration = {
				[1.0] = 2.125937461853
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_046"
			}
		},
		pwe_gameplay_hunter_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2385416030884
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.1735210418701
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_13_reply_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6363749504089
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_11"
			}
		},
		pbr_gameplay_elf_downed_3_times_11 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.6000000238419
			},
			localization_strings = {
				[1.0] = "pbr_gameplay_elf_downed_3_times_11"
			}
		},
		pbw_gameplay_hanging_help = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.9009791612625,
				1.270187497139,
				2.1469790935516,
				1.5290207862854,
				2.7162709236145,
				1.9411041736603
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
		pdr_gameplay_hunter_killing_rat_ogre_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6678333282471
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01"
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
			sound_events_duration = {
				[1.0] = 3.4710416793823
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01"
			}
		},
		pwh_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.1724166870117
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_125"
			}
		},
		pes_gameplay_response_151 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7900834083557
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_151"
			}
		},
		pes_gameplay_hunter_killing_spawn_melee_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.0389583110809
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_melee_01"
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
			sound_events_duration = {
				[1.0] = 4.1975002288818
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01"
			}
		},
		pes_gameplay_response_112 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2666459083557
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_112"
			}
		},
		pbw_gameplay_response_118 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7282707691193
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_118"
			}
		},
		pdr_gameplay_wizard_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2005624771118
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_07_reply_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2494790554047
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.2556457519531
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_02"
			}
		},
		pwe_gameplay_response_193 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_193"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6675000190735
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_193"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.157187461853
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
			sound_events_duration = {
				[1.0] = 4.8376460075378
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.5960416793823
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
			sound_events_duration = {
				[1.0] = 1.8165208101273
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.5948541164398
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
			sound_events_duration = {
				[1.0] = 3.2893540859222
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
			sound_events_duration = {
				[1.0] = 2.3800001144409
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.7393958568573
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_05_reply_01"
			}
		},
		pwh_gameplay_ranger_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1252915859222
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03"
			}
		},
		pbw_gameplay_elf_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.2881875038147
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
			sound_events_duration = {
				[1.0] = 2.0208957195282
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
			sound_events_duration = {
				[1.0] = 5.452166557312
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_reply_01"
			}
		},
		pbw_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9493124485016
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.3557291030884
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02"
			}
		},
		pwe_gameplay_hunter_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.1714792251587
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02"
			}
		},
		pbw_gameplay_elf_misses_bomb_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 4.604395866394
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_misses_bomb_01"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.2349791526794
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			}
		},
		pwh_gameplay_response_146 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_146"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8003749847412
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_146"
			}
		},
		pwh_gameplay_response_128 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.5255832672119
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_128"
			}
		},
		pes_gameplay_elf_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1140625476837
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_response_121 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.9997291564941
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_121"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.7536039352417
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pwe_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7218749523163
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_183"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1527500152588
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3385207653046
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
			sound_events_duration = {
				[1.0] = 3.9870624542236
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
			sound_events_duration = {
				[1.0] = 3.3370625972748
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
			sound_events_duration = {
				[1.0] = 3.1920208930969
			},
			localization_strings = {
				[1.0] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pdr_hunter_shoots_rat_ogre_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_hunter_shoots_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2000000476837
			},
			localization_strings = {
				[1.0] = "pdr_hunter_shoots_rat_ogre_01"
			}
		},
		pes_gameplay_hunter_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.0886249542236
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06"
			}
		},
		pbw_gameplay_response_119 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3136250972748
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_119"
			}
		},
		pdr_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.3202290534973
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_hunter_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.143958568573
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_02_reply_01"
			}
		},
		pwh_gameplay_response_182 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.5471873283386
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_182"
			}
		},
		pes_gameplay_wizard_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6578540802002
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_04_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.0427083969116
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03"
			}
		},
		pdr_gameplay_response_163 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_163"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9491667747498
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_163"
			}
		},
		pwe_gameplay_response_187 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.502729177475
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_187"
			}
		},
		pwh_gameplay_response_147 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pwh_gameplay_response_147",
				[2.0] = "pwe_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.765625,
				[2.0] = 2.8948750495911
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_147",
				[2.0] = "pwe_gameplay_wizard_killing_troll_melee_01"
			},
			randomize_indexes = {}
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
			sound_events_duration = {
				[1.0] = 1.9230624437332
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
			sound_events_duration = {
				[1.0] = 1.9096250534058
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
			sound_events_duration = {
				[1.0] = 4.1062707901001
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_050"
			}
		},
		pbw_gameplay_wizard_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9481041431427
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3070833683014
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_11_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9064373970032
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_07_reply_01"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9014582633972
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.8357706069946
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.4831042289734
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			}
		},
		pdr_gameplay_killing_a_rat_ogre_crossbow_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0934374332428
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.443895816803
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.4626665115356
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01"
			}
		},
		pwe_gameplay_ranger_hit_by_goo_thrice_00 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.127833366394
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_hit_by_goo_thrice_00"
			}
		},
		pbw_gameplay_wizard_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2802290916443
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_04_reply_01"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.7955622673035
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04"
			}
		},
		pdr_gameplay_wizard_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.2715001106262
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
			sound_events_duration = {
				[1.0] = 3.6804583072662
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.4529376029968
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01"
			}
		},
		pes_gameplay_elf_hit_by_goo_thrice_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.7402291297913
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_hit_by_goo_thrice_02"
			}
		},
		pdr_gameplay_response_125 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2574167251587
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_125"
			}
		},
		pes_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8210833072662
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_147"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.050666809082
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4023957252502
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_02"
			}
		},
		pwh_gameplay_wizard_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.9895625114441
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03_reply_01"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1465208530426
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_01"
			}
		},
		pwh_gameplay_response_189 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1927292346954
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_189"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3301665782928
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.37464594841
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
			sound_events_duration = {
				[1.0] = 2.5246665477753
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_response_043"
			}
		},
		pbw_gameplay_wizard_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5474374294281
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_06_reply_01"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3558125495911
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pbw_gameplay_response_157 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_157"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.733416557312
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_157"
			}
		},
		pwh_gameplay_wizard_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.4037289619446
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_10_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1496458053589
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_10_reply_01"
			}
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
			sound_events_duration = {
				[1.0] = 2.2004582881927
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02"
			}
		},
		pdr_gameplay_wizard_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.8710622787476
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_06_reply_01"
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
			sound_events_duration = {
				[1.0] = 4.582145690918
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			}
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
			sound_events_duration = {
				[1.0] = 4.6964998245239
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
			sound_events_duration = {
				[1.0] = 3.4939999580383
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_02"
			}
		},
		pdr_gameplay_ranger_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0958542823791
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_11_reply_01"
			}
		},
		pwe_gameplay_response_154 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3919582366943
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_154"
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
			sound_events_duration = {
				[1.0] = 2.2466666698456
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02"
			}
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.9452917575836
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
			sound_events_duration = {
				[1.0] = 1.925604224205
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
			sound_events_duration = {
				[1.0] = 2.6358957290649
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03"
			}
		},
		pbw_gameplay_response_178 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8267290592194
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_178"
			}
		},
		pwh_gameplay_wizard_downed_3_times_14_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 7.0014791488647
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14_reply_01"
			}
		},
		pbw_gameplay_wizard_downed_3_times_14_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1672916412353
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_14_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.0016667842865
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_10_reply_01"
			}
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
			sound_events_duration = {
				[1.0] = 2.8994374275208
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health__reply_02"
			}
		},
		pwh_gameplay_soldier_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.0904583930969
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
			sound_events_duration = {
				[1.0] = 3.4176042079926
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.0547292232513
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.6049375534058
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1971666812897
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.2039375305176
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_03"
			}
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.5054793357849
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1559791564941
			},
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.1674375534058
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04"
			}
		},
		pbw_gameplay_response_120 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4068541526794
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
			sound_events_duration = {
				[1.0] = 2.5639374256134
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
			sound_events_duration = {
				[1.0] = 1.9445416927338
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_13 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.1770000457764
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13"
			}
		},
		pes_gameplay_soldier_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5417499542236
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_soldier_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.2695832252502
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.7580833435059
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_06_reply_01"
			}
		},
		pbw_gameplay_response_145 = {
			sound_events_n = 2,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_response_145",
				[2.0] = "pwh_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.88218748569489,
				[2.0] = 6.2334585189819
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_145",
				[2.0] = "pwh_gameplay_soldier_killing_troll_melee_01"
			},
			randomize_indexes = {}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.4720001220703
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6573123931885
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.8394584655762
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.3662085533142
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4567
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1052916049957
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_09_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.9365208148956
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
			sound_events_duration = {
				[1.0] = 4.767541885376
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pes_gameplay_soldier_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.5743124485016
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_04_reply_01"
			}
		},
		pwe_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9564583301544
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pes_gameplay_elf_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3577709197998
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
			sound_events_duration = {
				[1.0] = 2.3347916603088
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pwh_gameplay_soldier_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.3931250572205
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_06 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.0160207748413
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06"
			}
		},
		pwh_gameplay_soldier_downed_3_times_04 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4936666488648
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04"
			}
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.6566041707993
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_01"
			}
		},
		pbw_gameplay_soldier_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3886458873749
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_05_reply_01"
			}
		},
		pwh_gameplay_ranger_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6878333091736
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_02_reply_01"
			}
		},
		pwe_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6460626125336
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7735209465027
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pwe_gameplay_ranger_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 0.55156248807907
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.7350833415985
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_12_reply_01"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 5.9997291564941
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_ranger_caught_by_slaver_3_times_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.774749994278
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02"
			}
		},
		pdr_gameplay_response_129 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6789166927338
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
			sound_events_duration = {
				[1.0] = 1.7483958005905
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01"
			}
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
			sound_events_duration = {
				[1.0] = 3.9071457386017
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01"
			}
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8294167518616
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
			sound_events_duration = {
				[1.0] = 4.358916759491
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_response_192 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9765207767487
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_192"
			}
		},
		pdr_gameplay_ranger_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4392292499542
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_13_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.4308540821075
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_07_reply_01"
			}
		},
		pdr_gameplay_ranger_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.8877291679382
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_09_reply_01"
			}
		},
		pbw_gameplay_response_20 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 0.34406250715256
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_20"
			}
		},
		pes_gameplay_response_169 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pes_gameplay_response_169"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2818541526794
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_169"
			}
		},
		pwh_gameplay_hunter_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.9809167385101
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
			sound_events_duration = {
				[1.0] = 3.8009374141693
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
			sound_events_duration = {
				[1.0] = 3.4157917499542
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_03_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.6138334274292
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_03_reply_01"
			}
		},
		pbw_gameplay_response_147 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4578542709351
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_147"
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
			sound_events_duration = {
				[1.0] = 0.90499997138977
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			}
		},
		pwe_gameplay_hunter_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.1983332633972
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.716875076294
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
			sound_events_duration = {
				[1.0] = 2.3019790649414
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			}
		},
		pwh_gameplay_hunter_downed_3_times_10_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.6896667480469
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_10_reply_01"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.0397291183472
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3154582977295
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			}
		},
		pes_gameplay_hunter_downed_3_times_06_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.9105000495911
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06_reply_01"
			}
		},
		pes_gameplay_response_30 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.5638332366943
			},
			localization_strings = {
				[1.0] = "pes_gameplay_response_30"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.245041847229
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03"
			}
		},
		pwh_gameplay_hunter_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.1999998092651
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_07_reply_01"
			}
		},
		pbw_gameplay_soldier_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5566458702087
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_hunter_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.2201042175293
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_04_reply_01"
			}
		},
		pdr_gameplay_elf_downed_3_times_13_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5163749456406
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
			sound_events_duration = {
				[1.0] = 2.7780208587647
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
			sound_events_duration = {
				[1.0] = 2.6144790649414
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01"
			}
		},
		pwh_gameplay_ranger_downed_3_time_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.4529999494553
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
			sound_events_duration = {
				[1.0] = 5.8677916526794
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
			sound_events_duration = {
				[1.0] = 2.8944375514984
			},
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4622082710266
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02_reply_01"
			}
		},
		pbw_killing_a_second_rat_ogre_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.8280000686645
			},
			localization_strings = {
				[1.0] = "pbw_killing_a_second_rat_ogre_02"
			}
		},
		pwe_gameplay_elf_downed_3_times_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.5234375
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_02_reply_01"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1526250839233
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			}
		},
		pwe_gameplay_elf_downed_3_times_12_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.3637707233429
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_12_reply_01"
			}
		},
		pdr_gameplay_response_158 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_158"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.3713750839233
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_158"
			}
		},
		pes_gameplay_elf_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 0.77727085351944
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08_reply_01"
			}
		},
		pdr_gameplay_response_40 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.2379791736603
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_40"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9027082920074
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
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
			sound_events_duration = {
				[1.0] = 2.7524583339691
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_04"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4873125553131
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
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
			sound_events_duration = {
				[1.0] = 2.619916677475
			},
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_07_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.0366666316986
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
			sound_events_duration = {
				[1.0] = 2.4987916946411
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01"
			}
		},
		pes_gameplay_elf_downed_3_times_09_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.6962914466858
			},
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_04_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 6.5744791030884
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
			sound_events_duration = {
				[1.0] = 3.0606875419617
			},
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01"
			}
		},
		pwh_gameplay_elf_downed_3_times_08_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4996874332428
			},
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_08_reply_01"
			}
		},
		pwe_gameplay_response_186 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pwe_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.298749923706
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_response_186"
			}
		},
		pdr_gameplay_response_183 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pdr_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3731875419617
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_response_183"
			}
		},
		pwe_gameplay_elf_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 1.9858958721161
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
			sound_events_duration = {
				[1.0] = 1.9656250476837
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
			sound_events_duration = {
				[1.0] = 2.7128958702087
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			}
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_02 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.8414373397827
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 3.5431876182556
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
			sound_events_duration = {
				[1.0] = 4.3161668777466
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			}
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 7.1352915763855
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
			sound_events_duration = {
				[1.0] = 2.6805624961853
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			}
		},
		pbw_gameplay_response_122 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.3430209159851
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_response_122"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.6877498626709
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.0424165725708
			},
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.5519165992737
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
			}
		},
		pes_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.4657082557678
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
			sound_events_duration = {
				[1.0] = 2.7886457443237
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01"
			}
		},
		pbw_gameplay_elf_downed_3_times_05_reply_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 4.2043747901917
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_05_reply_01"
			}
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01 = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "special_occasions_honduras",
			category = "special_occasion",
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
			sound_events_duration = {
				[1.0] = 2.912645816803
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
			sound_events_duration = {
				[1.0] = 3.3167707920074
			},
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04"
			}
		}
	})
end
