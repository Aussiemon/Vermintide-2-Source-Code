return function ()
	define_rule({
		name = "epm_spawning_packmaster",
		response = "epm_spawning_packmaster",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"spawning"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_spawning_packmaster",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_spawning_packmaster",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_vw_affirmative",
		response = "epm_vw_affirmative",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"affirmative"
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
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_packmaster_affirmative",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_packmaster_affirmative",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_vw_negation",
		response = "epm_vw_negation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"negation"
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
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_packmaster_negation",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_packmaster_negation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_vw_gather",
		response = "epm_vw_gather",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gather"
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
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_packmaster_gather",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_packmaster_gather",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_vw_ambush",
		response = "epm_vw_ambush",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ambush"
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
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_packmaster_ambush",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_packmaster_ambush",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_vw_wait",
		response = "epm_vw_wait",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wait"
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
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_packmaster_wait",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_packmaster_wait",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_vw_attack_now",
		response = "epm_vw_attack_now",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"attack_now"
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
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_packmaster_attack_now",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_packmaster_attack_now",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_vw_cover_me",
		response = "epm_vw_cover_me",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"cover_me"
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
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_packmaster_cover_me",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_packmaster_cover_me",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_vw_go_here",
		response = "epm_vw_go_here",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"go_here"
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
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_packmaster_go_here",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_packmaster_go_here",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_spawning_globadier",
		response = "epg_spawning_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"spawning"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_spawning_globadier",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_spawning_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_taunting_sienna",
		response = "epg_taunting_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_poison_wind_globadier"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_taunting_sienna",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_taunting_bardin",
		response = "epg_taunting_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_poison_wind_globadier"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_taunting_bardin",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_bardin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_taunting_kerillian",
		response = "epg_taunting_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_poison_wind_globadier"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_taunting_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_taunting_kruber",
		response = "epg_taunting_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_poison_wind_globadier"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_taunting_kruber",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_taunting_saltzpyre",
		response = "epg_taunting_saltzpyre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_poison_wind_globadier"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_taunting_saltzpyre",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_saltzpyre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_vw_affirmative",
		response = "epg_vw_affirmative",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"affirmative"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_globadier_affirmative",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_globadier_affirmative",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_vw_negation",
		response = "epg_vw_negation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"negation"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_globadier_negation",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_globadier_negation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_vw_gather",
		response = "epg_vw_gather",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gather"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_globadier_gather",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_globadier_gather",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_vw_ambush",
		response = "epg_vw_ambush",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ambush"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_globadier_ambush",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_globadier_ambush",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_vw_wait",
		response = "epg_vw_wait",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wait"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_globadier_wait",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_globadier_wait",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_vw_attack_now",
		response = "epg_vw_attack_now",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"attack_now"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_globadier_attack_now",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_globadier_attack_now",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_vw_cover_me",
		response = "epg_vw_cover_me",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"cover_me"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_globadier_cover_me",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_globadier_cover_me",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epg_vw_go_here",
		response = "epg_vw_go_here",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"go_here"
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
				"vs_poison_wind_globadier"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_poison_wind_globadier"
			},
			{
				"user_memory",
				"time_since_globadier_go_here",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_globadier_go_here",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_spawning_ratling_gunner",
		response = "erg_spawning_ratling_gunner",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"spawning"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_spawning_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_spawning_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_taunting_sienna",
		response = "erg_taunting_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_ratling_gunner"
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
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_taunting_sienna",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_taunting_bardin",
		response = "erg_taunting_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_ratling_gunner"
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
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_taunting_bardin",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_bardin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_taunting_kerillian",
		response = "erg_taunting_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_ratling_gunner"
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
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_taunting_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_taunting_kruber",
		response = "erg_taunting_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_ratling_gunner"
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
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_taunting_kruber",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_taunting_saltzpyre",
		response = "erg_taunting_saltzpyre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_ratling_gunner"
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
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_taunting_saltzpyre",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_saltzpyre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_vw_affirmative",
		response = "erg_vw_affirmative",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"affirmative"
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
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_ratling_gunner_affirmative",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_gunner_affirmative",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_vw_negation",
		response = "erg_vw_negation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"negation"
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
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_ratling_gunner_negation",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_gunner_negation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_vw_gather",
		response = "erg_vw_gather",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gather"
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
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_ratling_gunner_gather",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_gunner_gather",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_vw_ambush",
		response = "erg_vw_ambush",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ambush"
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
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_ratling_gunner_ambush",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_gunner_ambush",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_vw_wait",
		response = "erg_vw_wait",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wait"
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
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_ratling_gunner_wait",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_gunner_wait",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_vw_attack_now",
		response = "erg_vw_attack_now",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"attack_now"
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
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_ratling_gunner_attack_now",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_gunner_attack_now",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_vw_cover_me",
		response = "erg_vw_cover_me",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"cover_me"
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
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_ratling_gunner_cover_me",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_gunner_cover_me",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "erg_vw_go_here",
		response = "erg_vw_go_here",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"go_here"
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
				"vs_ratling_gunner"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_ratling_gunner"
			},
			{
				"user_memory",
				"time_since_ratling_gunner_go_here",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_gunner_go_here",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_packmaster_hook_fail",
		response = "epm_packmaster_hook_fail",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hook_fail"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_hook_fail",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_hook_fail",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_packmaster_hook_success",
		response = "epm_packmaster_hook_success",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hook_success"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_hook_success",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_hook_success",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_packmaster_skulking",
		response = "epm_packmaster_skulking",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"skulking"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_skulking",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_skulking",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_packmaster_grab_walk",
		response = "epm_packmaster_grab_walk",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"walking"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_packmaster"
			},
			{
				"user_memory",
				"time_since_grab_walk",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_grab_walk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_walking",
		response = "ewt_walking",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"walking"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_walk_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_walk_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_spawning_warpfire_thrower",
		response = "ewt_spawning_warpfire_thrower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"spawning"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_spawning_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_spawning_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_taunting_sienna",
		response = "ewt_taunting_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_warpfire_thrower"
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
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_taunting_sienna",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_taunting_bardin",
		response = "ewt_taunting_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_warpfire_thrower"
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
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_taunting_bardin",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_bardin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_taunting_kerillian",
		response = "ewt_taunting_kerillian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_warpfire_thrower"
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
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_taunting_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_taunting_kruber",
		response = "ewt_taunting_kruber",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_warpfire_thrower"
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
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_taunting_kruber",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_kruber",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_taunting_saltzpyre",
		response = "ewt_taunting_saltzpyre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"taunting"
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
				"vs_warpfire_thrower"
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
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_taunting_saltzpyre",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taunting_saltzpyre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_vw_affirmative",
		response = "ewt_vw_affirmative",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"affirmative"
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
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_warpfire_thrower_affirmative",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_warpfire_thrower_affirmative",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_vw_negation",
		response = "ewt_vw_negation",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"negation"
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
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_warpfire_thrower_negation",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_warpfire_thrower_negation",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_vw_gather",
		response = "ewt_vw_gather",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"gather"
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
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_warpfire_thrower_gather",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_warpfire_thrower_gather",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_vw_ambush",
		response = "ewt_vw_ambush",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ambush"
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
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_warpfire_thrower_ambush",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_warpfire_thrower_ambush",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_vw_wait",
		response = "ewt_vw_wait",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"wait"
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
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_warpfire_thrower_wait",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_warpfire_thrower_wait",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_vw_attack_now",
		response = "ewt_vw_attack_now",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"attack_now"
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
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_warpfire_thrower_attack_now",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_warpfire_thrower_attack_now",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_vw_cover_me",
		response = "ewt_vw_cover_me",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"cover_me"
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
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_warpfire_thrower_cover_me",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_warpfire_thrower_cover_me",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ewt_vw_go_here",
		response = "ewt_vw_go_here",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"go_here"
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
				"vs_warpfire_thrower"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"vs_warpfire_thrower"
			},
			{
				"user_memory",
				"time_since_warpfire_thrower_go_here",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_warpfire_thrower_go_here",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		epg_vw_affirmative = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_vw_affirmative_01",
				"epg_vw_affirmative_02",
				"epg_vw_affirmative_03",
				"epg_vw_affirmative_04",
				"epg_vw_affirmative_05",
				"epg_vw_affirmative_06",
				"epg_vw_affirmative_07",
				"epg_vw_affirmative_08",
				"epg_vw_affirmative_09",
				"epg_vw_affirmative_10"
			},
			sound_events = {
				"epg_vw_affirmative_01",
				"epg_vw_affirmative_02",
				"epg_vw_affirmative_03",
				"epg_vw_affirmative_04",
				"epg_vw_affirmative_05",
				"epg_vw_affirmative_06",
				"epg_vw_affirmative_07",
				"epg_vw_affirmative_08",
				"epg_vw_affirmative_09",
				"epg_vw_affirmative_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.65006250143051,
				0.93536460399628,
				0.88412499427795,
				2.2340936660767,
				1.9925625324249,
				0.8378541469574,
				2.5,
				2.3164596557617,
				1.3261666297913,
				1.5
			}
		},
		ewt_spawning_warpfire_thrower = {
			face_animations_n = 5,
			database = "pactsworn_player_vo",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"ewt_spawning_warpfire_thrower_01",
				"ewt_spawning_warpfire_thrower_02",
				"ewt_spawning_warpfire_thrower_03",
				"ewt_spawning_warpfire_thrower_04",
				"ewt_spawning_warpfire_thrower_05"
			},
			sound_events = {
				"ewt_spawning_warpfire_thrower_01",
				"ewt_spawning_warpfire_thrower_02",
				"ewt_spawning_warpfire_thrower_03",
				"ewt_spawning_warpfire_thrower_04",
				"ewt_spawning_warpfire_thrower_05"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				7.3617744445801,
				6.9342193603516,
				4.8433690071106,
				7.1534142494202,
				4.6699042320252
			}
		},
		erg_vw_affirmative = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_vw_affirmative_01",
				"erg_vw_affirmative_02",
				"erg_vw_affirmative_03",
				"erg_vw_affirmative_04",
				"erg_vw_affirmative_05",
				"erg_vw_affirmative_06",
				"erg_vw_affirmative_07",
				"erg_vw_affirmative_08",
				"erg_vw_affirmative_09",
				"erg_vw_affirmative_10"
			},
			sound_events = {
				"erg_vw_affirmative_01",
				"erg_vw_affirmative_02",
				"erg_vw_affirmative_03",
				"erg_vw_affirmative_04",
				"erg_vw_affirmative_05",
				"erg_vw_affirmative_06",
				"erg_vw_affirmative_07",
				"erg_vw_affirmative_08",
				"erg_vw_affirmative_09",
				"erg_vw_affirmative_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epg_vw_cover_me = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_vw_cover_me_01",
				"epg_vw_cover_me_02",
				"epg_vw_cover_me_03",
				"epg_vw_cover_me_04",
				"epg_vw_cover_me_05",
				"epg_vw_cover_me_06",
				"epg_vw_cover_me_07",
				"epg_vw_cover_me_08",
				"epg_vw_cover_me_09",
				"epg_vw_cover_me_10"
			},
			sound_events = {
				"epg_vw_cover_me_01",
				"epg_vw_cover_me_02",
				"epg_vw_cover_me_03",
				"epg_vw_cover_me_04",
				"epg_vw_cover_me_05",
				"epg_vw_cover_me_06",
				"epg_vw_cover_me_07",
				"epg_vw_cover_me_08",
				"epg_vw_cover_me_09",
				"epg_vw_cover_me_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.67250001430511,
				3.4567,
				3.4567,
				1.1013646125793,
				3.4567,
				0.8918229341507,
				3.4567,
				1.5835760831833,
				1.75,
				1.8297395706177
			}
		},
		epm_vw_affirmative = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epm_vw_affirmative_01",
				"epm_vw_affirmative_02",
				"epm_vw_affirmative_03",
				"epm_vw_affirmative_04",
				"epm_vw_affirmative_05",
				"epm_vw_affirmative_06",
				"epm_vw_affirmative_07",
				"epm_vw_affirmative_08",
				"epm_vw_affirmative_09",
				"epm_vw_affirmative_10"
			},
			sound_events = {
				"epm_vw_affirmative_01",
				"epm_vw_affirmative_02",
				"epm_vw_affirmative_03",
				"epm_vw_affirmative_04",
				"epm_vw_affirmative_05",
				"epm_vw_affirmative_06",
				"epm_vw_affirmative_07",
				"epm_vw_affirmative_08",
				"epm_vw_affirmative_09",
				"epm_vw_affirmative_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.77843749523163,
				0.64977085590363,
				0.4743125140667,
				1.2229374647141,
				2.6236667633057,
				1.5621458292007,
				2.9307084083557,
				2.8758542537689,
				1.6516041755676,
				2.1353125572205
			}
		},
		erg_vw_cover_me = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_vw_cover_me_01",
				"erg_vw_cover_me_02",
				"erg_vw_cover_me_03",
				"erg_vw_cover_me_04",
				"erg_vw_cover_me_05",
				"erg_vw_cover_me_06",
				"erg_vw_cover_me_07",
				"erg_vw_cover_me_08",
				"erg_vw_cover_me_09",
				"erg_vw_cover_me_10"
			},
			sound_events = {
				"erg_vw_cover_me_01",
				"erg_vw_cover_me_02",
				"erg_vw_cover_me_03",
				"erg_vw_cover_me_04",
				"erg_vw_cover_me_05",
				"erg_vw_cover_me_06",
				"erg_vw_cover_me_07",
				"erg_vw_cover_me_08",
				"erg_vw_cover_me_09",
				"erg_vw_cover_me_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epm_vw_attack_now = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epm_vw_attack_now_01",
				"epm_vw_attack_now_02",
				"epm_vw_attack_now_03",
				"epm_vw_attack_now_04",
				"epm_vw_attack_now_05",
				"epm_vw_attack_now_06",
				"epm_vw_attack_now_07",
				"epm_vw_attack_now_08",
				"epm_vw_attack_now_09",
				"epm_vw_attack_now_10"
			},
			sound_events = {
				"epm_vw_attack_now_01",
				"epm_vw_attack_now_02",
				"epm_vw_attack_now_03",
				"epm_vw_attack_now_04",
				"epm_vw_attack_now_05",
				"epm_vw_attack_now_06",
				"epm_vw_attack_now_07",
				"epm_vw_attack_now_08",
				"epm_vw_attack_now_09",
				"epm_vw_attack_now_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epg_taunting_kerillian = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_taunting_kerillian_01",
				"epg_taunting_kerillian_02",
				"epg_taunting_kerillian_03",
				"epg_taunting_kerillian_04",
				"epg_taunting_kerillian_05",
				"epg_taunting_kerillian_06",
				"epg_taunting_kerillian_07",
				"epg_taunting_kerillian_08",
				"epg_taunting_kerillian_09",
				"epg_taunting_kerillian_10"
			},
			sound_events = {
				"epg_taunting_kerillian_01",
				"epg_taunting_kerillian_02",
				"epg_taunting_kerillian_03",
				"epg_taunting_kerillian_04",
				"epg_taunting_kerillian_05",
				"epg_taunting_kerillian_06",
				"epg_taunting_kerillian_07",
				"epg_taunting_kerillian_08",
				"epg_taunting_kerillian_09",
				"epg_taunting_kerillian_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		ewt_vw_negation = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_vw_negation_01",
				"ewt_vw_negation_02",
				"ewt_vw_negation_03",
				"ewt_vw_negation_04",
				"ewt_vw_negation_05",
				"ewt_vw_negation_06",
				"ewt_vw_negation_07",
				"ewt_vw_negation_08",
				"ewt_vw_negation_09",
				"ewt_vw_negation_10"
			},
			sound_events = {
				"ewt_vw_negation_01",
				"ewt_vw_negation_02",
				"ewt_vw_negation_03",
				"ewt_vw_negation_04",
				"ewt_vw_negation_05",
				"ewt_vw_negation_06",
				"ewt_vw_negation_07",
				"ewt_vw_negation_08",
				"ewt_vw_negation_09",
				"ewt_vw_negation_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.8513503074646,
				1.9994206428528,
				3.0230720043182,
				3.1808757781982,
				2.8809204101563,
				2.0743012428284,
				2.4426481723785,
				2.2565083503723,
				3.1240468025208,
				3.4567
			}
		},
		ewt_taunting_bardin = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_taunting_bardin_01",
				"ewt_taunting_bardin_02",
				"ewt_taunting_bardin_03",
				"ewt_taunting_bardin_04",
				"ewt_taunting_bardin_05",
				"ewt_taunting_bardin_06",
				"ewt_taunting_bardin_07",
				"ewt_taunting_bardin_08",
				"ewt_taunting_bardin_09",
				"ewt_taunting_bardin_10"
			},
			sound_events = {
				"ewt_taunting_bardin_01",
				"ewt_taunting_bardin_02",
				"ewt_taunting_bardin_03",
				"ewt_taunting_bardin_04",
				"ewt_taunting_bardin_05",
				"ewt_taunting_bardin_06",
				"ewt_taunting_bardin_07",
				"ewt_taunting_bardin_08",
				"ewt_taunting_bardin_09",
				"ewt_taunting_bardin_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.4146766662598,
				3.4828960895538,
				4.0174236297607,
				4.5589122772217,
				3.4567,
				5.6412019729614,
				3.618735074997,
				2.4186778068542,
				2.9500198364258,
				2.6239702701569
			}
		},
		ewt_taunting_sienna = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_taunting_sienna_01",
				"ewt_taunting_sienna_02",
				"ewt_taunting_sienna_03",
				"ewt_taunting_sienna_04",
				"ewt_taunting_sienna_05",
				"ewt_taunting_sienna_06",
				"ewt_taunting_sienna_07",
				"ewt_taunting_sienna_08",
				"ewt_taunting_sienna_09",
				"ewt_taunting_sienna_10"
			},
			sound_events = {
				"ewt_taunting_sienna_01",
				"ewt_taunting_sienna_02",
				"ewt_taunting_sienna_03",
				"ewt_taunting_sienna_04",
				"ewt_taunting_sienna_05",
				"ewt_taunting_sienna_06",
				"ewt_taunting_sienna_07",
				"ewt_taunting_sienna_08",
				"ewt_taunting_sienna_09",
				"ewt_taunting_sienna_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6904349327087,
				6.2976274490356,
				5.1519017219544,
				4.6952037811279,
				6.0815782546997,
				3.9612436294556,
				3.1462473869324,
				2.6507134437561,
				4.4598054885864,
				4.8403835296631
			}
		},
		erg_vw_gather = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_vw_gather_01",
				"erg_vw_gather_02",
				"erg_vw_gather_03",
				"erg_vw_gather_04",
				"erg_vw_gather_05",
				"erg_vw_gather_06",
				"erg_vw_gather_07",
				"erg_vw_gather_08",
				"erg_vw_gather_09",
				"erg_vw_gather_10"
			},
			sound_events = {
				"erg_vw_gather_01",
				"erg_vw_gather_02",
				"erg_vw_gather_03",
				"erg_vw_gather_04",
				"erg_vw_gather_05",
				"erg_vw_gather_06",
				"erg_vw_gather_07",
				"erg_vw_gather_08",
				"erg_vw_gather_09",
				"erg_vw_gather_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epg_vw_wait = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_vw_wait_01",
				"epg_vw_wait_02",
				"epg_vw_wait_03",
				"epg_vw_wait_04",
				"epg_vw_wait_05",
				"epg_vw_wait_06",
				"epg_vw_wait_07",
				"epg_vw_wait_08",
				"epg_vw_wait_09",
				"epg_vw_wait_10"
			},
			sound_events = {
				"epg_vw_wait_01",
				"epg_vw_wait_02",
				"epg_vw_wait_03",
				"epg_vw_wait_04",
				"epg_vw_wait_05",
				"epg_vw_wait_06",
				"epg_vw_wait_07",
				"epg_vw_wait_08",
				"epg_vw_wait_09",
				"epg_vw_wait_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epg_spawning_globadier = {
			face_animations_n = 5,
			database = "pactsworn_player_vo",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"epg_spawning_globadier_01",
				"epg_spawning_globadier_02",
				"epg_spawning_globadier_03",
				"epg_spawning_globadier_04",
				"epg_spawning_globadier_05"
			},
			sound_events = {
				"epg_spawning_globadier_01",
				"epg_spawning_globadier_02",
				"epg_spawning_globadier_03",
				"epg_spawning_globadier_04",
				"epg_spawning_globadier_05"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.0537030696869,
				3.9060728549957,
				3.0499999523163,
				3.2238436937332,
				4.8374512195587
			}
		},
		erg_taunting_saltzpyre = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_taunting_saltzpyre_01",
				"erg_taunting_saltzpyre_02",
				"erg_taunting_saltzpyre_03",
				"erg_taunting_saltzpyre_04",
				"erg_taunting_saltzpyre_05",
				"erg_taunting_saltzpyre_06",
				"erg_taunting_saltzpyre_07",
				"erg_taunting_saltzpyre_08",
				"erg_taunting_saltzpyre_09",
				"erg_taunting_saltzpyre_10"
			},
			sound_events = {
				"erg_taunting_saltzpyre_01",
				"erg_taunting_saltzpyre_02",
				"erg_taunting_saltzpyre_03",
				"erg_taunting_saltzpyre_04",
				"erg_taunting_saltzpyre_05",
				"erg_taunting_saltzpyre_06",
				"erg_taunting_saltzpyre_07",
				"erg_taunting_saltzpyre_08",
				"erg_taunting_saltzpyre_09",
				"erg_taunting_saltzpyre_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		erg_vw_wait = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_vw_wait_01",
				"erg_vw_wait_02",
				"erg_vw_wait_03",
				"erg_vw_wait_04",
				"erg_vw_wait_05",
				"erg_vw_wait_06",
				"erg_vw_wait_07",
				"erg_vw_wait_08",
				"erg_vw_wait_09",
				"erg_vw_wait_10"
			},
			sound_events = {
				"erg_vw_wait_01",
				"erg_vw_wait_02",
				"erg_vw_wait_03",
				"erg_vw_wait_04",
				"erg_vw_wait_05",
				"erg_vw_wait_06",
				"erg_vw_wait_07",
				"erg_vw_wait_08",
				"erg_vw_wait_09",
				"erg_vw_wait_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		erg_taunting_bardin = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_taunting_bardin_01",
				"erg_taunting_bardin_02",
				"erg_taunting_bardin_03",
				"erg_taunting_bardin_04",
				"erg_taunting_bardin_05",
				"erg_taunting_bardin_06",
				"erg_taunting_bardin_07",
				"erg_taunting_bardin_08",
				"erg_taunting_bardin_09",
				"erg_taunting_bardin_10"
			},
			sound_events = {
				"erg_taunting_bardin_01",
				"erg_taunting_bardin_02",
				"erg_taunting_bardin_03",
				"erg_taunting_bardin_04",
				"erg_taunting_bardin_05",
				"erg_taunting_bardin_06",
				"erg_taunting_bardin_07",
				"erg_taunting_bardin_08",
				"erg_taunting_bardin_09",
				"erg_taunting_bardin_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epm_vw_gather = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epm_vw_gather_01",
				"epm_vw_gather_02",
				"epm_vw_gather_03",
				"epm_vw_gather_04",
				"epm_vw_gather_05",
				"epm_vw_gather_06",
				"epm_vw_gather_07",
				"epm_vw_gather_08",
				"epm_vw_gather_09",
				"epm_vw_gather_10"
			},
			sound_events = {
				"epm_vw_gather_01",
				"epm_vw_gather_02",
				"epm_vw_gather_03",
				"epm_vw_gather_04",
				"epm_vw_gather_05",
				"epm_vw_gather_06",
				"epm_vw_gather_07",
				"epm_vw_gather_08",
				"epm_vw_gather_09",
				"epm_vw_gather_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		ewt_taunting_kruber = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_taunting_kruber_01",
				"ewt_taunting_kruber_02",
				"ewt_taunting_kruber_03",
				"ewt_taunting_kruber_04",
				"ewt_taunting_kruber_05",
				"ewt_taunting_kruber_06",
				"ewt_taunting_kruber_07",
				"ewt_taunting_kruber_08",
				"ewt_taunting_kruber_09",
				"ewt_taunting_kruber_10"
			},
			sound_events = {
				"ewt_taunting_kruber_01",
				"ewt_taunting_kruber_02",
				"ewt_taunting_kruber_03",
				"ewt_taunting_kruber_04",
				"ewt_taunting_kruber_05",
				"ewt_taunting_kruber_06",
				"ewt_taunting_kruber_07",
				"ewt_taunting_kruber_08",
				"ewt_taunting_kruber_09",
				"ewt_taunting_kruber_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.3526954650879,
				6.3914637565613,
				4.3689975738525,
				5.6412019729614,
				4.2059035301208,
				3.0805106163025,
				2.6564357280731,
				3.0821425914764,
				2.6324455738068,
				4.4747505187988
			}
		},
		epm_spawning_packmaster = {
			face_animations_n = 5,
			database = "pactsworn_player_vo",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"epm_spawning_packmaster_01",
				"epm_spawning_packmaster_02",
				"epm_spawning_packmaster_03",
				"epm_spawning_packmaster_04",
				"epm_spawning_packmaster_05"
			},
			sound_events = {
				"epm_spawning_packmaster_01",
				"epm_spawning_packmaster_02",
				"epm_spawning_packmaster_03",
				"epm_spawning_packmaster_04",
				"epm_spawning_packmaster_05"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				5.8881878852844,
				5.7025418281555,
				5.0870833396912,
				6.5522503852844,
				7.3559169769287
			}
		},
		epm_packmaster_grab_walk = {
			face_animations_n = 1,
			database = "pactsworn_player_vo",
			sound_events_n = 1,
			category = "player_feedback",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "player_packmaster_vce_grab_walk"
			},
			sound_events = {
				[1.0] = "player_packmaster_vce_grab_walk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 2.5831877589226
			}
		},
		ewt_vw_wait = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_vw_wait_01",
				"ewt_vw_wait_02",
				"ewt_vw_wait_03",
				"ewt_vw_wait_04",
				"ewt_vw_wait_05",
				"ewt_vw_wait_06",
				"ewt_vw_wait_07",
				"ewt_vw_wait_08",
				"ewt_vw_wait_09",
				"ewt_vw_wait_10"
			},
			sound_events = {
				"ewt_vw_wait_01",
				"ewt_vw_wait_02",
				"ewt_vw_wait_03",
				"ewt_vw_wait_04",
				"ewt_vw_wait_05",
				"ewt_vw_wait_06",
				"ewt_vw_wait_07",
				"ewt_vw_wait_08",
				"ewt_vw_wait_09",
				"ewt_vw_wait_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epm_packmaster_hook_fail = {
			face_animations_n = 1,
			database = "pactsworn_player_vo",
			sound_events_n = 1,
			category = "special_occasion",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "player_packmaster_vce_effort"
			},
			sound_events = {
				[1.0] = "player_packmaster_vce_effort"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 0.8659992814064
			}
		},
		ewt_vw_gather = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_vw_gather_01",
				"ewt_vw_gather_02",
				"ewt_vw_gather_03",
				"ewt_vw_gather_04",
				"ewt_vw_gather_05",
				"ewt_vw_gather_06",
				"ewt_vw_gather_07",
				"ewt_vw_gather_08",
				"ewt_vw_gather_09",
				"ewt_vw_gather_10"
			},
			sound_events = {
				"ewt_vw_gather_01",
				"ewt_vw_gather_02",
				"ewt_vw_gather_03",
				"ewt_vw_gather_04",
				"ewt_vw_gather_05",
				"ewt_vw_gather_06",
				"ewt_vw_gather_07",
				"ewt_vw_gather_08",
				"ewt_vw_gather_09",
				"ewt_vw_gather_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.4093964099884,
				1.5927877426148,
				1.9749388694763,
				2.9449269771576,
				1.8572298288345,
				1.5483469963074,
				2.5192985534668,
				1.8583899736404,
				2.0990977287292,
				3.5355956554413
			}
		},
		ewt_vw_ambush = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_vw_ambush_01",
				"ewt_vw_ambush_02",
				"ewt_vw_ambush_03",
				"ewt_vw_ambush_04",
				"ewt_vw_ambush_05",
				"ewt_vw_ambush_06",
				"ewt_vw_ambush_07",
				"ewt_vw_ambush_08",
				"ewt_vw_ambush_09",
				"ewt_vw_ambush_10"
			},
			sound_events = {
				"ewt_vw_ambush_01",
				"ewt_vw_ambush_02",
				"ewt_vw_ambush_03",
				"ewt_vw_ambush_04",
				"ewt_vw_ambush_05",
				"ewt_vw_ambush_06",
				"ewt_vw_ambush_07",
				"ewt_vw_ambush_08",
				"ewt_vw_ambush_09",
				"ewt_vw_ambush_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.6396667957306,
				2.9660263061523,
				3.5523886680603,
				3.5027565956116,
				2.2452211380005,
				2.1342961788177,
				2.8378758430481,
				3.3909664154053,
				4.0391917228699,
				3.1347439289093
			}
		},
		erg_vw_negation = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_vw_negation_01",
				"erg_vw_negation_02",
				"erg_vw_negation_03",
				"erg_vw_negation_04",
				"erg_vw_negation_05",
				"erg_vw_negation_06",
				"erg_vw_negation_07",
				"erg_vw_negation_08",
				"erg_vw_negation_09",
				"erg_vw_negation_10"
			},
			sound_events = {
				"erg_vw_negation_01",
				"erg_vw_negation_02",
				"erg_vw_negation_03",
				"erg_vw_negation_04",
				"erg_vw_negation_05",
				"erg_vw_negation_06",
				"erg_vw_negation_07",
				"erg_vw_negation_08",
				"erg_vw_negation_09",
				"erg_vw_negation_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		ewt_vw_affirmative = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_vw_affirmative_01",
				"ewt_vw_affirmative_02",
				"ewt_vw_affirmative_03",
				"ewt_vw_affirmative_04",
				"ewt_vw_affirmative_05",
				"ewt_vw_affirmative_06",
				"ewt_vw_affirmative_07",
				"ewt_vw_affirmative_08",
				"ewt_vw_affirmative_09",
				"ewt_vw_affirmative_10"
			},
			sound_events = {
				"ewt_vw_affirmative_01",
				"ewt_vw_affirmative_02",
				"ewt_vw_affirmative_03",
				"ewt_vw_affirmative_04",
				"ewt_vw_affirmative_05",
				"ewt_vw_affirmative_06",
				"ewt_vw_affirmative_07",
				"ewt_vw_affirmative_08",
				"ewt_vw_affirmative_09",
				"ewt_vw_affirmative_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.6671965122223,
				1.8053168058395,
				1.8658427000046,
				2.3523509502411,
				2.9645318984985,
				2.2036712169647,
				3.6134061813355,
				4.5693740844727,
				2.8889827728272,
				3.37965965271
			}
		},
		epm_packmaster_hook_success = {
			face_animations_n = 21,
			database = "pactsworn_player_vo",
			sound_events_n = 21,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 21,
			randomize_indexes = {},
			localization_strings = {
				"epm_hook_success_01",
				"epm_hook_success_02",
				"epm_hook_success_03",
				"epm_hook_success_04",
				"epm_hook_success_05",
				"epm_hook_success_06",
				"epm_hook_success_07",
				"epm_hook_success_08",
				"epm_hook_success_09",
				"epm_hook_success_10",
				"epm_hook_success_11",
				"epm_hook_success_12",
				"epm_hook_success_13",
				"epm_hook_success_14",
				"epm_hook_success_15",
				"epm_hook_success_16",
				"epm_hook_success_17",
				"epm_hook_success_18",
				"epm_hook_success_19",
				"epm_hook_success_20",
				"epm_hook_success_21"
			},
			sound_events = {
				"epm_hook_success_01",
				"epm_hook_success_02",
				"epm_hook_success_03",
				"epm_hook_success_04",
				"epm_hook_success_05",
				"epm_hook_success_06",
				"epm_hook_success_07",
				"epm_hook_success_08",
				"epm_hook_success_09",
				"epm_hook_success_10",
				"epm_hook_success_11",
				"epm_hook_success_12",
				"epm_hook_success_13",
				"epm_hook_success_14",
				"epm_hook_success_15",
				"epm_hook_success_16",
				"epm_hook_success_17",
				"epm_hook_success_18",
				"epm_hook_success_19",
				"epm_hook_success_20",
				"epm_hook_success_21"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.85491669178009,
				0.90943747758865,
				0.61695832014084,
				1.0083333253861,
				1.1391249895096,
				1.4951041936874,
				2.0949125289917,
				1.5319783687592,
				2.501312494278,
				3.2467501163483,
				1.7868332862854,
				2.5771250724792,
				3.88316655159,
				3.8704166412353,
				1.9630920886993,
				2.4822587966919,
				1.9546250104904,
				3.3528125286102,
				1.8324791193008,
				3.4412083625794,
				4.2535209655762
			}
		},
		epg_vw_negation = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_vw_negation_01",
				"epg_vw_negation_02",
				"epg_vw_negation_03",
				"epg_vw_negation_04",
				"epg_vw_negation_05",
				"epg_vw_negation_06",
				"epg_vw_negation_07",
				"epg_vw_negation_08",
				"epg_vw_negation_09",
				"epg_vw_negation_10"
			},
			sound_events = {
				"epg_vw_negation_01",
				"epg_vw_negation_02",
				"epg_vw_negation_03",
				"epg_vw_negation_04",
				"epg_vw_negation_05",
				"epg_vw_negation_06",
				"epg_vw_negation_07",
				"epg_vw_negation_08",
				"epg_vw_negation_09",
				"epg_vw_negation_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epm_vw_wait = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epm_vw_wait_01",
				"epm_vw_wait_02",
				"epm_vw_wait_03",
				"epm_vw_wait_04",
				"epm_vw_wait_05",
				"epm_vw_wait_06",
				"epm_vw_wait_07",
				"epm_vw_wait_08",
				"epm_vw_wait_09",
				"epm_vw_wait_10"
			},
			sound_events = {
				"epm_vw_wait_01",
				"epm_vw_wait_02",
				"epm_vw_wait_03",
				"epm_vw_wait_04",
				"epm_vw_wait_05",
				"epm_vw_wait_06",
				"epm_vw_wait_07",
				"epm_vw_wait_08",
				"epm_vw_wait_09",
				"epm_vw_wait_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		ewt_taunting_saltzpyre = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_taunting_saltzpyre_01",
				"ewt_taunting_saltzpyre_02",
				"ewt_taunting_saltzpyre_03",
				"ewt_taunting_saltzpyre_04",
				"ewt_taunting_saltzpyre_05",
				"ewt_taunting_saltzpyre_06",
				"ewt_taunting_saltzpyre_07",
				"ewt_taunting_saltzpyre_08",
				"ewt_taunting_saltzpyre_09",
				"ewt_taunting_saltzpyre_10"
			},
			sound_events = {
				"ewt_taunting_saltzpyre_01",
				"ewt_taunting_saltzpyre_02",
				"ewt_taunting_saltzpyre_03",
				"ewt_taunting_saltzpyre_04",
				"ewt_taunting_saltzpyre_05",
				"ewt_taunting_saltzpyre_06",
				"ewt_taunting_saltzpyre_07",
				"ewt_taunting_saltzpyre_08",
				"ewt_taunting_saltzpyre_09",
				"ewt_taunting_saltzpyre_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				6.8343181610107,
				5.8760695457458,
				4.3259525299072,
				4.8050670623779,
				6.4908528327942,
				3.4567,
				2.4455192089081,
				2.4861059188843,
				2.640389919281,
				2.8014187812805
			}
		},
		epg_taunting_sienna = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_taunting_sienna_01",
				"epg_taunting_sienna_02",
				"epg_taunting_sienna_03",
				"epg_taunting_sienna_04",
				"epg_taunting_sienna_05",
				"epg_taunting_sienna_06",
				"epg_taunting_sienna_07",
				"epg_taunting_sienna_08",
				"epg_taunting_sienna_09",
				"epg_taunting_sienna_10"
			},
			sound_events = {
				"epg_taunting_sienna_01",
				"epg_taunting_sienna_02",
				"epg_taunting_sienna_03",
				"epg_taunting_sienna_04",
				"epg_taunting_sienna_05",
				"epg_taunting_sienna_06",
				"epg_taunting_sienna_07",
				"epg_taunting_sienna_08",
				"epg_taunting_sienna_09",
				"epg_taunting_sienna_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epm_vw_go_here = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epm_vw_go_here_01",
				"epm_vw_go_here_02",
				"epm_vw_go_here_03",
				"epm_vw_go_here_04",
				"epm_vw_go_here_05",
				"epm_vw_go_here_06",
				"epm_vw_go_here_07",
				"epm_vw_go_here_08",
				"epm_vw_go_here_09",
				"epm_vw_go_here_10"
			},
			sound_events = {
				"epm_vw_go_here_01",
				"epm_vw_go_here_02",
				"epm_vw_go_here_03",
				"epm_vw_go_here_04",
				"epm_vw_go_here_05",
				"epm_vw_go_here_06",
				"epm_vw_go_here_07",
				"epm_vw_go_here_08",
				"epm_vw_go_here_09",
				"epm_vw_go_here_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epg_taunting_bardin = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_taunting_bardin_01",
				"epg_taunting_bardin_02",
				"epg_taunting_bardin_03",
				"epg_taunting_bardin_04",
				"epg_taunting_bardin_05",
				"epg_taunting_bardin_06",
				"epg_taunting_bardin_07",
				"epg_taunting_bardin_08",
				"epg_taunting_bardin_09",
				"epg_taunting_bardin_10"
			},
			sound_events = {
				"epg_taunting_bardin_01",
				"epg_taunting_bardin_02",
				"epg_taunting_bardin_03",
				"epg_taunting_bardin_04",
				"epg_taunting_bardin_05",
				"epg_taunting_bardin_06",
				"epg_taunting_bardin_07",
				"epg_taunting_bardin_08",
				"epg_taunting_bardin_09",
				"epg_taunting_bardin_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7485938072205,
				2.5140521526337,
				2.9983646869659,
				2.2327499389648,
				1.8534479141235,
				1.8508437871933,
				1.3309687376022,
				3.4567,
				1.5809999704361,
				1.6414687633514
			}
		},
		ewt_vw_cover_me = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_vw_cover_me_01",
				"ewt_vw_cover_me_02",
				"ewt_vw_cover_me_03",
				"ewt_vw_cover_me_04",
				"ewt_vw_cover_me_05",
				"ewt_vw_cover_me_06",
				"ewt_vw_cover_me_07",
				"ewt_vw_cover_me_08",
				"ewt_vw_cover_me_09",
				"ewt_vw_cover_me_10"
			},
			sound_events = {
				"ewt_vw_cover_me_01",
				"ewt_vw_cover_me_02",
				"ewt_vw_cover_me_03",
				"ewt_vw_cover_me_04",
				"ewt_vw_cover_me_05",
				"ewt_vw_cover_me_06",
				"ewt_vw_cover_me_07",
				"ewt_vw_cover_me_08",
				"ewt_vw_cover_me_09",
				"ewt_vw_cover_me_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7644548416138,
				1.8863916397095,
				2.3518199920654,
				2.9128746986389,
				2.4478788375855,
				1.8281861543655,
				2.3542582988739,
				3.4567,
				2.1034235954285,
				3.4567
			}
		},
		epg_vw_ambush = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_vw_ambush_01",
				"epg_vw_ambush_02",
				"epg_vw_ambush_03",
				"epg_vw_ambush_04",
				"epg_vw_ambush_05",
				"epg_vw_ambush_06",
				"epg_vw_ambush_07",
				"epg_vw_ambush_08",
				"epg_vw_ambush_09",
				"epg_vw_ambush_10"
			},
			sound_events = {
				"epg_vw_ambush_01",
				"epg_vw_ambush_02",
				"epg_vw_ambush_03",
				"epg_vw_ambush_04",
				"epg_vw_ambush_05",
				"epg_vw_ambush_06",
				"epg_vw_ambush_07",
				"epg_vw_ambush_08",
				"epg_vw_ambush_09",
				"epg_vw_ambush_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.7265521287918,
				1.7375104427338,
				2.109375,
				1.6448645591736,
				1.3825833797455,
				2.9916851520538,
				3.4567,
				2.9411458969116,
				3.928750038147,
				1.2809270620346
			}
		},
		ewt_taunting_kerillian = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_taunting_kerillian_01",
				"ewt_taunting_kerillian_02",
				"ewt_taunting_kerillian_03",
				"ewt_taunting_kerillian_04",
				"ewt_taunting_kerillian_05",
				"ewt_taunting_kerillian_06",
				"ewt_taunting_kerillian_07",
				"ewt_taunting_kerillian_08",
				"ewt_taunting_kerillian_09",
				"ewt_taunting_kerillian_10"
			},
			sound_events = {
				"ewt_taunting_kerillian_01",
				"ewt_taunting_kerillian_02",
				"ewt_taunting_kerillian_03",
				"ewt_taunting_kerillian_04",
				"ewt_taunting_kerillian_05",
				"ewt_taunting_kerillian_06",
				"ewt_taunting_kerillian_07",
				"ewt_taunting_kerillian_08",
				"ewt_taunting_kerillian_09",
				"ewt_taunting_kerillian_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.6622321605682,
				4.7017321586609,
				5.6915616989136,
				4.2379951477051,
				3.3822159767151,
				2.8394885063171,
				3.225159406662,
				2.996800661087,
				2.611385345459,
				5.1755766868591
			}
		},
		epg_vw_gather = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_vw_gather_01",
				"epg_vw_gather_02",
				"epg_vw_gather_03",
				"epg_vw_gather_04",
				"epg_vw_gather_05",
				"epg_vw_gather_06",
				"epg_vw_gather_07",
				"epg_vw_gather_08",
				"epg_vw_gather_09",
				"epg_vw_gather_10"
			},
			sound_events = {
				"epg_vw_gather_01",
				"epg_vw_gather_02",
				"epg_vw_gather_03",
				"epg_vw_gather_04",
				"epg_vw_gather_05",
				"epg_vw_gather_06",
				"epg_vw_gather_07",
				"epg_vw_gather_08",
				"epg_vw_gather_09",
				"epg_vw_gather_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.1282291412354,
				0.62897914648056,
				1.0814895629883,
				1.8645416498184,
				0.66460418701172,
				3.4567,
				1.1668437719345,
				1,
				0.89566665887833,
				2.8515625
			}
		},
		erg_vw_attack_now = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_vw_attack_now_01",
				"erg_vw_attack_now_02",
				"erg_vw_attack_now_03",
				"erg_vw_attack_now_04",
				"erg_vw_attack_now_05",
				"erg_vw_attack_now_06",
				"erg_vw_attack_now_07",
				"erg_vw_attack_now_08",
				"erg_vw_attack_now_09",
				"erg_vw_attack_now_10"
			},
			sound_events = {
				"erg_vw_attack_now_01",
				"erg_vw_attack_now_02",
				"erg_vw_attack_now_03",
				"erg_vw_attack_now_04",
				"erg_vw_attack_now_05",
				"erg_vw_attack_now_06",
				"erg_vw_attack_now_07",
				"erg_vw_attack_now_08",
				"erg_vw_attack_now_09",
				"erg_vw_attack_now_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		erg_taunting_kruber = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_taunting_kruber_01",
				"erg_taunting_kruber_02",
				"erg_taunting_kruber_03",
				"erg_taunting_kruber_04",
				"erg_taunting_kruber_05",
				"erg_taunting_kruber_06",
				"erg_taunting_kruber_07",
				"erg_taunting_kruber_08",
				"erg_taunting_kruber_09",
				"erg_taunting_kruber_10"
			},
			sound_events = {
				"erg_taunting_kruber_01",
				"erg_taunting_kruber_02",
				"erg_taunting_kruber_03",
				"erg_taunting_kruber_04",
				"erg_taunting_kruber_05",
				"erg_taunting_kruber_06",
				"erg_taunting_kruber_07",
				"erg_taunting_kruber_08",
				"erg_taunting_kruber_09",
				"erg_taunting_kruber_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epg_vw_go_here = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_vw_go_here_01",
				"epg_vw_go_here_02",
				"epg_vw_go_here_03",
				"epg_vw_go_here_04",
				"epg_vw_go_here_05",
				"epg_vw_go_here_06",
				"epg_vw_go_here_07",
				"epg_vw_go_here_08",
				"epg_vw_go_here_09",
				"epg_vw_go_here_10"
			},
			sound_events = {
				"epg_vw_go_here_01",
				"epg_vw_go_here_02",
				"epg_vw_go_here_03",
				"epg_vw_go_here_04",
				"epg_vw_go_here_05",
				"epg_vw_go_here_06",
				"epg_vw_go_here_07",
				"epg_vw_go_here_08",
				"epg_vw_go_here_09",
				"epg_vw_go_here_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.99088543653488,
				1.3643125295639,
				0.7852395772934,
				1.8366562128067,
				1.4066145420075,
				2.1103646755219,
				3,
				1.3037395477295,
				2.1519479751587,
				1.6587604284286
			}
		},
		epm_packmaster_skulking = {
			face_animations_n = 1,
			database = "pactsworn_player_vo",
			sound_events_n = 1,
			category = "player_feedback",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "player_packmaster_vce_skulking"
			},
			sound_events = {
				[1.0] = "player_packmaster_vce_skulking"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.4567
			}
		},
		epg_taunting_kruber = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_taunting_kruber_01",
				"epg_taunting_kruber_02",
				"epg_taunting_kruber_03",
				"epg_taunting_kruber_04",
				"epg_taunting_kruber_05",
				"epg_taunting_kruber_06",
				"epg_taunting_kruber_07",
				"epg_taunting_kruber_08",
				"epg_taunting_kruber_09",
				"epg_taunting_kruber_10"
			},
			sound_events = {
				"epg_taunting_kruber_01",
				"epg_taunting_kruber_02",
				"epg_taunting_kruber_03",
				"epg_taunting_kruber_04",
				"epg_taunting_kruber_05",
				"epg_taunting_kruber_06",
				"epg_taunting_kruber_07",
				"epg_taunting_kruber_08",
				"epg_taunting_kruber_09",
				"epg_taunting_kruber_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		erg_vw_ambush = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_vw_ambush_01",
				"erg_vw_ambush_02",
				"erg_vw_ambush_03",
				"erg_vw_ambush_04",
				"erg_vw_ambush_05",
				"erg_vw_ambush_06",
				"erg_vw_ambush_07",
				"erg_vw_ambush_08",
				"erg_vw_ambush_09",
				"erg_vw_ambush_10"
			},
			sound_events = {
				"erg_vw_ambush_01",
				"erg_vw_ambush_02",
				"erg_vw_ambush_03",
				"erg_vw_ambush_04",
				"erg_vw_ambush_05",
				"erg_vw_ambush_06",
				"erg_vw_ambush_07",
				"erg_vw_ambush_08",
				"erg_vw_ambush_09",
				"erg_vw_ambush_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epm_vw_negation = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epm_vw_negation_01",
				"epm_vw_negation_02",
				"epm_vw_negation_03",
				"epm_vw_negation_04",
				"epm_vw_negation_05",
				"epm_vw_negation_06",
				"epm_vw_negation_07",
				"epm_vw_negation_08",
				"epm_vw_negation_09",
				"epm_vw_negation_10"
			},
			sound_events = {
				"epm_vw_negation_01",
				"epm_vw_negation_02",
				"epm_vw_negation_03",
				"epm_vw_negation_04",
				"epm_vw_negation_05",
				"epm_vw_negation_06",
				"epm_vw_negation_07",
				"epm_vw_negation_08",
				"epm_vw_negation_09",
				"epm_vw_negation_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epm_vw_ambush = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epm_vw_ambush_01",
				"epm_vw_ambush_02",
				"epm_vw_ambush_03",
				"epm_vw_ambush_04",
				"epm_vw_ambush_05",
				"epm_vw_ambush_06",
				"epm_vw_ambush_07",
				"epm_vw_ambush_08",
				"epm_vw_ambush_09",
				"epm_vw_ambush_10"
			},
			sound_events = {
				"epm_vw_ambush_01",
				"epm_vw_ambush_02",
				"epm_vw_ambush_03",
				"epm_vw_ambush_04",
				"epm_vw_ambush_05",
				"epm_vw_ambush_06",
				"epm_vw_ambush_07",
				"epm_vw_ambush_08",
				"epm_vw_ambush_09",
				"epm_vw_ambush_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epg_taunting_saltzpyre = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_taunting_saltzpyre_01",
				"epg_taunting_saltzpyre_02",
				"epg_taunting_saltzpyre_03",
				"epg_taunting_saltzpyre_04",
				"epg_taunting_saltzpyre_05",
				"epg_taunting_saltzpyre_06",
				"epg_taunting_saltzpyre_07",
				"epg_taunting_saltzpyre_08",
				"epg_taunting_saltzpyre_09",
				"epg_taunting_saltzpyre_10"
			},
			sound_events = {
				"epg_taunting_saltzpyre_01",
				"epg_taunting_saltzpyre_02",
				"epg_taunting_saltzpyre_03",
				"epg_taunting_saltzpyre_04",
				"epg_taunting_saltzpyre_05",
				"epg_taunting_saltzpyre_06",
				"epg_taunting_saltzpyre_07",
				"epg_taunting_saltzpyre_08",
				"epg_taunting_saltzpyre_09",
				"epg_taunting_saltzpyre_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		erg_taunting_sienna = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_taunting_sienna_01",
				"erg_taunting_sienna_02",
				"erg_taunting_sienna_03",
				"erg_taunting_sienna_04",
				"erg_taunting_sienna_05",
				"erg_taunting_sienna_06",
				"erg_taunting_sienna_07",
				"erg_taunting_sienna_08",
				"erg_taunting_sienna_09",
				"erg_taunting_sienna_10"
			},
			sound_events = {
				"erg_taunting_sienna_01",
				"erg_taunting_sienna_02",
				"erg_taunting_sienna_03",
				"erg_taunting_sienna_04",
				"erg_taunting_sienna_05",
				"erg_taunting_sienna_06",
				"erg_taunting_sienna_07",
				"erg_taunting_sienna_08",
				"erg_taunting_sienna_09",
				"erg_taunting_sienna_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		erg_taunting_kerillian = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_taunting_kerillian_01",
				"erg_taunting_kerillian_02",
				"erg_taunting_kerillian_03",
				"erg_taunting_kerillian_04",
				"erg_taunting_kerillian_05",
				"erg_taunting_kerillian_06",
				"erg_taunting_kerillian_07",
				"erg_taunting_kerillian_08",
				"erg_taunting_kerillian_09",
				"erg_taunting_kerillian_10"
			},
			sound_events = {
				"erg_taunting_kerillian_01",
				"erg_taunting_kerillian_02",
				"erg_taunting_kerillian_03",
				"erg_taunting_kerillian_04",
				"erg_taunting_kerillian_05",
				"erg_taunting_kerillian_06",
				"erg_taunting_kerillian_07",
				"erg_taunting_kerillian_08",
				"erg_taunting_kerillian_09",
				"erg_taunting_kerillian_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		erg_vw_go_here = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"erg_vw_go_here_01",
				"erg_vw_go_here_02",
				"erg_vw_go_here_03",
				"erg_vw_go_here_04",
				"erg_vw_go_here_05",
				"erg_vw_go_here_06",
				"erg_vw_go_here_07",
				"erg_vw_go_here_08",
				"erg_vw_go_here_09",
				"erg_vw_go_here_10"
			},
			sound_events = {
				"erg_vw_go_here_01",
				"erg_vw_go_here_02",
				"erg_vw_go_here_03",
				"erg_vw_go_here_04",
				"erg_vw_go_here_05",
				"erg_vw_go_here_06",
				"erg_vw_go_here_07",
				"erg_vw_go_here_08",
				"erg_vw_go_here_09",
				"erg_vw_go_here_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		ewt_vw_go_here = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_vw_go_here_01",
				"ewt_vw_go_here_02",
				"ewt_vw_go_here_03",
				"ewt_vw_go_here_04",
				"ewt_vw_go_here_05",
				"ewt_vw_go_here_06",
				"ewt_vw_go_here_07",
				"ewt_vw_go_here_08",
				"ewt_vw_go_here_09",
				"ewt_vw_go_here_10"
			},
			sound_events = {
				"ewt_vw_go_here_01",
				"ewt_vw_go_here_02",
				"ewt_vw_go_here_03",
				"ewt_vw_go_here_04",
				"ewt_vw_go_here_05",
				"ewt_vw_go_here_06",
				"ewt_vw_go_here_07",
				"ewt_vw_go_here_08",
				"ewt_vw_go_here_09",
				"ewt_vw_go_here_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.2670874595642,
				2.4917886257172,
				1.6333546638489,
				2.1555924415588,
				2.6031854152679,
				3.3055460453033,
				2.9295692443848,
				2.5728635787964,
				3.4567,
				3.4567
			}
		},
		erg_spawning_ratling_gunner = {
			face_animations_n = 5,
			database = "pactsworn_player_vo",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"erg_spawning_ratling_gunner_01",
				"erg_spawning_ratling_gunner_02",
				"erg_spawning_ratling_gunner_03",
				"erg_spawning_ratling_gunner_04",
				"erg_spawning_ratling_gunner_05"
			},
			sound_events = {
				"erg_spawning_ratling_gunner_01",
				"erg_spawning_ratling_gunner_02",
				"erg_spawning_ratling_gunner_03",
				"erg_spawning_ratling_gunner_04",
				"erg_spawning_ratling_gunner_05"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epm_vw_cover_me = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epm_vw_cover_me_01",
				"epm_vw_cover_me_02",
				"epm_vw_cover_me_03",
				"epm_vw_cover_me_04",
				"epm_vw_cover_me_05",
				"epm_vw_cover_me_06",
				"epm_vw_cover_me_07",
				"epm_vw_cover_me_08",
				"epm_vw_cover_me_09",
				"epm_vw_cover_me_10"
			},
			sound_events = {
				"epm_vw_cover_me_01",
				"epm_vw_cover_me_02",
				"epm_vw_cover_me_03",
				"epm_vw_cover_me_04",
				"epm_vw_cover_me_05",
				"epm_vw_cover_me_06",
				"epm_vw_cover_me_07",
				"epm_vw_cover_me_08",
				"epm_vw_cover_me_09",
				"epm_vw_cover_me_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			}
		},
		epg_vw_attack_now = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"epg_vw_attack_now_01",
				"epg_vw_attack_now_02",
				"epg_vw_attack_now_03",
				"epg_vw_attack_now_04",
				"epg_vw_attack_now_05",
				"epg_vw_attack_now_06",
				"epg_vw_attack_now_07",
				"epg_vw_attack_now_08",
				"epg_vw_attack_now_09",
				"epg_vw_attack_now_10"
			},
			sound_events = {
				"epg_vw_attack_now_01",
				"epg_vw_attack_now_02",
				"epg_vw_attack_now_03",
				"epg_vw_attack_now_04",
				"epg_vw_attack_now_05",
				"epg_vw_attack_now_06",
				"epg_vw_attack_now_07",
				"epg_vw_attack_now_08",
				"epg_vw_attack_now_09",
				"epg_vw_attack_now_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.25,
				1.6578958034515,
				1.7745312452316,
				3.2537708282471,
				0.67805206775665,
				1.178552031517,
				2.0025730133057,
				1.852697968483,
				2.6036040782928,
				4.9072709083557
			}
		},
		ewt_walking = {
			face_animations_n = 1,
			database = "pactsworn_player_vo",
			sound_events_n = 1,
			category = "player_feedback",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "player_combat_walk_normal"
			},
			sound_events = {
				[1.0] = "player_combat_walk_normal"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 4.3152661323547
			}
		},
		ewt_vw_attack_now = {
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
			randomize_indexes = {},
			localization_strings = {
				"ewt_vw_attack_now_01",
				"ewt_vw_attack_now_02",
				"ewt_vw_attack_now_03",
				"ewt_vw_attack_now_04",
				"ewt_vw_attack_now_05",
				"ewt_vw_attack_now_06",
				"ewt_vw_attack_now_07",
				"ewt_vw_attack_now_08",
				"ewt_vw_attack_now_09",
				"ewt_vw_attack_now_10"
			},
			sound_events = {
				"ewt_vw_attack_now_01",
				"ewt_vw_attack_now_02",
				"ewt_vw_attack_now_03",
				"ewt_vw_attack_now_04",
				"ewt_vw_attack_now_05",
				"ewt_vw_attack_now_06",
				"ewt_vw_attack_now_07",
				"ewt_vw_attack_now_08",
				"ewt_vw_attack_now_09",
				"ewt_vw_attack_now_10"
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
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1907866001129,
				2.6916933059692,
				2.5000476837158,
				3.019198179245,
				3.6611506938934,
				1.7001141309738,
				2.4042444229126,
				2.5827348232269,
				2.4108908176422,
				4.910505771637
			}
		}
	})
end
