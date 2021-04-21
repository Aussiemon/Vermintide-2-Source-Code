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
		response = "pwe_gameplay_elf_downed_3_times_08_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_08_reply_01",
		criterias = {
			{
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
				"wood_elf"
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
				"pwe_gameplay_elf_downed_3_times_08_reply_01"
			},
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
		response = "pwe_gameplay_elf_downed_3_times_07_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_07_reply_01",
		criterias = {
			{
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
				"wood_elf"
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
				"pwe_gameplay_elf_downed_3_times_07_reply_01"
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
		response = "pwe_gameplay_elf_downed_3_times_03_reply_01",
		name = "pwe_gameplay_elf_downed_3_times_03_reply_01",
		criterias = {
			{
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
				"wood_elf"
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
				"pwe_gameplay_elf_downed_3_times_03_reply_01"
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
		response = "pwe_gameplay_hunter_downed_3_times_06_reply_01",
		name = "pwe_gameplay_hunter_downed_3_times_06_reply_01",
		criterias = {
			{
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
		response = "pdr_gameplay_soldier_downed_3_times_11_reply_01",
		name = "pdr_gameplay_soldier_downed_3_times_11_reply_01",
		criterias = {
			{
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
				"dwarf_ranger"
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
		response = "pdr_gameplay_soldier_downed_3_times_10_reply_01",
		name = "pdr_gameplay_soldier_downed_3_times_10_reply_01",
		criterias = {
			{
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
				"dwarf_ranger"
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
		name = "pbw_gameplay_elf_hit_by_goo_thrice_02",
		response = "pbw_gameplay_elf_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_elf_hit_by_goo_thrice_02",
		response = "pdr_gameplay_elf_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_elf_hit_by_goo_thrice_02",
		response = "pes_gameplay_elf_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_elf_hit_by_goo_thrice_02",
		response = "pwh_gameplay_elf_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
		response = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
		response = "pbw_gameplay_hunter_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
		response = "pdr_gameplay_hunter_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hunter_hit_by_goo_thrice",
		response = "pes_gameplay_hunter_hit_by_goo_thrice",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
		response = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
		response = "pwe_gameplay_hunter_hit_by_goo_thrice_03",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
		response = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
		response = "pbw_gameplay_ranger_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ranger_hit_by_goo_thrice_02",
		response = "pes_gameplay_ranger_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
		response = "pwe_gameplay_ranger_hit_by_goo_thrice_00",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
		response = "pwh_gameplay_ranger_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
		response = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
		response = "pbw_gameplay_soldier_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
		response = "pdr_gameplay_soldier_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
		response = "pwe_gameplay_soldier_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
		response = "pwh_gameplay_soldier_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
		response = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
		response = "pdr_gameplay_wizard_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wizard_hit_by_goo_thrice_02",
		response = "pes_gameplay_wizard_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
		response = "pwe_gameplay_wizard_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
		response = "pwh_gameplay_wizard_hit_by_goo_thrice_02",
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
			},
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMEDIFF,
				OP.GT,
				45
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
		response = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04",
		criterias = {
			{
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
		},
		on_done = {
			{
				"faction_memory",
				"time_since_hit_by_goo_vo",
				OP.TIMESET
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
				"dwarf_ranger"
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
				"empire_soldier"
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
				"pbw_gameplay_elf_killing_rat_ogre_ranged_01"
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
				"pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
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
		pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2809584140778
			},
			sound_events = {
				[1.0] = "pes_pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5431876182556
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_19 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_19"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.7102916240692
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_killing_a_rat_ogre_crossbow_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0934374332428
			},
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_rat_ogre_crossbow_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9666666984558
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_kills_3_specials_in_a_row_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8113541603088
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_kills_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_160 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_160",
				[2.0] = "pdr_gameplay_hunter_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 3.9625415802002,
				[2.0] = 3.7712917327881
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_160",
				[2.0] = "pdr_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.3760416507721
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_177 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_177"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2646458148956
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_08 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6560626029968
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_132 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_132"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4652082920074
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_132"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_downed_3_times_10 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_10"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5859999656677
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_18 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_18"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.03870844841
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_kills_3_specials_in_a_row_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9089374542236
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_kills_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_174 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_174"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0672917366028
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_174"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 0.66906249523163
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 1.925604224205
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_downed_3_times_13_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5163749456406
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6025208234787
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.8350625038147
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9191875457764
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 1.7590416669846
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 2.1709792613983
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_ranger_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2207708358765
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4751250743866
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_23 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_23"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9874792098999
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_186 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_186"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9574167728424
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.1514792442322
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_149 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_149"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.00816655159
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.8032187223434
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_response_044 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_044"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5562291145325
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_044"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_156 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_156",
				[2.0] = "pbw_gameplay_hunter_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 3.4592082500458,
				[2.0] = 2.3018333911896
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_156",
				[2.0] = "pbw_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_122 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_122"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9498543739319
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_122"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.231645822525
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2192499637604
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.6204373836517
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_184 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_184"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5193123817444
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9188542366028
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_151 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_151",
				[2.0] = "pdr_gameplay_soldier_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 2.5986042022705,
				[2.0] = 6.2466039657593
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_151",
				[2.0] = "pdr_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7340625524521
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.1974582672119
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6143126487732
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_13_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_13_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2945833206177
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_08 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_08"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2053959369659
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5248334407806
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6776249408722
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_elf_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6358125209808
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8532291650772
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8996040821075
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4712500572205
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7350000143051
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_09 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.3679165840149
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.4939167499542
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.704062461853
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_184 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_184"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6178125143051
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1761040687561
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_elf_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8351666927338
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_downed_3_times_12 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_12"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6698334217072
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4063749313355
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_hanging_help = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			localization_strings = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			sound_events_duration = {
				1.9009791612625,
				1.270187497139,
				2.1469790935516,
				1.5290207862854,
				2.7162709236145,
				1.9411041736603
			},
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
			}
		},
		pes_gameplay_response_117 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_117"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8982917070389
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_117"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_downed_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6360416412353
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_hunter_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8561458587647
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.0395728945732
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4523334503174
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4021875858307
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_181 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_181"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.045437335968
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_downed_3_times_07 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0608959197998
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_192 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_192"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0745000839233
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6352915763855
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5475833415985
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_hit_by_goo_thrice = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_hit_by_goo_thrice"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3996561765671
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_hit_by_goo_thrice"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.3587498664856
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_192 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_192"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2000000476837
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_downed_3_times_11 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5652916431427
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_response_136 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_136"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1050000190735
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_136"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_138 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_138"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.1015207767487
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_138"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 2.1117708683014
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 8.637770652771
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_ranger_downed_3_times_07 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7990416288376
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_elf_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.2866249084473
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_137 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_137"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6364583969116
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_137"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3154582977295
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_downed_3_times_12_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6049375534058
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8659167289734
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_182 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_182"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.5471873283386
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5759167671204
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 4.140124797821
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.4194791316986
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_38 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_38"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.7217292785645
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8144791126251
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.7639789581299
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.092916727066
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_13_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_13_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1735210418701
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6749792098999
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7451875209808
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_downed_3_times_06 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0160207748413
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2539792060852
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_downed_3_times_06 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2855312824249
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_response_172 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_172"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9857083559036
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_172"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_potions_above_half_health_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0903332233429
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_128 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_128"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5255832672119
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_128"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6652500629425
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9467916488648
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 8.8636665344238
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8722500801086
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.1975002288818
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4417500495911
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.9196872711182
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_elf_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.4710416793823
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_118 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_118"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.589822947979
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_118"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 5.5513124465942
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_124 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_124"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7338540554047
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 2.8754374980927
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_hunter_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5960416793823
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_194 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_194"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0926876068115
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_194"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_179 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_179"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8786250352859
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_downed_3_times_03_azsd = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_azsd"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5489375591278
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_azsd"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_wizard_downed_3_times_07 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7106041908264
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_elf_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.1352915763855
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.026166677475
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_20 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_20"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.9240000247955
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.2201042175293
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.157187461853
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_hunter_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.9340415000916
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.1944583654404
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6877498626709
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_elf_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4657082557678
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_elf_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.912645816803
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_40 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_40"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 4.6742081642151
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_40"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.2446458339691
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.4214792251587
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2573747634888
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_36 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_36"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 4.0851874351502
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_36"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6641874313355
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8488854169846
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 5.4133543968201
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6430000066757
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_177 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_177"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0534999370575
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9366042613983
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_41 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_41"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.4262707233429
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_41"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 6.3000001907349
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_hunter_downed_3_times_11_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_11_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5777292251587
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_11_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9027082920074
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.025927066803
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.7536039352417
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_hunter_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9068748950958
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8500626087189
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_elf_downed_3_times_07 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3509166240692
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_hunter_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0454998016357
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_195 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_195"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1313126087189
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_195"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2738122940064
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9445209503174
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_178 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_178"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2531249523163
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_183 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_183"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6016042232513
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9719791412353
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6237916946411
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.8357706069946
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7706561684608
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8371665477753
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_32 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_32"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.2151041030884
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_32"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6460626125336
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6377291679382
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 2.8635416030884
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.1999998092651
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_ranger_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0680415630341
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.1999998092651
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 1.2964375019074
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_39 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_39"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.5257084369659
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_127 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_127"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5852708816528
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_downed_3_times_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9895625114441
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_downed_3_times_05_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6328645944595
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_downed_3_times_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6534376144409
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_ranger_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2881875038147
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.56014585495
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_downed_3_times_06 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_06"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9446874856949
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2498333454132
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.6358957290649
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_124 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_124"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.2771874666214
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2005624771118
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5324583053589
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5013333559036
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.4446458816528
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_ranger_downed_3_times_13_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1627707481384
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 5.1630001068115
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_043 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_043"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.53977084159851
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_043"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.726583480835
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_23 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_23"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 0.49114581942558
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_downed_3_times_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2695832252502
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_182 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_182"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6711459159851
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_22 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_22"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3210833072662
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5639374256134
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 5.2872290611267
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_15 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_15"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 0.59985417127609
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_15"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_14 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_14"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7819374799728
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_14"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3372502326965
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8759167194366
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_144 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_144"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9440834522247
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_144"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.8095417022705
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_21 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_21"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.3809583187103
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.997270822525
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_182 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_182"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6414375305176
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_20 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_20"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 0.34406250715256
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.9008123874664
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_159 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_159"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9488334655762
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_159"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.0859167575836
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_19 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_19"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			sound_events_duration = {
				[1.0] = 2.4829165935516
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.6887917518616
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_downed_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7866666316986
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 2.4483957290649
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwb_gameplay_response_18 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwb_gameplay_response_18"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.3848748207092
			},
			sound_events = {
				[1.0] = "pwb_gameplay_response_18"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_154 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_154",
				[2.0] = "pwh_gameplay_wizard_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 3.3548958301544,
				[2.0] = 6.673291683197
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_154",
				[2.0] = "pwh_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4094895124435
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7735209465027
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_downed_3_times_12 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7075417041779
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_elf_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7402291297913
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_187 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_187"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5723123550415
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_kiling_a_second_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_kiling_a_second_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.511833190918
			},
			sound_events = {
				[1.0] = "pwe_gameplay_kiling_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 0.67268747091293
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.2004582881927
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.0294582843781
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_113 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_113"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.037145614624
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_113"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7904584407806
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_23 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_23"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 1.6683332920075
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_23"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1791875362396
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9089167118073
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9789375066757
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_118 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_118"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7282707691193
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_118"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0333125591278
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_158 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_158",
				[2.0] = "pwe_gameplay_wizard_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 2.7744791507721,
				[2.0] = 2.8671040534973
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_158",
				[2.0] = "pwe_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.0172915458679
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_14_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_14_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1672916412353
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_14_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0904583930969
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_22 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_22"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.9586040973663
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.3298124074936
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.7887916564941
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_04"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.7524583339691
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_158 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_158"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9046459197998
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_158"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_079 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_079"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2911250591278
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_downed_3_times_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9974792003632
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_120 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_120"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4068541526794
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_120"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2810208797455
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_downed_3_times_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4168124198914
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_192 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_192"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9765207767487
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_192"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6752083301544
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1620626449585
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6365833282471
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_downed_3_times_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4993958473206
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_elf_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7938332557678
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6302083730698
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.9818959236145
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5350208282471
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_downed_3_times_05 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3004999160767
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6334373950958
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.956333398819
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6573123931885
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.0801043510437
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7977709770203
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.796875
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_178 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_178"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5299792289734
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6085624694824
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5530834197998
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9731457233429
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0772082805634
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1070104837418
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2052083015442
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_180 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_180"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.178750038147
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1682915687561
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_39 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_39"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 1.5932500362396
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_173 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_173"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2980208396912
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_173"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6903749704361
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5692291259766
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_130 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_130"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3040418624878
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_130"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.9385209083557
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2474999427795
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3643124103546
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_182 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_182"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1438331604004
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9809167385101
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_193 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_193"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3872082233429
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_193"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_114 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_114"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.005083322525
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_114"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7580833435059
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.923708319664
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_081 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_081"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0006248950958
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_081"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6820416450501
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_150 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_150"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5112500190735
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8394584655762
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_02_reply_1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.5161457061768
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6400625705719
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8038332462311
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7981040477753
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_189 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_189"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1987500190735
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.654833316803
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_downed_3_times_10 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8430624008179
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_044 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_044"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8440208435059
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_044"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_shoots_a_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_shoots_a_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0554165840149
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_shoots_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_184 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_184"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.754625082016
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4060416221619
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_downed_3_times_13 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2966876029968
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3284583091736
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 9.8933334350586
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.3083333969116
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1527500152588
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbr_gameplay_elf_downed_3_times_11 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbr_gameplay_elf_downed_3_times_11"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6000000238419
			},
			sound_events = {
				[1.0] = "pbr_gameplay_elf_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1301875114441
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7526042461395
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3073334693909
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8858542442322
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5128126144409
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.2349791526794
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_13 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_13"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.0902707576752
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_195 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_195"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0526666641235
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_195"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7419791221619
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_177 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_177"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2476458549499
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_177"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3557291030884
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.2524583339691
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2016665935516
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7438333034515
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6683332920075
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2286250591278
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.1261665821075
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_150 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_150"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.2469375133514
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_38 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_38"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7488958835602
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.9181354045868
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.170104265213
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_142 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_142"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.839604139328
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_142"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9073750972748
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_ranged_01_reply_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_080 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_080"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.802791595459
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_080"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.277708530426
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4140417575836
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_04"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 5.1474165916443
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.452166557312
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_162 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_162"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6843957901001
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_162"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_185 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_185"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3766875267029
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_155 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_155",
				[2.0] = "pbw_gameplay_soldier_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 2.2663540840149,
				[2.0] = 1.6343749761581
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_155",
				[2.0] = "pbw_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_127 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_127"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2607290744781
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.2518539428711
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_soldier_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.9409790039063
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5948541164398
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_155 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_155"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0507500171661
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_155"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.761833190918
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_kills_3_specials_in_a_row_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_ranger_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0380001068115
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_078 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_078"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1641666889191
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_078"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5020208358765
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6368541717529
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.0286664962769
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.184187412262
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2191457748413
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_147 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_147",
				[2.0] = "pwe_gameplay_wizard_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 3.765625,
				[2.0] = 2.8948750495911
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_147",
				[2.0] = "pwe_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.5519165992737
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_wizard_downed_3_times_12_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_12_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0928750038147
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_153 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_153",
				[2.0] = "pwh_gameplay_soldier_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 4.164083480835,
				[2.0] = 1.3996249437332
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_153",
				[2.0] = "pwh_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_150 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_150"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5023334026337
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.0646247863769
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_154 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_154"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8023750782013
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1765832901001
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9656250476837
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9014582633972
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_180 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_180"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6865000724792
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_152 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_152"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9021458625794
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1979999542236
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_079 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_079"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2222292423248
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.443895816803
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6185417175293
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_183 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_183"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4175624847412
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8136665821075
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_rat_ogre_melee_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3558125495911
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_183 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_183"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5426459312439
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4873125553131
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.82847905159
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3893332481384
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1121039390564
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_151 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_151"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2842708826065
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0039374828339
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_37_alt1 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_37_alt1"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7279999256134
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_37_alt1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_39 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_39"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.2757709026337
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8180208206177
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3647084236145
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.4451456069946
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6678333282471
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hanging_help = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			localization_strings = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			sound_events_duration = {
				3.2326250076294,
				3.2326250076294,
				1.8696249723434,
				1.6470416784286,
				1.9007707834244,
				3.8779792785645
			},
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
			}
		},
		pwe_gameplay_hunter_downed_3_times_11 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7410624027252
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_053 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_053"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8137500286102
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_053"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3932082653046
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_054 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_054"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8282916545868
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_054"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8407502174377
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_rat_ogre_melee_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.3357915878296
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_145 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_145",
				[2.0] = "pwe_gameplay_soldier_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 3.5002915859222,
				[2.0] = 5.2760210037231
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_145",
				[2.0] = "pwe_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_24 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_24"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.723729133606
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_24"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1526250839233
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_07_b = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_07_b"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9031875133514
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_07_b"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8324167728424
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.660749912262
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9681458473206
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9346458911896
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_06 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_06"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5328125953674
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.6435208320618
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_149 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_149"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9388542175293
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_fires_a_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_fires_a_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0513334274292
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_fires_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6492916345596
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_178 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_178"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8267290592194
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_178"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.5561459064484
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_07 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_07"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7749581336975
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3019790649414
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_killing_a_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_killing_a_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5700833797455
			},
			sound_events = {
				[1.0] = "pwe_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7967500686645
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.736624956131
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_119 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_119"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.90125000476837
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_119"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_190 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_190"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4117293357849
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_07 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_07"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4634585380554
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_09 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_09"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6161665916443
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_179 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_179"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1684582233429
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.221604347229
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_116 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_116"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5398540496826
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_116"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_127 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_127"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.51597905159
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_127"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5417499542236
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_hunter_shoots_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_hunter_shoots_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2000000476837
			},
			sound_events = {
				[1.0] = "pdr_hunter_shoots_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.5346667766571
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.3161250352859
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.6896667480469
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0547292232513
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_180 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_180"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5721874237061
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_killing_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_killing_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1148540973663
			},
			sound_events = {
				[1.0] = "pbw_gameplay_killing_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.6792917251587
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_response_126 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_126"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3977084159851
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_123 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_123"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4564166069031
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_163 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_163"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9491667747498
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_163"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_05_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_05_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7393958568573
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_159 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_159"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.9873123168945
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_159"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7427604198456
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_i_will_tank = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "special_occasions_honduras",
			sound_events_n = 12,
			category = "player_feedback",
			dialogue_animations_n = 12,
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
			randomize_indexes = {},
			sound_events_duration = {
				2.2811040878296,
				4.3625831604004,
				2.618979215622,
				1.9424166679382,
				3.7235834598541,
				1.0561666488648,
				3.5016250610352,
				2.1384375095367,
				2.952166557312,
				1.8544374704361,
				2.060604095459,
				1.960000038147
			},
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
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.90499997138977
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.2556457519531
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_soldier_3_special_kills_in_a_row_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8414373397827
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_3_special_kills_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_22 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_22"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 1.2649375200272
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_22"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.37464594841
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_152 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_152"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2174792289734
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_156 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_156",
				[2.0] = "pes_gameplay_wizard_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 2.7527084350586,
				[2.0] = 2.239458322525
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_156",
				[2.0] = "pes_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_161 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_161",
				[2.0] = "pdr_gameplay_wizard_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 7.3709998130798,
				[2.0] = 3.7340624332428
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_161",
				[2.0] = "pdr_gameplay_wizard_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_147 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_147"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8210833072662
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_153 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_153",
				[2.0] = "pwe_gameplay_soldier_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 2.2950832843781,
				[2.0] = 4.4217500686645
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_153",
				[2.0] = "pwe_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_downed_3_times_11 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5148541927338
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_response_145 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_145"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.694000005722
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_145"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1714792251587
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9910207986832
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_31 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_31"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2017292976379
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_31"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6843333244324
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_045 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_045"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4719998836517
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_045"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_157 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_157",
				[2.0] = "pwh_gameplay_ranger_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 4.8428750038147,
				[2.0] = 2.9807915687561
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_157",
				[2.0] = "pwh_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_killing_a_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6248958110809
			},
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6138334274292
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_157 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_157",
				[2.0] = "pwe_gameplay_hunter_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 2.120374917984,
				[2.0] = 2.0093333721161
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_157",
				[2.0] = "pwe_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9082708358765
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_175 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_175"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8216562271118
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_175"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_149 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pes_gameplay_response_149",
				[2.0] = "pes_gameplay_ranger_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 3.6704375743866,
				[2.0] = 3.9827499389648
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_149",
				[2.0] = "pes_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_160 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_160"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3836874961853
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_160"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0480625629425
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_148 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pes_gameplay_response_148",
				[2.0] = "pbw_gameplay_ranger_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 2.309291601181,
				[2.0] = 2.2381875514984
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_148",
				[2.0] = "pbw_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7956042289734
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4308540821075
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_another_is_bunnyjumping_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "default",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_another_is_bunnyjumping_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.4828124046326
			},
			sound_events = {
				[1.0] = "pwe_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_160 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_160"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9597709178925
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_160"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.2466666698456
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_167 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_167"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1003959178925
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_167"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_146 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_146"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8003749847412
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_146"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4720001220703
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_downed_3_times_05_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3931250572205
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_155 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_155",
				[2.0] = "pwh_gameplay_elf_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 4.0076456069946,
				[2.0] = 3.8949999809265
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_155",
				[2.0] = "pwh_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_179 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_179"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9971041679382
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_179"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_144 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pes_gameplay_response_144",
				[2.0] = "pbw_gameplay_elf_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 3.5143959522247,
				[2.0] = 1.246749997139
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_144",
				[2.0] = "pbw_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6566667556763
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_response_139 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pes_gameplay_response_139",
				[2.0] = "pwh_gameplay_wizard_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 2.3132915496826,
				[2.0] = 5.0317916870117
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_139",
				[2.0] = "pwh_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_146 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_146"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8703124523163
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_146"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_downed_3_times_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1674375534058
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_hunter_downed_3_times_05 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.663229227066
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7955622673035
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_141 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_141"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7555416822434
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_141"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_079 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_079"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8851873874664
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_079"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_downed_3_times_10 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_10"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9230208396912
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_response_143 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_143"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2463854551315
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_143"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_145 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_145",
				[2.0] = "pwh_gameplay_soldier_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 0.88218748569489,
				[2.0] = 6.2334585189819
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_145",
				[2.0] = "pwh_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5707499980927
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_21 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_21"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 0.80291664600372
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9483957290649
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_155 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_155"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8284165859222
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_155"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_181 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_181"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.86416667699814
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_30 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_30"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5638332366943
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_30"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5898332595825
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_193 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_193"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6675000190735
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_193"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.4939999580383
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.6964998245239
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_149 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_149"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4189167022705
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_149"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_151 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_151"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6797082424164
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_156 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_156"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2740626335144
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_156"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_170 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_170"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3319582939148
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_170"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3800001144409
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_129 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_129"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.069479227066
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_129"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_152 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_152"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8269166946411
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9165832996368
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4206874370575
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_181 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_181"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5275626182556
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_154 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_154"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0040001869202
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_125 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_125"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0792915821075
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_hunter_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_hunter_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6131250858307
			},
			sound_events = {
				[1.0] = "pbw_gameplay_hunter_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_071 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_071"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 6.6868124008179
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_071"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_154 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_154"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3919582366943
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_154"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_150 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_150"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0369167327881
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_150"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_10 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1288542747498
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_147 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_147"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4689373970032
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_151 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_151"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9551458358765
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_151"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9079790115356
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_hit_by_goo_thrice_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_another_is_bunnyjumping_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "default",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_another_is_bunnyjumping_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8214375972748
			},
			sound_events = {
				[1.0] = "pdr_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_188 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_188"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2879791259766
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0702500343323
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_another_is_bunnyjumping_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "default",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_another_is_bunnyjumping_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9320623874664
			},
			sound_events = {
				[1.0] = "pes_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_downed_3_times_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6729583740234
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_response_125 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_125"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1724166870117
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hanging_help = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			localization_strings = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			sound_events_duration = {
				3.2312500476837,
				2.1472499370575,
				3.9923958778381,
				4.2404165267944,
				3.0713124275208,
				4.147979259491
			},
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
			}
		},
		pdr_gameplay_response_189 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_189"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8605624437332
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0931665897369
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3370625972748
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_185 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_185"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.7577500343323
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0062084197998
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9362709522247
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_solider_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_solider_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 1.8142499923706
			},
			sound_events = {
				[1.0] = "pwh_gameplay_solider_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_194 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_194"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5059585571289
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_194"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.7169585227966
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.774749994278
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_killing_a_second_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1709792613983
			},
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1359374523163
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.4156250953674
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.6907708644867
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_181 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_181"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5760624408722
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.3262915611267
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_168 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_168"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3744270801544
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_168"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_187 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_187"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.502729177475
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_176 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_176"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2354791164398
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_176"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1680417060852
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7483958005905
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_downed_3_times_12 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4539792537689
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_soldier_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8342916965485
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_189 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_189"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1927292346954
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_189"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_190 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_190"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6384999752045
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_190 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_190"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2688748836517
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_190"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_188 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_188"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5237708091736
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3619999885559
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_killing_rat_ogre_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2459583282471
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_killing_rat_ogre_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_20 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_20"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8485207557678
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7862708568573
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_186 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_186"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4821457862854
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_188 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_188"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0986042022705
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8832502365112
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9027292728424
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_rat_ogre_ranged_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 1.7240833044052
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.520124912262
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2255001068115
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_16 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_16"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.0083541870117
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_16"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_122 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_122"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3430209159851
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_122"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_downed_3_times_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0427083969116
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_elf_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 4.604395866394
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_056 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_056"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1098749637604
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_056"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 2.8450000286102
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_elf_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1032083034515
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_08 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_08"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0973958969116
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7556874752045
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_183 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_183"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3731875419617
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5474374294281
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.0725002288818
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_183 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_183"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7218749523163
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_183"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_downed_3_times_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4722291231155
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_downed_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0639584064484
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_wizard_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0599167346954
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_175 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_175"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2624583244324
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_175"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0328333377838
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_180 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_180"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5412292480469
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_186 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_186"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.0481877326965
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_caught_by_slaver_3_times_two = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0596458911896
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_caught_by_slaver_3_times_two"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_downed_3_times_08 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0694375038147
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_response_181 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_181"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6921665668488
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_181"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.582145690918
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_124 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_124"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7425625324249
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_124"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_162 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_162"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5483748912811
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_162"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_148 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_148"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3770415782928
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_148"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_043 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_043"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5246665477753
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_043"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_184 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_184"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7992498874664
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_184"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.8318958282471
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_killing_rat_ogre_ranged_01_reply_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_050 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_050"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1062707901001
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_050"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1665625572205
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_elf_downed_3_times_12_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_12_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3637707233429
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_187 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_187"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5497500896454
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_killing_a_second_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_killing_a_second_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4454793930054
			},
			sound_events = {
				[1.0] = "pbw_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8480625152588
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_169 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_169"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2818541526794
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_169"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_downed_3_times_12_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_12_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7350833415985
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_killing_a_second_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8738125562668
			},
			sound_events = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_161 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_161",
				[2.0] = "pdr_gameplay_elf_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 5.8654789924622,
				[2.0] = 2.8445208072662
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_161",
				[2.0] = "pdr_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 2.1559791564941
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_soldier_downed_3_times_05_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_05_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3886458873749
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_downed_3_times_09 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5728125572205
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.5054793357849
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8168540000916
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4489374160767
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_ameplay_soldier_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9230624437332
			},
			sound_events = {
				[1.0] = "pbw_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_180 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_180"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2374999523163
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_180"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_downed_3_times_11 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_11"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6363749504089
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_11"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.358916759491
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7755208015442
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_146 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pes_gameplay_response_146",
				[2.0] = "pes_gameplay_elf_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 1.7487291097641,
				[2.0] = 3.5201041698456
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_146",
				[2.0] = "pes_gameplay_elf_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_38 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_38"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.7909791469574
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_38"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4626665115356
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_00_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4872916936874
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_elf_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3202290534973
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.619916677475
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7551875114441
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9365208148956
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4639375209808
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3347916603088
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_142 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_142"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.090562582016
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_142"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5680832862854
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_174 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_174"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.470999956131
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_174"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_another_is_bunnyjumping_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "default",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_another_is_bunnyjumping_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9307708740234
			},
			sound_events = {
				[1.0] = "pbw_gameplay_another_is_bunnyjumping_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4023957252502
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_downed_3_time_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_time_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4529999494553
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_time_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.2182083129883
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4179999828339
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.4147500991821
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4932084083557
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_wizard_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3591458797455
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_elf_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4622082710266
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4176042079926
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_12_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_12_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9481041431427
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_killing_a_second_rat_ogre_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_killing_a_second_rat_ogre_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8280000686645
			},
			sound_events = {
				[1.0] = "pbw_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0631041526794
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6257083415985
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2136664390564
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_downed_3_times_13_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.383749961853
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7886457443237
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.3023437261581
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_06 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.3719792366028
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.2821249961853
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 5.8331665992737
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_killing_a_second_rat_ogre_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5244584083557
			},
			sound_events = {
				[1.0] = "pwh_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5737916231155
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4157917499542
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2464375495911
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.2337501049042
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health__reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health__reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8994374275208
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health__reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4067707061768
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0086250305176
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9445416927338
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5426459312439
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_176 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_176"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0192084312439
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_176"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2187917232513
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2274789810181
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_wizard_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1773748397827
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9096250534058
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_121 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_121"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9997291564941
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_121"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_downed_3_times_07 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.1976249814033
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_downed_3_times_07"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.6083126068115
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3070833683014
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0106875896454
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0933332443237
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_downed_3_times_13 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2494790554047
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_37 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_37"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7976666688919
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_37"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6878333091736
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_downed_3_times_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1252915859222
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_wizard_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6046874523163
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_killing_spawn_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9452707767487
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3161668777466
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_killing_a_second_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3102707862854
			},
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_126 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_126"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3830208778381
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hanging_help = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			localization_strings = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			sound_events_duration = {
				1.7967916727066,
				1.9630000591278,
				2.0131666660309,
				1.4808541536331,
				2.4451458454132,
				2.6665208339691
			},
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
			}
		},
		pes_gameplay_response_17 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_17"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4541457891464
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_115 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_115"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3047292232513
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_115"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.0366666316986
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_188 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_188"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6091666221619
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_188"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 5.4831042289734
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_response_159 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_159",
				[2.0] = "pdr_gameplay_soldier_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 5.3045415878296,
				[2.0] = 3.1486666202545
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_159",
				[2.0] = "pdr_gameplay_soldier_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_21 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_21"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0450832843781
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_082 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_082"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6281249523163
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_082"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_157 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_157"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.733416557312
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_157"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_153 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_153"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4233541488648
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_153"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2036666870117
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8877291679382
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6328959465027
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8213124275208
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9573333263397
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_downed_3_times_08 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_08"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8218958377838
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_hunter_potions_above_half_health_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1266875267029
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_potions_above_half_health_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_downed_3_times_10 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_10"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8644165992737
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_10"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4436457157135
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_hit_by_goo_thrice_00 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_hit_by_goo_thrice_00"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.127833366394
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_hit_by_goo_thrice_00"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_response_071 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_071"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9802498817444
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_071"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_140 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_140"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2160415649414
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_140"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_141 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_141"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7400624752045
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_141"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6303958892822
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_054 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_054"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6996040344238
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_054"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.9986040592194
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_131 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_131"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0816457271576
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_131"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_downed_3_times_06 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_06"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.1784374713898
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_125 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_125"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2574167251587
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_125"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_191 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_191"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9091458320618
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.4668333530426
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9064373970032
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0555417537689
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_129 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_129"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6789166927338
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_129"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_killing_3_specials_in_a_row_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.5193333625794
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_killing_3_specials_in_a_row_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_ranger_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9493124485016
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_12_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_12_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1971666812897
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.050666809082
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.6804583072662
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_17 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_17"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.3195209503174
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_17"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.9522914886475
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2741458415985
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9329791069031
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_21 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_21"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.6679792404175
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_21"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.3167707920074
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_downed_3_times_05 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_05"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8679583072662
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_hunter_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4855415821075
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_downed_3_times_12_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0698957443237
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_elf_downed_3_times_13 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8666042089462
			},
			sound_events = {
				[1.0] = "pdr_gameplay_elf_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_response_055 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_055"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2893540859222
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_055"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.5475206375122
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_killing_rat_ogre_melee_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7128958702087
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 4.4614791870117
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_148 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_148",
				[2.0] = "pes_gameplay_wizard_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 5.3911666870117,
				[2.0] = 1.8489583730698
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_148",
				[2.0] = "pes_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_156 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_156"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9440417289734
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_156"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_152 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_152"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.249979019165
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_152"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.9468123912811
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2385416030884
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5913958549499
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_killing_rat_ogre_ranged_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_148 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_148"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1942291259766
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_148"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6365833282471
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8851666450501
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7175834178925
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_soldier_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0216457843781
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_downed_3_times_08 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_08"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9855208396912
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_response_171 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_171"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.801541686058
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_171"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_191 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_191"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7859165668488
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1285207271576
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_185 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_185"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1394376754761
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_hit_by_goo_thrice_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_hit_by_goo_thrice_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3396666049957
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_hit_by_goo_thrice_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_i_will_tank = {
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "special_occasions_honduras",
			sound_events_n = 14,
			category = "player_feedback",
			dialogue_animations_n = 14,
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
			randomize_indexes = {},
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
			}
		},
		pwh_gameplay_soldier_downed_3_times_04 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4936666488648
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_04"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.8379373550415
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_hit_by_goo_thrice_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_downed_3_times_12 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5231459140778
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 1.7826042175293
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_3_special_kills_in_a_row_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_wizard_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8117709159851
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8912916183472
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7575626373291
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4987916946411
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_157 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_157"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5322916507721
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_157"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_another_is_bunnyjumping_01_alt1 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "default",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_another_is_bunnyjumping_01_alt1"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3018751144409
			},
			sound_events = {
				[1.0] = "pwh_gameplay_another_is_bunnyjumping_01_alt1"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8376460075378
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 6.0397291183472
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_ameplay_soldier_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1920208930969
			},
			sound_events = {
				[1.0] = "pes_ameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_147 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_147"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4578542709351
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_147"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0899584293366
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_119 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_119"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3136250972748
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_119"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1465208530426
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.8165208101273
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 2.7698125839233
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.767541885376
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_killing_a_second_rat_ogre_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3803124427795
			},
			sound_events = {
				[1.0] = "pes_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_killing_a_second_rat_ogre_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6186456680298
			},
			sound_events = {
				[1.0] = "pdr_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_187 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_187"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3809790611267
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_187"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4037289619446
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1496458053589
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_downed_3_times_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.8710622787476
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9615416526794
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2868332862854
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_caught_by_slaver_3_times_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9252500534058
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_caught_by_slaver_3_times_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5121666193008
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7193331718445
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 6.5630831718445
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_ranger_potions_above_half_health_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6144790649414
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_downed_3_times_14_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 7.0014791488647
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_killing_a_second_rat_ogre_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_killing_a_second_rat_ogre_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7440209388733
			},
			sound_events = {
				[1.0] = "pwe_gameplay_killing_a_second_rat_ogre_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_killing_troll_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0032708644867
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_046 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_046"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.125937461853
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_046"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.0424165725708
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_wizard_downed_3_times_14 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4786875247955
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_downed_3_times_14"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.3559165000916
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1782917976379
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hanging_help = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "special_occasions_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
			localization_strings = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			randomize_indexes = {},
			sound_events_duration = {
				2.4445834159851,
				1.726083278656,
				1.9011458158493,
				1.6703333854675,
				2.4530000686645,
				3.1792917251587
			},
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
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.1656875610352
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3839166164398
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8944375514984
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2802290916443
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_185 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_185"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7092914581299
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_185"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_downed_3_times_05_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_05_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2715001106262
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_05_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_05_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.3056458234787
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_wizard_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1935832500458
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.4529376029968
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_hit_by_goo_thrice_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8894584178925
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_wizard_potions_above_half_health_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.943437576294
			},
			sound_events = {
				[1.0] = "pwh_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_08 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_08"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3361041545868
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4090416431427
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 4.3812294006348
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_ranger_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0958542823791
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_misses_bomb_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_misses_bomb_01"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.9102499485016
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_misses_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_123 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_123"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6128542423248
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 3.6928958892822
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_3_special_kills_in_a_row_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_117 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_117"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5924167633057
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_117"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_128 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_128"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9133543968201
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_128"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_downed_3_times_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.2039375305176
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_downed_3_times_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.7039999961853
			},
			sound_events = {
				[1.0] = "pwe_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5422084331513
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 3.814374923706
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.853395819664
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03"
			},
			face_animations = {
				[1.0] = "face_smug"
			},
			sound_events_duration = {
				[1.0] = 1.090020775795
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5083749294281
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8599584102631
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.9157290458679
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.6585729122162
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_killing_rat_ogre_ranged_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3291666507721
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1052916049957
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_downed_3_times_09 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_09"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8972084522247
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.6179790496826
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_hit_by_goo_thrice_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1999998092651
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_130 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_130"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9252917766571
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_130"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9051458835602
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_downed_3_times_08 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.4792292118073
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_08"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.182062625885
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_03_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.6509585380554
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_40 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_40"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.2379791736603
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_40"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.4049792289734
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7848334312439
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_downed_3_times_12_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.55156248807907
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_downed_3_times_12_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3301665782928
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_response_182 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_182"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5512082576752
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_182"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_11_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.6566041707993
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_11_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			face_animations = {
				[1.0] = "face_happy"
			},
			sound_events_duration = {
				[1.0] = 5.9866456985474
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_3_special_kills_in_a_row_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3662085533142
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_hit_by_goo_thrice_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_downed_3_times_13 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1770000457764
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_downed_3_times_13"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_ranger_downed_3_times_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2776875495911
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_downed_3_times_13_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_13_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4392292499542
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_150 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_150",
				[2.0] = "pes_gameplay_hunter_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 3.4987082481384,
				[2.0] = 2.0599687099457
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_150",
				[2.0] = "pes_gameplay_hunter_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_potions_above_half_health_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.7780208587647
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_potions_above_half_health_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_response_20 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_20"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.1216042041779
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_20"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.143958568573
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_killing_rat_ogre_ranged_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.7711873054504
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_rat_ogre_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_downed_3_times_12 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_12"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5054166316986
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_12"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_response_151 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_151",
				[2.0] = "pwe_gameplay_ranger_killing_troll_ranged_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 5.1344165802002,
				[2.0] = 4.4044165611267
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_151",
				[2.0] = "pwe_gameplay_ranger_killing_troll_ranged_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_191 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_191"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8743541240692
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_191"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9071457386017
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_123 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_123"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.3896040916443
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_123"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_downed_3_times_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9105000495911
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_126 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_126"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0455832481384
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_126"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_hunter_downed_3_times_13_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1983332633972
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hunter_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_39 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_39"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 2.368958234787
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_39"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_13_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_13_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.716875076294
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_13_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_soldier_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.7417500019074
			},
			sound_events = {
				[1.0] = "pwh_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_killing_rat_ogre_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_killing_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.1504166126251
			},
			sound_events = {
				[1.0] = "pes_gameplay_killing_rat_ogre_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_downed_3_times_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8827290534973
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_dwarf_picks_up_a_bomb = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "default",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_dwarf_picks_up_a_bomb_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.1708331108093
			},
			sound_events = {
				[1.0] = "pwe_gameplay_dwarf_picks_up_a_bomb_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_112 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_112"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.2666459083557
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_112"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_hunter_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3385207653046
			},
			sound_events = {
				[1.0] = "pdr_gameplay_hunter_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_downed_3_times_09 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.3461666107178
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_hunter_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1684167385101
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_downed_3_times_05_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_05_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.2043747901917
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.4996874332428
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5234375
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_response_158 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_response_158"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.3713750839233
			},
			sound_events = {
				[1.0] = "pdr_gameplay_response_158"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_elf_downed_3_times_08_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 0.77727085351944
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_08_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5409166812897
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_elf_downed_3_times_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.197562456131
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_03_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_03_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.1140625476837
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_03_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_10_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_10_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0016667842865
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_10_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_elf_downed_3_times_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			},
			sound_events = {
				[1.0] = "pbw_gameplay_elf_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_06_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_06_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.5591459274292
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_06_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_07_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_07_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.3577709197998
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_07_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.5566458702087
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9589791297913
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_downed_3_times_09 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_09"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8851873874664
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_downed_3_times_09"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_elf_downed_3_times_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.5744791030884
			},
			sound_events = {
				[1.0] = "pwh_gameplay_elf_downed_3_times_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_ranger_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.9997291564941
			},
			sound_events = {
				[1.0] = "pwh_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_elf_downed_3_times_09_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 6.6962914466858
			},
			sound_events = {
				[1.0] = "pes_gameplay_elf_downed_3_times_09_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_downed_3_times_05_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_05_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9858958721161
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_downed_3_times_05_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_response_199 = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "special_occasions_honduras",
			sound_events_n = 2,
			category = "special_occasion",
			dialogue_animations_n = 2,
			localization_strings = {
				[1.0] = "pbw_gameplay_response_199",
				[2.0] = "pdr_gameplay_wizard_killing_troll_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			randomize_indexes = {},
			sound_events_duration = {
				[1.0] = 4.5523958206177,
				[2.0] = 3.3403542041779
			},
			sound_events = {
				[1.0] = "pbw_gameplay_response_199",
				[2.0] = "pdr_gameplay_wizard_killing_troll_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.746791601181
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.6805624961853
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_wizard_downed_3_times_05 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_05"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8025417327881
			},
			sound_events = {
				[1.0] = "pes_gameplay_wizard_downed_3_times_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pwh_gameplay_response_19 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_response_19"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 3.0958333015442
			},
			sound_events = {
				[1.0] = "pwh_gameplay_response_19"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_01_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 5.8677916526794
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0552499294281
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_hunter_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.0606875419617
			},
			sound_events = {
				[1.0] = "pes_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_ranger_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9564583301544
			},
			sound_events = {
				[1.0] = "pwe_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_03_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.5335208177566
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_ranger_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9452917575836
			},
			sound_events = {
				[1.0] = "pbw_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pes_gameplay_response_116 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_116"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.661812543869
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_116"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwh_gameplay_hunter_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.48672914505
			},
			sound_events = {
				[1.0] = "pwh_gameplay_hunter_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_response_05 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_response_05"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.9708333015442
			},
			sound_events = {
				[1.0] = "pes_gameplay_response_05"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_wizard_potions_above_half_health_03_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.0208957195282
			},
			sound_events = {
				[1.0] = "pbw_gameplay_wizard_potions_above_half_health_03_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 4.245041847229
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_killing_rat_ogre_melee_01_reply_03"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_soldier_killing_spawn_melee_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_melee_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.838427066803
			},
			sound_events = {
				[1.0] = "pwe_gameplay_soldier_killing_spawn_melee_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_wizard_potions_above_half_health_03_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.9025624990463
			},
			sound_events = {
				[1.0] = "pdr_gameplay_wizard_potions_above_half_health_03_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_soldier_potions_above_half_health_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.9870624542236
			},
			sound_events = {
				[1.0] = "pes_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_response_186 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_response_186"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.298749923706
			},
			sound_events = {
				[1.0] = "pwe_gameplay_response_186"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_04_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 1.3627916574478
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_04_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pwe_gameplay_elf_potions_above_half_health_01_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8009374141693
			},
			sound_events = {
				[1.0] = "pwe_gameplay_elf_potions_above_half_health_01_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pes_gameplay_ranger_3_special_kills_in_a_row_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 2.8294167518616
			},
			sound_events = {
				[1.0] = "pes_gameplay_ranger_3_special_kills_in_a_row_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			}
		},
		pdr_gameplay_ranger_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.557416677475
			},
			sound_events = {
				[1.0] = "pdr_gameplay_ranger_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pbw_gameplay_soldier_potions_above_half_health_02_reply_01 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.2707707881927
			},
			sound_events = {
				[1.0] = "pbw_gameplay_soldier_potions_above_half_health_02_reply_01"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		},
		pdr_gameplay_soldier_potions_above_half_health_02_reply_02 = {
			face_animations_n = 1,
			database = "special_occasions_honduras",
			sound_events_n = 1,
			category = "casual_talk",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			sound_events_duration = {
				[1.0] = 3.8580832481384
			},
			sound_events = {
				[1.0] = "pdr_gameplay_soldier_potions_above_half_health_02_reply_02"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			}
		}
	})
end
