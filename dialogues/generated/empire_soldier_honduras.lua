return function ()
	define_rule({
		response = "pes_activate_ability_grail_knight",
		name = "pes_activate_ability_grail_knight",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_questingknight"
			}
		}
	})
	define_rule({
		response = "pes_activate_ability_huntsman",
		name = "pes_activate_ability_huntsman",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_huntsman"
			}
		}
	})
	define_rule({
		response = "pes_activate_ability_knight",
		name = "pes_activate_ability_knight",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_knight"
			}
		}
	})
	define_rule({
		response = "pes_activate_ability_mercenary",
		name = "pes_activate_ability_mercenary",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability"
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
				"user_context",
				"player_career",
				OP.EQ,
				"es_mercenary"
			}
		}
	})
	define_rule({
		name = "pes_curse",
		response = "pes_curse",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemies_close"
			},
			{
				"query_context",
				"num_units",
				OP.GT,
				35
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.NEQ,
				"es_questingknight"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"intensity",
				OP.GT,
				30
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_curse_forced",
		response = "pes_curse_forced",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"force_curse_vo"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"player_career",
				OP.NEQ,
				"es_questingknight"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_curse_vo",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_curse_vo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_ambush_horde_spawned",
		response = "pes_gameplay_ambush_horde_spawned",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde"
			},
			{
				"query_context",
				"horde_type",
				OP.EQ,
				"ambush"
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
				"time_since_ambush",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ambush",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_armoured_enemy_bright_wizard",
		response = "pes_gameplay_armoured_enemy_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_armoured_enemy_dwarf_ranger",
		response = "pes_gameplay_armoured_enemy_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_armoured_enemy_witch_hunter",
		response = "pes_gameplay_armoured_enemy_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_armoured_enemy_wood_elf",
		response = "pes_gameplay_armoured_enemy_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"armor_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"profile_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_armor_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bile_troll_before_puke",
		response = "pes_gameplay_bile_troll_before_puke",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"before_puke"
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
				"before_puke",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"before_puke",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bile_troll_incapacitaded",
		response = "pes_gameplay_bile_troll_incapacitaded",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"troll_incapacitaded"
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
				"troll_incapacitaded",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"troll_incapacitaded",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_gameplay_bright_wizard_being_helped_up",
		name = "pes_gameplay_bright_wizard_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
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
		name = "pes_gameplay_bright_wizard_dead",
		response = "pes_gameplay_bright_wizard_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
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
				"time_since_pbw_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pbw_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_eaten",
		response = "pes_gameplay_bright_wizard_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
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
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_grabbed",
		response = "pes_gameplay_bright_wizard_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_low_on_health",
		response = "pes_gameplay_bright_wizard_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_low_health_pbw",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pbw",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_bright_wizard_on_a_frenzy",
		response = "pes_gameplay_bright_wizard_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
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
				"time_since_last_frenzy_bright_wizard",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_bright_wizard",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_casual_quotes",
		response = "pes_gameplay_casual_quotes",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
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
				"global_context",
				"level_time",
				OP.GT,
				900
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_chaos_wizard_leech_leeching_bardin",
		response = "pes_gameplay_chaos_wizard_leech_leeching_bardin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_chaos_wizard_leech_leeching_keriliian",
		response = "pes_gameplay_chaos_wizard_leech_leeching_keriliian",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_chaos_wizard_leech_leeching_saltzpyre",
		response = "pes_gameplay_chaos_wizard_leech_leeching_saltzpyre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_chaos_wizard_leech_leeching_sienna",
		response = "pes_gameplay_chaos_wizard_leech_leeching_sienna",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dead_body",
		response = "pes_gameplay_dead_body",
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
				"generic_spotting_dead_body"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				12
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
				"user_context",
				"intensity",
				OP.EQ,
				0
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				90
			},
			{
				"faction_memory",
				"time_since_spotting_dead_body",
				OP.TIMEDIFF,
				OP.GT,
				480
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_spotting_dead_body",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dead_end",
		response = "pes_gameplay_dead_end",
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
				"generic_dead_end"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_dead_end",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_dead_end",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_gameplay_dwarf_ranger_being_helped",
		name = "pes_gameplay_dwarf_ranger_being_helped",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
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
		name = "pes_gameplay_dwarf_ranger_dead",
		response = "pes_gameplay_dwarf_ranger_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
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
				"time_since_pdr_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pdr_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_eaten",
		response = "pes_gameplay_dwarf_ranger_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
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
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_grabbed",
		response = "pes_gameplay_dwarf_ranger_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_low_on_health",
		response = "pes_gameplay_dwarf_ranger_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_low_health_pdr",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pdr",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_dwarf_ranger_on_a_frenzy",
		response = "pes_gameplay_dwarf_ranger_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
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
				"time_since_last_frenzy_dwarf_ranger",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_dwarf_ranger",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_encouraging_words",
		response = "pes_gameplay_encouraging_words",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friends_close"
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
				"global_context",
				"level_time",
				OP.GT,
				600
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_friendly_fire_bright_wizard",
		response = "pes_gameplay_friendly_fire_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"player_profile",
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
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_friendly_fire_dwarf_ranger",
		response = "pes_gameplay_friendly_fire_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"player_profile",
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
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_friendly_fire_witch_hunter",
		response = "pes_gameplay_friendly_fire_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"player_profile",
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
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_friendly_fire_wood_elf",
		response = "pes_gameplay_friendly_fire_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friendly_fire"
			},
			{
				"query_context",
				"target",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"player_profile",
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
				"last_friendly_fire",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"last_friendly_fire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_globadier_guck",
		response = "pes_gameplay_globadier_guck",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"pwg_projectile"
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
				"pwg_projectile_thrown",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_projectile_thrown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_bright_wizard",
		response = "pes_gameplay_healing_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_draught",
		response = "pes_gameplay_healing_draught",
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
				"health_flask"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_dwarf_ranger",
		response = "pes_gameplay_healing_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_witch_hunter",
		response = "pes_gameplay_healing_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_healing_wood_elf",
		response = "pes_gameplay_healing_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_bright_wizard_in_trouble",
		response = "pes_gameplay_heard_bright_wizard_in_trouble",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pbw_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_dwarf_ranger_in_trouble",
		response = "pes_gameplay_heard_dwarf_ranger_in_trouble",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pdr_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_witch_hunter_in_trouble",
		response = "pes_gameplay_heard_witch_hunter_in_trouble",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_heard_wood_elf_in_trouble",
		response = "pes_gameplay_heard_wood_elf_in_trouble",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"time_since_we_downed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_we_downed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_Skaven_warpfire_thrower",
		response = "pes_gameplay_hearing_a_Skaven_warpfire_thrower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		response = "pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_spawn",
		response = "pes_gameplay_hearing_a_chaos_spawn",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_spawn_combat",
		response = "pes_gameplay_hearing_a_chaos_spawn_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_warrior_combat",
		response = "pes_gameplay_hearing_a_chaos_warrior_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_warrior",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_leech",
		response = "pes_gameplay_hearing_a_chaos_wizard_leech",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_corruptor_sorcerer"
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
				"last_seen_leech",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_leech",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_leech",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_plague",
		response = "pes_gameplay_hearing_a_chaos_wizard_plague",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_plague_combat",
		response = "pes_gameplay_hearing_a_chaos_wizard_plague_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_tentacle",
		response = "pes_gameplay_hearing_a_chaos_wizard_tentacle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		response = "pes_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_wind",
		response = "pes_gameplay_hearing_a_chaos_wizard_wind",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_chaos_wizard_wind_combat",
		response = "pes_gameplay_hearing_a_chaos_wizard_wind_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_globadier",
		response = "pes_gameplay_hearing_a_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_globadier_combat",
		response = "pes_gameplay_hearing_a_globadier_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_gutter_runner",
		response = "pes_gameplay_hearing_a_gutter_runner",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_gutter_runner_combat",
		response = "pes_gameplay_hearing_a_gutter_runner_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_minotaur",
		response = "pes_gameplay_hearing_a_minotaur",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_minotaur"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"time_since_incoming_attack",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_beastmen_minotaur",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_beastmen_minotaur",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_pm",
		response = "pes_gameplay_hearing_a_pm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"Play_plague_monk_alerted_vce"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_pm_in_combat",
		response = "pes_gameplay_hearing_a_pm_in_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"Play_plague_monk_alerted_vce"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_patrol_stormvermin",
		response = "pes_gameplay_hearing_a_skaven_patrol_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_storm_vermin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_rat_ogre",
		response = "pes_gameplay_hearing_a_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_rat_ogre_combat",
		response = "pes_gameplay_hearing_a_skaven_rat_ogre_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_ratling_gun",
		response = "pes_gameplay_hearing_a_skaven_ratling_gun",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_skaven_ratling_gun_combat",
		response = "pes_gameplay_hearing_a_skaven_ratling_gun_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_standard_bearer",
		response = "pes_gameplay_hearing_a_standard_bearer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_standard_bearer"
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
				"last_seen_beastmen_standard_bearer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_beastmen_standard_bearer",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_beastmen_standard_bearer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_standard_bearer_crater",
		response = "pes_gameplay_hearing_a_standard_bearer_crater",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_standard_bearer_crater"
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
				"last_seen_beastmen_standard_bearer_crater",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_beastmen_standard_bearer_crater",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_beastmen_standard_bearer_crater",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_stormfiend",
		response = "pes_gameplay_hearing_a_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_stormfiend_combat",
		response = "pes_gameplay_hearing_a_stormfiend_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_troll",
		response = "pes_gameplay_hearing_a_troll",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_a_troll_combat",
		response = "pes_gameplay_hearing_a_troll_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"user_context",
				"enemies_close",
				OP.GT,
				0
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
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hearing_marauder_berserker_combat",
		response = "pes_gameplay_hearing_marauder_berserker_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"sound_event",
				OP.EQ,
				"ecb_gameplay_running_towards_players"
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
				"last_heard_chaos_berzerker",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_berzerker",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_hears_incoming_horde",
		response = "pes_gameplay_hears_incoming_horde",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"horde"
			},
			{
				"query_context",
				"horde_type",
				OP.EQ,
				"vector"
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"time_since_horde",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_horde",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_helped_by_bright_wizard",
		response = "pes_gameplay_helped_by_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"healer_name",
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
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_helped_by_dwarf_ranger",
		response = "pes_gameplay_helped_by_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"healer_name",
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
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_helped_by_witch_hunter",
		response = "pes_gameplay_helped_by_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"healer_name",
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
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_helped_by_wood_elf",
		response = "pes_gameplay_helped_by_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_completed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"healer_name",
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
				"last_helped",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_helped",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_gameplay_hit_by_goo",
		name = "pes_gameplay_hit_by_goo",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"hit_by_goo"
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
		name = "pes_gameplay_incoming_attack",
		response = "pes_gameplay_incoming_attack",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"incoming_attack"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_minotaur"
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
				"time_since_incoming_attack",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_incoming_attack",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_incoming_bestigor_attack",
		response = "pes_gameplay_incoming_bestigor_attack",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"incoming_attack"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_bestigor"
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
				"time_since_incoming_bestigor_attack",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_incoming_bestigor_attack",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_incoming_globadier",
		response = "pes_gameplay_incoming_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"pwg_suicide_run"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pwg_suicides",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_suicides",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_incoming_skaven_rat_ogre",
		response = "pes_gameplay_incoming_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"rat_ogre_change_target"
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"ogre_charges",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"ogre_charges",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_warrior",
		response = "pes_gameplay_killing_a_chaos_warrior",
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
				"chaos_warrior"
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
				"time_since_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_warrior",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_warrior_champion",
		response = "pes_gameplay_killing_a_chaos_warrior_champion",
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
				"chaos_exalted_champion"
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
				"time_since_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_exalted_champion",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_wizard_leech",
		response = "pes_gameplay_killing_a_chaos_wizard_leech",
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
				"chaos_corruptor_sorcerer"
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
				"time_since_chaos_wizard_leech",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_wizard_leech",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_wizard_plague",
		response = "pes_gameplay_killing_a_chaos_wizard_plague",
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
				"chaos_plague_sorcerer"
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
				"time_since_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_plague_sorcerer",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_wizard_tentacle",
		response = "pes_gameplay_killing_a_chaos_wizard_tentacle",
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
				"chaos_tentacle_sorcerer"
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
				"time_since_chaos_wizard_tentacle",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_wizard_tentacle",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_chaos_wizard_wind",
		response = "pes_gameplay_killing_a_chaos_wizard_wind",
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
				"chaos_vortex_sorcerer"
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
				"time_since_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_chaos_vortex_sorcerer",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_minotaur",
		response = "pes_gameplay_killing_a_minotaur",
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
				"beastmen_minotaur"
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
				"time_since_killing_beastmen_minotaur",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_beastmen_minotaur",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_skaven_warpfire_thrower",
		response = "pes_gameplay_killing_a_skaven_warpfire_thrower",
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
				"skaven_warpfire_thrower"
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
				"time_since_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_skaven_warpfire_thrower",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_a_stormfiend",
		response = "pes_gameplay_killing_a_stormfiend",
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
				"skaven_stormfiend"
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
				"time_since_killing_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_skaven_stormfiend",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_globadier",
		response = "pes_gameplay_killing_globadier",
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
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"user_memory",
				"time_since_killing_globadier",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_globadier",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_gutterrunner",
		response = "pes_gameplay_killing_gutterrunner",
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
			},
			{
				"user_memory",
				"time_since_killing_gutterrunner",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_gutterrunner",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_lootrat",
		response = "pes_gameplay_killing_lootrat",
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
				"skaven_loot_rat"
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
				"time_since_killing_lootrat",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_lootrat",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_packmaster",
		response = "pes_gameplay_killing_packmaster",
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
			},
			{
				"user_memory",
				"time_since_killing_packmaster",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_packmaster",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_killing_ratling",
		response = "pes_gameplay_killing_ratling",
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
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"user_memory",
				"time_since_killing_ratling",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_killing_ratling",
				OP.TIMESET
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pes_gameplay_knocked_down",
		response = "pes_gameplay_knocked_down",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
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
				"time_since_knocked_down",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_knocked_down",
				OP.TIMESET
			},
			{
				"faction_memory",
				"times_we_downed",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"times_down_empire_soldier",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pes_gameplay_low_on_health",
		response = "pes_gameplay_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"health_trigger"
			},
			{
				"query_context",
				"current_amount",
				OP.LTEQ,
				0.4
			},
			{
				"query_context",
				"current_amount",
				OP.GTEQ,
				0.1
			},
			{
				"query_context",
				"trigger_type",
				OP.EQ,
				"decreasing"
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
				"low_health",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"low_health",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_no_nearby_teammates",
		response = "pes_gameplay_no_nearby_teammates",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"friends_distant"
			},
			{
				"user_context",
				"friends_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				60
			},
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_alone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_out_of_ammo",
		response = "pes_gameplay_out_of_ammo",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"reload_failed"
			},
			{
				"query_context",
				"fail_reason",
				OP.EQ,
				"out_of_ammo"
			},
			{
				"query_context",
				"item_name",
				OP.NEQ,
				"healthkit_first_aid_kit_01"
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
				"time_since_out_of_ammo",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_out_of_ammo",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_parry_bright_wizard",
		response = "pes_gameplay_parry_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
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
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_parry_dwarf_ranger",
		response = "pes_gameplay_parry_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
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
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_parry_witch_hunter",
		response = "pes_gameplay_parry_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
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
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_parry_wood_elf",
		response = "pes_gameplay_parry_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"frenzy_attack_damage"
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
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMEDIFF,
				OP.GT,
				600
			}
		},
		on_done = {
			{
				"faction_memory",
				"frenzy_attack_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_player_pounced",
		response = "pes_gameplay_player_pounced",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
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
				"time_since_knocked_down",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_knocked_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_Skaven_warpfire_thrower",
		response = "pes_gameplay_seeing_a_Skaven_warpfire_thrower",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_warpfire_thrower"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_warpfire_thrower",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_spawn",
		response = "pes_gameplay_seeing_a_chaos_spawn",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_spawn"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_spawn",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_warrior",
		response = "pes_gameplay_seeing_a_chaos_warrior",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_warrior",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_warrior",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_warrior_champion_combat",
		response = "pes_gameplay_seeing_a_chaos_warrior_champion_combat",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_exalted_champion"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_exalted_champion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_wizard_plague",
		response = "pes_gameplay_seeing_a_chaos_wizard_plague",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_plague_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_plague_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_wizard_tentacle",
		response = "pes_gameplay_seeing_a_chaos_wizard_tentacle",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_tentacle_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_tentacle_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_chaos_wizard_wind",
		response = "pes_gameplay_seeing_a_chaos_wizard_wind",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_vortex_sorcerer"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_vortex_sorcerer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_globadier",
		response = "pes_gameplay_seeing_a_globadier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_gutter_runner",
		response = "pes_gameplay_seeing_a_gutter_runner",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_pm",
		response = "pes_gameplay_seeing_a_pm",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_plague_monk"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				10
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
				"last_heard_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_plague_monk",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_scr",
		response = "pes_gameplay_seeing_a_scr",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_clan_rat_with_shield"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"seeing_a_scr",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"seeing_a_scr",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_shield_stormvermin",
		response = "pes_gameplay_seeing_a_shield_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin_with_shield"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_seen_skaven_storm_vermin_with_shield",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_storm_vermin_with_shield",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_patrol_stormvermin",
		response = "pes_gameplay_seeing_a_skaven_patrol_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_storm_vermin"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_rat_ogre",
		response = "pes_gameplay_seeing_a_skaven_rat_ogre",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rat_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_ratling_gun",
		response = "pes_gameplay_seeing_a_skaven_ratling_gun",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_skaven_slaver",
		response = "pes_gameplay_seeing_a_skaven_slaver",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
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
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"time_since_slaver",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_slaver",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_stormfiend",
		response = "pes_gameplay_seeing_a_stormfiend",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_stormfiend"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_skaven_stormfiend",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_stormvermin",
		response = "pes_gameplay_seeing_a_stormvermin",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
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
			},
			{
				"user_context",
				"friends_close",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"last_seen_storm_vermin_commander",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_storm_vermin_commander",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_troll",
		response = "pes_gameplay_seeing_a_troll",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"chaos_troll"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				20
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
				"last_heard_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_chaos_troll",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_seeing_a_ungor_archer",
		response = "pes_gameplay_seeing_a_ungor_archer",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"beastmen_ungor_archer"
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
				"last_seen_ungor_archer",
				OP.TIMEDIFF,
				OP.GT,
				40
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_ungor_archer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_self_heal",
		response = "pes_gameplay_self_heal",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heal_start"
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
				"last_healed_someone",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"last_healed_someone",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_special_enemy_kill_melee",
		response = "pes_gameplay_special_enemy_kill_melee",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"hit_zone",
				OP.EQ,
				"head"
			},
			{
				"query_context",
				"weapon_slot",
				OP.EQ,
				"slot_melee"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_last_special_kill_melee",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_special_kill_melee",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_special_enemy_kill_ranged",
		response = "pes_gameplay_special_enemy_kill_ranged",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killed_enemy"
			},
			{
				"query_context",
				"hit_zone",
				OP.EQ,
				"head"
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
			},
			{
				"faction_memory",
				"time_since_last_special_kill_ranged",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_special_kill_ranged",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_ammo",
		response = "pes_gameplay_spots_ammo",
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
				"ammo"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"global_context",
				"current_level",
				OP.NEQ,
				"inn_level"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_bomb",
		response = "pes_gameplay_spots_bomb",
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
				"bomb"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_health",
		response = "pes_gameplay_spots_health",
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
				"health"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_spots_potion",
		response = "pes_gameplay_spots_potion",
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
				"potion"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"query_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"query_context",
				"distance",
				OP.GT,
				1
			},
			{
				"query_context",
				"distance",
				OP.LT,
				17
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				240
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_standard_bearer_buff_active",
		response = "pes_gameplay_standard_bearer_buff_active",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"standard_bearer_buff_active"
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
				"time_since_standard_bearer_buff_active",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_standard_bearer_buff_active",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_standard_bearer_buff_deactivated",
		response = "pes_gameplay_standard_bearer_buff_deactivated",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"standard_bearer_buff_deactivated"
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
				"time_since_standard_bearer_buff_deactivated",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_standard_bearer_buff_deactivated",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_standard_bearer_has_planted_standard",
		response = "pes_gameplay_standard_bearer_has_planted_standard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"has_planted_standard"
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
				"time_since_beastmen_standard_planted",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_beastmen_standard_planted",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_standard_bearer_has_planted_standard_crater",
		response = "pes_gameplay_standard_bearer_has_planted_standard_crater",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"has_planted_standard_crater"
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
				"time_since_beastmen_standard_planted_crater",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_beastmen_standard_planted_crater",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_taking_heavy_damage",
		response = "pes_gameplay_taking_heavy_damage",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"health_trigger"
			},
			{
				"query_context",
				"trigger_type",
				OP.EQ,
				"losing_rapidly"
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
				"time_since_taking_heavy_damage",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_taking_heavy_damage",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_tension_no_enemies",
		response = "pes_gameplay_tension_no_enemies",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemies_distant"
			},
			{
				"query_context",
				"num_units",
				OP.LT,
				5
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				300
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				90
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				900
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_throwing_bomb",
		response = "pes_gameplay_throwing_bomb",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"throwing_item"
			},
			{
				"query_context",
				"item_type",
				OP.EQ,
				"grenade"
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
				"time_since_throwing_bomb",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_throwing_bomb",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_using_potion",
		response = "pes_gameplay_using_potion",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_healing_draught"
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
				"time_since_used_potion",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_used_potion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_weapon_flair_defensive",
		response = "pes_gameplay_weapon_flair_defensive",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"weapon_flair_defensive"
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
				"time_since_stance_triggered",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_weapon_flair_offensive",
		response = "pes_gameplay_weapon_flair_offensive",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"weapon_flair_offensive"
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
				"time_since_stance_triggered",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_stance_triggered",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_gameplay_witch_hunter_being_helped_up",
		name = "pes_gameplay_witch_hunter_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
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
		name = "pes_gameplay_witch_hunter_dead",
		response = "pes_gameplay_witch_hunter_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
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
				"time_since_pwh_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pwh_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_eaten",
		response = "pes_gameplay_witch_hunter_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
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
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_grabbed",
		response = "pes_gameplay_witch_hunter_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_low_on_health",
		response = "pes_gameplay_witch_hunter_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwh_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_low_health_pwh",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pwh",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_witch_hunter_on_a_frenzy",
		response = "pes_gameplay_witch_hunter_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
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
				"time_since_last_frenzy_witch_hunter",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_witch_hunter",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_gameplay_wood_elf_being_helped_up",
		name = "pes_gameplay_wood_elf_being_helped_up",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"start_revive"
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
		name = "pes_gameplay_wood_elf_dead",
		response = "pes_gameplay_wood_elf_dead",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
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
				"time_since_pwe_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pwe_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_eaten",
		response = "pes_gameplay_wood_elf_eaten",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"attack_tag",
				OP.EQ,
				"chaos_spawn_eating"
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
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_eaten",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_grabbed",
		response = "pes_gameplay_wood_elf_grabbed",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"times_since_we_grabbed",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"times_since_we_grabbed",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_low_on_health",
		response = "pes_gameplay_wood_elf_low_on_health",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name",
				OP.EQ,
				"pwe_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"time_since_low_health_pwe",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pwe",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_gameplay_wood_elf_on_a_frenzy",
		response = "pes_gameplay_wood_elf_on_a_frenzy",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"multikill"
			},
			{
				"query_context",
				"number_of_kills",
				OP.EQ,
				7
			},
			{
				"query_context",
				"profile_name",
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
				"time_since_last_frenzy_wood_elf",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_wood_elf",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pes_last_hero_standing",
		name = "pes_last_hero_standing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"last_hero_standing"
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
		name = "pes_objective_achieved_all_but_one_goal",
		response = "pes_objective_achieved_all_but_one_goal",
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
				"objective_achieved_all_but_one_goal"
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
				"time_since_objective_achieved_all_but_one_goal_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_achieved_all_but_one_goal_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_across",
		response = "pes_objective_correct_path_across",
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
				"this_way_correct_path_across"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_correct_path_across",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_across",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_alley",
		response = "pes_objective_correct_path_alley",
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
				"this_way_correct_path_alley"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_correct_path_alley",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_alley",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_bridge",
		response = "pes_objective_correct_path_bridge",
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
				"this_way_bridge"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_bridge",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_bridge",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_door",
		response = "pes_objective_correct_path_door",
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
				"this_way_door"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_door",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_door",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_down",
		response = "pes_objective_correct_path_down",
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
				"this_way_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_down",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_ladder_down",
		response = "pes_objective_correct_path_ladder_down",
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
				"this_way_correct_path_ladder_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
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
				"faction_memory",
				"time_since_correct_path_ladder_down",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_ladder_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_ladder_up",
		response = "pes_objective_correct_path_ladder_up",
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
				"this_way_correct_path_ladder_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
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
				"faction_memory",
				"time_since_correct_path_ladder_up",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_correct_path_ladder_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_stairs_down",
		response = "pes_objective_correct_path_stairs_down",
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
				"this_way_stairs_down"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
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
				"faction_memory",
				"time_since_found_way_stairs_down",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_stairs_down",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_stairs_up",
		response = "pes_objective_correct_path_stairs_up",
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
				"this_way_stairs_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
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
				"user_context",
				"friends_distant",
				OP.GTEQ,
				1
			},
			{
				"faction_memory",
				"time_since_found_way_stairs_up",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_stairs_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_street",
		response = "pes_objective_correct_path_street",
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
				"this_way_street"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_street",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_street",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_this_way",
		response = "pes_objective_correct_path_this_way",
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
				"this_way"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_correct_path_up",
		response = "pes_objective_correct_path_up",
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
				"this_way_up"
			},
			{
				"query_context",
				"distance",
				OP.LTEQ,
				15
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
				"time_since_found_way_up",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found_way_up",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_goal_achieved_escape",
		response = "pes_objective_goal_achieved_escape",
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
				"objective_goal_achieved_escape"
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
				"time_since_objective_goal_achieved_escape_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_goal_achieved_escape_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_goal_achieved_more_left",
		response = "pes_objective_goal_achieved_more_left",
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
				"objective_goal_achieved_more_left"
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
				"time_since_objective_goal_achieved_more_left_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_goal_achieved_more_left_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_interacting_with_objective",
		response = "pes_objective_interacting_with_objective",
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
				"objective_interacting_with_objective"
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
				"time_since_objective_interacting_with_objective_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_interacting_with_objective_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_objective_nearing_objective_deadline",
		response = "pes_objective_nearing_objective_deadline",
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
				"objective_nearing_objective_deadline"
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
				"time_since_objective_nearing_objective_deadline_done",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_objective_nearing_objective_deadline_done",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pes_targeted_by_ratling",
		response = "pes_targeted_by_ratling",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ratling_target"
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
				"time_since_ratling_target",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ratling_target",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		pes_activate_ability_grail_knight = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "activate_ability",
			dialogue_animations_n = 8,
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_activate_ability_grail_knight_08",
				"pes_activate_ability_grail_knight_01",
				"pes_activate_ability_grail_knight_02",
				"pes_activate_ability_grail_knight_03",
				"pes_activate_ability_grail_knight_04",
				"pes_activate_ability_grail_knight_05",
				"pes_activate_ability_grail_knight_06",
				"pes_activate_ability_grail_knight_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_activate_ability_grail_knight_08",
				"pes_activate_ability_grail_knight_01",
				"pes_activate_ability_grail_knight_02",
				"pes_activate_ability_grail_knight_03",
				"pes_activate_ability_grail_knight_04",
				"pes_activate_ability_grail_knight_05",
				"pes_activate_ability_grail_knight_06",
				"pes_activate_ability_grail_knight_07"
			},
			sound_events_duration = {
				0.94466668367386,
				0.96162497997284,
				1.1160833835602,
				1.2789583206177,
				1.3204791545868,
				1.78806245327,
				1.8778749704361,
				1.2822707891464
			}
		},
		pes_activate_ability_huntsman = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "activate_ability",
			dialogue_animations_n = 12,
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_activate_ability_huntsman_01",
				"pes_activate_ability_huntsman_02",
				"pes_activate_ability_huntsman_03",
				"pes_activate_ability_huntsman_04",
				"pes_activate_ability_huntsman_05",
				"pes_activate_ability_huntsman_06",
				"pes_activate_ability_huntsman_07",
				"pes_activate_ability_huntsman_08",
				"pes_activate_ability_huntsman_09",
				"pes_activate_ability_huntsman_10",
				"pes_activate_ability_huntsman_11",
				"pes_activate_ability_huntsman_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_activate_ability_huntsman_01",
				"pes_activate_ability_huntsman_02",
				"pes_activate_ability_huntsman_03",
				"pes_activate_ability_huntsman_04",
				"pes_activate_ability_huntsman_05",
				"pes_activate_ability_huntsman_06",
				"pes_activate_ability_huntsman_07",
				"pes_activate_ability_huntsman_08",
				"pes_activate_ability_huntsman_09",
				"pes_activate_ability_huntsman_10",
				"pes_activate_ability_huntsman_11",
				"pes_activate_ability_huntsman_12"
			},
			sound_events_duration = {
				3.4831666946411,
				2.8919792175293,
				2.3422501087189,
				2.9697291851044,
				2.1768958568573,
				3.663583278656,
				2.0214791297913,
				3.0589165687561,
				2.4418542385101,
				2.4608125686645,
				2.9036042690277,
				3.18004155159
			}
		},
		pes_activate_ability_knight = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "activate_ability",
			dialogue_animations_n = 12,
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_activate_ability_knight_01",
				"pes_activate_ability_knight_02",
				"pes_activate_ability_knight_03",
				"pes_activate_ability_knight_04",
				"pes_activate_ability_knight_05",
				"pes_activate_ability_knight_06",
				"pes_activate_ability_knight_07",
				"pes_activate_ability_knight_08",
				"pes_activate_ability_knight_09",
				"pes_activate_ability_knight_10",
				"pes_activate_ability_knight_11",
				"pes_activate_ability_knight_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_activate_ability_knight_01",
				"pes_activate_ability_knight_02",
				"pes_activate_ability_knight_03",
				"pes_activate_ability_knight_04",
				"pes_activate_ability_knight_05",
				"pes_activate_ability_knight_06",
				"pes_activate_ability_knight_07",
				"pes_activate_ability_knight_08",
				"pes_activate_ability_knight_09",
				"pes_activate_ability_knight_10",
				"pes_activate_ability_knight_11",
				"pes_activate_ability_knight_12"
			},
			sound_events_duration = {
				1.9961667060852,
				2.4541249275208,
				1.118083357811,
				1.5277500152588,
				1.3519166707993,
				1.6802916526794,
				3.6310625076294,
				1.7254375219345,
				2.9519374370575,
				3.6905000209808,
				2.5241665840149,
				2.1462082862854
			}
		},
		pes_activate_ability_mercenary = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "empire_soldier_honduras",
			sound_events_n = 15,
			category = "activate_ability",
			dialogue_animations_n = 15,
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_activate_ability_mercenary_01",
				"pes_activate_ability_mercenary_02",
				"pes_activate_ability_mercenary_04",
				"pes_activate_ability_mercenary_05",
				"pes_activate_ability_mercenary_06",
				"pes_activate_ability_mercenary_07",
				"pes_activate_ability_mercenary_08",
				"pes_activate_ability_mercenary_09",
				"pes_activate_ability_mercenary_10",
				"pes_activate_ability_mercenary_11",
				"pes_activate_ability_mercenary_12",
				"pes_activate_ability_mercenary_13",
				"pes_activate_ability_mercenary_14",
				"pes_activate_ability_mercenary_15",
				"pes_activate_ability_mercenary_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_activate_ability_mercenary_01",
				"pes_activate_ability_mercenary_02",
				"pes_activate_ability_mercenary_04",
				"pes_activate_ability_mercenary_05",
				"pes_activate_ability_mercenary_06",
				"pes_activate_ability_mercenary_07",
				"pes_activate_ability_mercenary_08",
				"pes_activate_ability_mercenary_09",
				"pes_activate_ability_mercenary_10",
				"pes_activate_ability_mercenary_11",
				"pes_activate_ability_mercenary_12",
				"pes_activate_ability_mercenary_13",
				"pes_activate_ability_mercenary_14",
				"pes_activate_ability_mercenary_15",
				"pes_activate_ability_mercenary_16"
			},
			sound_events_duration = {
				6.9235625267029,
				4.1105833053589,
				5.1145000457764,
				4.2063331604004,
				5.0917916297913,
				4.7221665382385,
				4.2292914390564,
				4.079062461853,
				3.319000005722,
				2.9270625114441,
				3.8017292022705,
				1.2831041812897,
				1.4261041879654,
				1.1333541870117,
				1.9232292175293
			}
		},
		pes_curse = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "casual_talk",
			dialogue_animations_n = 12,
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
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_curse_01",
				"pes_curse_02",
				"pes_curse_03",
				"pes_curse_04",
				"pes_curse_05",
				"pes_curse_06",
				"pes_curse_07",
				"pes_curse_08",
				"pes_curse_09",
				"pes_curse_10",
				"pes_curse_11",
				"pes_curse_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_curse_01",
				"pes_curse_02",
				"pes_curse_03",
				"pes_curse_04",
				"pes_curse_05",
				"pes_curse_06",
				"pes_curse_07",
				"pes_curse_08",
				"pes_curse_09",
				"pes_curse_10",
				"pes_curse_11",
				"pes_curse_12"
			},
			sound_events_duration = {
				1.2617499828339,
				2.0743124485016,
				1.6797292232513,
				1.1849999427795,
				0.94533336162567,
				1.4531667232513,
				0.77787500619888,
				1.3886666297913,
				1.6567916870117,
				1.5216666460037,
				0.80235415697098,
				1.8654375076294
			}
		},
		pes_curse_forced = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "mutator_special_occasion",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_curse_02",
				"pes_curse_04",
				"pes_curse_05",
				"pes_curse_07",
				"pes_curse_09",
				"pes_curse_10",
				"pes_curse_11",
				"pes_curse_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_curse_02",
				"pes_curse_04",
				"pes_curse_05",
				"pes_curse_07",
				"pes_curse_09",
				"pes_curse_10",
				"pes_curse_11",
				"pes_curse_12"
			},
			sound_events_duration = {
				2.0743124485016,
				1.1849999427795,
				0.94533336162567,
				0.77787500619888,
				1.6567916870117,
				1.5216666460037,
				0.80235415697098,
				1.8654375076294
			}
		},
		pes_gameplay_ambush_horde_spawned = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_ambush_horde_spawned_02",
				"pes_gameplay_ambush_horde_spawned_03",
				"pes_gameplay_ambush_horde_spawned_05",
				"pes_gameplay_ambush_horde_spawned_07",
				"pes_gameplay_ambush_horde_spawned_08",
				"pes_gameplay_ambush_horde_spawned_09",
				"pes_gameplay_ambush_horde_spawned_10",
				"pes_gameplay_ambush_horde_spawned_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_ambush_horde_spawned_02",
				"pes_gameplay_ambush_horde_spawned_03",
				"pes_gameplay_ambush_horde_spawned_05",
				"pes_gameplay_ambush_horde_spawned_07",
				"pes_gameplay_ambush_horde_spawned_08",
				"pes_gameplay_ambush_horde_spawned_09",
				"pes_gameplay_ambush_horde_spawned_10",
				"pes_gameplay_ambush_horde_spawned_11"
			},
			sound_events_duration = {
				0.77812498807907,
				1.0866249799728,
				0.6659791469574,
				1.795041680336,
				2.5153748989105,
				1.3851875066757,
				2.4151875972748,
				2.0396041870117
			}
		},
		pes_gameplay_armoured_enemy_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_armoured_enemy_bright_wizard_04",
				"pes_gameplay_armoured_enemy_bright_wizard_05",
				"pes_gameplay_armoured_enemy_bright_wizard_06",
				"pes_gameplay_armoured_enemy_bright_wizard_07",
				"pes_gameplay_armoured_enemy_bright_wizard_08",
				"pes_gameplay_armoured_enemy_bright_wizard_09",
				"pes_gameplay_armoured_enemy_bright_wizard_10",
				"pes_gameplay_armoured_enemy_bright_wizard_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_armoured_enemy_bright_wizard_04",
				"pes_gameplay_armoured_enemy_bright_wizard_05",
				"pes_gameplay_armoured_enemy_bright_wizard_06",
				"pes_gameplay_armoured_enemy_bright_wizard_07",
				"pes_gameplay_armoured_enemy_bright_wizard_08",
				"pes_gameplay_armoured_enemy_bright_wizard_09",
				"pes_gameplay_armoured_enemy_bright_wizard_10",
				"pes_gameplay_armoured_enemy_bright_wizard_11"
			},
			sound_events_duration = {
				2.1407291889191,
				2.1447916030884,
				3.1605000495911,
				3.1131041049957,
				2.1101040840149,
				2.8345000743866,
				2.3861458301544,
				2.6569790840149
			}
		},
		pes_gameplay_armoured_enemy_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_armoured_enemy_dwarf_04",
				"pes_gameplay_armoured_enemy_dwarf_05",
				"pes_gameplay_armoured_enemy_dwarf_06",
				"pes_gameplay_armoured_enemy_dwarf_07",
				"pes_gameplay_armoured_enemy_dwarf_08",
				"pes_gameplay_armoured_enemy_dwarf_ranger_04",
				"pes_gameplay_armoured_enemy_dwarf_ranger_05",
				"pes_gameplay_armoured_enemy_dwarf_ranger_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_armoured_enemy_dwarf_04",
				"pes_gameplay_armoured_enemy_dwarf_05",
				"pes_gameplay_armoured_enemy_dwarf_06",
				"pes_gameplay_armoured_enemy_dwarf_07",
				"pes_gameplay_armoured_enemy_dwarf_08",
				"pes_gameplay_armoured_enemy_dwarf_ranger_04",
				"pes_gameplay_armoured_enemy_dwarf_ranger_05",
				"pes_gameplay_armoured_enemy_dwarf_ranger_06"
			},
			sound_events_duration = {
				2.9894790649414,
				3.0604999065399,
				2.4258332252502,
				2.313916683197,
				2.1896250247955,
				1.8363749980927,
				2.0309166908264,
				2.112208366394
			}
		},
		pes_gameplay_armoured_enemy_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_armoured_enemy_witch_hunter_04",
				"pes_gameplay_armoured_enemy_witch_hunter_05",
				"pes_gameplay_armoured_enemy_witch_hunter_06",
				"pes_gameplay_armoured_enemy_witch_hunter_07",
				"pes_gameplay_armoured_enemy_witch_hunter_08",
				"pes_gameplay_armoured_enemy_witch_hunter_09",
				"pes_gameplay_armoured_enemy_witch_hunter_10",
				"pes_gameplay_armoured_enemy_witch_hunter_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_armoured_enemy_witch_hunter_04",
				"pes_gameplay_armoured_enemy_witch_hunter_05",
				"pes_gameplay_armoured_enemy_witch_hunter_06",
				"pes_gameplay_armoured_enemy_witch_hunter_07",
				"pes_gameplay_armoured_enemy_witch_hunter_08",
				"pes_gameplay_armoured_enemy_witch_hunter_09",
				"pes_gameplay_armoured_enemy_witch_hunter_10",
				"pes_gameplay_armoured_enemy_witch_hunter_11"
			},
			sound_events_duration = {
				1.4931771159172,
				2.9435937404633,
				1.6293437480927,
				2.1658124923706,
				2.3955208063126,
				2.931281208992,
				2.182114481926,
				1.9483646154404
			}
		},
		pes_gameplay_armoured_enemy_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_armoured_enemy_wood_elf_04",
				"pes_gameplay_armoured_enemy_wood_elf_05",
				"pes_gameplay_armoured_enemy_wood_elf_06",
				"pes_gameplay_armoured_enemy_wood_elf_07",
				"pes_gameplay_armoured_enemy_wood_elf_08",
				"pes_gameplay_armoured_enemy_wood_elf_09",
				"pes_gameplay_armoured_enemy_wood_elf_10",
				"pes_gameplay_armoured_enemy_wood_elf_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_armoured_enemy_wood_elf_04",
				"pes_gameplay_armoured_enemy_wood_elf_05",
				"pes_gameplay_armoured_enemy_wood_elf_06",
				"pes_gameplay_armoured_enemy_wood_elf_07",
				"pes_gameplay_armoured_enemy_wood_elf_08",
				"pes_gameplay_armoured_enemy_wood_elf_09",
				"pes_gameplay_armoured_enemy_wood_elf_10",
				"pes_gameplay_armoured_enemy_wood_elf_11"
			},
			sound_events_duration = {
				2.2260415554047,
				1.7368750572205,
				3.2526457309723,
				2.9973750114441,
				2.3644790649414,
				3.0718541145325,
				2.8150625228882,
				3.4244375228882
			}
		},
		pes_gameplay_bile_troll_before_puke = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_bile_troll_before_puke_01",
				"pes_gameplay_bile_troll_before_puke_02",
				"pes_gameplay_bile_troll_before_puke_03",
				"pes_gameplay_bile_troll_before_puke_04",
				"pes_gameplay_bile_troll_before_puke_05",
				"pes_gameplay_bile_troll_before_puke_06",
				"pes_gameplay_bile_troll_before_puke_07",
				"pes_gameplay_bile_troll_before_puke_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_bile_troll_before_puke_01",
				"pes_gameplay_bile_troll_before_puke_02",
				"pes_gameplay_bile_troll_before_puke_03",
				"pes_gameplay_bile_troll_before_puke_04",
				"pes_gameplay_bile_troll_before_puke_05",
				"pes_gameplay_bile_troll_before_puke_06",
				"pes_gameplay_bile_troll_before_puke_07",
				"pes_gameplay_bile_troll_before_puke_08"
			},
			sound_events_duration = {
				1.4017083644867,
				1.3723958730698,
				1.5541042089462,
				1.8127708435059,
				1.5573958158493,
				2.0389790534973,
				2.0966875553131,
				2.2415416240692
			}
		},
		pes_gameplay_bile_troll_incapacitaded = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_bile_troll_incapacitaded_01",
				"pes_gameplay_bile_troll_incapacitaded_02",
				"pes_gameplay_bile_troll_incapacitaded_03",
				"pes_gameplay_bile_troll_incapacitaded_04",
				"pes_gameplay_bile_troll_incapacitaded_05",
				"pes_gameplay_bile_troll_incapacitaded_06",
				"pes_gameplay_bile_troll_incapacitaded_07",
				"pes_gameplay_bile_troll_incapacitaded_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_bile_troll_incapacitaded_01",
				"pes_gameplay_bile_troll_incapacitaded_02",
				"pes_gameplay_bile_troll_incapacitaded_03",
				"pes_gameplay_bile_troll_incapacitaded_04",
				"pes_gameplay_bile_troll_incapacitaded_05",
				"pes_gameplay_bile_troll_incapacitaded_06",
				"pes_gameplay_bile_troll_incapacitaded_07",
				"pes_gameplay_bile_troll_incapacitaded_08"
			},
			sound_events_duration = {
				1.9502500295639,
				2.1260623931885,
				2.1935625076294,
				2.8361876010895,
				2.6457290649414,
				2.058354139328,
				2.8859167098999,
				3.0660208463669
			}
		},
		pes_gameplay_bright_wizard_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "player_feedback",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_bright_wizard_being_helped_up_04",
				"pes_gameplay_bright_wizard_being_helped_up_05",
				"pes_gameplay_bright_wizard_being_helped_up_06",
				"pes_gameplay_bright_wizard_being_helped_up_07",
				"pes_gameplay_bright_wizard_being_helped_up_08",
				"pes_gameplay_bright_wizard_being_helped_up_09",
				"pes_gameplay_bright_wizard_being_helped_up_10",
				"pes_gameplay_bright_wizard_being_helped_up_11",
				"pes_gameplay_bright_wizard_being_helped_up_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_bright_wizard_being_helped_up_04",
				"pes_gameplay_bright_wizard_being_helped_up_05",
				"pes_gameplay_bright_wizard_being_helped_up_06",
				"pes_gameplay_bright_wizard_being_helped_up_07",
				"pes_gameplay_bright_wizard_being_helped_up_08",
				"pes_gameplay_bright_wizard_being_helped_up_09",
				"pes_gameplay_bright_wizard_being_helped_up_10",
				"pes_gameplay_bright_wizard_being_helped_up_11",
				"pes_gameplay_bright_wizard_being_helped_up_12"
			},
			sound_events_duration = {
				1.3002083301544,
				1.4221458435059,
				1.8824167251587,
				2.1931457519531,
				2.5976667404175,
				1.8385000228882,
				2.1156666278839,
				1.9369167089462,
				1.1509791612625
			}
		},
		pes_gameplay_bright_wizard_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_bright_wizard_dead_03",
				"pes_gameplay_bright_wizard_dead_05",
				"pes_gameplay_bright_wizard_dead_06",
				"pes_gameplay_bright_wizard_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_bright_wizard_dead_03",
				"pes_gameplay_bright_wizard_dead_05",
				"pes_gameplay_bright_wizard_dead_06",
				"pes_gameplay_bright_wizard_dead_07"
			},
			sound_events_duration = {
				1.2940000295639,
				1.431479215622,
				1.8936458826065,
				1.5607708692551
			}
		},
		pes_gameplay_bright_wizard_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "player_feedback",
			dialogue_animations_n = 7,
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_bright_wizard_eaten_01",
				"pes_bright_wizard_eaten_02",
				"pes_bright_wizard_eaten_03",
				"pes_bright_wizard_eaten_04",
				"pes_bright_wizard_eaten_05",
				"pes_bright_wizard_eaten_06",
				"pes_bright_wizard_eaten_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_bright_wizard_eaten_01",
				"pes_bright_wizard_eaten_02",
				"pes_bright_wizard_eaten_03",
				"pes_bright_wizard_eaten_04",
				"pes_bright_wizard_eaten_05",
				"pes_bright_wizard_eaten_06",
				"pes_bright_wizard_eaten_07"
			},
			sound_events_duration = {
				4.0943541526794,
				4.2224998474121,
				4.1722395420074,
				3.4435000419617,
				4.9303331375122,
				4.5411043167114,
				8.7027082443237
			}
		},
		pes_gameplay_bright_wizard_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
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
				"pes_gameplay_bright_wizard_grabbed_07",
				"pes_gameplay_bright_wizard_grabbed_08",
				"pes_gameplay_bright_wizard_grabbed_09",
				"pes_gameplay_bright_wizard_grabbed_10",
				"pes_gameplay_bright_wizard_grabbed_11",
				"pes_gameplay_bright_wizard_grabbed_12",
				"pes_gameplay_bright_wizard_grabbed_13",
				"pes_gameplay_bright_wizard_grabbed_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_bright_wizard_grabbed_07",
				"pes_gameplay_bright_wizard_grabbed_08",
				"pes_gameplay_bright_wizard_grabbed_09",
				"pes_gameplay_bright_wizard_grabbed_10",
				"pes_gameplay_bright_wizard_grabbed_11",
				"pes_gameplay_bright_wizard_grabbed_12",
				"pes_gameplay_bright_wizard_grabbed_13",
				"pes_gameplay_bright_wizard_grabbed_14"
			},
			sound_events_duration = {
				2.4909791946411,
				1.7778542041779,
				1.9073125123978,
				2.132333278656,
				2.2673125267029,
				3.122750043869,
				2.2799582481384,
				1.7297187447548
			}
		},
		pes_gameplay_bright_wizard_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
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
				"pes_gameplay_bright_wizard_low_on_health_05",
				"pes_gameplay_bright_wizard_low_on_health_06",
				"pes_gameplay_bright_wizard_low_on_health_07",
				"pes_gameplay_bright_wizard_low_on_health_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_bright_wizard_low_on_health_05",
				"pes_gameplay_bright_wizard_low_on_health_06",
				"pes_gameplay_bright_wizard_low_on_health_07",
				"pes_gameplay_bright_wizard_low_on_health_08"
			},
			sound_events_duration = {
				3.1317915916443,
				1.7292499542236,
				2.1368124485016,
				2.0660624504089
			}
		},
		pes_gameplay_bright_wizard_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_bright_wizard_on_a_frenzy_02",
				"pes_gameplay_bright_wizard_on_a_frenzy_05",
				"pes_gameplay_bright_wizard_on_a_frenzy_06",
				"pes_gameplay_bright_wizard_on_a_frenzy_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_bright_wizard_on_a_frenzy_02",
				"pes_gameplay_bright_wizard_on_a_frenzy_05",
				"pes_gameplay_bright_wizard_on_a_frenzy_06",
				"pes_gameplay_bright_wizard_on_a_frenzy_07"
			},
			sound_events_duration = {
				1.0153958797455,
				3.6179790496826,
				3.5642499923706,
				2.5870833396912
			}
		},
		pes_gameplay_casual_quotes = {
			randomize_indexes_n = 0,
			face_animations_n = 29,
			database = "empire_soldier_honduras",
			sound_events_n = 29,
			category = "casual_talk",
			dialogue_animations_n = 29,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
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
				"face_contempt",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
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
				"pes_gameplay_casual_quotes_11",
				"pes_gameplay_casual_quotes_12",
				"pes_gameplay_casual_quotes_13",
				"pes_gameplay_casual_quotes_14",
				"pes_gameplay_casual_quotes_15",
				"pes_gameplay_casual_quotes_16",
				"pes_gameplay_casual_quotes_17",
				"pes_gameplay_casual_quotes_18",
				"pes_gameplay_casual_quotes_19",
				"pes_gameplay_casual_quotes_20",
				"pes_gameplay_casual_quotes_21",
				"pes_gameplay_casual_quotes_22",
				"pes_gameplay_casual_quotes_23",
				"pes_gameplay_casual_quotes_24",
				"pes_gameplay_casual_quotes_25",
				"pes_gameplay_casual_quotes_26",
				"pes_gameplay_casual_quotes_27",
				"pes_gameplay_casual_quotes_28",
				"pes_gameplay_casual_quotes_29",
				"pes_gameplay_casual_quotes_30",
				"pes_gameplay_casual_quotes_31",
				"pes_gameplay_casual_quotes_32",
				"pes_gameplay_casual_quotes_33",
				"pes_gameplay_casual_quotes_34",
				"pes_gameplay_casual_quotes_35",
				"pes_gameplay_casual_quotes_36",
				"pes_gameplay_casual_quotes_37",
				"pes_gameplay_casual_quotes_38",
				"pes_gameplay_casual_quotes_39"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_casual_quotes_11",
				"pes_gameplay_casual_quotes_12",
				"pes_gameplay_casual_quotes_13",
				"pes_gameplay_casual_quotes_14",
				"pes_gameplay_casual_quotes_15",
				"pes_gameplay_casual_quotes_16",
				"pes_gameplay_casual_quotes_17",
				"pes_gameplay_casual_quotes_18",
				"pes_gameplay_casual_quotes_19",
				"pes_gameplay_casual_quotes_20",
				"pes_gameplay_casual_quotes_21",
				"pes_gameplay_casual_quotes_22",
				"pes_gameplay_casual_quotes_23",
				"pes_gameplay_casual_quotes_24",
				"pes_gameplay_casual_quotes_25",
				"pes_gameplay_casual_quotes_26",
				"pes_gameplay_casual_quotes_27",
				"pes_gameplay_casual_quotes_28",
				"pes_gameplay_casual_quotes_29",
				"pes_gameplay_casual_quotes_30",
				"pes_gameplay_casual_quotes_31",
				"pes_gameplay_casual_quotes_32",
				"pes_gameplay_casual_quotes_33",
				"pes_gameplay_casual_quotes_34",
				"pes_gameplay_casual_quotes_35",
				"pes_gameplay_casual_quotes_36",
				"pes_gameplay_casual_quotes_37",
				"pes_gameplay_casual_quotes_38",
				"pes_gameplay_casual_quotes_39"
			},
			sound_events_duration = {
				5.407208442688,
				7.5135002136231,
				7.8430624008179,
				8.3301458358765,
				10.377062797546,
				8.6436247825623,
				6.577624797821,
				8.4105205535889,
				9.1085314750671,
				6.1174168586731,
				2.4480834007263,
				2.766104221344,
				3.0992813110352,
				3.113520860672,
				3.0552916526794,
				6.0177497863769,
				4.6808748245239,
				4.3884167671204,
				5.0256667137146,
				5.4794793128967,
				4.4850625991821,
				2.9484167098999,
				2.4502084255219,
				4.9278335571289,
				3.7029166221619,
				3.4774167537689,
				3.2907500267029,
				2.2963333129883,
				2.9701459407806
			}
		},
		pes_gameplay_chaos_wizard_leech_leeching_bardin = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "player_alerts",
			dialogue_animations_n = 7,
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_01",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_02",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_03",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_04",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_05",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_06",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_01",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_02",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_03",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_04",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_05",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_06",
				"pes_gameplay_chaos_wizard_leech_leeching_bardin_07"
			},
			sound_events_duration = {
				4.6287293434143,
				3.7953333854675,
				3.9570417404175,
				4.4899582862854,
				1.977302134037,
				1.5908958911896,
				6.1523752212524
			}
		},
		pes_gameplay_chaos_wizard_leech_leeching_keriliian = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "player_alerts",
			dialogue_animations_n = 7,
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_01",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_02",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_03",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_04",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_05",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_06",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_01",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_02",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_03",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_04",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_05",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_06",
				"pes_gameplay_chaos_wizard_leech_leeching_keriliian_07"
			},
			sound_events_duration = {
				3.9367916584015,
				3.5935416221619,
				4.1253123283386,
				4.5433750152588,
				1.6276458501816,
				1.4658958911896,
				5.859395980835
			}
		},
		pes_gameplay_chaos_wizard_leech_leeching_saltzpyre = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
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
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_01",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_02",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_03",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_04",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_05",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_01",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_02",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_03",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_04",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_05",
				"pes_gameplay_chaos_wizard_leech_leeching_saltzpyre_06"
			},
			sound_events_duration = {
				2.3715207576752,
				2.7387292385101,
				3.0899374485016,
				3.9257082939148,
				2.2114374637604,
				1.5917916297913
			}
		},
		pes_gameplay_chaos_wizard_leech_leeching_sienna = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "player_alerts",
			dialogue_animations_n = 7,
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_01",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_02",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_03",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_04",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_05",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_06",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_01",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_02",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_03",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_04",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_05",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_06",
				"pes_gameplay_chaos_wizard_leech_leeching_sienna_07"
			},
			sound_events_duration = {
				4.0015001296997,
				3.3269584178925,
				4.2745418548584,
				2.9791458249092,
				1.3307291269302,
				1.7174999713898,
				4.8152709007263
			}
		},
		pes_gameplay_dead_body = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "casual_talk",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dead_body_06",
				"pes_gameplay_dead_body_07",
				"pes_gameplay_dead_body_08",
				"pes_gameplay_dead_body_09",
				"pes_gameplay_dead_body_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_dead_body_06",
				"pes_gameplay_dead_body_07",
				"pes_gameplay_dead_body_08",
				"pes_gameplay_dead_body_09",
				"pes_gameplay_dead_body_10"
			},
			sound_events_duration = {
				2.0574374198914,
				1.4673750400543,
				2.9416875839233,
				2.5627708435059,
				2.3739583492279
			}
		},
		pes_gameplay_dead_end = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "guidance",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dead_end_02",
				"pes_gameplay_dead_end_07",
				"pes_gameplay_dead_end_08",
				"pes_gameplay_dead_end_09",
				"pes_gameplay_dead_end_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_dead_end_02",
				"pes_gameplay_dead_end_07",
				"pes_gameplay_dead_end_08",
				"pes_gameplay_dead_end_09",
				"pes_gameplay_dead_end_10"
			},
			sound_events_duration = {
				1.4166041612625,
				1.5535416603088,
				1.9623333215714,
				1.3861875534058,
				1.9203958511352
			}
		},
		pes_gameplay_dwarf_ranger_being_helped = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "player_feedback",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dwarf_ranger_being_helped_up_02",
				"pes_gameplay_dwarf_ranger_being_helped_up_04",
				"pes_gameplay_dwarf_ranger_being_helped_up_05",
				"pes_gameplay_dwarf_ranger_being_helped_up_06",
				"pes_gameplay_dwarf_ranger_being_helped_up_07",
				"pes_gameplay_dwarf_ranger_being_helped_up_08",
				"pes_gameplay_dwarf_ranger_being_helped_up_09",
				"pes_gameplay_dwarf_ranger_being_helped_up_10",
				"pes_gameplay_dwarf_ranger_being_helped_up_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_dwarf_ranger_being_helped_up_02",
				"pes_gameplay_dwarf_ranger_being_helped_up_04",
				"pes_gameplay_dwarf_ranger_being_helped_up_05",
				"pes_gameplay_dwarf_ranger_being_helped_up_06",
				"pes_gameplay_dwarf_ranger_being_helped_up_07",
				"pes_gameplay_dwarf_ranger_being_helped_up_08",
				"pes_gameplay_dwarf_ranger_being_helped_up_09",
				"pes_gameplay_dwarf_ranger_being_helped_up_10",
				"pes_gameplay_dwarf_ranger_being_helped_up_11"
			},
			sound_events_duration = {
				1.1185417175293,
				1.2692500352859,
				1.9630625247955,
				1.5223958492279,
				2.3047499656677,
				3.4669165611267,
				2.3089792728424,
				2.7057082653046,
				1.8933750391007
			}
		},
		pes_gameplay_dwarf_ranger_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dwarf_ranger_dead_04",
				"pes_gameplay_dwarf_ranger_dead_05",
				"pes_gameplay_dwarf_ranger_dead_06",
				"pes_gameplay_dwarf_ranger_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_dwarf_ranger_dead_04",
				"pes_gameplay_dwarf_ranger_dead_05",
				"pes_gameplay_dwarf_ranger_dead_06",
				"pes_gameplay_dwarf_ranger_dead_07"
			},
			sound_events_duration = {
				1.3528333902359,
				1.582791686058,
				2.7328958511352,
				1.2981041669846
			}
		},
		pes_gameplay_dwarf_ranger_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "player_feedback",
			dialogue_animations_n = 6,
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
				"pes_dwarf_ranger_eaten_01",
				"pes_dwarf_ranger_eaten_02",
				"pes_dwarf_ranger_eaten_03",
				"pes_dwarf_ranger_eaten_04",
				"pes_dwarf_ranger_eaten_05",
				"pes_dwarf_ranger_eaten_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_dwarf_ranger_eaten_01",
				"pes_dwarf_ranger_eaten_02",
				"pes_dwarf_ranger_eaten_03",
				"pes_dwarf_ranger_eaten_04",
				"pes_dwarf_ranger_eaten_05",
				"pes_dwarf_ranger_eaten_06"
			},
			sound_events_duration = {
				4.260187625885,
				4.683479309082,
				5.487208366394,
				4.6671457290649,
				3.7868541479111,
				5.2311248779297
			}
		},
		pes_gameplay_dwarf_ranger_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			sound_events_n = 10,
			category = "player_alerts",
			dialogue_animations_n = 10,
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
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_07",
				"pes_gameplay_dwarf_ranger_grabbed_08",
				"pes_gameplay_dwarf_ranger_grabbed_09",
				"pes_gameplay_dwarf_ranger_grabbed_10",
				"pes_gameplay_dwarf_ranger_grabbed_11",
				"pes_gameplay_dwarf_ranger_grabbed_12",
				"pes_gameplay_dwarf_ranger_grabbed_13",
				"pes_gameplay_dwarf_ranger_grabbed_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_07",
				"pes_gameplay_dwarf_ranger_grabbed_08",
				"pes_gameplay_dwarf_ranger_grabbed_09",
				"pes_gameplay_dwarf_ranger_grabbed_10",
				"pes_gameplay_dwarf_ranger_grabbed_11",
				"pes_gameplay_dwarf_ranger_grabbed_12",
				"pes_gameplay_dwarf_ranger_grabbed_13",
				"pes_gameplay_dwarf_ranger_grabbed_14"
			},
			sound_events_duration = {
				2.2966041564941,
				3.1192290782928,
				1.8975207805634,
				2.4263958930969,
				3.203583240509,
				2.3882915973663,
				3.9129374027252,
				3.6676249504089,
				2.5434999465942,
				1.7259374856949
			}
		},
		pes_gameplay_dwarf_ranger_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
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
				"pes_gameplay_dwarf_ranger_low_on_health_05",
				"pes_gameplay_dwarf_ranger_low_on_health_06",
				"pes_gameplay_dwarf_ranger_low_on_health_07",
				"pes_gameplay_dwarf_ranger_low_on_health_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_dwarf_ranger_low_on_health_05",
				"pes_gameplay_dwarf_ranger_low_on_health_06",
				"pes_gameplay_dwarf_ranger_low_on_health_07",
				"pes_gameplay_dwarf_ranger_low_on_health_08"
			},
			sound_events_duration = {
				2.5209999084473,
				2.1845834255219,
				2.240770816803,
				1.6283333301544
			}
		},
		pes_gameplay_dwarf_ranger_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pes_gameplay_dwarf_ranger_on_a_frenzy_08"
			},
			sound_events_duration = {
				2.79161465168,
				3.3894791603088,
				2.8754167556763,
				3.1515624523163
			}
		},
		pes_gameplay_encouraging_words = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "casual_talk",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_encouraging_words_07",
				"pes_gameplay_encouraging_words_08",
				"pes_gameplay_encouraging_words_09",
				"pes_gameplay_encouraging_words_10",
				"pes_gameplay_encouraging_words_11",
				"pes_gameplay_encouraging_words_12",
				"pes_gameplay_encouraging_words_13",
				"pes_gameplay_encouraging_words_14",
				"pes_gameplay_encouraging_words_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_encouraging_words_07",
				"pes_gameplay_encouraging_words_08",
				"pes_gameplay_encouraging_words_09",
				"pes_gameplay_encouraging_words_10",
				"pes_gameplay_encouraging_words_11",
				"pes_gameplay_encouraging_words_12",
				"pes_gameplay_encouraging_words_13",
				"pes_gameplay_encouraging_words_14",
				"pes_gameplay_encouraging_words_15"
			},
			sound_events_duration = {
				2.9073750972748,
				1.8201874494553,
				1.6032708883286,
				2.4839999675751,
				2.9246040582657,
				3.4016666412353,
				1.8115000724793,
				3.2144792079926,
				2.2105000019074
			}
		},
		pes_gameplay_friendly_fire_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_bright_wizard_05",
				"pes_gameplay_friendly_fire_bright_wizard_06",
				"pes_gameplay_friendly_fire_bright_wizard_07",
				"pes_gameplay_friendly_fire_bright_wizard_08",
				"pes_gameplay_friendly_fire_bright_wizard_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_friendly_fire_bright_wizard_05",
				"pes_gameplay_friendly_fire_bright_wizard_06",
				"pes_gameplay_friendly_fire_bright_wizard_07",
				"pes_gameplay_friendly_fire_bright_wizard_08",
				"pes_gameplay_friendly_fire_bright_wizard_09"
			},
			sound_events_duration = {
				1.9725416898727,
				2.5274999141693,
				1.6631875038147,
				1.7563333511352,
				3.0621042251587
			}
		},
		pes_gameplay_friendly_fire_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_dwarf_ranger_01",
				"pes_gameplay_friendly_fire_dwarf_ranger_02",
				"pes_gameplay_friendly_fire_dwarf_ranger_03",
				"pes_gameplay_friendly_fire_dwarf_ranger_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_friendly_fire_dwarf_ranger_01",
				"pes_gameplay_friendly_fire_dwarf_ranger_02",
				"pes_gameplay_friendly_fire_dwarf_ranger_03",
				"pes_gameplay_friendly_fire_dwarf_ranger_04"
			},
			sound_events_duration = {
				1.2092916965485,
				2.9716458320618,
				2.2016041278839,
				1.0587916374207
			}
		},
		pes_gameplay_friendly_fire_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_witch_hunter_05",
				"pes_gameplay_friendly_fire_witch_hunter_06",
				"pes_gameplay_friendly_fire_witch_hunter_07",
				"pes_gameplay_friendly_fire_witch_hunter_08",
				"pes_gameplay_friendly_fire_witch_hunter_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_friendly_fire_witch_hunter_05",
				"pes_gameplay_friendly_fire_witch_hunter_06",
				"pes_gameplay_friendly_fire_witch_hunter_07",
				"pes_gameplay_friendly_fire_witch_hunter_08",
				"pes_gameplay_friendly_fire_witch_hunter_13"
			},
			sound_events_duration = {
				1.7199374437332,
				3.1616251468658,
				1.6965520977974,
				2.4497812986374,
				2.8824895620346
			}
		},
		pes_gameplay_friendly_fire_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "player_feedback",
			dialogue_animations_n = 6,
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_friendly_fire_wood_elf_03",
				"pes_gameplay_friendly_fire_wood_elf_05",
				"pes_gameplay_friendly_fire_wood_elf_06",
				"pes_gameplay_friendly_fire_wood_elf_07",
				"pes_gameplay_friendly_fire_wood_elf_08",
				"pes_gameplay_friendly_fire_wood_elf_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_friendly_fire_wood_elf_03",
				"pes_gameplay_friendly_fire_wood_elf_05",
				"pes_gameplay_friendly_fire_wood_elf_06",
				"pes_gameplay_friendly_fire_wood_elf_07",
				"pes_gameplay_friendly_fire_wood_elf_08",
				"pes_gameplay_friendly_fire_wood_elf_09"
			},
			sound_events_duration = {
				1.4158124923706,
				2.3131041526794,
				1.8877708911896,
				5.7091250419617,
				2.1494166851044,
				4.8829998970032
			}
		},
		pes_gameplay_globadier_guck = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_globadier_guck_01",
				"pes_gameplay_globadier_guck_02",
				"pes_gameplay_globadier_guck_07",
				"pes_gameplay_globadier_guck_08",
				"pes_gameplay_globadier_guck_09",
				"pes_gameplay_globadier_guck_10",
				"pes_gameplay_globadier_guck_11",
				"pes_gameplay_globadier_guck_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_globadier_guck_01",
				"pes_gameplay_globadier_guck_02",
				"pes_gameplay_globadier_guck_07",
				"pes_gameplay_globadier_guck_08",
				"pes_gameplay_globadier_guck_09",
				"pes_gameplay_globadier_guck_10",
				"pes_gameplay_globadier_guck_11",
				"pes_gameplay_globadier_guck_12"
			},
			sound_events_duration = {
				0.83012497425079,
				0.90572917461395,
				1.7839374542236,
				2.1928124427795,
				1.6194791793823,
				1.7455416917801,
				1.7194374799728,
				2.0680000782013
			}
		},
		pes_gameplay_healing_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
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
			localization_strings = {
				"pes_gameplay_healing_bright_wizard_04",
				"pes_gameplay_healing_bright_wizard_05",
				"pes_gameplay_healing_bright_wizard_06",
				"pes_gameplay_healing_bright_wizard_07",
				"pes_gameplay_healing_bright_wizard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_healing_bright_wizard_04",
				"pes_gameplay_healing_bright_wizard_05",
				"pes_gameplay_healing_bright_wizard_06",
				"pes_gameplay_healing_bright_wizard_07",
				"pes_gameplay_healing_bright_wizard_08"
			},
			sound_events_duration = {
				1.4577499628067,
				2.1049375534058,
				2.218291759491,
				2.6545832157135,
				4.4468955993652
			}
		},
		pes_gameplay_healing_draught = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			sound_events_n = 10,
			category = "seen_items",
			dialogue_animations_n = 10,
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
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_09",
				"pes_gameplay_healing_draught_10",
				"pes_gameplay_healing_draught_11",
				"pes_gameplay_healing_draught_12",
				"pes_gameplay_healing_draught_13",
				"pes_gameplay_healing_draught_14",
				"pes_gameplay_healing_draught_15",
				"pes_gameplay_healing_draught_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_09",
				"pes_gameplay_healing_draught_10",
				"pes_gameplay_healing_draught_11",
				"pes_gameplay_healing_draught_12",
				"pes_gameplay_healing_draught_13",
				"pes_gameplay_healing_draught_14",
				"pes_gameplay_healing_draught_15",
				"pes_gameplay_healing_draught_16"
			},
			sound_events_duration = {
				1.1509791612625,
				1.4188749790192,
				1.4321041107178,
				2.8939166069031,
				2.801020860672,
				1.7520833015442,
				1.7342499494553,
				1.332291662693,
				2.0410000085831,
				1.5239374637604
			}
		},
		pes_gameplay_healing_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
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
			localization_strings = {
				"pes_gameplay_healing_dwarf_ranger_03",
				"pes_gameplay_healing_dwarf_ranger_04",
				"pes_gameplay_healing_dwarf_ranger_05",
				"pes_gameplay_healing_dwarf_ranger_06",
				"pes_gameplay_healing_dwarf_ranger_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_healing_dwarf_ranger_03",
				"pes_gameplay_healing_dwarf_ranger_04",
				"pes_gameplay_healing_dwarf_ranger_05",
				"pes_gameplay_healing_dwarf_ranger_06",
				"pes_gameplay_healing_dwarf_ranger_08"
			},
			sound_events_duration = {
				1.6958333253861,
				1.7903333902359,
				2.2813541889191,
				2.7509999275208,
				3.4129374027252
			}
		},
		pes_gameplay_healing_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_healing_witch_hunter_01",
				"pes_gameplay_healing_witch_hunter_02",
				"pes_gameplay_healing_witch_hunter_03",
				"pes_gameplay_healing_witch_hunter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_healing_witch_hunter_01",
				"pes_gameplay_healing_witch_hunter_02",
				"pes_gameplay_healing_witch_hunter_03",
				"pes_gameplay_healing_witch_hunter_04"
			},
			sound_events_duration = {
				1.4707812070847,
				1.3158228993416,
				1.2450729012489,
				1.5641041994095
			}
		},
		pes_gameplay_healing_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_healing_wood_elf_01",
				"pes_gameplay_healing_wood_elf_02",
				"pes_gameplay_healing_wood_elf_03",
				"pes_gameplay_healing_wood_elf_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_healing_wood_elf_01",
				"pes_gameplay_healing_wood_elf_02",
				"pes_gameplay_healing_wood_elf_03",
				"pes_gameplay_healing_wood_elf_04"
			},
			sound_events_duration = {
				1.6994166374207,
				1.4035625457764,
				1.4770624637604,
				1.6429582834244
			}
		},
		pes_gameplay_heard_bright_wizard_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pes_gameplay_heard_bright_wizard_in_trouble_05",
				"pes_gameplay_heard_bright_wizard_in_trouble_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_05",
				"pes_gameplay_heard_bright_wizard_in_trouble_06"
			},
			sound_events_duration = {
				0.92252081632614,
				1.6449791193008,
				1.525229215622,
				1.156729221344
			}
		},
		pes_gameplay_heard_dwarf_ranger_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_alerts",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_09"
			},
			sound_events_duration = {
				1.9193333387375,
				1.1840000152588,
				1.7017707824707,
				1.3398333787918,
				1.4905833005905
			}
		},
		pes_gameplay_heard_witch_hunter_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pes_gameplay_heard_witch_hunter_in_trouble_05",
				"pes_gameplay_heard_witch_hunter_in_trouble_06",
				"pes_gameplay_heard_witch_hunter_in_trouble_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_05",
				"pes_gameplay_heard_witch_hunter_in_trouble_06",
				"pes_gameplay_heard_witch_hunter_in_trouble_07"
			},
			sound_events_duration = {
				1.1610833108425,
				1.4362083077431,
				1.1228958368301,
				1.9436354041099
			}
		},
		pes_gameplay_heard_wood_elf_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
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
				"pes_gameplay_heard_wood_elf_in_trouble_04",
				"pes_gameplay_heard_wood_elf_in_trouble_05",
				"pes_gameplay_heard_wood_elf_in_trouble_06",
				"pes_gameplay_heard_wood_elf_in_trouble_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_heard_wood_elf_in_trouble_04",
				"pes_gameplay_heard_wood_elf_in_trouble_05",
				"pes_gameplay_heard_wood_elf_in_trouble_06",
				"pes_gameplay_heard_wood_elf_in_trouble_07"
			},
			sound_events_duration = {
				1.3036667108536,
				1.644770860672,
				1.9461666345596,
				2.5126874446869
			}
		},
		pes_gameplay_hearing_a_Skaven_warpfire_thrower = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
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
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			sound_events_duration = {
				2.5845415592194,
				4.754979133606,
				2.586874961853,
				3.0988750457764,
				1.8821666240692,
				1.3387916088104
			}
		},
		pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
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
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pes_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			sound_events_duration = {
				0.92299997806549,
				1.010645866394,
				1.2624167203903,
				2.3858124017715,
				2.1128125190735,
				1.5776666402817
			}
		},
		pes_gameplay_hearing_a_chaos_spawn = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_chaos_spawn_01",
				"pes_gameplay_hearing_a_chaos_spawn_02",
				"pes_gameplay_hearing_a_chaos_spawn_03",
				"pes_gameplay_hearing_a_chaos_spawn_04",
				"pes_gameplay_hearing_a_chaos_spawn_05",
				"pes_gameplay_hearing_a_chaos_spawn_06",
				"pes_gameplay_hearing_a_chaos_spawn_07",
				"pes_gameplay_hearing_a_chaos_spawn_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_spawn_01",
				"pes_gameplay_hearing_a_chaos_spawn_02",
				"pes_gameplay_hearing_a_chaos_spawn_03",
				"pes_gameplay_hearing_a_chaos_spawn_04",
				"pes_gameplay_hearing_a_chaos_spawn_05",
				"pes_gameplay_hearing_a_chaos_spawn_06",
				"pes_gameplay_hearing_a_chaos_spawn_07",
				"pes_gameplay_hearing_a_chaos_spawn_08"
			},
			sound_events_duration = {
				4.2102084159851,
				5.580020904541,
				4.0981874465942,
				3.6888542175293,
				1.9125624895096,
				1.8865000009537,
				1.6497083902359,
				2.068416595459
			}
		},
		pes_gameplay_hearing_a_chaos_spawn_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_chaos_spawn_combat_01",
				"pes_gameplay_hearing_a_chaos_spawn_combat_02",
				"pes_gameplay_hearing_a_chaos_spawn_combat_03",
				"pes_gameplay_hearing_a_chaos_spawn_combat_04",
				"pes_gameplay_hearing_a_chaos_spawn_combat_05",
				"pes_gameplay_hearing_a_chaos_spawn_combat_06",
				"pes_gameplay_hearing_a_chaos_spawn_combat_07",
				"pes_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_spawn_combat_01",
				"pes_gameplay_hearing_a_chaos_spawn_combat_02",
				"pes_gameplay_hearing_a_chaos_spawn_combat_03",
				"pes_gameplay_hearing_a_chaos_spawn_combat_04",
				"pes_gameplay_hearing_a_chaos_spawn_combat_05",
				"pes_gameplay_hearing_a_chaos_spawn_combat_06",
				"pes_gameplay_hearing_a_chaos_spawn_combat_07",
				"pes_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			sound_events_duration = {
				1.3194583654404,
				0.90866667032242,
				1.4846667051315,
				1.168729186058,
				1.5741875171661,
				1.4272708892822,
				1.423187494278,
				2.8595833778381
			}
		},
		pes_gameplay_hearing_a_chaos_warrior_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_chaos_warrior_combat_01",
				"pes_gameplay_hearing_a_chaos_warrior_combat_02",
				"pes_gameplay_hearing_a_chaos_warrior_combat_03",
				"pes_gameplay_hearing_a_chaos_warrior_combat_04",
				"pes_gameplay_hearing_a_chaos_warrior_combat_05",
				"pes_gameplay_hearing_a_chaos_warrior_combat_06",
				"pes_gameplay_hearing_a_chaos_warrior_combat_07",
				"pes_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_warrior_combat_01",
				"pes_gameplay_hearing_a_chaos_warrior_combat_02",
				"pes_gameplay_hearing_a_chaos_warrior_combat_03",
				"pes_gameplay_hearing_a_chaos_warrior_combat_04",
				"pes_gameplay_hearing_a_chaos_warrior_combat_05",
				"pes_gameplay_hearing_a_chaos_warrior_combat_06",
				"pes_gameplay_hearing_a_chaos_warrior_combat_07",
				"pes_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			sound_events_duration = {
				1.1238541603088,
				0.93924999237061,
				1.6641666889191,
				2.3556666374206,
				2.0205729603767,
				1.5402708053589,
				1.5673542022705,
				2.2484583854675
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_leech = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_chaos_wizard_leech_01",
				"pes_gameplay_hearing_a_chaos_wizard_leech_02",
				"pes_gameplay_hearing_a_chaos_wizard_leech_03",
				"pes_gameplay_hearing_a_chaos_wizard_leech_04",
				"pes_gameplay_seeing_a_chaos_wizard_leech_07",
				"pes_gameplay_seeing_a_chaos_wizard_leech_08",
				"pes_gameplay_seeing_a_chaos_wizard_leech_09",
				"pes_gameplay_seeing_a_chaos_wizard_leech_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_leech_01",
				"pes_gameplay_hearing_a_chaos_wizard_leech_02",
				"pes_gameplay_hearing_a_chaos_wizard_leech_03",
				"pes_gameplay_hearing_a_chaos_wizard_leech_04",
				"pes_gameplay_seeing_a_chaos_wizard_leech_07",
				"pes_gameplay_seeing_a_chaos_wizard_leech_08",
				"pes_gameplay_seeing_a_chaos_wizard_leech_09",
				"pes_gameplay_seeing_a_chaos_wizard_leech_10"
			},
			sound_events_duration = {
				3.161468744278,
				2.608416557312,
				2.0324583053589,
				3.1651666164398,
				1.2311874628067,
				1.6204166412354,
				0.77110415697098,
				1.1091874837875
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_chaos_wizard_plague_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_plague_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			sound_events_duration = {
				4.1688749790192,
				4.4007081985474,
				6.6871252059936,
				1.8782708644867,
				1.2085624933243,
				1.5510833263397,
				1.8734375238419,
				3.707270860672
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_plague_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			sound_events_duration = {
				1.4699167013168,
				1.893458366394,
				2.2542917728424,
				1.8599375486374,
				3.1629583835602,
				2.499062538147,
				2.5678749084473,
				2.8775625228882
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_tentacle = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			sound_events_duration = {
				2.4063124656677,
				2.429229259491,
				3.9542708396912,
				3.6744375228882,
				1.2816041707993,
				1.9255625009537,
				1.3128957748413,
				1.1866874694824
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_tentacle_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pes_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			sound_events_duration = {
				1.1859999895096,
				1.8530000448227,
				1.3426666259766,
				2.2252707481384,
				2.0570833683014,
				2.3985209465027,
				2.3434791564941,
				2.5833957195282
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_chaos_wizard_wind_01",
				"pes_gameplay_hearing_a_chaos_wizard_wind_02",
				"pes_gameplay_hearing_a_chaos_wizard_wind_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_07",
				"pes_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_01",
				"pes_gameplay_hearing_a_chaos_wizard_wind_02",
				"pes_gameplay_hearing_a_chaos_wizard_wind_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_07",
				"pes_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			sound_events_duration = {
				2.7492291927338,
				3.3764998912811,
				2.8633332252502,
				3.8016457557678,
				1.4635624885559,
				1.5411458015442,
				1.6314791440964,
				1.8511250019074
			}
		},
		pes_gameplay_hearing_a_chaos_wizard_wind_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pes_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			sound_events_duration = {
				2.6115000247955,
				2.1483957767487,
				2.7521667480469,
				2.0632083415985,
				1.2982292175293
			}
		},
		pes_gameplay_hearing_a_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_globadier_07",
				"pes_gameplay_hearing_a_globadier_08",
				"pes_gameplay_hearing_a_globadier_09",
				"pes_gameplay_hearing_a_globadier_10",
				"pes_gameplay_hearing_a_globadier_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_globadier_07",
				"pes_gameplay_hearing_a_globadier_08",
				"pes_gameplay_hearing_a_globadier_09",
				"pes_gameplay_hearing_a_globadier_10",
				"pes_gameplay_hearing_a_globadier_11"
			},
			sound_events_duration = {
				2.0779790878296,
				2.751312494278,
				2.2869374752045,
				2.447083234787,
				3.1160416603088
			}
		},
		pes_gameplay_hearing_a_globadier_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_globadier_combat_03",
				"pes_gameplay_hearing_a_globadier_combat_04",
				"pes_gameplay_hearing_a_globadier_combat_06",
				"pes_gameplay_hearing_a_globadier_combat_07",
				"pes_gameplay_hearing_a_globadier_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_globadier_combat_03",
				"pes_gameplay_hearing_a_globadier_combat_04",
				"pes_gameplay_hearing_a_globadier_combat_06",
				"pes_gameplay_hearing_a_globadier_combat_07",
				"pes_gameplay_hearing_a_globadier_combat_08"
			},
			sound_events_duration = {
				0.71872913837433,
				1.1677082777023,
				2.1322290897369,
				1.2357708215714,
				1.8441457748413
			}
		},
		pes_gameplay_hearing_a_gutter_runner = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "enemy_alerts_high",
			dialogue_animations_n = 9,
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_gutter_runner_03",
				"pes_gameplay_hearing_a_gutter_runner_07",
				"pes_gameplay_hearing_a_gutter_runner_08",
				"pes_gameplay_hearing_a_gutter_runner_09",
				"pes_gameplay_hearing_a_gutter_runner_10",
				"pes_gameplay_hearing_a_gutter_runner_11",
				"pes_gameplay_hearing_a_gutter_runner_12",
				"pes_gameplay_hearing_a_gutter_runner_13",
				"pes_gameplay_hearing_a_gutter_runner_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_gutter_runner_03",
				"pes_gameplay_hearing_a_gutter_runner_07",
				"pes_gameplay_hearing_a_gutter_runner_08",
				"pes_gameplay_hearing_a_gutter_runner_09",
				"pes_gameplay_hearing_a_gutter_runner_10",
				"pes_gameplay_hearing_a_gutter_runner_11",
				"pes_gameplay_hearing_a_gutter_runner_12",
				"pes_gameplay_hearing_a_gutter_runner_13",
				"pes_gameplay_hearing_a_gutter_runner_14"
			},
			sound_events_duration = {
				1.6357707977295,
				1.8591874837875,
				1.8933229446411,
				1.8722083568573,
				1.8619999885559,
				2.0953333377838,
				1.9997082948685,
				1.3164999485016,
				2.6667709350586
			}
		},
		pes_gameplay_hearing_a_gutter_runner_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
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
				"pes_gameplay_hearing_a_gutter_runner_combat_03",
				"pes_gameplay_hearing_a_gutter_runner_combat_04",
				"pes_gameplay_hearing_a_gutter_runner_combat_05",
				"pes_gameplay_hearing_a_gutter_runner_combat_06",
				"pes_gameplay_hearing_a_gutter_runner_combat_07",
				"pes_gameplay_hearing_a_gutter_runner_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_gutter_runner_combat_03",
				"pes_gameplay_hearing_a_gutter_runner_combat_04",
				"pes_gameplay_hearing_a_gutter_runner_combat_05",
				"pes_gameplay_hearing_a_gutter_runner_combat_06",
				"pes_gameplay_hearing_a_gutter_runner_combat_07",
				"pes_gameplay_hearing_a_gutter_runner_combat_08"
			},
			sound_events_duration = {
				0.89620834589005,
				1.0884375572205,
				1.9212083816528,
				1.8308124542236,
				1.2607916593552,
				1.8716875314713
			}
		},
		pes_gameplay_hearing_a_minotaur = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
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
				"pes_gameplay_hearing_a_minotaur_01",
				"pes_gameplay_hearing_a_minotaur_02",
				"pes_gameplay_hearing_a_minotaur_03",
				"pes_gameplay_hearing_a_minotaur_04",
				"pes_gameplay_hearing_a_minotaur_05",
				"pes_gameplay_hearing_a_minotaur_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_minotaur_01",
				"pes_gameplay_hearing_a_minotaur_02",
				"pes_gameplay_hearing_a_minotaur_03",
				"pes_gameplay_hearing_a_minotaur_04",
				"pes_gameplay_hearing_a_minotaur_05",
				"pes_gameplay_hearing_a_minotaur_06"
			},
			sound_events_duration = {
				4.199812412262,
				4.0535001754761,
				3.5983126163483,
				3.7879791259766,
				3.4111875295639,
				4.0297603607178
			}
		},
		pes_gameplay_hearing_a_pm = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "enemy_alerts",
			dialogue_animations_n = 12,
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
				"dialogue_talk"
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_pm_01",
				"pes_gameplay_hearing_a_pm_02",
				"pes_gameplay_hearing_a_pm_03",
				"pes_gameplay_hearing_a_pm_04",
				"pes_gameplay_hearing_a_plague_monk_01",
				"pes_gameplay_hearing_a_plague_monk_02",
				"pes_gameplay_hearing_a_plague_monk_03",
				"pes_gameplay_hearing_a_plague_monk_04",
				"pes_gameplay_hearing_a_plague_monk_05",
				"pes_gameplay_hearing_a_plague_monk_06",
				"pes_gameplay_hearing_a_plague_monk_07",
				"pes_gameplay_hearing_a_plague_monk_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_pm_01",
				"pes_gameplay_hearing_a_pm_02",
				"pes_gameplay_hearing_a_pm_03",
				"pes_gameplay_hearing_a_pm_04",
				"pes_gameplay_hearing_a_plague_monk_01",
				"pes_gameplay_hearing_a_plague_monk_02",
				"pes_gameplay_hearing_a_plague_monk_03",
				"pes_gameplay_hearing_a_plague_monk_04",
				"pes_gameplay_hearing_a_plague_monk_05",
				"pes_gameplay_hearing_a_plague_monk_06",
				"pes_gameplay_hearing_a_plague_monk_07",
				"pes_gameplay_hearing_a_plague_monk_08"
			},
			sound_events_duration = {
				2.0219790935516,
				2.7976875305176,
				2.7582292556763,
				2.7337501049042,
				2.1063542366028,
				4.2329168319702,
				2.8080625534058,
				2.8716666698456,
				1.2773958444595,
				1.7499582767487,
				2.4377708435059,
				1.7516458034515
			}
		},
		pes_gameplay_hearing_a_pm_in_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "enemy_alerts",
			dialogue_animations_n = 12,
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
				"dialogue_talk"
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_pm_in_combat_01",
				"pes_gameplay_hearing_a_pm_in_combat_02",
				"pes_gameplay_hearing_a_pm_in_combat_03",
				"pes_gameplay_hearing_a_pm_in_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_01",
				"pes_gameplay_hearing_a_plague_monk_combat_02",
				"pes_gameplay_hearing_a_plague_monk_combat_03",
				"pes_gameplay_hearing_a_plague_monk_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_05",
				"pes_gameplay_hearing_a_plague_monk_combat_06",
				"pes_gameplay_hearing_a_plague_monk_combat_07",
				"pes_gameplay_hearing_a_plague_monk_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_pm_in_combat_01",
				"pes_gameplay_hearing_a_pm_in_combat_02",
				"pes_gameplay_hearing_a_pm_in_combat_03",
				"pes_gameplay_hearing_a_pm_in_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_01",
				"pes_gameplay_hearing_a_plague_monk_combat_02",
				"pes_gameplay_hearing_a_plague_monk_combat_03",
				"pes_gameplay_hearing_a_plague_monk_combat_04",
				"pes_gameplay_hearing_a_plague_monk_combat_05",
				"pes_gameplay_hearing_a_plague_monk_combat_06",
				"pes_gameplay_hearing_a_plague_monk_combat_07",
				"pes_gameplay_hearing_a_plague_monk_combat_08"
			},
			sound_events_duration = {
				1.1623541116715,
				2.1133749485016,
				1.3072708845139,
				2.201354265213,
				0.86360418796539,
				0.91787499189377,
				1.2286458015442,
				1.0827292203903,
				2.2430416345596,
				1.3619166612625,
				1.6432917118073,
				2.2044167518616
			}
		},
		pes_gameplay_hearing_a_skaven_patrol_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
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
				"face_nervous",
				"face_concerned",
				"face_concerned",
				"face_nervous",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pes_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			sound_events_duration = {
				1.4509791135788,
				2.6708540916443,
				1.7882291078568,
				1.5687291622162,
				2.0784583091736,
				2.2767915725708,
				2
			}
		},
		pes_gameplay_hearing_a_skaven_rat_ogre = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
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
				"pes_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_12"
			},
			sound_events_duration = {
				3.3472499847412,
				2.1437292098999,
				2.2722291946411,
				2.271562576294,
				2.3054270744324,
				1.971062541008
			}
		},
		pes_gameplay_hearing_a_skaven_rat_ogre_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "enemy_alerts_high",
			dialogue_animations_n = 9,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
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
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_08",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_09",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_10",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_skaven_rat_ogre_combat_02",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_08",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_09",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_10",
				"pes_gameplay_hearing_a_Skaven_rat_ogre_combat_11"
			},
			sound_events_duration = {
				1.1099166870117,
				2.7042915821075,
				1.8572083711624,
				1.3405417203903,
				2.3556666374206,
				2.5387499332428,
				2.199458360672,
				2.4891457557678,
				2.1313333511352
			}
		},
		pes_gameplay_hearing_a_skaven_ratling_gun = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "enemy_alerts_high",
			dialogue_animations_n = 12,
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
				"dialogue_talk"
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_04",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_17",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_18"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_04",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_17",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_18"
			},
			sound_events_duration = {
				0.625,
				3.1795625686645,
				1.56795835495,
				2.3728542327881,
				1.7964792251587,
				2.3600208759308,
				1.792729139328,
				1.8285624980927,
				2.8057708740234,
				2.5897812843323,
				1.938916683197,
				1.5670833587647
			}
		},
		pes_gameplay_hearing_a_skaven_ratling_gun_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "enemy_alerts_high",
			dialogue_animations_n = 9,
			dialogue_animations = {
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
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_04",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_08",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pes_gameplay_hearing_a_skaven_ratling_gun_combat_04",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_08",
				"pes_gameplay_hearing_a_Skaven_ratling_gun_combat_09"
			},
			sound_events_duration = {
				1.2875833511352,
				0.87272918224335,
				1.274854183197,
				1.0438541173935,
				0.57854169607162,
				0.85597914457321,
				3.4567,
				1.173187494278,
				0.55237501859665
			}
		},
		pes_gameplay_hearing_a_standard_bearer = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
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
				"pes_gameplay_hearing_a_standard_bearer_01",
				"pes_gameplay_hearing_a_standard_bearer_02",
				"pes_gameplay_hearing_a_standard_bearer_03",
				"pes_gameplay_hearing_a_standard_bearer_05",
				"pes_gameplay_hearing_a_standard_bearer_combat_01",
				"pes_gameplay_hearing_a_standard_bearer_combat_02"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_standard_bearer_01",
				"pes_gameplay_hearing_a_standard_bearer_02",
				"pes_gameplay_hearing_a_standard_bearer_03",
				"pes_gameplay_hearing_a_standard_bearer_05",
				"pes_gameplay_hearing_a_standard_bearer_combat_01",
				"pes_gameplay_hearing_a_standard_bearer_combat_02"
			},
			sound_events_duration = {
				2.7074375152588,
				2.4106249809265,
				3.2161042690277,
				3.2970833778381,
				2.572104215622,
				2.3330208063126
			}
		},
		pes_gameplay_hearing_a_standard_bearer_crater = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
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
				"pes_gameplay_hearing_a_standard_bearer_01",
				"pes_gameplay_hearing_a_standard_bearer_02",
				"pes_gameplay_hearing_a_standard_bearer_03",
				"pes_gameplay_hearing_a_standard_bearer_05",
				"pes_gameplay_hearing_a_standard_bearer_combat_01",
				"pes_gameplay_hearing_a_standard_bearer_combat_02"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_standard_bearer_01",
				"pes_gameplay_hearing_a_standard_bearer_02",
				"pes_gameplay_hearing_a_standard_bearer_03",
				"pes_gameplay_hearing_a_standard_bearer_05",
				"pes_gameplay_hearing_a_standard_bearer_combat_01",
				"pes_gameplay_hearing_a_standard_bearer_combat_02"
			},
			sound_events_duration = {
				2.7074375152588,
				2.4106249809265,
				3.2161042690277,
				3.2970833778381,
				2.572104215622,
				2.3330208063126
			}
		},
		pes_gameplay_hearing_a_stormfiend = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
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
				"pes_gameplay_hearing_a_stormfiend_01",
				"pes_gameplay_hearing_a_stormfiend_02",
				"pes_gameplay_hearing_a_stormfiend_03",
				"pes_gameplay_hearing_a_stormfiend_04",
				"pes_gameplay_hearing_a_stormfiend_05",
				"pes_gameplay_hearing_a_stormfiend_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_stormfiend_01",
				"pes_gameplay_hearing_a_stormfiend_02",
				"pes_gameplay_hearing_a_stormfiend_03",
				"pes_gameplay_hearing_a_stormfiend_04",
				"pes_gameplay_hearing_a_stormfiend_05",
				"pes_gameplay_hearing_a_stormfiend_06"
			},
			sound_events_duration = {
				1.8164999485016,
				4.0240626335144,
				3.1698334217072,
				3.9937708377838,
				2.1451041698456,
				1.8535208106041
			}
		},
		pes_gameplay_hearing_a_stormfiend_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_stormfiend_combat_01",
				"pes_gameplay_hearing_a_stormfiend_combat_02",
				"pes_gameplay_hearing_a_stormfiend_combat_03",
				"pes_gameplay_hearing_a_stormfiend_combat_04",
				"pes_gameplay_hearing_a_stormfiend_combat_05",
				"pes_gameplay_hearing_a_stormfiend_combat_06",
				"pes_gameplay_hearing_a_stormfiend_combat_07",
				"pes_gameplay_hearing_a_stormfiend_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_stormfiend_combat_01",
				"pes_gameplay_hearing_a_stormfiend_combat_02",
				"pes_gameplay_hearing_a_stormfiend_combat_03",
				"pes_gameplay_hearing_a_stormfiend_combat_04",
				"pes_gameplay_hearing_a_stormfiend_combat_05",
				"pes_gameplay_hearing_a_stormfiend_combat_06",
				"pes_gameplay_hearing_a_stormfiend_combat_07",
				"pes_gameplay_hearing_a_stormfiend_combat_08"
			},
			sound_events_duration = {
				1.3533749580383,
				1.5151666402817,
				1.3053333759308,
				1.7060208320618,
				1.8576041460037,
				2.1462292671204,
				3.3650624752045,
				1.2939791679382
			}
		},
		pes_gameplay_hearing_a_troll = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
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
				"pes_gameplay_hearing_a_troll_01",
				"pes_gameplay_hearing_a_troll_02",
				"pes_gameplay_hearing_a_troll_03",
				"pes_gameplay_hearing_a_troll_04",
				"pes_gameplay_hearing_a_troll_05",
				"pes_gameplay_hearing_a_troll_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_troll_01",
				"pes_gameplay_hearing_a_troll_02",
				"pes_gameplay_hearing_a_troll_03",
				"pes_gameplay_hearing_a_troll_04",
				"pes_gameplay_hearing_a_troll_05",
				"pes_gameplay_hearing_a_troll_06"
			},
			sound_events_duration = {
				2.9682188034058,
				4.4051666259766,
				3.7769582271576,
				3.2501873970032,
				2.1605207920074,
				3.7060625553131
			}
		},
		pes_gameplay_hearing_a_troll_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_a_troll_combat_01",
				"pes_gameplay_hearing_a_troll_combat_02",
				"pes_gameplay_hearing_a_troll_combat_03",
				"pes_gameplay_hearing_a_troll_combat_04",
				"pes_gameplay_hearing_a_troll_combat_05",
				"pes_gameplay_hearing_a_troll_combat_06",
				"pes_gameplay_hearing_a_troll_combat_07",
				"pes_gameplay_hearing_a_troll_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_a_troll_combat_01",
				"pes_gameplay_hearing_a_troll_combat_02",
				"pes_gameplay_hearing_a_troll_combat_03",
				"pes_gameplay_hearing_a_troll_combat_04",
				"pes_gameplay_hearing_a_troll_combat_05",
				"pes_gameplay_hearing_a_troll_combat_06",
				"pes_gameplay_hearing_a_troll_combat_07",
				"pes_gameplay_hearing_a_troll_combat_08"
			},
			sound_events_duration = {
				0.97335416078568,
				1.3664166927338,
				1.3004167079925,
				2.2612083554268,
				1.2836666107178,
				1.3773332834244,
				1.7371666431427,
				1.7669583559036
			}
		},
		pes_gameplay_hearing_marauder_berserker_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"pes_gameplay_hearing_marauder_berserker_combat_01",
				"pes_gameplay_hearing_marauder_berserker_combat_02",
				"pes_gameplay_hearing_marauder_berserker_combat_03",
				"pes_gameplay_hearing_marauder_berserker_combat_04",
				"pes_gameplay_hearing_marauder_berserker_combat_05",
				"pes_gameplay_hearing_marauder_berserker_combat_06",
				"pes_gameplay_hearing_marauder_berserker_combat_07",
				"pes_gameplay_hearing_marauder_berserker_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hearing_marauder_berserker_combat_01",
				"pes_gameplay_hearing_marauder_berserker_combat_02",
				"pes_gameplay_hearing_marauder_berserker_combat_03",
				"pes_gameplay_hearing_marauder_berserker_combat_04",
				"pes_gameplay_hearing_marauder_berserker_combat_05",
				"pes_gameplay_hearing_marauder_berserker_combat_06",
				"pes_gameplay_hearing_marauder_berserker_combat_07",
				"pes_gameplay_hearing_marauder_berserker_combat_08"
			},
			sound_events_duration = {
				0.90152084827423,
				1.717812538147,
				1.0566458702087,
				1.3105208873749,
				1.7610416412354,
				1.6983333826065,
				1.0968542098999,
				2.6166040897369
			}
		},
		pes_gameplay_hears_incoming_horde = {
			randomize_indexes_n = 0,
			face_animations_n = 18,
			database = "empire_soldier_honduras",
			sound_events_n = 18,
			category = "enemy_alerts_high",
			dialogue_animations_n = 18,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
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
				"face_contempt",
				"face_smug",
				"face_smug",
				"face_smug",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_hears_incoming_horde_06",
				"pes_gameplay_hears_incoming_horde_10",
				"pes_gameplay_hears_incoming_horde_11",
				"pes_gameplay_hears_incoming_horde_12",
				"pes_gameplay_hears_incoming_horde_13",
				"pes_gameplay_hears_incoming_horde_14",
				"pes_gameplay_hears_incoming_horde_15",
				"pes_gameplay_hears_incoming_horde_16",
				"pes_gameplay_hears_incoming_horde_17",
				"pes_gameplay_hears_incoming_horde_18",
				"pes_gameplay_hears_incoming_horde_19",
				"pes_gameplay_hears_incoming_horde_20",
				"pes_gameplay_hears_incoming_horde_21",
				"pes_gameplay_hears_incoming_horde_22",
				"pes_gameplay_hears_incoming_horde_23",
				"pes_gameplay_hears_incoming_horde_24",
				"pes_gameplay_hears_incoming_horde_25",
				"pes_gameplay_hears_incoming_horde_26"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hears_incoming_horde_06",
				"pes_gameplay_hears_incoming_horde_10",
				"pes_gameplay_hears_incoming_horde_11",
				"pes_gameplay_hears_incoming_horde_12",
				"pes_gameplay_hears_incoming_horde_13",
				"pes_gameplay_hears_incoming_horde_14",
				"pes_gameplay_hears_incoming_horde_15",
				"pes_gameplay_hears_incoming_horde_16",
				"pes_gameplay_hears_incoming_horde_17",
				"pes_gameplay_hears_incoming_horde_18",
				"pes_gameplay_hears_incoming_horde_19",
				"pes_gameplay_hears_incoming_horde_20",
				"pes_gameplay_hears_incoming_horde_21",
				"pes_gameplay_hears_incoming_horde_22",
				"pes_gameplay_hears_incoming_horde_23",
				"pes_gameplay_hears_incoming_horde_24",
				"pes_gameplay_hears_incoming_horde_25",
				"pes_gameplay_hears_incoming_horde_26"
			},
			sound_events_duration = {
				1.3609999418259,
				2.1676459312439,
				2.3610000610352,
				2.193416595459,
				1.3713229298592,
				1.8708332777023,
				2.0458854436874,
				2.3609583377838,
				2.0683958530426,
				2.928729057312,
				1.6343333125114,
				1.9971874952316,
				3.0042083263397,
				2.3849999904633,
				1.7853541374207,
				2.3836040496826,
				1.6995416879654,
				2.1515624523163
			}
		},
		pes_gameplay_helped_by_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_helped_by_bright_wizard_05",
				"pes_gameplay_helped_by_bright_wizard_06",
				"pes_gameplay_helped_by_bright_wizard_07",
				"pes_gameplay_helped_by_bright_wizard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_helped_by_bright_wizard_05",
				"pes_gameplay_helped_by_bright_wizard_06",
				"pes_gameplay_helped_by_bright_wizard_07",
				"pes_gameplay_helped_by_bright_wizard_08"
			},
			sound_events_duration = {
				1.6083958148956,
				1.1209583282471,
				0.97295835614204,
				2.2362291812897
			}
		},
		pes_gameplay_helped_by_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_helped_by_dwarf_ranger_05",
				"pes_gameplay_helped_by_dwarf_ranger_06",
				"pes_gameplay_helped_by_dwarf_ranger_07",
				"pes_gameplay_helped_by_dwarf_ranger_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_helped_by_dwarf_ranger_05",
				"pes_gameplay_helped_by_dwarf_ranger_06",
				"pes_gameplay_helped_by_dwarf_ranger_07",
				"pes_gameplay_helped_by_dwarf_ranger_08"
			},
			sound_events_duration = {
				0.99989581108093,
				1.1915208101273,
				2.7005624771118,
				1.3275624513626
			}
		},
		pes_gameplay_helped_by_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_helped_by_witch_hunter_01",
				"pes_gameplay_helped_by_witch_hunter_02",
				"pes_gameplay_helped_by_witch_hunter_03",
				"pes_gameplay_helped_by_witch_hunter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_helped_by_witch_hunter_01",
				"pes_gameplay_helped_by_witch_hunter_02",
				"pes_gameplay_helped_by_witch_hunter_03",
				"pes_gameplay_helped_by_witch_hunter_04"
			},
			sound_events_duration = {
				0.73257291316986,
				1.0046562552452,
				0.72977083921432,
				1.5409582853317
			}
		},
		pes_gameplay_helped_by_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_helped_by_wood_elf_02",
				"pes_gameplay_helped_by_wood_elf_05",
				"pes_gameplay_helped_by_wood_elf_06",
				"pes_gameplay_helped_by_wood_elf_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_helped_by_wood_elf_02",
				"pes_gameplay_helped_by_wood_elf_05",
				"pes_gameplay_helped_by_wood_elf_06",
				"pes_gameplay_helped_by_wood_elf_07"
			},
			sound_events_duration = {
				1.2000000476837,
				1.1828541755676,
				2.0490521192551,
				2.6001040935516
			}
		},
		pes_gameplay_hit_by_goo = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_hit_by_goo_06",
				"pes_gameplay_hit_by_goo_08",
				"pes_gameplay_hit_by_goo_09",
				"pes_gameplay_hit_by_goo_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_hit_by_goo_06",
				"pes_gameplay_hit_by_goo_08",
				"pes_gameplay_hit_by_goo_09",
				"pes_gameplay_hit_by_goo_10"
			},
			sound_events_duration = {
				1.9279999732971,
				2.8499999046326,
				3.4144480228424,
				4.0159583091736
			}
		},
		pes_gameplay_incoming_attack = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_minotaur_01",
				"pes_gameplay_seeing_a_minotaur_02",
				"pes_gameplay_seeing_a_minotaur_03",
				"pes_gameplay_seeing_a_minotaur_04",
				"pes_gameplay_seeing_a_minotaur_05",
				"pes_gameplay_hearing_a_minotaur_combat_05",
				"pes_gameplay_hearing_a_minotaur_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_minotaur_01",
				"pes_gameplay_seeing_a_minotaur_02",
				"pes_gameplay_seeing_a_minotaur_03",
				"pes_gameplay_seeing_a_minotaur_04",
				"pes_gameplay_seeing_a_minotaur_05",
				"pes_gameplay_hearing_a_minotaur_combat_05",
				"pes_gameplay_hearing_a_minotaur_combat_06"
			},
			sound_events_duration = {
				3.5386874675751,
				3.2677292823791,
				2.2543542385101,
				3.1864583492279,
				3.4574167728424,
				1.793729186058,
				2.1730833053589
			}
		},
		pes_gameplay_incoming_bestigor_attack = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_incoming_bestigor_attack_01",
				"pes_gameplay_incoming_bestigor_attack_02",
				"pes_gameplay_incoming_bestigor_attack_03",
				"pes_gameplay_incoming_bestigor_attack_04",
				"pes_gameplay_incoming_bestigor_attack_05",
				"pes_gameplay_incoming_bestigor_attack_06",
				"pes_gameplay_incoming_bestigor_attack_07",
				"pes_gameplay_incoming_bestigor_attack_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_incoming_bestigor_attack_01",
				"pes_gameplay_incoming_bestigor_attack_02",
				"pes_gameplay_incoming_bestigor_attack_03",
				"pes_gameplay_incoming_bestigor_attack_04",
				"pes_gameplay_incoming_bestigor_attack_05",
				"pes_gameplay_incoming_bestigor_attack_06",
				"pes_gameplay_incoming_bestigor_attack_07",
				"pes_gameplay_incoming_bestigor_attack_08"
			},
			sound_events_duration = {
				1.5334166288376,
				2.5169792175293,
				1.0762292146683,
				1.3925833702087,
				2.7031042575836,
				2.1149165630341,
				1.0233750343323,
				1.9972916841507
			}
		},
		pes_gameplay_incoming_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "player_alerts",
			dialogue_animations_n = 6,
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
				"pes_gameplay_incoming_globadier_01",
				"pes_gameplay_incoming_globadier_02",
				"pes_gameplay_incoming_globadier_03",
				"pes_gameplay_incoming_globadier_04",
				"pes_gameplay_incoming_globadier_05",
				"pes_gameplay_incoming_globadier_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_incoming_globadier_01",
				"pes_gameplay_incoming_globadier_02",
				"pes_gameplay_incoming_globadier_03",
				"pes_gameplay_incoming_globadier_04",
				"pes_gameplay_incoming_globadier_05",
				"pes_gameplay_incoming_globadier_06"
			},
			sound_events_duration = {
				1.6429582834244,
				1.5585833787918,
				1.6459791660309,
				2.8512709140778,
				1.8298541307449,
				1.3109583854675
			}
		},
		pes_gameplay_incoming_skaven_rat_ogre = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "player_alerts",
			dialogue_animations_n = 9,
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
				"pes_gameplay_incoming_skaven_rat_ogre_01",
				"pes_gameplay_incoming_skaven_rat_ogre_05",
				"pes_gameplay_incoming_skaven_rat_ogre_06",
				"pes_gameplay_incoming_Skaven_rat_ogre_09",
				"pes_gameplay_incoming_Skaven_rat_ogre_10",
				"pes_gameplay_incoming_Skaven_rat_ogre_11",
				"pes_gameplay_incoming_Skaven_rat_ogre_12",
				"pes_gameplay_incoming_Skaven_rat_ogre_13",
				"pes_gameplay_incoming_Skaven_rat_ogre_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_incoming_skaven_rat_ogre_01",
				"pes_gameplay_incoming_skaven_rat_ogre_05",
				"pes_gameplay_incoming_skaven_rat_ogre_06",
				"pes_gameplay_incoming_Skaven_rat_ogre_09",
				"pes_gameplay_incoming_Skaven_rat_ogre_10",
				"pes_gameplay_incoming_Skaven_rat_ogre_11",
				"pes_gameplay_incoming_Skaven_rat_ogre_12",
				"pes_gameplay_incoming_Skaven_rat_ogre_13",
				"pes_gameplay_incoming_Skaven_rat_ogre_14"
			},
			sound_events_duration = {
				1.3062916994095,
				0.84112501144409,
				1.7713333368301,
				2.7480833530426,
				2.6036978960037,
				1.7257916331291,
				2.3278334140778,
				2.0251042842865,
				2.5132915973663
			}
		},
		pes_gameplay_killing_a_chaos_warrior = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_warrior_01",
				"pes_gameplay_killing_a_chaos_warrior_02",
				"pes_gameplay_killing_a_chaos_warrior_03",
				"pes_gameplay_killing_a_chaos_warrior_04",
				"pes_gameplay_killing_a_chaos_warrior_05",
				"pes_gameplay_killing_a_chaos_warrior_06",
				"pes_gameplay_killing_a_chaos_warrior_07",
				"pes_gameplay_killing_a_chaos_warrior_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_chaos_warrior_01",
				"pes_gameplay_killing_a_chaos_warrior_02",
				"pes_gameplay_killing_a_chaos_warrior_03",
				"pes_gameplay_killing_a_chaos_warrior_04",
				"pes_gameplay_killing_a_chaos_warrior_05",
				"pes_gameplay_killing_a_chaos_warrior_06",
				"pes_gameplay_killing_a_chaos_warrior_07",
				"pes_gameplay_killing_a_chaos_warrior_08"
			},
			sound_events_duration = {
				1.8720208406448,
				1.5387916564941,
				1.9371875524521,
				2.5409166812897,
				2.1196041107178,
				2.1526665687561,
				4.1780209541321,
				1.2760624885559
			}
		},
		pes_gameplay_killing_a_chaos_warrior_champion = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_warrior_champion_01",
				"pes_gameplay_killing_a_chaos_warrior_champion_02",
				"pes_gameplay_killing_a_chaos_warrior_champion_03",
				"pes_gameplay_killing_a_chaos_warrior_champion_04",
				"pes_gameplay_killing_a_chaos_warrior_champion_05",
				"pes_gameplay_killing_a_chaos_warrior_champion_06",
				"pes_gameplay_killing_a_chaos_warrior_champion_07",
				"pes_gameplay_killing_a_chaos_warrior_champion_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_chaos_warrior_champion_01",
				"pes_gameplay_killing_a_chaos_warrior_champion_02",
				"pes_gameplay_killing_a_chaos_warrior_champion_03",
				"pes_gameplay_killing_a_chaos_warrior_champion_04",
				"pes_gameplay_killing_a_chaos_warrior_champion_05",
				"pes_gameplay_killing_a_chaos_warrior_champion_06",
				"pes_gameplay_killing_a_chaos_warrior_champion_07",
				"pes_gameplay_killing_a_chaos_warrior_champion_08"
			},
			sound_events_duration = {
				3.7217707633972,
				2.9558228254318,
				3.2511250972748,
				1.8682708740234,
				3.5334792137146,
				4.1793541908264,
				2.6062083244324,
				2.3493750095367
			}
		},
		pes_gameplay_killing_a_chaos_wizard_leech = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_wizard_leech_01",
				"pes_gameplay_killing_a_chaos_wizard_leech_02",
				"pes_gameplay_killing_a_chaos_wizard_leech_03",
				"pes_gameplay_killing_a_chaos_wizard_leech_04",
				"pes_gameplay_killing_a_chaos_wizard_leech_05",
				"pes_gameplay_killing_a_chaos_wizard_leech_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_leech_01",
				"pes_gameplay_killing_a_chaos_wizard_leech_02",
				"pes_gameplay_killing_a_chaos_wizard_leech_03",
				"pes_gameplay_killing_a_chaos_wizard_leech_04",
				"pes_gameplay_killing_a_chaos_wizard_leech_05",
				"pes_gameplay_killing_a_chaos_wizard_leech_06"
			},
			sound_events_duration = {
				1.0725833177566,
				1.4505833387375,
				2.294041633606,
				1.9979583621025,
				1.4899791479111,
				2.0367708206177
			}
		},
		pes_gameplay_killing_a_chaos_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_wizard_plague_01",
				"pes_gameplay_killing_a_chaos_wizard_plague_02",
				"pes_gameplay_killing_a_chaos_wizard_plague_03",
				"pes_gameplay_killing_a_chaos_wizard_plague_04",
				"pes_gameplay_killing_a_chaos_wizard_plague_05",
				"pes_gameplay_killing_a_chaos_wizard_plague_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_plague_01",
				"pes_gameplay_killing_a_chaos_wizard_plague_02",
				"pes_gameplay_killing_a_chaos_wizard_plague_03",
				"pes_gameplay_killing_a_chaos_wizard_plague_04",
				"pes_gameplay_killing_a_chaos_wizard_plague_05",
				"pes_gameplay_killing_a_chaos_wizard_plague_06"
			},
			sound_events_duration = {
				1.4851458072662,
				2.7062292098999,
				2.0168333053589,
				1.7163541316986,
				1.0011041164398,
				0.91879165172577
			}
		},
		pes_gameplay_killing_a_chaos_wizard_tentacle = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pes_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			sound_events_duration = {
				2.2999999523163,
				1.6017916202545,
				2.5575625896454,
				3.1151041984558,
				3.4077498912811,
				1.9730833768845
			}
		},
		pes_gameplay_killing_a_chaos_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_chaos_wizard_wind_01",
				"pes_gameplay_killing_a_chaos_wizard_wind_02",
				"pes_gameplay_killing_a_chaos_wizard_wind_03",
				"pes_gameplay_killing_a_chaos_wizard_wind_04",
				"pes_gameplay_killing_a_chaos_wizard_wind_05",
				"pes_gameplay_killing_a_chaos_wizard_wind_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_chaos_wizard_wind_01",
				"pes_gameplay_killing_a_chaos_wizard_wind_02",
				"pes_gameplay_killing_a_chaos_wizard_wind_03",
				"pes_gameplay_killing_a_chaos_wizard_wind_04",
				"pes_gameplay_killing_a_chaos_wizard_wind_05",
				"pes_gameplay_killing_a_chaos_wizard_wind_06"
			},
			sound_events_duration = {
				1.6732708215714,
				2.4189584255219,
				1.4757708311081,
				3.0437083244324,
				2.903520822525,
				2.4785416126251
			}
		},
		pes_gameplay_killing_a_minotaur = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_minotaur_01",
				"pes_gameplay_killing_a_minotaur_02",
				"pes_gameplay_killing_a_minotaur_03",
				"pes_gameplay_killing_a_minotaur_04",
				"pes_gameplay_killing_a_minotaur_05",
				"pes_gameplay_killing_a_minotaur_06",
				"pes_gameplay_killing_a_minotaur_07",
				"pes_gameplay_killing_a_minotaur_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_minotaur_01",
				"pes_gameplay_killing_a_minotaur_02",
				"pes_gameplay_killing_a_minotaur_03",
				"pes_gameplay_killing_a_minotaur_04",
				"pes_gameplay_killing_a_minotaur_05",
				"pes_gameplay_killing_a_minotaur_06",
				"pes_gameplay_killing_a_minotaur_07",
				"pes_gameplay_killing_a_minotaur_08"
			},
			sound_events_duration = {
				3.6936457157135,
				2.2442500591278,
				2.796875,
				2.9044061899185,
				2.8189792633057,
				2.3869270086289,
				3.4747290611267,
				3.4649374485016
			}
		},
		pes_gameplay_killing_a_skaven_warpfire_thrower = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			sound_events_duration = {
				1.291375041008,
				1.1993124485016,
				2.6884167194366,
				1.4978125095367,
				1.9841250181198,
				2.9686979055405,
				2.8504374027252,
				2.067125082016
			}
		},
		pes_gameplay_killing_a_stormfiend = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_a_stormfiend_01",
				"pes_gameplay_killing_a_stormfiend_02",
				"pes_gameplay_killing_a_stormfiend_03",
				"pes_gameplay_killing_a_stormfiend_04",
				"pes_gameplay_killing_a_stormfiend_05",
				"pes_gameplay_killing_a_stormfiend_06",
				"pes_gameplay_killing_a_stormfiend_07",
				"pes_gameplay_killing_a_stormfiend_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_a_stormfiend_01",
				"pes_gameplay_killing_a_stormfiend_02",
				"pes_gameplay_killing_a_stormfiend_03",
				"pes_gameplay_killing_a_stormfiend_04",
				"pes_gameplay_killing_a_stormfiend_05",
				"pes_gameplay_killing_a_stormfiend_06",
				"pes_gameplay_killing_a_stormfiend_07",
				"pes_gameplay_killing_a_stormfiend_08"
			},
			sound_events_duration = {
				1.3641458749771,
				1.6720416545868,
				2.7783124446869,
				2.6464583873749,
				2.9873332977295,
				2.1358957290649,
				3.4507501125336,
				1.8140208721161
			}
		},
		pes_gameplay_killing_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_globadier_02",
				"pes_gameplay_killing_globadier_03",
				"pes_gameplay_killing_globadier_05",
				"pes_gameplay_killing_globadier_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_globadier_02",
				"pes_gameplay_killing_globadier_03",
				"pes_gameplay_killing_globadier_05",
				"pes_gameplay_killing_globadier_06"
			},
			sound_events_duration = {
				1.2009375095367,
				1.5518333911896,
				1.8965624570847,
				2.2914166450501
			}
		},
		pes_gameplay_killing_gutterrunner = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_gutterrunner_05",
				"pes_gameplay_killing_gutterrunner_06",
				"pes_gameplay_killing_gutterrunner_07",
				"pes_gameplay_killing_gutterrunner_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_gutterrunner_05",
				"pes_gameplay_killing_gutterrunner_06",
				"pes_gameplay_killing_gutterrunner_07",
				"pes_gameplay_killing_gutterrunner_08"
			},
			sound_events_duration = {
				2.1292290687561,
				2.0014998912811,
				1.209625005722,
				1.9996875524521
			}
		},
		pes_gameplay_killing_lootrat = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_lootrat_03",
				"pes_gameplay_killing_lootrat_05",
				"pes_gameplay_killing_lootrat_06",
				"pes_gameplay_killing_lootrat_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_lootrat_03",
				"pes_gameplay_killing_lootrat_05",
				"pes_gameplay_killing_lootrat_06",
				"pes_gameplay_killing_lootrat_07"
			},
			sound_events_duration = {
				1.9087707996368,
				2.579541683197,
				1.5564583539963,
				2.0619375705719
			}
		},
		pes_gameplay_killing_packmaster = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_packmaster_01",
				"pes_gameplay_killing_packmaster_02",
				"pes_gameplay_killing_packmaster_05",
				"pes_gameplay_killing_packmaster_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_packmaster_01",
				"pes_gameplay_killing_packmaster_02",
				"pes_gameplay_killing_packmaster_05",
				"pes_gameplay_killing_packmaster_06"
			},
			sound_events_duration = {
				1.2129791975021,
				1.2718958854675,
				1.8952499628067,
				1.5379583835602
			}
		},
		pes_gameplay_killing_ratling = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_killing_ratling_03",
				"pes_gameplay_killing_ratling_05",
				"pes_gameplay_killing_ratling_06",
				"pes_gameplay_killing_ratling_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_killing_ratling_03",
				"pes_gameplay_killing_ratling_05",
				"pes_gameplay_killing_ratling_06",
				"pes_gameplay_killing_ratling_07"
			},
			sound_events_duration = {
				2.1445000171661,
				2.2647500038147,
				2.3850834369659,
				1.9672291278839
			}
		},
		pes_gameplay_knocked_down = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
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
				"face_fear",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06",
				"pes_gameplay_knocked_down_07",
				"pes_gameplay_knocked_down_08",
				"pes_gameplay_knocked_down_09",
				"pes_gameplay_knocked_down_10",
				"pes_gameplay_knocked_down_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06",
				"pes_gameplay_knocked_down_07",
				"pes_gameplay_knocked_down_08",
				"pes_gameplay_knocked_down_09",
				"pes_gameplay_knocked_down_10",
				"pes_gameplay_knocked_down_11"
			},
			sound_events_duration = {
				1.0710208415985,
				1.0446041822434,
				1.9732916355133,
				0.75041669607162,
				1.6293541193008,
				2.3336040973663,
				2.0243124961853,
				1.6031041145325
			}
		},
		pes_gameplay_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_pain"
			},
			localization_strings = {
				"pes_gameplay_low_on_health_01",
				"pes_gameplay_low_on_health_09",
				"pes_gameplay_low_on_health_10",
				"pes_gameplay_low_on_health_11",
				"pes_gameplay_low_on_health_12",
				"pes_gameplay_low_on_health_13",
				"pes_gameplay_low_on_health_14",
				"pes_gameplay_low_on_health_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_low_on_health_01",
				"pes_gameplay_low_on_health_09",
				"pes_gameplay_low_on_health_10",
				"pes_gameplay_low_on_health_11",
				"pes_gameplay_low_on_health_12",
				"pes_gameplay_low_on_health_13",
				"pes_gameplay_low_on_health_14",
				"pes_gameplay_low_on_health_15"
			},
			sound_events_duration = {
				2.2957916259766,
				2.2180833816528,
				3.2766873836517,
				1.8077708482742,
				3.6779375076294,
				2.3515000343323,
				2.0228333473206,
				1.5894792079925
			}
		},
		pes_gameplay_no_nearby_teammates = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "casual_talk",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous"
			},
			localization_strings = {
				"pes_gameplay_no_nearby_teammates_05",
				"pes_gameplay_no_nearby_teammates_06",
				"pes_gameplay_no_nearby_teammates_09",
				"pes_gameplay_no_nearby_teammates_10",
				"pes_gameplay_no_nearby_teammates_11",
				"pes_gameplay_no_nearby_teammates_12",
				"pes_gameplay_no_nearby_teammates_13",
				"pes_gameplay_no_nearby_teammates_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_no_nearby_teammates_05",
				"pes_gameplay_no_nearby_teammates_06",
				"pes_gameplay_no_nearby_teammates_09",
				"pes_gameplay_no_nearby_teammates_10",
				"pes_gameplay_no_nearby_teammates_11",
				"pes_gameplay_no_nearby_teammates_12",
				"pes_gameplay_no_nearby_teammates_13",
				"pes_gameplay_no_nearby_teammates_14"
			},
			sound_events_duration = {
				1.4054583311081,
				1.0354374647141,
				1.4790832996368,
				3.2729375362396,
				2.6882915496826,
				1.9952499270439,
				2.158124923706,
				2.4183957576752
			}
		},
		pes_gameplay_out_of_ammo = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "player_feedback",
			dialogue_animations_n = 9,
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pes_gameplay_out_of_ammo_05",
				"pes_gameplay_out_of_ammo_06",
				"pes_gameplay_out_of_ammo_07",
				"pes_gameplay_out_of_ammo_08",
				"pes_gameplay_out_of_ammo_09",
				"pes_gameplay_out_of_ammo_10",
				"pes_gameplay_out_of_ammo_11",
				"pes_gameplay_out_of_ammo_12",
				"pes_gameplay_out_of_ammo_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_out_of_ammo_05",
				"pes_gameplay_out_of_ammo_06",
				"pes_gameplay_out_of_ammo_07",
				"pes_gameplay_out_of_ammo_08",
				"pes_gameplay_out_of_ammo_09",
				"pes_gameplay_out_of_ammo_10",
				"pes_gameplay_out_of_ammo_11",
				"pes_gameplay_out_of_ammo_12",
				"pes_gameplay_out_of_ammo_13"
			},
			sound_events_duration = {
				1.4534167051315,
				1.5814791917801,
				1.2135416269302,
				1.1613124608993,
				1.1037708520889,
				0.73227083683014,
				2.3864374160767,
				1.8904374837875,
				1.6058541536331
			}
		},
		pes_gameplay_parry_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_parry_bright_wizard_01",
				"pes_gameplay_parry_bright_wizard_02",
				"pes_gameplay_parry_bright_wizard_03",
				"pes_gameplay_parry_bright_wizard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_parry_bright_wizard_01",
				"pes_gameplay_parry_bright_wizard_02",
				"pes_gameplay_parry_bright_wizard_03",
				"pes_gameplay_parry_bright_wizard_04"
			},
			sound_events_duration = {
				1.5378750562668,
				1.4210416078568,
				2.0954792499542,
				2.5803332328796
			}
		},
		pes_gameplay_parry_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_parry_dwarf_ranger_01",
				"pes_gameplay_parry_dwarf_ranger_02",
				"pes_gameplay_parry_dwarf_ranger_03",
				"pes_gameplay_parry_dwarf_ranger_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_parry_dwarf_ranger_01",
				"pes_gameplay_parry_dwarf_ranger_02",
				"pes_gameplay_parry_dwarf_ranger_03",
				"pes_gameplay_parry_dwarf_ranger_04"
			},
			sound_events_duration = {
				3.1969896554947,
				2.1908750534058,
				2.2472500801086,
				2.142416715622
			}
		},
		pes_gameplay_parry_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_parry_witch_hunter_01",
				"pes_gameplay_parry_witch_hunter_02",
				"pes_gameplay_parry_witch_hunter_03",
				"pes_gameplay_parry_witch_hunter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_parry_witch_hunter_01",
				"pes_gameplay_parry_witch_hunter_02",
				"pes_gameplay_parry_witch_hunter_03",
				"pes_gameplay_parry_witch_hunter_04"
			},
			sound_events_duration = {
				1.226322889328,
				2.2145208120346,
				1.9222812652588,
				2.2582604885101
			}
		},
		pes_gameplay_parry_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pes_gameplay_parry_wood_elf_01",
				"pes_gameplay_parry_wood_elf_02",
				"pes_gameplay_parry_wood_elf_03",
				"pes_gameplay_parry_wood_elf_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_parry_wood_elf_01",
				"pes_gameplay_parry_wood_elf_02",
				"pes_gameplay_parry_wood_elf_03",
				"pes_gameplay_parry_wood_elf_04"
			},
			sound_events_duration = {
				2.1739583015442,
				1.7309999465942,
				3.0297083854675,
				2.0038125514984
			}
		},
		pes_gameplay_player_pounced = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			sound_events_n = 10,
			category = "player_alerts",
			dialogue_animations_n = 10,
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
			randomize_indexes = {},
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
			sound_events_duration = {
				1.4091458320618,
				1.954437494278,
				1.9655417203903,
				2.2325625419617,
				2.4606249332428,
				1.9934166669846,
				2.183354139328,
				2.1371250152588,
				2.6592707633972,
				2.0841457843781
			}
		},
		pes_gameplay_seeing_a_Skaven_warpfire_thrower = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pes_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			sound_events_duration = {
				3.1081874370575,
				4.5991561412811,
				2.9146873950958,
				3.3966875076294,
				3.1701874732971,
				4.0842084884644,
				3.5552916526794,
				4.2286667823792
			}
		},
		pes_gameplay_seeing_a_chaos_spawn = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_seeing_a_chaos_spawn_01",
				"pes_gameplay_seeing_a_chaos_spawn_02",
				"pes_gameplay_seeing_a_chaos_spawn_03",
				"pes_gameplay_seeing_a_chaos_spawn_04",
				"pes_gameplay_seeing_a_chaos_spawn_05",
				"pes_gameplay_seeing_a_chaos_spawn_06",
				"pes_gameplay_seeing_a_chaos_spawn_07",
				"pes_gameplay_seeing_a_chaos_spawn_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_spawn_01",
				"pes_gameplay_seeing_a_chaos_spawn_02",
				"pes_gameplay_seeing_a_chaos_spawn_03",
				"pes_gameplay_seeing_a_chaos_spawn_04",
				"pes_gameplay_seeing_a_chaos_spawn_05",
				"pes_gameplay_seeing_a_chaos_spawn_06",
				"pes_gameplay_seeing_a_chaos_spawn_07",
				"pes_gameplay_seeing_a_chaos_spawn_08"
			},
			sound_events_duration = {
				4.6962289810181,
				2.3624167442322,
				3.4473541975021,
				3.0198540687561,
				3.6132500171661,
				3.6184582710266,
				2.7463126182556,
				2.4739375114441
			}
		},
		pes_gameplay_seeing_a_chaos_warrior = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"pes_gameplay_seeing_a_chaos_warrior_01",
				"pes_gameplay_seeing_a_chaos_warrior_02",
				"pes_gameplay_seeing_a_chaos_warrior_03",
				"pes_gameplay_seeing_a_chaos_warrior_04",
				"pes_gameplay_seeing_a_chaos_warrior_05",
				"pes_gameplay_seeing_a_chaos_warrior_06",
				"pes_gameplay_seeing_a_chaos_warrior_07",
				"pes_gameplay_seeing_a_chaos_warrior_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_warrior_01",
				"pes_gameplay_seeing_a_chaos_warrior_02",
				"pes_gameplay_seeing_a_chaos_warrior_03",
				"pes_gameplay_seeing_a_chaos_warrior_04",
				"pes_gameplay_seeing_a_chaos_warrior_05",
				"pes_gameplay_seeing_a_chaos_warrior_06",
				"pes_gameplay_seeing_a_chaos_warrior_07",
				"pes_gameplay_seeing_a_chaos_warrior_08"
			},
			sound_events_duration = {
				3.319854259491,
				2.9505208730698,
				1.4906041622162,
				2.0340416431427,
				3.7763125896454,
				2.6143124103546,
				2.7025208473206,
				2.3324792385101
			}
		},
		pes_gameplay_seeing_a_chaos_warrior_champion_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pes_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			sound_events_duration = {
				3.4119791984558,
				3.8653957843781,
				4.2404999732971,
				3.362687587738,
				3.1817708015442,
				2.8816874027252,
				3.77308344841,
				4.5625
			}
		},
		pes_gameplay_seeing_a_chaos_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_chaos_wizard_plague_01",
				"pes_gameplay_seeing_a_chaos_wizard_plague_02",
				"pes_gameplay_seeing_a_chaos_wizard_plague_03",
				"pes_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_plague_01",
				"pes_gameplay_seeing_a_chaos_wizard_plague_02",
				"pes_gameplay_seeing_a_chaos_wizard_plague_03",
				"pes_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			sound_events_duration = {
				3.6139166355133,
				3.447083234787,
				1.9325416088104,
				1.6720833778381
			}
		},
		pes_gameplay_seeing_a_chaos_wizard_tentacle = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pes_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			sound_events_duration = {
				1.8580833673477,
				2.8627500534058,
				3.1139376163483,
				2.7561249732971
			}
		},
		pes_gameplay_seeing_a_chaos_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_chaos_wizard_wind_01",
				"pes_gameplay_seeing_a_chaos_wizard_wind_02",
				"pes_gameplay_seeing_a_chaos_wizard_wind_03",
				"pes_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_chaos_wizard_wind_01",
				"pes_gameplay_seeing_a_chaos_wizard_wind_02",
				"pes_gameplay_seeing_a_chaos_wizard_wind_03",
				"pes_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			sound_events_duration = {
				2.7060832977295,
				3.1529166698456,
				3.6873958110809,
				2.5999999046326
			}
		},
		pes_gameplay_seeing_a_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
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
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_07",
				"pes_gameplay_seeing_a_globadier_08",
				"pes_gameplay_seeing_a_globadier_09",
				"pes_gameplay_seeing_a_globadier_10",
				"pes_gameplay_seeing_a_globadier_11"
			},
			sound_events_duration = {
				1.0624375343323,
				0.86418747901917,
				1.6050624847412,
				2.0940520167351,
				1.2890416383743,
				1.6476249694824,
				1.3189582824707
			}
		},
		pes_gameplay_seeing_a_gutter_runner = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
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
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06",
				"pes_gameplay_seeing_a_gutter_runner_07",
				"pes_gameplay_seeing_a_gutter_runner_08",
				"pes_gameplay_seeing_a_gutter_runner_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06",
				"pes_gameplay_seeing_a_gutter_runner_07",
				"pes_gameplay_seeing_a_gutter_runner_08",
				"pes_gameplay_seeing_a_gutter_runner_09"
			},
			sound_events_duration = {
				1.0027500391007,
				1.3851875066757,
				1.2981666326523,
				1.2619792222977,
				1.9981979727745,
				2.2602500915527
			}
		},
		pes_gameplay_seeing_a_pm = {
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "empire_soldier_honduras",
			sound_events_n = 16,
			category = "enemy_alerts",
			dialogue_animations_n = 16,
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
				"dialogue_talk"
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
				"pes_gameplay_seeing_a_pm_01",
				"pes_gameplay_seeing_a_pm_02",
				"pes_gameplay_seeing_a_pm_03",
				"pes_gameplay_seeing_a_pm_04",
				"pes_gameplay_seeing_a_pm_05",
				"pes_gameplay_seeing_a_pm_06",
				"pes_gameplay_seeing_a_pm_07",
				"pes_gameplay_seeing_a_pm_08",
				"pes_gameplay_seeing_a_plague_monk_01",
				"pes_gameplay_seeing_a_plague_monk_02",
				"pes_gameplay_seeing_a_plague_monk_03",
				"pes_gameplay_seeing_a_plague_monk_04",
				"pes_gameplay_seeing_a_plague_monk_05",
				"pes_gameplay_seeing_a_plague_monk_06",
				"pes_gameplay_seeing_a_plague_monk_07",
				"pes_gameplay_seeing_a_plague_monk_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_pm_01",
				"pes_gameplay_seeing_a_pm_02",
				"pes_gameplay_seeing_a_pm_03",
				"pes_gameplay_seeing_a_pm_04",
				"pes_gameplay_seeing_a_pm_05",
				"pes_gameplay_seeing_a_pm_06",
				"pes_gameplay_seeing_a_pm_07",
				"pes_gameplay_seeing_a_pm_08",
				"pes_gameplay_seeing_a_plague_monk_01",
				"pes_gameplay_seeing_a_plague_monk_02",
				"pes_gameplay_seeing_a_plague_monk_03",
				"pes_gameplay_seeing_a_plague_monk_04",
				"pes_gameplay_seeing_a_plague_monk_05",
				"pes_gameplay_seeing_a_plague_monk_06",
				"pes_gameplay_seeing_a_plague_monk_07",
				"pes_gameplay_seeing_a_plague_monk_08"
			},
			sound_events_duration = {
				1.5271458625793,
				1.6247291564941,
				2.6726875305176,
				1.5940833091736,
				1.302854180336,
				1.5676875114441,
				1.9768749475479,
				2.0193541049957,
				2.4447500705719,
				2.0614583492279,
				2.8597812652588,
				2.9318749904633,
				2.209041595459,
				2.6277499198914,
				1.7398542165756,
				2.3909686803818
			}
		},
		pes_gameplay_seeing_a_scr = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "empire_soldier_honduras",
			sound_events_n = 15,
			category = "enemy_alerts",
			dialogue_animations_n = 15,
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
				"dialogue_talk"
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_scr_01",
				"pes_gameplay_seeing_a_scr_02",
				"pes_gameplay_seeing_a_scr_03",
				"pes_gameplay_seeing_a_scr_04",
				"pes_gameplay_seeing_a_scr_05",
				"pes_gameplay_seeing_a_scr_06",
				"pes_gameplay_seeing_a_scr_07",
				"pes_gameplay_seeing_a_shield_clanrat_01",
				"pes_gameplay_seeing_a_shield_clanrat_02",
				"pes_gameplay_seeing_a_shield_clanrat_03",
				"pes_gameplay_seeing_a_shield_clanrat_04",
				"pes_gameplay_seeing_a_shield_clanrat_05",
				"pes_gameplay_seeing_a_shield_clanrat_06",
				"pes_gameplay_seeing_a_shield_clanrat_07",
				"pes_gameplay_seeing_a_shield_clanrat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_scr_01",
				"pes_gameplay_seeing_a_scr_02",
				"pes_gameplay_seeing_a_scr_03",
				"pes_gameplay_seeing_a_scr_04",
				"pes_gameplay_seeing_a_scr_05",
				"pes_gameplay_seeing_a_scr_06",
				"pes_gameplay_seeing_a_scr_07",
				"pes_gameplay_seeing_a_shield_clanrat_01",
				"pes_gameplay_seeing_a_shield_clanrat_02",
				"pes_gameplay_seeing_a_shield_clanrat_03",
				"pes_gameplay_seeing_a_shield_clanrat_04",
				"pes_gameplay_seeing_a_shield_clanrat_05",
				"pes_gameplay_seeing_a_shield_clanrat_06",
				"pes_gameplay_seeing_a_shield_clanrat_07",
				"pes_gameplay_seeing_a_shield_clanrat_08"
			},
			sound_events_duration = {
				1.4554166793823,
				1.9449374675751,
				0.94022917747498,
				1.8354375362396,
				1.4451874494553,
				1.4347916841507,
				1.320729136467,
				1.7016667127609,
				1.9116041660309,
				0.83649998903275,
				1.4907499551773,
				1.6280208826065,
				1.0646874904633,
				2.3352916240692,
				3.1080832481384
			}
		},
		pes_gameplay_seeing_a_shield_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"pes_gameplay_seeing_a_shield_stormvermin_01",
				"pes_gameplay_seeing_a_shield_stormvermin_02",
				"pes_gameplay_seeing_a_shield_stormvermin_03",
				"pes_gameplay_seeing_a_shield_stormvermin_04",
				"pes_gameplay_seeing_a_shield_stormvermin_05",
				"pes_gameplay_seeing_a_shield_stormvermin_06",
				"pes_gameplay_seeing_a_shield_stormvermin_07",
				"pes_gameplay_seeing_a_shield_stormvermin_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_shield_stormvermin_01",
				"pes_gameplay_seeing_a_shield_stormvermin_02",
				"pes_gameplay_seeing_a_shield_stormvermin_03",
				"pes_gameplay_seeing_a_shield_stormvermin_04",
				"pes_gameplay_seeing_a_shield_stormvermin_05",
				"pes_gameplay_seeing_a_shield_stormvermin_06",
				"pes_gameplay_seeing_a_shield_stormvermin_07",
				"pes_gameplay_seeing_a_shield_stormvermin_08"
			},
			sound_events_duration = {
				1.9320833683014,
				1.597895860672,
				1.7263333797455,
				2.1454374790192,
				2.3747498989105,
				2.7608542442322,
				3.3124792575836,
				3.8119790554047
			}
		},
		pes_gameplay_seeing_a_skaven_patrol_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_12",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pes_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_12",
				"pes_gameplay_seeing_a_Skaven_patrol_stormvermin_13"
			},
			sound_events_duration = {
				1.505083322525,
				1.9318541288376,
				2.0269582271576,
				2.3062292337418,
				2.1215521097183,
				2.4532916545868,
				3.3297708034515,
				2.5868958234787
			}
		},
		pes_gameplay_seeing_a_skaven_rat_ogre = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
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
				"pes_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pes_gameplay_seeing_a_Skaven_rat_ogre_11"
			},
			sound_events_duration = {
				1.1322083473206,
				2.7177083492279,
				2.4540103673935,
				2.1096875667572,
				2,
				2.0011458396912
			}
		},
		pes_gameplay_seeing_a_skaven_ratling_gun = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
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
				"pes_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pes_gameplay_seeing_a_Skaven_ratling_gun_11"
			},
			sound_events_duration = {
				1.0576041936874,
				1.2963750362396,
				1.5645208358765,
				1.8381458520889,
				1.0864791870117,
				1.5746458768845,
				1.7218124866486
			}
		},
		pes_gameplay_seeing_a_skaven_slaver = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "enemy_alerts_high",
			dialogue_animations_n = 9,
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
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_Skaven_slaver_09",
				"pes_gameplay_seeing_a_Skaven_slaver_10",
				"pes_gameplay_seeing_a_Skaven_slaver_11",
				"pes_gameplay_seeing_a_Skaven_slaver_12",
				"pes_gameplay_seeing_a_Skaven_slaver_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_Skaven_slaver_09",
				"pes_gameplay_seeing_a_Skaven_slaver_10",
				"pes_gameplay_seeing_a_Skaven_slaver_11",
				"pes_gameplay_seeing_a_Skaven_slaver_12",
				"pes_gameplay_seeing_a_Skaven_slaver_13"
			},
			sound_events_duration = {
				0.88443750143051,
				0.94454169273376,
				1.029000043869,
				1.5038958787918,
				1.8552082777023,
				1.7373958826065,
				2.1106250286102,
				1.2322708368301,
				2.1496665477753
			}
		},
		pes_gameplay_seeing_a_stormfiend = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_seeing_a_stormfiend_01",
				"pes_gameplay_seeing_a_stormfiend_02",
				"pes_gameplay_seeing_a_stormfiend_03",
				"pes_gameplay_seeing_a_stormfiend_04",
				"pes_gameplay_seeing_a_stormfiend_05",
				"pes_gameplay_seeing_a_stormfiend_06",
				"pes_gameplay_seeing_a_stormfiend_07",
				"pes_gameplay_seeing_a_stormfiend_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_stormfiend_01",
				"pes_gameplay_seeing_a_stormfiend_02",
				"pes_gameplay_seeing_a_stormfiend_03",
				"pes_gameplay_seeing_a_stormfiend_04",
				"pes_gameplay_seeing_a_stormfiend_05",
				"pes_gameplay_seeing_a_stormfiend_06",
				"pes_gameplay_seeing_a_stormfiend_07",
				"pes_gameplay_seeing_a_stormfiend_08"
			},
			sound_events_duration = {
				2.2115833759308,
				4.2078334093094,
				2.6422083377838,
				2.4455416202545,
				2.5981457233429,
				2.7933332920074,
				2.470624923706,
				3.7116665840149
			}
		},
		pes_gameplay_seeing_a_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_09",
				"pes_gameplay_seeing_a_stormvermin_10",
				"pes_gameplay_seeing_a_stormvermin_11",
				"pes_gameplay_seeing_a_stormvermin_12",
				"pes_gameplay_seeing_a_stormvermin_13",
				"pes_gameplay_seeing_a_stormvermin_14",
				"pes_gameplay_seeing_a_stormvermin_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_09",
				"pes_gameplay_seeing_a_stormvermin_10",
				"pes_gameplay_seeing_a_stormvermin_11",
				"pes_gameplay_seeing_a_stormvermin_12",
				"pes_gameplay_seeing_a_stormvermin_13",
				"pes_gameplay_seeing_a_stormvermin_14",
				"pes_gameplay_seeing_a_stormvermin_15"
			},
			sound_events_duration = {
				1.1208958625793,
				1.3295208215714,
				1.6428542137146,
				2.0409166812897,
				2.5769374370575,
				1.6695417165756,
				2.3740832805634,
				2.5849375724792
			}
		},
		pes_gameplay_seeing_a_troll = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
				"pes_gameplay_seeing_a_troll_01",
				"pes_gameplay_seeing_a_troll_02",
				"pes_gameplay_seeing_a_troll_03",
				"pes_gameplay_seeing_a_troll_04",
				"pes_gameplay_seeing_a_troll_05",
				"pes_gameplay_seeing_a_troll_06",
				"pes_gameplay_seeing_a_troll_07",
				"pes_gameplay_seeing_a_troll_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_troll_01",
				"pes_gameplay_seeing_a_troll_02",
				"pes_gameplay_seeing_a_troll_03",
				"pes_gameplay_seeing_a_troll_04",
				"pes_gameplay_seeing_a_troll_05",
				"pes_gameplay_seeing_a_troll_06",
				"pes_gameplay_seeing_a_troll_07",
				"pes_gameplay_seeing_a_troll_08"
			},
			sound_events_duration = {
				2.1530001163483,
				1.3343333005905,
				4.0587501525879,
				5.7707915306091,
				4.5772290229797,
				5.556104183197,
				3.772020816803,
				3.4877707958221
			}
		},
		pes_gameplay_seeing_a_ungor_archer = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_ungor_archer_01",
				"pes_gameplay_seeing_a_ungor_archer_02",
				"pes_gameplay_seeing_a_ungor_archer_03",
				"pes_gameplay_seeing_a_ungor_archer_04",
				"pes_gameplay_seeing_a_ungor_archer_05",
				"pes_gameplay_seeing_a_ungor_archer_06",
				"pes_gameplay_seeing_a_ungor_archer_07",
				"pes_gameplay_seeing_a_ungor_archer_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_seeing_a_ungor_archer_01",
				"pes_gameplay_seeing_a_ungor_archer_02",
				"pes_gameplay_seeing_a_ungor_archer_03",
				"pes_gameplay_seeing_a_ungor_archer_04",
				"pes_gameplay_seeing_a_ungor_archer_05",
				"pes_gameplay_seeing_a_ungor_archer_06",
				"pes_gameplay_seeing_a_ungor_archer_07",
				"pes_gameplay_seeing_a_ungor_archer_08"
			},
			sound_events_duration = {
				1.5789999961853,
				1.1486250162125,
				1.7194374799728,
				2.4866459369659,
				0.8349791765213,
				0.71314585208893,
				1.4965416193008,
				1.1017082929611
			}
		},
		pes_gameplay_self_heal = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "empire_soldier_honduras",
			sound_events_n = 10,
			category = "player_feedback",
			dialogue_animations_n = 10,
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
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_self_heal_06",
				"pes_gameplay_self_heal_07",
				"pes_gameplay_self_heal_08",
				"pes_gameplay_self_heal_09",
				"pes_gameplay_self_heal_10",
				"pes_gameplay_self_heal_11",
				"pes_gameplay_self_heal_12",
				"pes_gameplay_self_heal_13",
				"pes_gameplay_self_heal_14",
				"pes_gameplay_self_heal_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_self_heal_06",
				"pes_gameplay_self_heal_07",
				"pes_gameplay_self_heal_08",
				"pes_gameplay_self_heal_09",
				"pes_gameplay_self_heal_10",
				"pes_gameplay_self_heal_11",
				"pes_gameplay_self_heal_12",
				"pes_gameplay_self_heal_13",
				"pes_gameplay_self_heal_14",
				"pes_gameplay_self_heal_15"
			},
			sound_events_duration = {
				1.4743958711624,
				1.947104215622,
				3.1814999580383,
				1.9716875553131,
				3.2748124599457,
				2.8253126144409,
				2.2543542385101,
				1.3730208873749,
				2.1986874341965,
				2.2281665802002
			}
		},
		pes_gameplay_special_enemy_kill_melee = {
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "empire_soldier_honduras",
			sound_events_n = 16,
			category = "player_feedback",
			dialogue_animations_n = 16,
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_special_enemy_kill_melee_03",
				"pes_gameplay_special_enemy_kill_melee_09",
				"pes_gameplay_special_enemy_kill_melee_10",
				"pes_gameplay_special_enemy_kill_melee_11",
				"pes_gameplay_special_enemy_kill_melee_12",
				"pes_gameplay_special_enemy_kill_melee_13",
				"pes_gameplay_special_enemy_kill_melee_14",
				"pes_gameplay_special_enemy_kill_melee_15",
				"pes_gameplay_special_enemy_kill_melee_16",
				"pes_gameplay_special_enemy_kill_melee_17",
				"pes_gameplay_special_enemy_kill_melee_18",
				"pes_gameplay_special_enemy_kill_melee_19",
				"pes_gameplay_special_enemy_kill_melee_20",
				"pes_gameplay_special_enemy_kill_melee_21",
				"pes_gameplay_special_enemy_kill_melee_22",
				"pes_gameplay_special_enemy_kill_melee_23"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_special_enemy_kill_melee_03",
				"pes_gameplay_special_enemy_kill_melee_09",
				"pes_gameplay_special_enemy_kill_melee_10",
				"pes_gameplay_special_enemy_kill_melee_11",
				"pes_gameplay_special_enemy_kill_melee_12",
				"pes_gameplay_special_enemy_kill_melee_13",
				"pes_gameplay_special_enemy_kill_melee_14",
				"pes_gameplay_special_enemy_kill_melee_15",
				"pes_gameplay_special_enemy_kill_melee_16",
				"pes_gameplay_special_enemy_kill_melee_17",
				"pes_gameplay_special_enemy_kill_melee_18",
				"pes_gameplay_special_enemy_kill_melee_19",
				"pes_gameplay_special_enemy_kill_melee_20",
				"pes_gameplay_special_enemy_kill_melee_21",
				"pes_gameplay_special_enemy_kill_melee_22",
				"pes_gameplay_special_enemy_kill_melee_23"
			},
			sound_events_duration = {
				1.4644792079925,
				1.9137083292007,
				2.1420834064484,
				1.962729215622,
				1.967854142189,
				2.1464166641235,
				2.4424374103546,
				2.0405623912811,
				2.0892083644867,
				3.6387708187103,
				3.2637083530426,
				3.2625625133514,
				1.5056458711624,
				2.3790624141693,
				2.3672292232513,
				3.5559582710266
			}
		},
		pes_gameplay_special_enemy_kill_ranged = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "player_feedback",
			dialogue_animations_n = 12,
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_special_enemy_kill_ranged_02",
				"pes_gameplay_special_enemy_kill_ranged_09",
				"pes_gameplay_special_enemy_kill_ranged_10",
				"pes_gameplay_special_enemy_kill_ranged_11",
				"pes_gameplay_special_enemy_kill_ranged_12",
				"pes_gameplay_special_enemy_kill_ranged_13",
				"pes_gameplay_special_enemy_kill_ranged_14",
				"pes_gameplay_special_enemy_kill_ranged_15",
				"pes_gameplay_special_enemy_kill_ranged_16",
				"pes_gameplay_special_enemy_kill_ranged_17",
				"pes_gameplay_special_enemy_kill_ranged_18",
				"pes_gameplay_special_enemy_kill_ranged_19"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_special_enemy_kill_ranged_02",
				"pes_gameplay_special_enemy_kill_ranged_09",
				"pes_gameplay_special_enemy_kill_ranged_10",
				"pes_gameplay_special_enemy_kill_ranged_11",
				"pes_gameplay_special_enemy_kill_ranged_12",
				"pes_gameplay_special_enemy_kill_ranged_13",
				"pes_gameplay_special_enemy_kill_ranged_14",
				"pes_gameplay_special_enemy_kill_ranged_15",
				"pes_gameplay_special_enemy_kill_ranged_16",
				"pes_gameplay_special_enemy_kill_ranged_17",
				"pes_gameplay_special_enemy_kill_ranged_18",
				"pes_gameplay_special_enemy_kill_ranged_19"
			},
			sound_events_duration = {
				1.1437292098999,
				1.1609791517258,
				1.5118333101273,
				1.68850004673,
				2.0530624389648,
				1.2923958301544,
				2.8040208816528,
				1.587729215622,
				1.920937538147,
				1.4058542251587,
				2.6454999446869,
				1.7760208845139
			}
		},
		pes_gameplay_spots_ammo = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "seen_items",
			dialogue_animations_n = 8,
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
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_05",
				"pes_gameplay_spots_ammo_06",
				"pes_gameplay_spots_ammo_07",
				"pes_gameplay_spots_ammo_08",
				"pes_gameplay_spots_ammo_09",
				"pes_gameplay_spots_ammo_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_05",
				"pes_gameplay_spots_ammo_06",
				"pes_gameplay_spots_ammo_07",
				"pes_gameplay_spots_ammo_08",
				"pes_gameplay_spots_ammo_09",
				"pes_gameplay_spots_ammo_10"
			},
			sound_events_duration = {
				0.8832291662693,
				1.2390208244324,
				1.3858958482742,
				1.4178750514984,
				2.0729167461395,
				1.6746250391007,
				1.4186667203903,
				2.6123125553131
			}
		},
		pes_gameplay_spots_bomb = {
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "empire_soldier_honduras",
			sound_events_n = 14,
			category = "seen_items",
			dialogue_animations_n = 14,
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
				"pes_gameplay_spots_bomb_05",
				"pes_gameplay_spots_bomb_09",
				"pes_gameplay_spots_bomb_10",
				"pes_gameplay_spots_bomb_11",
				"pes_gameplay_spots_bomb_12",
				"pes_gameplay_spots_bomb_13",
				"pes_gameplay_spots_bomb_14",
				"pes_gameplay_spots_bomb_15",
				"pes_gameplay_spots_bomb_16",
				"pes_gameplay_spots_bomb_17",
				"pes_gameplay_spots_bomb_18",
				"pes_gameplay_spots_bomb_19",
				"pes_gameplay_spots_bomb_20",
				"pes_gameplay_spots_bomb_21"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_spots_bomb_05",
				"pes_gameplay_spots_bomb_09",
				"pes_gameplay_spots_bomb_10",
				"pes_gameplay_spots_bomb_11",
				"pes_gameplay_spots_bomb_12",
				"pes_gameplay_spots_bomb_13",
				"pes_gameplay_spots_bomb_14",
				"pes_gameplay_spots_bomb_15",
				"pes_gameplay_spots_bomb_16",
				"pes_gameplay_spots_bomb_17",
				"pes_gameplay_spots_bomb_18",
				"pes_gameplay_spots_bomb_19",
				"pes_gameplay_spots_bomb_20",
				"pes_gameplay_spots_bomb_21"
			},
			sound_events_duration = {
				0.59333330392838,
				3.1451041698456,
				2.477395772934,
				1.4434374570847,
				1.6692708730698,
				2.6242709159851,
				1.2113749980927,
				1.9523124694824,
				1.2056875228882,
				2.5682709217072,
				1.3494374752045,
				3.270604133606,
				1.9287707805634,
				1.3463541269302
			}
		},
		pes_gameplay_spots_health = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "seen_items",
			dialogue_animations_n = 12,
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
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_07",
				"pes_gameplay_spots_health_08",
				"pes_gameplay_spots_health_09",
				"pes_gameplay_spots_health_10",
				"pes_gameplay_spots_health_11",
				"pes_gameplay_spots_health_12",
				"pes_gameplay_spots_health_13",
				"pes_gameplay_spots_health_14",
				"pes_gameplay_spots_health_15",
				"pes_gameplay_spots_health_16",
				"pes_gameplay_spots_health_17"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_07",
				"pes_gameplay_spots_health_08",
				"pes_gameplay_spots_health_09",
				"pes_gameplay_spots_health_10",
				"pes_gameplay_spots_health_11",
				"pes_gameplay_spots_health_12",
				"pes_gameplay_spots_health_13",
				"pes_gameplay_spots_health_14",
				"pes_gameplay_spots_health_15",
				"pes_gameplay_spots_health_16",
				"pes_gameplay_spots_health_17"
			},
			sound_events_duration = {
				1.276270866394,
				1.0624582767487,
				1.145708322525,
				0.982541680336,
				1.4442917108536,
				1.8630833625793,
				1.7280000448227,
				1.418145775795,
				2.4351458549499,
				1.5250624418259,
				1.72756254673,
				2.0222916603088
			}
		},
		pes_gameplay_spots_potion = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "empire_soldier_honduras",
			sound_events_n = 15,
			category = "seen_items",
			dialogue_animations_n = 15,
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
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_06",
				"pes_gameplay_spots_potion_07",
				"pes_gameplay_spots_potion_08",
				"pes_gameplay_spots_potion_09",
				"pes_gameplay_spots_potion_10",
				"pes_gameplay_spots_potion_11",
				"pes_gameplay_spots_potion_12",
				"pes_gameplay_spots_potion_13",
				"pes_gameplay_spots_potion_14",
				"pes_gameplay_spots_potion_15",
				"pes_gameplay_spots_potion_16",
				"pes_gameplay_spots_potion_17"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_06",
				"pes_gameplay_spots_potion_07",
				"pes_gameplay_spots_potion_08",
				"pes_gameplay_spots_potion_09",
				"pes_gameplay_spots_potion_10",
				"pes_gameplay_spots_potion_11",
				"pes_gameplay_spots_potion_12",
				"pes_gameplay_spots_potion_13",
				"pes_gameplay_spots_potion_14",
				"pes_gameplay_spots_potion_15",
				"pes_gameplay_spots_potion_16",
				"pes_gameplay_spots_potion_17"
			},
			sound_events_duration = {
				0.61514586210251,
				1.1201041936874,
				1.0846041440964,
				1.2224583625793,
				1.1109583377838,
				1.8152500391007,
				1.435250043869,
				1.5198333263397,
				0.91835415363312,
				1.238520860672,
				1.3626041412354,
				1.8177917003632,
				1.27243745327,
				1.5283958911896,
				1.7974375486374
			}
		},
		pes_gameplay_standard_bearer_buff_active = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_standard_bearer_buff_active_01",
				"pes_gameplay_standard_bearer_buff_active_02",
				"pes_gameplay_standard_bearer_buff_active_03",
				"pes_gameplay_standard_bearer_buff_active_04",
				"pes_gameplay_standard_bearer_buff_active_05",
				"pes_gameplay_standard_bearer_buff_active_06",
				"pes_gameplay_standard_bearer_buff_active_07",
				"pes_gameplay_standard_bearer_buff_active_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_standard_bearer_buff_active_01",
				"pes_gameplay_standard_bearer_buff_active_02",
				"pes_gameplay_standard_bearer_buff_active_03",
				"pes_gameplay_standard_bearer_buff_active_04",
				"pes_gameplay_standard_bearer_buff_active_05",
				"pes_gameplay_standard_bearer_buff_active_06",
				"pes_gameplay_standard_bearer_buff_active_07",
				"pes_gameplay_standard_bearer_buff_active_08"
			},
			sound_events_duration = {
				2.8988229036331,
				2.992666721344,
				2.5157499313355,
				2.6468958854675,
				2.3965208530426,
				1.9911249876022,
				3.0820624828339,
				3.4946562051773
			}
		},
		pes_gameplay_standard_bearer_buff_deactivated = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_standard_bearer_buff_deactivated_01",
				"pes_gameplay_standard_bearer_buff_deactivated_02",
				"pes_gameplay_standard_bearer_buff_deactivated_03",
				"pes_gameplay_standard_bearer_buff_deactivated_04",
				"pes_gameplay_standard_bearer_buff_deactivated_05",
				"pes_gameplay_standard_bearer_buff_deactivated_06",
				"pes_gameplay_standard_bearer_buff_deactivated_07",
				"pes_gameplay_standard_bearer_buff_deactivated_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_standard_bearer_buff_deactivated_01",
				"pes_gameplay_standard_bearer_buff_deactivated_02",
				"pes_gameplay_standard_bearer_buff_deactivated_03",
				"pes_gameplay_standard_bearer_buff_deactivated_04",
				"pes_gameplay_standard_bearer_buff_deactivated_05",
				"pes_gameplay_standard_bearer_buff_deactivated_06",
				"pes_gameplay_standard_bearer_buff_deactivated_07",
				"pes_gameplay_standard_bearer_buff_deactivated_08"
			},
			sound_events_duration = {
				2.7529165744781,
				2.7799999713898,
				2.6228749752045,
				2.2760417461395,
				1.4685833454132,
				2.1784791946411,
				4.741729259491,
				2.0946978926659
			}
		},
		pes_gameplay_standard_bearer_has_planted_standard = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_standard_bearer_has_planted_standard_01",
				"pes_gameplay_standard_bearer_has_planted_standard_02",
				"pes_gameplay_standard_bearer_has_planted_standard_03",
				"pes_gameplay_standard_bearer_has_planted_standard_04",
				"pes_gameplay_standard_bearer_has_planted_standard_05",
				"pes_gameplay_standard_bearer_has_planted_standard_06",
				"pes_gameplay_standard_bearer_has_planted_standard_07",
				"pes_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_standard_bearer_has_planted_standard_01",
				"pes_gameplay_standard_bearer_has_planted_standard_02",
				"pes_gameplay_standard_bearer_has_planted_standard_03",
				"pes_gameplay_standard_bearer_has_planted_standard_04",
				"pes_gameplay_standard_bearer_has_planted_standard_05",
				"pes_gameplay_standard_bearer_has_planted_standard_06",
				"pes_gameplay_standard_bearer_has_planted_standard_07",
				"pes_gameplay_standard_bearer_has_planted_standard_08"
			},
			sound_events_duration = {
				1.3592292070389,
				1.5201666355133,
				1.6275000572205,
				2.152104139328,
				2.8018958568573,
				2.8317084312439,
				2.3011250495911,
				1.7228749990463
			}
		},
		pes_gameplay_standard_bearer_has_planted_standard_crater = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_standard_bearer_has_planted_standard_01",
				"pes_gameplay_standard_bearer_has_planted_standard_02",
				"pes_gameplay_standard_bearer_has_planted_standard_03",
				"pes_gameplay_standard_bearer_has_planted_standard_04",
				"pes_gameplay_standard_bearer_has_planted_standard_05",
				"pes_gameplay_standard_bearer_has_planted_standard_06",
				"pes_gameplay_standard_bearer_has_planted_standard_07",
				"pes_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_standard_bearer_has_planted_standard_01",
				"pes_gameplay_standard_bearer_has_planted_standard_02",
				"pes_gameplay_standard_bearer_has_planted_standard_03",
				"pes_gameplay_standard_bearer_has_planted_standard_04",
				"pes_gameplay_standard_bearer_has_planted_standard_05",
				"pes_gameplay_standard_bearer_has_planted_standard_06",
				"pes_gameplay_standard_bearer_has_planted_standard_07",
				"pes_gameplay_standard_bearer_has_planted_standard_08"
			},
			sound_events_duration = {
				1.3592292070389,
				1.5201666355133,
				1.6275000572205,
				2.152104139328,
				2.8018958568573,
				2.8317084312439,
				2.3011250495911,
				1.7228749990463
			}
		},
		pes_gameplay_taking_heavy_damage = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "empire_soldier_honduras",
			sound_events_n = 12,
			category = "player_alerts",
			dialogue_animations_n = 12,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
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
				"face_fear",
				"face_fear",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pes_gameplay_taking_heavy_damage_10",
				"pes_gameplay_taking_heavy_damage_11",
				"pes_gameplay_taking_heavy_damage_12",
				"pes_gameplay_taking_heavy_damage_13",
				"pes_gameplay_taking_heavy_damage_14",
				"pes_gameplay_taking_heavy_damage_15",
				"pes_gameplay_taking_heavy_damage_16",
				"pes_gameplay_taking_heavy_damage_17",
				"pes_gameplay_taking_heavy_damage_18",
				"pes_gameplay_taking_heavy_damage_19",
				"pes_gameplay_taking_heavy_damage_20",
				"pes_gameplay_taking_heavy_damage_21"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_taking_heavy_damage_10",
				"pes_gameplay_taking_heavy_damage_11",
				"pes_gameplay_taking_heavy_damage_12",
				"pes_gameplay_taking_heavy_damage_13",
				"pes_gameplay_taking_heavy_damage_14",
				"pes_gameplay_taking_heavy_damage_15",
				"pes_gameplay_taking_heavy_damage_16",
				"pes_gameplay_taking_heavy_damage_17",
				"pes_gameplay_taking_heavy_damage_18",
				"pes_gameplay_taking_heavy_damage_19",
				"pes_gameplay_taking_heavy_damage_20",
				"pes_gameplay_taking_heavy_damage_21"
			},
			sound_events_duration = {
				2.0765209197998,
				2.1640832424164,
				3.1448125839233,
				2.4996666908264,
				2.5320415496826,
				2.710697889328,
				2.8180000782013,
				2.4649374485016,
				3.8692290782928,
				2.3694167137146,
				3.0822291374206,
				2.5146040916443
			}
		},
		pes_gameplay_tension_no_enemies = {
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "empire_soldier_honduras",
			sound_events_n = 14,
			category = "casual_talk",
			dialogue_animations_n = 14,
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
				"dialogue_talk"
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_tension_no_enemies_09",
				"pes_gameplay_tension_no_enemies_10",
				"pes_gameplay_tension_no_enemies_11",
				"pes_gameplay_tension_no_enemies_12",
				"pes_gameplay_tension_no_enemies_13",
				"pes_gameplay_tension_no_enemies_14",
				"pes_gameplay_tension_no_enemies_15",
				"pes_gameplay_tension_no_enemies_16",
				"pes_gameplay_tension_no_enemies_17",
				"pes_gameplay_tension_no_enemies_18",
				"pes_gameplay_tension_no_enemies_19",
				"pes_gameplay_tension_no_enemies_20",
				"pes_gameplay_tension_no_enemies_21",
				"pes_gameplay_tension_no_enemies_22"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_tension_no_enemies_09",
				"pes_gameplay_tension_no_enemies_10",
				"pes_gameplay_tension_no_enemies_11",
				"pes_gameplay_tension_no_enemies_12",
				"pes_gameplay_tension_no_enemies_13",
				"pes_gameplay_tension_no_enemies_14",
				"pes_gameplay_tension_no_enemies_15",
				"pes_gameplay_tension_no_enemies_16",
				"pes_gameplay_tension_no_enemies_17",
				"pes_gameplay_tension_no_enemies_18",
				"pes_gameplay_tension_no_enemies_19",
				"pes_gameplay_tension_no_enemies_20",
				"pes_gameplay_tension_no_enemies_21",
				"pes_gameplay_tension_no_enemies_22"
			},
			sound_events_duration = {
				2.5494582653046,
				2.2474582195282,
				2.6116042137146,
				2.7171459197998,
				2.0209167003632,
				3.7557082176209,
				3.8467500209808,
				4.3919792175293,
				4.6895623207092,
				2.9695521593094,
				4.2666668891907,
				3.7225625514984,
				3.1173124313355,
				4.3376665115356
			}
		},
		pes_gameplay_throwing_bomb = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_throwing_bomb_01",
				"pes_gameplay_throwing_bomb_03",
				"pes_gameplay_throwing_bomb_06",
				"pes_gameplay_throwing_bomb_07",
				"pes_gameplay_throwing_bomb_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_throwing_bomb_01",
				"pes_gameplay_throwing_bomb_03",
				"pes_gameplay_throwing_bomb_06",
				"pes_gameplay_throwing_bomb_07",
				"pes_gameplay_throwing_bomb_08"
			},
			sound_events_duration = {
				0.97354167699814,
				0.86779165267944,
				1.5438541173935,
				1.3927083015442,
				1.0770000219345
			}
		},
		pes_gameplay_using_potion = {
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "empire_soldier_honduras",
			sound_events_n = 13,
			category = "player_feedback",
			dialogue_animations_n = 13,
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
				"dialogue_talk"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_using_potion_06",
				"pes_gameplay_using_potion_07",
				"pes_gameplay_using_potion_08",
				"pes_gameplay_using_potion_09",
				"pes_gameplay_using_potion_10",
				"pes_gameplay_using_potion_11",
				"pes_gameplay_using_potion_12",
				"pes_gameplay_using_potion_13",
				"pes_gameplay_using_potion_14",
				"pes_gameplay_using_potion_15",
				"pes_gameplay_using_potion_16",
				"pes_gameplay_using_potion_17",
				"pes_gameplay_using_potion_17"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_using_potion_06",
				"pes_gameplay_using_potion_07",
				"pes_gameplay_using_potion_08",
				"pes_gameplay_using_potion_09",
				"pes_gameplay_using_potion_10",
				"pes_gameplay_using_potion_11",
				"pes_gameplay_using_potion_12",
				"pes_gameplay_using_potion_13",
				"pes_gameplay_using_potion_14",
				"pes_gameplay_using_potion_15",
				"pes_gameplay_using_potion_16",
				"pes_gameplay_using_potion_17",
				"pes_gameplay_using_potion_17"
			},
			sound_events_duration = {
				2.3868020176887,
				3.0466666221619,
				1.3427916765213,
				1.075291633606,
				3.0904791355133,
				0.90324997901917,
				2.1392707824707,
				2.1170625686645,
				2.2873332500458,
				3.5207290649414,
				1.7713749408722,
				1.9331250190735,
				1.9331250190735
			}
		},
		pes_gameplay_weapon_flair_defensive = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_activating_magic_weapon_defensive_01",
				"pes_gameplay_activating_magic_weapon_defensive_02",
				"pes_gameplay_activating_magic_weapon_defensive_03",
				"pes_gameplay_activating_magic_weapon_defensive_04",
				"pes_gameplay_activating_magic_weapon_defensive_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_activating_magic_weapon_defensive_01",
				"pes_gameplay_activating_magic_weapon_defensive_02",
				"pes_gameplay_activating_magic_weapon_defensive_03",
				"pes_gameplay_activating_magic_weapon_defensive_04",
				"pes_gameplay_activating_magic_weapon_defensive_05"
			},
			sound_events_duration = {
				2.825875043869,
				2.357062458992,
				1.1568125486374,
				1.4805624485016,
				1.6468125581741
			}
		},
		pes_gameplay_weapon_flair_offensive = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_activating_magic_weapon_offensive_01",
				"pes_gameplay_activating_magic_weapon_offensive_02",
				"pes_gameplay_activating_magic_weapon_offensive_03",
				"pes_gameplay_activating_magic_weapon_offensive_04",
				"pes_gameplay_activating_magic_weapon_offensive_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_activating_magic_weapon_offensive_01",
				"pes_gameplay_activating_magic_weapon_offensive_02",
				"pes_gameplay_activating_magic_weapon_offensive_03",
				"pes_gameplay_activating_magic_weapon_offensive_04",
				"pes_gameplay_activating_magic_weapon_offensive_05"
			},
			sound_events_duration = {
				2.1242709159851,
				1.8866875171661,
				2.457270860672,
				1.5628124475479,
				1.7028332948685
			}
		},
		pes_gameplay_witch_hunter_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_witch_hunter_being_helped_up_01",
				"pes_gameplay_witch_hunter_being_helped_up_04",
				"pes_gameplay_witch_hunter_being_helped_up_05",
				"pes_gameplay_witch_hunter_being_helped_up_06",
				"pes_gameplay_witch_hunter_being_helped_up_07",
				"pes_gameplay_witch_hunter_being_helped_up_08",
				"pes_gameplay_witch_hunter_being_helped_up_09",
				"pes_gameplay_witch_hunter_being_helped_up_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_witch_hunter_being_helped_up_01",
				"pes_gameplay_witch_hunter_being_helped_up_04",
				"pes_gameplay_witch_hunter_being_helped_up_05",
				"pes_gameplay_witch_hunter_being_helped_up_06",
				"pes_gameplay_witch_hunter_being_helped_up_07",
				"pes_gameplay_witch_hunter_being_helped_up_08",
				"pes_gameplay_witch_hunter_being_helped_up_09",
				"pes_gameplay_witch_hunter_being_helped_up_10"
			},
			sound_events_duration = {
				1.1166249811649,
				1.125,
				2.1772916913033,
				2.4727084040642,
				1.2745104432106,
				1.9975103735924,
				1.247250020504,
				3.5901770591736
			}
		},
		pes_gameplay_witch_hunter_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_witch_hunter_dead_04",
				"pes_gameplay_witch_hunter_dead_05",
				"pes_gameplay_witch_hunter_dead_06",
				"pes_gameplay_witch_hunter_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_witch_hunter_dead_04",
				"pes_gameplay_witch_hunter_dead_05",
				"pes_gameplay_witch_hunter_dead_06",
				"pes_gameplay_witch_hunter_dead_07"
			},
			sound_events_duration = {
				1.4584374427795,
				1.7827291488648,
				1.780729174614,
				2.4828751087189
			}
		},
		pes_gameplay_witch_hunter_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "player_feedback",
			dialogue_animations_n = 6,
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
				"pes_witch_hunter_eaten_01",
				"pes_witch_hunter_eaten_02",
				"pes_witch_hunter_eaten_03",
				"pes_witch_hunter_eaten_04",
				"pes_witch_hunter_eaten_05",
				"pes_witch_hunter_eaten_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_witch_hunter_eaten_01",
				"pes_witch_hunter_eaten_02",
				"pes_witch_hunter_eaten_03",
				"pes_witch_hunter_eaten_04",
				"pes_witch_hunter_eaten_05",
				"pes_witch_hunter_eaten_06"
			},
			sound_events_duration = {
				3.6645832657814,
				5.5493125915527,
				3.286812543869,
				4.5640834569931,
				7.7440414428711,
				2.3623750209808
			}
		},
		pes_gameplay_witch_hunter_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "empire_soldier_honduras",
			sound_events_n = 9,
			category = "player_alerts",
			dialogue_animations_n = 9,
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
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_06",
				"pes_gameplay_witch_hunter_grabbed_07",
				"pes_gameplay_witch_hunter_grabbed_08",
				"pes_gameplay_witch_hunter_grabbed_09",
				"pes_gameplay_witch_hunter_grabbed_10",
				"pes_gameplay_witch_hunter_grabbed_11",
				"pes_gameplay_witch_hunter_grabbed_12",
				"pes_gameplay_witch_hunter_grabbed_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_06",
				"pes_gameplay_witch_hunter_grabbed_07",
				"pes_gameplay_witch_hunter_grabbed_08",
				"pes_gameplay_witch_hunter_grabbed_09",
				"pes_gameplay_witch_hunter_grabbed_10",
				"pes_gameplay_witch_hunter_grabbed_11",
				"pes_gameplay_witch_hunter_grabbed_12",
				"pes_gameplay_witch_hunter_grabbed_13"
			},
			sound_events_duration = {
				2.925083398819,
				2.9000415802002,
				3.3603541851044,
				3.5836458206177,
				2.0309375524521,
				5.2601251602173,
				2.6294167041779,
				3.5905208587647,
				1.4511666297913
			}
		},
		pes_gameplay_witch_hunter_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_witch_hunter_low_on_health_01",
				"pes_gameplay_witch_hunter_low_on_health_05",
				"pes_gameplay_witch_hunter_low_on_health_06",
				"pes_gameplay_witch_hunter_low_on_health_07",
				"pes_gameplay_witch_hunter_low_on_health_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_witch_hunter_low_on_health_01",
				"pes_gameplay_witch_hunter_low_on_health_05",
				"pes_gameplay_witch_hunter_low_on_health_06",
				"pes_gameplay_witch_hunter_low_on_health_07",
				"pes_gameplay_witch_hunter_low_on_health_09"
			},
			sound_events_duration = {
				1.0624687373638,
				1.1834062337875,
				2.1568124890327,
				1.1668437719345,
				1.8022395968437
			}
		},
		pes_gameplay_witch_hunter_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
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
			localization_strings = {
				"pes_gameplay_witch_hunter_on_a_frenzy_05",
				"pes_gameplay_witch_hunter_on_a_frenzy_06",
				"pes_gameplay_witch_hunter_on_a_frenzy_07",
				"pes_gameplay_witch_hunter_on_a_frenzy_08",
				"pes_gameplay_witch_hunter_on_a_frenzy_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_witch_hunter_on_a_frenzy_05",
				"pes_gameplay_witch_hunter_on_a_frenzy_06",
				"pes_gameplay_witch_hunter_on_a_frenzy_07",
				"pes_gameplay_witch_hunter_on_a_frenzy_08",
				"pes_gameplay_witch_hunter_on_a_frenzy_09"
			},
			sound_events_duration = {
				2.2110208272934,
				2.4538540840149,
				2.6810103654861,
				2.2617604732513,
				3.3023645877838
			}
		},
		pes_gameplay_wood_elf_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_being_helped_up_01",
				"pes_gameplay_wood_elf_being_helped_up_02",
				"pes_gameplay_wood_elf_being_helped_up_05",
				"pes_gameplay_wood_elf_being_helped_up_06",
				"pes_gameplay_wood_elf_being_helped_up_07",
				"pes_gameplay_wood_elf_being_helped_up_08",
				"pes_gameplay_wood_elf_being_helped_up_09",
				"pes_gameplay_wood_elf_being_helped_up_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_wood_elf_being_helped_up_01",
				"pes_gameplay_wood_elf_being_helped_up_02",
				"pes_gameplay_wood_elf_being_helped_up_05",
				"pes_gameplay_wood_elf_being_helped_up_06",
				"pes_gameplay_wood_elf_being_helped_up_07",
				"pes_gameplay_wood_elf_being_helped_up_08",
				"pes_gameplay_wood_elf_being_helped_up_09",
				"pes_gameplay_wood_elf_being_helped_up_10"
			},
			sound_events_duration = {
				1.0759999752045,
				0.84172916412354,
				1.7598541975021,
				2.6215207576752,
				2.9243957996368,
				2.8300623893738,
				1.1249375343323,
				1.6879374980927
			}
		},
		pes_gameplay_wood_elf_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_alerts",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_sadness",
				"face_sadness",
				"face_sadness",
				"face_sadness"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_dead_04",
				"pes_gameplay_wood_elf_dead_05",
				"pes_gameplay_wood_elf_dead_06",
				"pes_gameplay_wood_elf_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_wood_elf_dead_04",
				"pes_gameplay_wood_elf_dead_05",
				"pes_gameplay_wood_elf_dead_06",
				"pes_gameplay_wood_elf_dead_07"
			},
			sound_events_duration = {
				2.6540832519531,
				1.584104180336,
				3.4997916221619,
				1.6931250095367
			}
		},
		pes_gameplay_wood_elf_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "player_feedback",
			dialogue_animations_n = 6,
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
				"pes_wood_elf_eaten_01",
				"pes_wood_elf_eaten_02",
				"pes_wood_elf_eaten_03",
				"pes_wood_elf_eaten_04",
				"pes_wood_elf_eaten_05",
				"pes_wood_elf_eaten_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_wood_elf_eaten_01",
				"pes_wood_elf_eaten_02",
				"pes_wood_elf_eaten_03",
				"pes_wood_elf_eaten_04",
				"pes_wood_elf_eaten_05",
				"pes_wood_elf_eaten_06"
			},
			sound_events_duration = {
				5.1081457138061,
				4.7625104188919,
				5.4041042327881,
				9.2661457061768,
				8.3173961639404,
				7.7153334617615
			}
		},
		pes_gameplay_wood_elf_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "empire_soldier_honduras",
			sound_events_n = 7,
			category = "player_alerts",
			dialogue_animations_n = 7,
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_07",
				"pes_gameplay_wood_elf_grabbed_08",
				"pes_gameplay_wood_elf_grabbed_09",
				"pes_gameplay_wood_elf_grabbed_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_07",
				"pes_gameplay_wood_elf_grabbed_08",
				"pes_gameplay_wood_elf_grabbed_09",
				"pes_gameplay_wood_elf_grabbed_10"
			},
			sound_events_duration = {
				1.2238124608993,
				1.5253541469574,
				1.3945416212082,
				2.229291677475,
				1.201291680336,
				2.2061250209808,
				1.6000000238419
			}
		},
		pes_gameplay_wood_elf_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "player_feedback",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pes_gameplay_wood_elf_low_on_health_05",
				"pes_gameplay_wood_elf_low_on_health_06",
				"pes_gameplay_wood_elf_low_on_health_07",
				"pes_gameplay_wood_elf_low_on_health_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_wood_elf_low_on_health_05",
				"pes_gameplay_wood_elf_low_on_health_06",
				"pes_gameplay_wood_elf_low_on_health_07",
				"pes_gameplay_wood_elf_low_on_health_08"
			},
			sound_events_duration = {
				3.0590417385101,
				1.786291718483,
				1.6073958873749,
				3.2092082500458
			}
		},
		pes_gameplay_wood_elf_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
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
			localization_strings = {
				"pes_gameplay_wood_elf_on_a_frenzy_04",
				"pes_gameplay_wood_elf_on_a_frenzy_05",
				"pes_gameplay_wood_elf_on_a_frenzy_06",
				"pes_gameplay_wood_elf_on_a_frenzy_07",
				"pes_gameplay_wood_elf_on_a_frenzy_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_gameplay_wood_elf_on_a_frenzy_04",
				"pes_gameplay_wood_elf_on_a_frenzy_05",
				"pes_gameplay_wood_elf_on_a_frenzy_06",
				"pes_gameplay_wood_elf_on_a_frenzy_07",
				"pes_gameplay_wood_elf_on_a_frenzy_08"
			},
			sound_events_duration = {
				5.4735207557678,
				3.0215208530426,
				5.4224166870117,
				4.357937335968,
				6.0621457099915
			}
		},
		pes_last_hero_standing = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_alerts",
			dialogue_animations_n = 8,
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
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pes_last_hero_standing_01",
				"pes_last_hero_standing_02",
				"pes_last_hero_standing_03",
				"pes_last_hero_standing_04",
				"pes_last_hero_standing_05",
				"pes_last_hero_standing_06",
				"pes_last_hero_standing_07",
				"pes_last_hero_standing_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_last_hero_standing_01",
				"pes_last_hero_standing_02",
				"pes_last_hero_standing_03",
				"pes_last_hero_standing_04",
				"pes_last_hero_standing_05",
				"pes_last_hero_standing_06",
				"pes_last_hero_standing_07",
				"pes_last_hero_standing_08"
			},
			sound_events_duration = {
				3.5355000495911,
				4.171395778656,
				2.5398540496826,
				2.7241562604904,
				5.1179375648499,
				4.2921667098999,
				2.925187587738,
				6.2219166755676
			}
		},
		pes_objective_achieved_all_but_one_goal = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "player_feedback",
			dialogue_animations_n = 6,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_achieved_all_but_one_goal_01",
				"pes_objective_achieved_all_but_one_goal_03",
				"pes_objective_achieved_all_but_one_goal_04",
				"pes_objective_achieved_all_but_one_goal_05",
				"pes_objective_achieved_all_but_one_goal_06",
				"pes_objective_achieved_all_but_one_goal_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_achieved_all_but_one_goal_01",
				"pes_objective_achieved_all_but_one_goal_03",
				"pes_objective_achieved_all_but_one_goal_04",
				"pes_objective_achieved_all_but_one_goal_05",
				"pes_objective_achieved_all_but_one_goal_06",
				"pes_objective_achieved_all_but_one_goal_09"
			},
			sound_events_duration = {
				1.0951458215714,
				1.0240416526794,
				1.6404166221619,
				1.6629791259766,
				1.4805624485016,
				2.5228126049042
			}
		},
		pes_objective_correct_path_across = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "guidance",
			dialogue_animations_n = 4,
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
				"pes_objective_correct_path_across_01",
				"pes_objective_correct_path_across_02",
				"pes_objective_correct_path_across_03",
				"pes_objective_correct_path_across_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_across_01",
				"pes_objective_correct_path_across_02",
				"pes_objective_correct_path_across_03",
				"pes_objective_correct_path_across_04"
			},
			sound_events_duration = {
				1.3494791984558,
				1.607125043869,
				0.90691667795181,
				1.3355000019074
			}
		},
		pes_objective_correct_path_alley = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "guidance",
			dialogue_animations_n = 4,
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
				"pes_objective_correct_path_alley_01",
				"pes_objective_correct_path_alley_02",
				"pes_objective_correct_path_alley_03",
				"pes_objective_correct_path_alley_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_alley_01",
				"pes_objective_correct_path_alley_02",
				"pes_objective_correct_path_alley_03",
				"pes_objective_correct_path_alley_04"
			},
			sound_events_duration = {
				1.2889167070389,
				0.93420833349228,
				1.1540416479111,
				1.2356458902359
			}
		},
		pes_objective_correct_path_bridge = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "empire_soldier_honduras",
			sound_events_n = 3,
			category = "guidance",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_correct_path_bridge_15",
				"pes_objective_correct_path_bridge_17",
				"pes_objective_correct_path_bridge_18"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_bridge_15",
				"pes_objective_correct_path_bridge_17",
				"pes_objective_correct_path_bridge_18"
			},
			sound_events_duration = {
				1.3894166946411,
				1.4055416584015,
				2.1084582805634
			}
		},
		pes_objective_correct_path_door = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "guidance",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_correct_path_door_01",
				"pes_objective_correct_path_door_02",
				"pes_objective_correct_path_door_05",
				"pes_objective_correct_path_door_06",
				"pes_objective_correct_path_door_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_door_01",
				"pes_objective_correct_path_door_02",
				"pes_objective_correct_path_door_05",
				"pes_objective_correct_path_door_06",
				"pes_objective_correct_path_door_07"
			},
			sound_events_duration = {
				1.2175832986832,
				0.91670835018158,
				2.6286873817444,
				0.91983336210251,
				1.0667916536331
			}
		},
		pes_objective_correct_path_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "guidance",
			dialogue_animations_n = 4,
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
				"pes_objective_correct_path_down_01",
				"pes_objective_correct_path_down_02",
				"pes_objective_correct_path_down_04",
				"pes_objective_correct_path_down_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_down_01",
				"pes_objective_correct_path_down_02",
				"pes_objective_correct_path_down_04",
				"pes_objective_correct_path_down_05"
			},
			sound_events_duration = {
				0.88533335924149,
				1.4690208435059,
				0.88533335924149,
				1.6513124704361
			}
		},
		pes_objective_correct_path_ladder_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "guidance",
			dialogue_animations_n = 4,
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
				"pes_objective_correct_path_ladder_down_01",
				"pes_objective_correct_path_ladder_down_02",
				"pes_objective_correct_path_ladder_down_03",
				"pes_objective_correct_path_ladder_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_ladder_down_01",
				"pes_objective_correct_path_ladder_down_02",
				"pes_objective_correct_path_ladder_down_03",
				"pes_objective_correct_path_ladder_down_04"
			},
			sound_events_duration = {
				1.0872917175293,
				1.1881250143051,
				1.0227291584015,
				1.4190000295639
			}
		},
		pes_objective_correct_path_ladder_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "guidance",
			dialogue_animations_n = 4,
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
				"pes_objective_correct_path_ladder_up_01",
				"pes_objective_correct_path_ladder_up_02",
				"pes_objective_correct_path_ladder_up_03",
				"pes_objective_correct_path_ladder_up_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_ladder_up_01",
				"pes_objective_correct_path_ladder_up_02",
				"pes_objective_correct_path_ladder_up_03",
				"pes_objective_correct_path_ladder_up_04"
			},
			sound_events_duration = {
				1.1364375352859,
				1.2652499675751,
				2.189270734787,
				0.84970831871033
			}
		},
		pes_objective_correct_path_stairs_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "guidance",
			dialogue_animations_n = 4,
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
				"pes_objective_correct_path_stairs_down_01",
				"pes_objective_correct_path_stairs_down_04",
				"pes_objective_correct_path_stairs_down_05",
				"pes_objective_correct_path_stairs_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_stairs_down_01",
				"pes_objective_correct_path_stairs_down_04",
				"pes_objective_correct_path_stairs_down_05",
				"pes_objective_correct_path_stairs_down_06"
			},
			sound_events_duration = {
				0.80083334445953,
				1.8931457996368,
				2.1068332195282,
				2.5751667022705
			}
		},
		pes_objective_correct_path_stairs_up = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "guidance",
			dialogue_animations_n = 5,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_correct_path_stairs_up_05",
				"pes_objective_correct_path_stairs_up_06",
				"pes_objective_correct_path_stairs_up_07",
				"pes_objective_correct_path_stairs_up_08",
				"pes_objective_correct_path_stairs_up_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_stairs_up_05",
				"pes_objective_correct_path_stairs_up_06",
				"pes_objective_correct_path_stairs_up_07",
				"pes_objective_correct_path_stairs_up_08",
				"pes_objective_correct_path_stairs_up_09"
			},
			sound_events_duration = {
				1.6878541707993,
				1.7917499542236,
				1.500895857811,
				1.8144791126251,
				2.3200623989105
			}
		},
		pes_objective_correct_path_street = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "guidance",
			dialogue_animations_n = 4,
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
				"pes_objective_correct_path_street_01",
				"pes_objective_correct_path_street_04",
				"pes_objective_correct_path_street_05",
				"pes_objective_correct_path_street_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_street_01",
				"pes_objective_correct_path_street_04",
				"pes_objective_correct_path_street_05",
				"pes_objective_correct_path_street_06"
			},
			sound_events_duration = {
				1.5993750095367,
				1.3937499523163,
				1.5167917013168,
				1.5372916460037
			}
		},
		pes_objective_correct_path_this_way = {
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "empire_soldier_honduras",
			sound_events_n = 2,
			category = "guidance",
			dialogue_animations_n = 2,
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_neutral",
				[2.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pes_objective_correct_path_this_way_01",
				[2.0] = "pes_objective_correct_path_this_way_13"
			},
			randomize_indexes = {},
			sound_events = {
				[1.0] = "pes_objective_correct_path_this_way_01",
				[2.0] = "pes_objective_correct_path_this_way_13"
			},
			sound_events_duration = {
				[1.0] = 0.82760417461395,
				[2.0] = 1.60256254673
			}
		},
		pes_objective_correct_path_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "empire_soldier_honduras",
			sound_events_n = 4,
			category = "guidance",
			dialogue_animations_n = 4,
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
				"pes_objective_correct_path_up",
				"pes_objective_correct_path_up_02",
				"pes_objective_correct_path_up_03",
				"pes_objective_correct_path_up_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_correct_path_up",
				"pes_objective_correct_path_up_02",
				"pes_objective_correct_path_up_03",
				"pes_objective_correct_path_up_04"
			},
			sound_events_duration = {
				0.85166668891907,
				1.1632083654404,
				0.82685416936874,
				0.84589582681656
			}
		},
		pes_objective_goal_achieved_escape = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "empire_soldier_honduras",
			sound_events_n = 6,
			category = "player_feedback",
			dialogue_animations_n = 6,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_goal_achieved_escape_04",
				"pes_objective_goal_achieved_escape_05",
				"pes_objective_goal_achieved_escape_06",
				"pes_objective_goal_achieved_escape_07",
				"pes_objective_goal_achieved_escape_08",
				"pes_objective_goal_achieved_escape_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_goal_achieved_escape_04",
				"pes_objective_goal_achieved_escape_05",
				"pes_objective_goal_achieved_escape_06",
				"pes_objective_goal_achieved_escape_07",
				"pes_objective_goal_achieved_escape_08",
				"pes_objective_goal_achieved_escape_09"
			},
			sound_events_duration = {
				0.99852085113525,
				3.1450207233429,
				2.000479221344,
				1.378666639328,
				1.9539583921433,
				1.6422291994095
			}
		},
		pes_objective_goal_achieved_more_left = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
			dialogue_animations = {
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
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_goal_achieved_more_left_01",
				"pes_objective_goal_achieved_more_left_04",
				"pes_objective_goal_achieved_more_left_06",
				"pes_objective_goal_achieved_more_left_09",
				"pes_objective_goal_achieved_more_left_10",
				"pes_objective_goal_achieved_more_left_11",
				"pes_objective_goal_achieved_more_left_12",
				"pes_objective_goal_achieved_more_left_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_goal_achieved_more_left_01",
				"pes_objective_goal_achieved_more_left_04",
				"pes_objective_goal_achieved_more_left_06",
				"pes_objective_goal_achieved_more_left_09",
				"pes_objective_goal_achieved_more_left_10",
				"pes_objective_goal_achieved_more_left_11",
				"pes_objective_goal_achieved_more_left_12",
				"pes_objective_goal_achieved_more_left_13"
			},
			sound_events_duration = {
				1.2025417089462,
				0.80210417509079,
				1.0707499980927,
				2.4456875324249,
				0.79991668462753,
				1.7997499704361,
				1.9791874885559,
				1.4331874847412
			}
		},
		pes_objective_interacting_with_objective = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "empire_soldier_honduras",
			sound_events_n = 5,
			category = "player_feedback",
			dialogue_animations_n = 5,
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
			localization_strings = {
				"pes_objective_interacting_with_objective_02",
				"pes_objective_interacting_with_objective_04",
				"pes_objective_interacting_with_objective_05",
				"pes_objective_interacting_with_objective_06",
				"pes_objective_interacting_with_objective_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_interacting_with_objective_02",
				"pes_objective_interacting_with_objective_04",
				"pes_objective_interacting_with_objective_05",
				"pes_objective_interacting_with_objective_06",
				"pes_objective_interacting_with_objective_07"
			},
			sound_events_duration = {
				0.89714580774307,
				2.4570207595825,
				1.8934270143509,
				2.4113957881927,
				0.832270860672
			}
		},
		pes_objective_nearing_objective_deadline = {
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "empire_soldier_honduras",
			sound_events_n = 3,
			category = "player_feedback",
			dialogue_animations_n = 3,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pes_objective_nearing_objective_deadline_01",
				"pes_objective_nearing_objective_deadline_02",
				"pes_objective_nearing_objective_deadline_03"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_objective_nearing_objective_deadline_01",
				"pes_objective_nearing_objective_deadline_02",
				"pes_objective_nearing_objective_deadline_03"
			},
			sound_events_duration = {
				0.48964583873749,
				0.64520835876465,
				1.5540624856949
			}
		},
		pes_targeted_by_ratling = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "empire_soldier_honduras",
			sound_events_n = 8,
			category = "player_feedback",
			dialogue_animations_n = 8,
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
				"pes_targeted_by_ratling_09",
				"pes_targeted_by_ratling_10",
				"pes_targeted_by_ratling_11",
				"pes_targeted_by_ratling_12",
				"pes_targeted_by_ratling_13",
				"pes_targeted_by_ratling_14",
				"pes_targeted_by_ratling_15",
				"pes_targeted_by_ratling_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pes_targeted_by_ratling_09",
				"pes_targeted_by_ratling_10",
				"pes_targeted_by_ratling_11",
				"pes_targeted_by_ratling_12",
				"pes_targeted_by_ratling_13",
				"pes_targeted_by_ratling_14",
				"pes_targeted_by_ratling_15",
				"pes_targeted_by_ratling_16"
			},
			sound_events_duration = {
				2.2133541107178,
				2.3333749771118,
				1.5521874427795,
				2.2633957862854,
				2.663583278656,
				2.3358540534973,
				1.702187538147,
				1.7905000448227
			}
		}
	})
end
