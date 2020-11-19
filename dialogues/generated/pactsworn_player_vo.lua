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
		erg_vw_go_here = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_vw_affirmative = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_vw_go_here = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_vw_negation = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_taunting_kruber = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_vw_negation = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_taunting_kruber = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_vw_ambush = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_taunting_bardin = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_taunting_bardin = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_spawning_packmaster = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 5,
			sound_events = {
				"epm_spawning_packmaster_01",
				"epm_spawning_packmaster_02",
				"epm_spawning_packmaster_03",
				"epm_spawning_packmaster_04",
				"epm_spawning_packmaster_05"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"epm_spawning_packmaster_01",
				"epm_spawning_packmaster_02",
				"epm_spawning_packmaster_03",
				"epm_spawning_packmaster_04",
				"epm_spawning_packmaster_05"
			},
			randomize_indexes = {}
		},
		erg_vw_affirmative = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_vw_ambush = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_vw_affirmative = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_vw_go_here = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_vw_gather = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_vw_affirmative = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_spawning_globadier = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 5,
			sound_events = {
				"epg_spawning_globadier_01",
				"epg_spawning_globadier_02",
				"epg_spawning_globadier_03",
				"epg_spawning_globadier_04",
				"epg_spawning_globadier_05"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"epg_spawning_globadier_01",
				"epg_spawning_globadier_02",
				"epg_spawning_globadier_03",
				"epg_spawning_globadier_04",
				"epg_spawning_globadier_05"
			},
			randomize_indexes = {}
		},
		epm_vw_attack_now = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_taunting_kerillian = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_vw_cover_me = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_vw_attack_now = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_vw_wait = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_walking = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "pactsworn_player_vo",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "player_combat_walk_normal"
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
				[1.0] = "player_combat_walk_normal"
			}
		},
		ewt_vw_negation = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_vw_ambush = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_vw_gather = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_vw_gather = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_taunting_sienna = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_taunting_saltzpyre = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_vw_attack_now = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_spawning_ratling_gunner = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 5,
			sound_events = {
				"erg_spawning_ratling_gunner_01",
				"erg_spawning_ratling_gunner_02",
				"erg_spawning_ratling_gunner_03",
				"erg_spawning_ratling_gunner_04",
				"erg_spawning_ratling_gunner_05"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"erg_spawning_ratling_gunner_01",
				"erg_spawning_ratling_gunner_02",
				"erg_spawning_ratling_gunner_03",
				"erg_spawning_ratling_gunner_04",
				"erg_spawning_ratling_gunner_05"
			},
			randomize_indexes = {}
		},
		ewt_taunting_bardin = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_vw_wait = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_taunting_kerillian = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_spawning_warpfire_thrower = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 5,
			sound_events = {
				"ewt_spawning_warpfire_thrower_01",
				"ewt_spawning_warpfire_thrower_02",
				"ewt_spawning_warpfire_thrower_03",
				"ewt_spawning_warpfire_thrower_04",
				"ewt_spawning_warpfire_thrower_05"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.4567,
				3.4567,
				3.4567,
				3.4567,
				3.4567
			},
			localization_strings = {
				"ewt_spawning_warpfire_thrower_01",
				"ewt_spawning_warpfire_thrower_02",
				"ewt_spawning_warpfire_thrower_03",
				"ewt_spawning_warpfire_thrower_04",
				"ewt_spawning_warpfire_thrower_05"
			},
			randomize_indexes = {}
		},
		epm_packmaster_grab_walk = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "pactsworn_player_vo",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "player_packmaster_vce_grab_walk"
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
				[1.0] = "player_packmaster_vce_grab_walk"
			}
		},
		erg_taunting_sienna = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_vw_wait = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_taunting_sienna = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_vw_go_here = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_taunting_saltzpyre = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_packmaster_hook_fail = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "pactsworn_player_vo",
			category = "special_occasion",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "player_packmaster_vce_effort"
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
				[1.0] = "player_packmaster_vce_effort"
			}
		},
		erg_vw_cover_me = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_packmaster_hook_success = {
			sound_events_n = 21,
			face_animations_n = 21,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 21,
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
				3.4567,
				3.4567,
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
			},
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
			randomize_indexes = {}
		},
		epm_packmaster_skulking = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "pactsworn_player_vo",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "player_packmaster_vce_skulking"
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
				[1.0] = "player_packmaster_vce_skulking"
			}
		},
		epg_vw_cover_me = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_vw_attack_now = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_vw_gather = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_vw_ambush = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_vw_negation = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		erg_taunting_saltzpyre = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		ewt_taunting_kruber = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_taunting_kerillian = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epg_vw_wait = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		},
		epm_vw_cover_me = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "pactsworn_player_vo",
			randomize_indexes_n = 0,
			category = "special_occasion",
			dialogue_animations_n = 10,
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
			},
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
			randomize_indexes = {}
		}
	})
end
