return function ()
	define_rule({
		response = "pbw_activate_ability_battle_wizard",
		name = "pbw_activate_ability_battle_wizard",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_adept"
			}
		}
	})
	define_rule({
		response = "pbw_activate_ability_pyromancer",
		name = "pbw_activate_ability_pyromancer",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_scholar"
			}
		}
	})
	define_rule({
		response = "pbw_activate_ability_unchained",
		name = "pbw_activate_ability_unchained",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"bw_unchained"
			}
		}
	})
	define_rule({
		name = "pbw_curse",
		response = "pbw_curse",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_curse_forced",
		response = "pbw_curse_forced",
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
		name = "pbw_gameplay_ambush_horde_spawned",
		response = "pbw_gameplay_ambush_horde_spawned",
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
		name = "pbw_gameplay_armoured_enemy_dwarf",
		response = "pbw_gameplay_armoured_enemy_dwarf",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_armoured_enemy_empire_soldier",
		response = "pbw_gameplay_armoured_enemy_empire_soldier",
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
				"bright_wizard"
			},
			{
				"query_context",
				"profile_name",
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
		name = "pbw_gameplay_armoured_enemy_witch_hunter",
		response = "pbw_gameplay_armoured_enemy_witch_hunter",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_armoured_enemy_wood_elf",
		response = "pbw_gameplay_armoured_enemy_wood_elf",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_bile_troll_before_puke",
		response = "pbw_gameplay_bile_troll_before_puke",
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
		name = "pbw_gameplay_bile_troll_incapacitaded",
		response = "pbw_gameplay_bile_troll_incapacitaded",
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
		name = "pbw_gameplay_casual_quotes",
		response = "pbw_gameplay_casual_quotes",
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
				"friends_close",
				OP.GT,
				1
			},
			{
				"user_context",
				"enemies_distant",
				OP.LT,
				5
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
		name = "pbw_gameplay_dead_body",
		response = "pbw_gameplay_dead_body",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_gameplay_dead_end",
		response = "pbw_gameplay_dead_end",
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
		response = "pbw_gameplay_dwarf_ranger_being_helped",
		name = "pbw_gameplay_dwarf_ranger_being_helped",
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
		name = "pbw_gameplay_dwarf_ranger_dead",
		response = "pbw_gameplay_dwarf_ranger_dead",
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
		name = "pbw_gameplay_dwarf_ranger_eaten",
		response = "pbw_gameplay_dwarf_ranger_eaten",
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
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				1
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
		name = "pbw_gameplay_dwarf_ranger_grabbed",
		response = "pbw_gameplay_dwarf_ranger_grabbed",
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
		name = "pbw_gameplay_dwarf_ranger_low_on_health",
		response = "pbw_gameplay_dwarf_ranger_low_on_health",
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
				"bright_wizard"
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
		name = "pbw_gameplay_dwarf_ranger_on_a_frenzy",
		response = "pbw_gameplay_dwarf_ranger_on_a_frenzy",
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
				"bright_wizard"
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
		response = "pbw_gameplay_empire_soldier_being_helped_up",
		name = "pbw_gameplay_empire_soldier_being_helped_up",
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
		name = "pbw_gameplay_empire_soldier_dead",
		response = "pbw_gameplay_empire_soldier_dead",
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
				"time_since_pes_death",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_pes_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_empire_soldier_eaten",
		response = "pbw_gameplay_empire_soldier_eaten",
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
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				1
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
		name = "pbw_gameplay_empire_soldier_grabbed",
		response = "pbw_gameplay_empire_soldier_grabbed",
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
		name = "pbw_gameplay_empire_soldier_low_on_health",
		response = "pbw_gameplay_empire_soldier_low_on_health",
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
				"pes_gameplay_low_on_health"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"time_since_low_health_pes",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_low_health_pes",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_empire_soldier_on_a_frenzy",
		response = "pbw_gameplay_empire_soldier_on_a_frenzy",
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
				"time_since_last_frenzy_empire_soldier",
				OP.TIMEDIFF,
				OP.GT,
				1200
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_last_frenzy_empire_soldier",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_encouraging_words",
		response = "pbw_gameplay_encouraging_words",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_gameplay_friendly_fire_dwarf_ranger",
		response = "pbw_gameplay_friendly_fire_dwarf_ranger",
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
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_friendly_fire_empire_soldier",
		response = "pbw_gameplay_friendly_fire_empire_soldier",
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
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"query_context",
				"player_profile",
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
		name = "pbw_gameplay_friendly_fire_witch_hunter",
		response = "pbw_gameplay_friendly_fire_witch_hunter",
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
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_friendly_fire_wood_elf",
		response = "pbw_gameplay_friendly_fire_wood_elf",
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
				"bright_wizard"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_globadier_guck",
		response = "pbw_gameplay_globadier_guck",
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
		name = "pbw_gameplay_healing_draught",
		response = "pbw_gameplay_healing_draught",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_healing_dwarf_ranger",
		response = "pbw_gameplay_healing_dwarf_ranger",
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
		name = "pbw_gameplay_healing_empire_soldier",
		response = "pbw_gameplay_healing_empire_soldier",
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
		name = "pbw_gameplay_healing_witch_hunter",
		response = "pbw_gameplay_healing_witch_hunter",
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
		name = "pbw_gameplay_healing_wood_elf",
		response = "pbw_gameplay_healing_wood_elf",
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
		name = "pbw_gameplay_heard_dwarf_ranger_in_trouble",
		response = "pbw_gameplay_heard_dwarf_ranger_in_trouble",
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
				"times_down_dwarf_ranger",
				OP.NEQ,
				2
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
		name = "pbw_gameplay_heard_empire_soldier_in_trouble",
		response = "pbw_gameplay_heard_empire_soldier_in_trouble",
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
				"pes_gameplay_knocked_down"
			},
			{
				"query_context",
				"speaker_name",
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
				"times_down_empire_soldier",
				OP.NEQ,
				2
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
		name = "pbw_gameplay_heard_witch_hunter_in_trouble",
		response = "pbw_gameplay_heard_witch_hunter_in_trouble",
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
				"times_down_witch_hunter",
				OP.NEQ,
				2
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
		name = "pbw_gameplay_heard_wood_elf_in_trouble",
		response = "pbw_gameplay_heard_wood_elf_in_trouble",
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
				"times_down_wood_elf",
				OP.NEQ,
				2
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
		name = "pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		response = "pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
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
		name = "pbw_gameplay_hearing_a_chaos_spawn_combat",
		response = "pbw_gameplay_hearing_a_chaos_spawn_combat",
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
		name = "pbw_gameplay_hearing_a_chaos_warrior_champion_combat",
		response = "pbw_gameplay_hearing_a_chaos_warrior_champion_combat",
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
				"chaos_exalted_champion"
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
				"last_seen_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_heard_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_heard_chaos_exalted_champion",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_chaos_warrior_combat",
		response = "pbw_gameplay_hearing_a_chaos_warrior_combat",
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
		name = "pbw_gameplay_hearing_a_chaos_wizard_plague_combat",
		response = "pbw_gameplay_hearing_a_chaos_wizard_plague_combat",
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
		name = "pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		response = "pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat",
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
				120
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
		name = "pbw_gameplay_hearing_a_chaos_wizard_wind_combat",
		response = "pbw_gameplay_hearing_a_chaos_wizard_wind_combat",
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
		name = "pbw_gameplay_hearing_a_gutter_runner_combat",
		response = "pbw_gameplay_hearing_a_gutter_runner_combat",
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
		name = "pbw_gameplay_hearing_a_minotaur",
		response = "pbw_gameplay_hearing_a_minotaur",
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
		name = "pbw_gameplay_hearing_a_skaven_rat_ogre_combat",
		response = "pbw_gameplay_hearing_a_skaven_rat_ogre_combat",
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
		name = "pbw_gameplay_hearing_a_skaven_ratling_gun",
		response = "pbw_gameplay_hearing_a_skaven_ratling_gun",
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
		name = "pbw_gameplay_hearing_a_skaven_ratling_gun_combat",
		response = "pbw_gameplay_hearing_a_skaven_ratling_gun_combat",
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
		name = "pbw_gameplay_hearing_a_standard_bearer",
		response = "pbw_gameplay_hearing_a_standard_bearer",
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
		name = "pbw_gameplay_hearing_a_standard_bearer_crater",
		response = "pbw_gameplay_hearing_a_standard_bearer_crater",
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
		name = "pbw_gameplay_hearing_a_stormfiend_combat",
		response = "pbw_gameplay_hearing_a_stormfiend_combat",
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
		name = "pbw_gameplay_hearing_a_troll_combat",
		response = "pbw_gameplay_hearing_a_troll_combat",
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
		name = "pbw_gameplay_hearing_marauder_berserker_combat",
		response = "pbw_gameplay_hearing_marauder_berserker_combat",
		criterias = {
			{
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
		name = "pbw_gameplay_hears_incoming_horde",
		response = "pbw_gameplay_hears_incoming_horde",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_gameplay_helped_by_dwarf_ranger",
		response = "pbw_gameplay_helped_by_dwarf_ranger",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_helped_by_empire_soldier",
		response = "pbw_gameplay_helped_by_empire_soldier",
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
				"bright_wizard"
			},
			{
				"query_context",
				"healer_name",
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
		name = "pbw_gameplay_helped_by_witch_hunter",
		response = "pbw_gameplay_helped_by_witch_hunter",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_helped_by_wood_elf",
		response = "pbw_gameplay_helped_by_wood_elf",
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
				"bright_wizard"
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
				"bright_wizard"
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
		response = "pbw_gameplay_hit_by_goo",
		name = "pbw_gameplay_hit_by_goo",
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
		name = "pbw_gameplay_incoming_attack",
		response = "pbw_gameplay_incoming_attack",
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
		name = "pbw_gameplay_incoming_bestigor_attack",
		response = "pbw_gameplay_incoming_bestigor_attack",
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
		name = "pbw_gameplay_incoming_globadier",
		response = "pbw_gameplay_incoming_globadier",
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
				"bright_wizard"
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
		name = "pbw_gameplay_incoming_skaven_rat_ogre",
		response = "pbw_gameplay_incoming_skaven_rat_ogre",
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
				"rat_ogre_charge"
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
		name = "pbw_gameplay_killing_a_chaos_warrior",
		response = "pbw_gameplay_killing_a_chaos_warrior",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_warrior_champion",
		response = "pbw_gameplay_killing_a_chaos_warrior_champion",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_wizard_plague",
		response = "pbw_gameplay_killing_a_chaos_wizard_plague",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_wizard_tentacle",
		response = "pbw_gameplay_killing_a_chaos_wizard_tentacle",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_wizard_wind",
		response = "pbw_gameplay_killing_a_chaos_wizard_wind",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_minotaur",
		response = "pbw_gameplay_killing_a_minotaur",
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
				"bright_wizard_special_kills_in_row",
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
				"empire_soldier_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_skaven_warpfire_thrower",
		response = "pbw_gameplay_killing_a_skaven_warpfire_thrower",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_stormfiend",
		response = "pbw_gameplay_killing_a_stormfiend",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_globadier",
		response = "pbw_gameplay_killing_globadier",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_gutterrunner",
		response = "pbw_gameplay_killing_gutterrunner",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_lootrat",
		response = "pbw_gameplay_killing_lootrat",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_packmaster",
		response = "pbw_gameplay_killing_packmaster",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_killing_ratling",
		response = "pbw_gameplay_killing_ratling",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			},
			{
				"faction_memory",
				"witch_hunter_special_kills_in_row",
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
		name = "pbw_gameplay_knocked_down",
		response = "pbw_gameplay_knocked_down",
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
				"times_down_bright_wizard",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_low_on_health",
		response = "pbw_gameplay_low_on_health",
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
		name = "pbw_gameplay_no_nearby_teammates",
		response = "pbw_gameplay_no_nearby_teammates",
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
				"bright_wizard"
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
		name = "pbw_gameplay_overcharge",
		response = "pbw_gameplay_overcharge",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"overcharge"
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
				"time_since_overcharge",
				OP.TIMEDIFF,
				OP.GT,
				300
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_overcharge",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_parry_dwarf_ranger",
		response = "pbw_gameplay_parry_dwarf_ranger",
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
		name = "pbw_gameplay_parry_empire_soldier",
		response = "pbw_gameplay_parry_empire_soldier",
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
		name = "pbw_gameplay_parry_witch_hunter",
		response = "pbw_gameplay_parry_witch_hunter",
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
		name = "pbw_gameplay_parry_wood_elf",
		response = "pbw_gameplay_parry_wood_elf",
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
		name = "pbw_gameplay_player_pounced",
		response = "pbw_gameplay_player_pounced",
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
		name = "pbw_gameplay_seeing_a_Skaven_warpfire_thrower",
		response = "pbw_gameplay_seeing_a_Skaven_warpfire_thrower",
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
				4
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
		name = "pbw_gameplay_seeing_a_chaos_spawn",
		response = "pbw_gameplay_seeing_a_chaos_spawn",
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
				4
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
		name = "pbw_gameplay_seeing_a_chaos_warrior",
		response = "pbw_gameplay_seeing_a_chaos_warrior",
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
				4
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
		name = "pbw_gameplay_seeing_a_chaos_warrior_champion_combat",
		response = "pbw_gameplay_seeing_a_chaos_warrior_champion_combat",
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
				4
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
		name = "pbw_gameplay_seeing_a_chaos_wizard_plague",
		response = "pbw_gameplay_seeing_a_chaos_wizard_plague",
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
				4
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
		name = "pbw_gameplay_seeing_a_chaos_wizard_tentacle",
		response = "pbw_gameplay_seeing_a_chaos_wizard_tentacle",
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
				4
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
		name = "pbw_gameplay_seeing_a_chaos_wizard_wind",
		response = "pbw_gameplay_seeing_a_chaos_wizard_wind",
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
				4
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
		name = "pbw_gameplay_seeing_a_globadier",
		response = "pbw_gameplay_seeing_a_globadier",
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
				4
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
		name = "pbw_gameplay_seeing_a_gutter_runner",
		response = "pbw_gameplay_seeing_a_gutter_runner",
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
				4
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
				"last_heard_gutter_runner",
				OP.EQ,
				OP.TIMEDIFF,
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
		name = "pbw_gameplay_seeing_a_pm",
		response = "pbw_gameplay_seeing_a_pm",
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
				4
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
		name = "pbw_gameplay_seeing_a_scr",
		response = "pbw_gameplay_seeing_a_scr",
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
				4
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
		name = "pbw_gameplay_seeing_a_shield_stormvermin",
		response = "pbw_gameplay_seeing_a_shield_stormvermin",
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
				4
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
		name = "pbw_gameplay_seeing_a_skaven_patrol_stormvermin",
		response = "pbw_gameplay_seeing_a_skaven_patrol_stormvermin",
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
				4
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
		name = "pbw_gameplay_seeing_a_skaven_rat_ogre",
		response = "pbw_gameplay_seeing_a_skaven_rat_ogre",
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
				4
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
		name = "pbw_gameplay_seeing_a_skaven_ratling_gun",
		response = "pbw_gameplay_seeing_a_skaven_ratling_gun",
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
				4
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
		name = "pbw_gameplay_seeing_a_skaven_slaver",
		response = "pbw_gameplay_seeing_a_skaven_slaver",
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
		name = "pbw_gameplay_seeing_a_stormfiend",
		response = "pbw_gameplay_seeing_a_stormfiend",
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
				4
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
		name = "pbw_gameplay_seeing_a_stormvermin",
		response = "pbw_gameplay_seeing_a_stormvermin",
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
		name = "pbw_gameplay_seeing_a_troll",
		response = "pbw_gameplay_seeing_a_troll",
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
				4
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
		name = "pbw_gameplay_seeing_a_ungor_archer",
		response = "pbw_gameplay_seeing_a_ungor_archer",
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
		name = "pbw_gameplay_self_heal",
		response = "pbw_gameplay_self_heal",
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
		name = "pbw_gameplay_special_enemy_kill_melee",
		response = "pbw_gameplay_special_enemy_kill_melee",
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
				"bright_wizard"
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
		name = "pbw_gameplay_special_enemy_kill_ranged",
		response = "pbw_gameplay_special_enemy_kill_ranged",
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
				"bright_wizard"
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
		name = "pbw_gameplay_spots_ammo",
		response = "pbw_gameplay_spots_ammo",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_gameplay_spots_bomb",
		response = "pbw_gameplay_spots_bomb",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_spots_health",
		response = "pbw_gameplay_spots_health",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_spots_potion",
		response = "pbw_gameplay_spots_potion",
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
				"bright_wizard"
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
				"bright_wizard"
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
		name = "pbw_gameplay_standard_bearer_buff_active",
		response = "pbw_gameplay_standard_bearer_buff_active",
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
		name = "pbw_gameplay_standard_bearer_buff_deactivated",
		response = "pbw_gameplay_standard_bearer_buff_deactivated",
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
		name = "pbw_gameplay_standard_bearer_has_planted_standard",
		response = "pbw_gameplay_standard_bearer_has_planted_standard",
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
		name = "pbw_gameplay_standard_bearer_has_planted_standard_crater",
		response = "pbw_gameplay_standard_bearer_has_planted_standard_crater",
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
		name = "pbw_gameplay_taking_heavy_damage",
		response = "pbw_gameplay_taking_heavy_damage",
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
		name = "pbw_gameplay_tension_no_enemies",
		response = "pbw_gameplay_tension_no_enemies",
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
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"intensity",
				OP.LT,
				90
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
		name = "pbw_gameplay_throwing_bomb",
		response = "pbw_gameplay_throwing_bomb",
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
		name = "pbw_gameplay_tips_wizard_plague",
		response = "pbw_gameplay_tips_wizard_plague",
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
				"on_plague_wave_hit"
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
				"on_plague_wave_hit",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"on_plague_wave_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_tips_wizard_wind",
		response = "pbw_gameplay_tips_wizard_wind",
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
				"chaos_vortex_spawned"
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
				"chaos_vortex_spawned",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_vortex_spawned",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_using_potion",
		response = "pbw_gameplay_using_potion",
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
		name = "pbw_gameplay_weapon_flair_defensive",
		response = "pbw_gameplay_weapon_flair_defensive",
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
		name = "pbw_gameplay_weapon_flair_offensive",
		response = "pbw_gameplay_weapon_flair_offensive",
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
		response = "pbw_gameplay_witch_hunter_being_helped_up",
		name = "pbw_gameplay_witch_hunter_being_helped_up",
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
		name = "pbw_gameplay_witch_hunter_dead",
		response = "pbw_gameplay_witch_hunter_dead",
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
		name = "pbw_gameplay_witch_hunter_eaten",
		response = "pbw_gameplay_witch_hunter_eaten",
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
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				1
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
		name = "pbw_gameplay_witch_hunter_grabbed",
		response = "pbw_gameplay_witch_hunter_grabbed",
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
		name = "pbw_gameplay_witch_hunter_low_on_health",
		response = "pbw_gameplay_witch_hunter_low_on_health",
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
				"bright_wizard"
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
		name = "pbw_gameplay_witch_hunter_on_a_frenzy",
		response = "pbw_gameplay_witch_hunter_on_a_frenzy",
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
				"bright_wizard"
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
		response = "pbw_gameplay_wood_elf_being_helped_up",
		name = "pbw_gameplay_wood_elf_being_helped_up",
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
		name = "pbw_gameplay_wood_elf_dead",
		response = "pbw_gameplay_wood_elf_dead",
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
		name = "pbw_gameplay_wood_elf_eaten",
		response = "pbw_gameplay_wood_elf_eaten",
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
				"faction_memory",
				"time_since_eaten",
				OP.TIMEDIFF,
				OP.GT,
				1
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
		name = "pbw_gameplay_wood_elf_grabbed",
		response = "pbw_gameplay_wood_elf_grabbed",
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
		name = "pbw_gameplay_wood_elf_low_on_health",
		response = "pbw_gameplay_wood_elf_low_on_health",
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
				"bright_wizard"
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
		name = "pbw_gameplay_wood_elf_on_a_frenzy",
		response = "pbw_gameplay_wood_elf_on_a_frenzy",
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
				"bright_wizard"
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
		response = "pbw_last_hero_standing",
		name = "pbw_last_hero_standing",
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
		name = "pbw_objective_achieved_all_but_one_goal",
		response = "pbw_objective_achieved_all_but_one_goal",
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
		name = "pbw_objective_correct_path_across",
		response = "pbw_objective_correct_path_across",
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
		name = "pbw_objective_correct_path_alley",
		response = "pbw_objective_correct_path_alley",
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
		name = "pbw_objective_correct_path_bridge",
		response = "pbw_objective_correct_path_bridge",
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
		name = "pbw_objective_correct_path_door",
		response = "pbw_objective_correct_path_door",
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
		name = "pbw_objective_correct_path_down",
		response = "pbw_objective_correct_path_down",
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
		name = "pbw_objective_correct_path_ladder_down",
		response = "pbw_objective_correct_path_ladder_down",
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
		name = "pbw_objective_correct_path_ladder_up",
		response = "pbw_objective_correct_path_ladder_up",
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
		name = "pbw_objective_correct_path_stairs_down",
		response = "pbw_objective_correct_path_stairs_down",
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
		name = "pbw_objective_correct_path_stairs_up",
		response = "pbw_objective_correct_path_stairs_up",
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
				"bright_wizard"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
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
		name = "pbw_objective_correct_path_street",
		response = "pbw_objective_correct_path_street",
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
		name = "pbw_objective_correct_path_this_way",
		response = "pbw_objective_correct_path_this_way",
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
		name = "pbw_objective_correct_path_up",
		response = "pbw_objective_correct_path_up",
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
		name = "pbw_objective_dropping_grimoire",
		response = "pbw_objective_dropping_grimoire",
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
				"grimoire"
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
				"time_since_throwing_grimoire",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_throwing_grimoire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_objective_goal_achieved_escape",
		response = "pbw_objective_goal_achieved_escape",
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
		name = "pbw_objective_goal_achieved_more_left",
		response = "pbw_objective_goal_achieved_more_left",
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
		name = "pbw_objective_interacting_with_objective",
		response = "pbw_objective_interacting_with_objective",
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
		name = "pbw_objective_nearing_objective_deadline",
		response = "pbw_objective_nearing_objective_deadline",
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
		name = "pbw_targeted_by_ratling",
		response = "pbw_targeted_by_ratling",
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
		pbw_activate_ability_battle_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "bright_wizard_honduras",
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
				"pbw_activate_ability_battle_wizard_01",
				"pbw_activate_ability_battle_wizard_02",
				"pbw_activate_ability_battle_wizard_03",
				"pbw_activate_ability_battle_wizard_04",
				"pbw_activate_ability_battle_wizard_05",
				"pbw_activate_ability_battle_wizard_06",
				"pbw_activate_ability_battle_wizard_07",
				"pbw_activate_ability_battle_wizard_08",
				"pbw_activate_ability_battle_wizard_09",
				"pbw_activate_ability_battle_wizard_10",
				"pbw_activate_ability_battle_wizard_11",
				"pbw_activate_ability_battle_wizard_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_activate_ability_battle_wizard_01",
				"pbw_activate_ability_battle_wizard_02",
				"pbw_activate_ability_battle_wizard_03",
				"pbw_activate_ability_battle_wizard_04",
				"pbw_activate_ability_battle_wizard_05",
				"pbw_activate_ability_battle_wizard_06",
				"pbw_activate_ability_battle_wizard_07",
				"pbw_activate_ability_battle_wizard_08",
				"pbw_activate_ability_battle_wizard_09",
				"pbw_activate_ability_battle_wizard_10",
				"pbw_activate_ability_battle_wizard_11",
				"pbw_activate_ability_battle_wizard_12"
			},
			sound_events_duration = {
				1.8937499523163,
				2.5130207538605,
				2.3882083892822,
				1.9769166707993,
				1.2478125095367,
				2.8103125095367,
				1.5035208463669,
				1.0926666259766,
				1.9409999847412,
				1.8511874675751,
				2.3946666717529,
				3.3020207881927
			}
		},
		pbw_activate_ability_pyromancer = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "bright_wizard_honduras",
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
				"pbw_activate_ability_pyromancer_01",
				"pbw_activate_ability_pyromancer_02",
				"pbw_activate_ability_pyromancer_03",
				"pbw_activate_ability_pyromancer_04",
				"pbw_activate_ability_pyromancer_05",
				"pbw_activate_ability_pyromancer_06",
				"pbw_activate_ability_pyromancer_07",
				"pbw_activate_ability_pyromancer_08",
				"pbw_activate_ability_pyromancer_09",
				"pbw_activate_ability_pyromancer_10",
				"pbw_activate_ability_pyromancer_11",
				"pbw_activate_ability_pyromancer_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_activate_ability_pyromancer_01",
				"pbw_activate_ability_pyromancer_02",
				"pbw_activate_ability_pyromancer_03",
				"pbw_activate_ability_pyromancer_04",
				"pbw_activate_ability_pyromancer_05",
				"pbw_activate_ability_pyromancer_06",
				"pbw_activate_ability_pyromancer_07",
				"pbw_activate_ability_pyromancer_08",
				"pbw_activate_ability_pyromancer_09",
				"pbw_activate_ability_pyromancer_10",
				"pbw_activate_ability_pyromancer_11",
				"pbw_activate_ability_pyromancer_12"
			},
			sound_events_duration = {
				1.9312916994095,
				1.5861874818802,
				1.0180833339691,
				2.31285405159,
				3.9249374866486,
				2.5165417194366,
				3.1542084217072,
				2.0076251029968,
				2.5495417118073,
				2.0251874923706,
				3.8913333415985,
				3.6621458530426
			}
		},
		pbw_activate_ability_unchained = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_honduras",
			sound_events_n = 10,
			category = "activate_ability",
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
				"pbw_activate_ability_unchained_01",
				"pbw_activate_ability_unchained_02",
				"pbw_activate_ability_unchained_03",
				"pbw_activate_ability_unchained_04",
				"pbw_activate_ability_unchained_05",
				"pbw_activate_ability_unchained_06",
				"pbw_activate_ability_unchained_07",
				"pbw_activate_ability_unchained_08",
				"pbw_activate_ability_unchained_09",
				"pbw_activate_ability_unchained_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_activate_ability_unchained_01",
				"pbw_activate_ability_unchained_02",
				"pbw_activate_ability_unchained_03",
				"pbw_activate_ability_unchained_04",
				"pbw_activate_ability_unchained_05",
				"pbw_activate_ability_unchained_06",
				"pbw_activate_ability_unchained_07",
				"pbw_activate_ability_unchained_08",
				"pbw_activate_ability_unchained_09",
				"pbw_activate_ability_unchained_10"
			},
			sound_events_duration = {
				4.0252084732056,
				2.4528958797455,
				1.7375416755676,
				5.0076665878296,
				3.1394791603088,
				1.6660833358765,
				0.86472916603088,
				1.5493124723434,
				1.9696667194366,
				2.3059582710266
			}
		},
		pbw_curse = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "bright_wizard_honduras",
			sound_events_n = 11,
			category = "casual_talk",
			dialogue_animations_n = 11,
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
				"face_angry"
			},
			localization_strings = {
				"pbw_curse_01",
				"pbw_curse_02",
				"pbw_curse_04",
				"pbw_curse_05",
				"pbw_curse_06",
				"pbw_curse_07",
				"pbw_curse_08",
				"pbw_curse_09",
				"pbw_curse_10",
				"pbw_curse_11",
				"pbw_curse_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_curse_01",
				"pbw_curse_02",
				"pbw_curse_04",
				"pbw_curse_05",
				"pbw_curse_06",
				"pbw_curse_07",
				"pbw_curse_08",
				"pbw_curse_09",
				"pbw_curse_10",
				"pbw_curse_11",
				"pbw_curse_12"
			},
			sound_events_duration = {
				1.829520881176,
				1.773458302021,
				1.3013957738876,
				1.6268957853317,
				2.7104375362396,
				1.8352500200272,
				1.8317500352859,
				1.0670833587647,
				1.1400624513626,
				1.9208958148956,
				1.6734791994095
			}
		},
		pbw_curse_forced = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_curse_01",
				"pbw_curse_02",
				"pbw_curse_05",
				"pbw_curse_06",
				"pbw_curse_07",
				"pbw_curse_08",
				"pbw_curse_09",
				"pbw_curse_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_curse_01",
				"pbw_curse_02",
				"pbw_curse_05",
				"pbw_curse_06",
				"pbw_curse_07",
				"pbw_curse_08",
				"pbw_curse_09",
				"pbw_curse_12"
			},
			sound_events_duration = {
				1.829520881176,
				1.773458302021,
				1.6268957853317,
				2.7104375362396,
				1.8352500200272,
				1.8317500352859,
				1.0670833587647,
				1.6734791994095
			}
		},
		pbw_gameplay_ambush_horde_spawned = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_ambush_horde_spawned_02",
				"pbw_gameplay_ambush_horde_spawned_07",
				"pbw_gameplay_ambush_horde_spawned_08",
				"pbw_gameplay_ambush_horde_spawned_09",
				"pbw_gameplay_ambush_horde_spawned_10",
				"pbw_gameplay_ambush_horde_spawned_11",
				"pbw_gameplay_ambush_horde_spawned_12",
				"pbw_gameplay_ambush_horde_spawned_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_ambush_horde_spawned_02",
				"pbw_gameplay_ambush_horde_spawned_07",
				"pbw_gameplay_ambush_horde_spawned_08",
				"pbw_gameplay_ambush_horde_spawned_09",
				"pbw_gameplay_ambush_horde_spawned_10",
				"pbw_gameplay_ambush_horde_spawned_11",
				"pbw_gameplay_ambush_horde_spawned_12",
				"pbw_gameplay_ambush_horde_spawned_13"
			},
			sound_events_duration = {
				0.9444375038147,
				1.460458278656,
				1.641937494278,
				2.9200415611267,
				4.1658959388733,
				2.8636457920074,
				2.9730207920074,
				2.5669584274292
			}
		},
		pbw_gameplay_armoured_enemy_dwarf = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_armoured_enemy_dwarf_04",
				"pbw_gameplay_armoured_enemy_dwarf_05",
				"pbw_gameplay_armoured_enemy_dwarf_06",
				"pbw_gameplay_armoured_enemy_dwarf_07",
				"pbw_gameplay_armoured_enemy_dwarf_08",
				"pbw_gameplay_armoured_enemy_dwarf_09",
				"pbw_gameplay_armoured_enemy_dwarf_10",
				"pbw_gameplay_armoured_enemy_dwarf_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_armoured_enemy_dwarf_04",
				"pbw_gameplay_armoured_enemy_dwarf_05",
				"pbw_gameplay_armoured_enemy_dwarf_06",
				"pbw_gameplay_armoured_enemy_dwarf_07",
				"pbw_gameplay_armoured_enemy_dwarf_08",
				"pbw_gameplay_armoured_enemy_dwarf_09",
				"pbw_gameplay_armoured_enemy_dwarf_10",
				"pbw_gameplay_armoured_enemy_dwarf_11"
			},
			sound_events_duration = {
				2.7678959369659,
				2.2147500514984,
				3.0510001182556,
				2.7005832195282,
				2.7799792289734,
				3.2070000171661,
				2.2827498912811,
				1.7439999580383
			}
		},
		pbw_gameplay_armoured_enemy_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_armoured_enemy_empire_soldier_04",
				"pbw_gameplay_armoured_enemy_empire_soldier_05",
				"pbw_gameplay_armoured_enemy_empire_soldier_06",
				"pbw_gameplay_armoured_enemy_empire_soldier_07",
				"pbw_gameplay_armoured_enemy_empire_soldier_08",
				"pbw_gameplay_armoured_enemy_empire_soldier_09",
				"pbw_gameplay_armoured_enemy_empire_soldier_10",
				"pbw_gameplay_armoured_enemy_empire_soldier_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_armoured_enemy_empire_soldier_04",
				"pbw_gameplay_armoured_enemy_empire_soldier_05",
				"pbw_gameplay_armoured_enemy_empire_soldier_06",
				"pbw_gameplay_armoured_enemy_empire_soldier_07",
				"pbw_gameplay_armoured_enemy_empire_soldier_08",
				"pbw_gameplay_armoured_enemy_empire_soldier_09",
				"pbw_gameplay_armoured_enemy_empire_soldier_10",
				"pbw_gameplay_armoured_enemy_empire_soldier_11"
			},
			sound_events_duration = {
				2.0122292041779,
				2.1851875782013,
				2.3567917346954,
				3.0853750705719,
				3.3801875114441,
				1.9500000476837,
				3.0435416698456,
				3.5143749713898
			}
		},
		pbw_gameplay_armoured_enemy_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_armoured_enemy_witch_hunter_04",
				"pbw_gameplay_armoured_enemy_witch_hunter_05",
				"pbw_gameplay_armoured_enemy_witch_hunter_06",
				"pbw_gameplay_armoured_enemy_witch_hunter_07",
				"pbw_gameplay_armoured_enemy_witch_hunter_08",
				"pbw_gameplay_armoured_enemy_witch_hunter_09",
				"pbw_gameplay_armoured_enemy_witch_hunter_10",
				"pbw_gameplay_armoured_enemy_witch_hunter_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_armoured_enemy_witch_hunter_04",
				"pbw_gameplay_armoured_enemy_witch_hunter_05",
				"pbw_gameplay_armoured_enemy_witch_hunter_06",
				"pbw_gameplay_armoured_enemy_witch_hunter_07",
				"pbw_gameplay_armoured_enemy_witch_hunter_08",
				"pbw_gameplay_armoured_enemy_witch_hunter_09",
				"pbw_gameplay_armoured_enemy_witch_hunter_10",
				"pbw_gameplay_armoured_enemy_witch_hunter_11"
			},
			sound_events_duration = {
				3.258291721344,
				4.1418123245239,
				4.0625,
				3.7809791564941,
				3.9947500228882,
				2.4144792556763,
				2.3558750152588,
				1.7306874990463
			}
		},
		pbw_gameplay_armoured_enemy_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_armoured_enemy_wood_elf_04",
				"pbw_gameplay_armoured_enemy_wood_elf_05",
				"pbw_gameplay_armoured_enemy_wood_elf_06",
				"pbw_gameplay_armoured_enemy_wood_elf_07",
				"pbw_gameplay_armoured_enemy_wood_elf_08",
				"pbw_gameplay_armoured_enemy_wood_elf_09",
				"pbw_gameplay_armoured_enemy_wood_elf_10",
				"pbw_gameplay_armoured_enemy_wood_elf_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_armoured_enemy_wood_elf_04",
				"pbw_gameplay_armoured_enemy_wood_elf_05",
				"pbw_gameplay_armoured_enemy_wood_elf_06",
				"pbw_gameplay_armoured_enemy_wood_elf_07",
				"pbw_gameplay_armoured_enemy_wood_elf_08",
				"pbw_gameplay_armoured_enemy_wood_elf_09",
				"pbw_gameplay_armoured_enemy_wood_elf_10",
				"pbw_gameplay_armoured_enemy_wood_elf_11"
			},
			sound_events_duration = {
				2.491708278656,
				2.8851249217987,
				1.8423541784286,
				2.7340624332428,
				2.142416715622,
				3.1939792633057,
				1.842854142189,
				3.0579373836517
			}
		},
		pbw_gameplay_bile_troll_before_puke = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_bile_troll_before_puke_01",
				"pbw_gameplay_bile_troll_before_puke_02",
				"pbw_gameplay_bile_troll_before_puke_03",
				"pbw_gameplay_bile_troll_before_puke_04",
				"pbw_gameplay_bile_troll_before_puke_05",
				"pbw_gameplay_bile_troll_before_puke_06",
				"pbw_gameplay_bile_troll_before_puke_07",
				"pbw_gameplay_bile_troll_before_puke_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_bile_troll_before_puke_01",
				"pbw_gameplay_bile_troll_before_puke_02",
				"pbw_gameplay_bile_troll_before_puke_03",
				"pbw_gameplay_bile_troll_before_puke_04",
				"pbw_gameplay_bile_troll_before_puke_05",
				"pbw_gameplay_bile_troll_before_puke_06",
				"pbw_gameplay_bile_troll_before_puke_07",
				"pbw_gameplay_bile_troll_before_puke_08"
			},
			sound_events_duration = {
				1.500479221344,
				1.5338541269302,
				1.9517291784286,
				1.8266249895096,
				1.4326250553131,
				2.0848541259766,
				1.286333322525,
				2.0851874351502
			}
		},
		pbw_gameplay_bile_troll_incapacitaded = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_bile_troll_incapacitaded_01",
				"pbw_gameplay_bile_troll_incapacitaded_02",
				"pbw_gameplay_bile_troll_incapacitaded_03",
				"pbw_gameplay_bile_troll_incapacitaded_04",
				"pbw_gameplay_bile_troll_incapacitaded_05",
				"pbw_gameplay_bile_troll_incapacitaded_06",
				"pbw_gameplay_bile_troll_incapacitaded_07",
				"pbw_gameplay_bile_troll_incapacitaded_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_bile_troll_incapacitaded_01",
				"pbw_gameplay_bile_troll_incapacitaded_02",
				"pbw_gameplay_bile_troll_incapacitaded_03",
				"pbw_gameplay_bile_troll_incapacitaded_04",
				"pbw_gameplay_bile_troll_incapacitaded_05",
				"pbw_gameplay_bile_troll_incapacitaded_06",
				"pbw_gameplay_bile_troll_incapacitaded_07",
				"pbw_gameplay_bile_troll_incapacitaded_08"
			},
			sound_events_duration = {
				1.5544999837875,
				2.2767708301544,
				1.8996249437332,
				2.0853126049042,
				2.9639375209808,
				2.8717291355133,
				1.5049166679382,
				2.8202290534973
			}
		},
		pbw_gameplay_casual_quotes = {
			randomize_indexes_n = 0,
			face_animations_n = 29,
			database = "bright_wizard_honduras",
			sound_events_n = 29,
			category = "casual_talk",
			dialogue_animations_n = 29,
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
				"pbw_gameplay_casual_quotes_11",
				"pbw_gameplay_casual_quotes_12",
				"pbw_gameplay_casual_quotes_13",
				"pbw_gameplay_casual_quotes_14",
				"pbw_gameplay_casual_quotes_15",
				"pbw_gameplay_casual_quotes_16",
				"pbw_gameplay_casual_quotes_17",
				"pbw_gameplay_casual_quotes_18",
				"pbw_gameplay_casual_quotes_19",
				"pbw_gameplay_casual_quotes_20",
				"pbw_gameplay_casual_quotes_21",
				"pbw_gameplay_casual_quotes_22",
				"pbw_gameplay_casual_quotes_23",
				"pbw_gameplay_casual_quotes_24",
				"pbw_gameplay_casual_quotes_25",
				"pbw_gameplay_casual_quotes_26",
				"pbw_gameplay_casual_quotes_27",
				"pbw_gameplay_casual_quotes_28",
				"pbw_gameplay_casual_quotes_29",
				"pbw_gameplay_casual_quotes_30",
				"pbw_gameplay_casual_quotes_31",
				"pbw_gameplay_casual_quotes_32",
				"pbw_gameplay_casual_quotes_33",
				"pbw_gameplay_casual_quotes_34",
				"pbw_gameplay_casual_quotes_35",
				"pbw_gameplay_casual_quotes_36",
				"pbw_gameplay_casual_quotes_37",
				"pbw_gameplay_casual_quotes_38",
				"pbw_gameplay_casual_quotes_39"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_casual_quotes_11",
				"pbw_gameplay_casual_quotes_12",
				"pbw_gameplay_casual_quotes_13",
				"pbw_gameplay_casual_quotes_14",
				"pbw_gameplay_casual_quotes_15",
				"pbw_gameplay_casual_quotes_16",
				"pbw_gameplay_casual_quotes_17",
				"pbw_gameplay_casual_quotes_18",
				"pbw_gameplay_casual_quotes_19",
				"pbw_gameplay_casual_quotes_20",
				"pbw_gameplay_casual_quotes_21",
				"pbw_gameplay_casual_quotes_22",
				"pbw_gameplay_casual_quotes_23",
				"pbw_gameplay_casual_quotes_24",
				"pbw_gameplay_casual_quotes_25",
				"pbw_gameplay_casual_quotes_26",
				"pbw_gameplay_casual_quotes_27",
				"pbw_gameplay_casual_quotes_28",
				"pbw_gameplay_casual_quotes_29",
				"pbw_gameplay_casual_quotes_30",
				"pbw_gameplay_casual_quotes_31",
				"pbw_gameplay_casual_quotes_32",
				"pbw_gameplay_casual_quotes_33",
				"pbw_gameplay_casual_quotes_34",
				"pbw_gameplay_casual_quotes_35",
				"pbw_gameplay_casual_quotes_36",
				"pbw_gameplay_casual_quotes_37",
				"pbw_gameplay_casual_quotes_38",
				"pbw_gameplay_casual_quotes_39"
			},
			sound_events_duration = {
				7.6883959770203,
				9.1767292022705,
				5.9436664581299,
				5.2916665077209,
				6.818416595459,
				9.6307916641235,
				4.6910209655762,
				7.4730415344238,
				8.9647083282471,
				8.24693775177,
				4.6794791221619,
				5.4045624732971,
				5.2174167633057,
				3.9166042804718,
				5.1371250152588,
				7.4300208091736,
				9.4523959159851,
				7.2185626029968,
				4.2583956718445,
				4.295458316803,
				3.8531875610352,
				1.9288125038147,
				2.4547083377838,
				3.2196042537689,
				4.6271352767944,
				2.7894792556763,
				4.0304164886475,
				3.0662708282471,
				3.9424583911896
			}
		},
		pbw_gameplay_dead_body = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_dead_body_06",
				"pbw_gameplay_dead_body_07",
				"pbw_gameplay_dead_body_08",
				"pbw_gameplay_dead_body_09",
				"pbw_gameplay_dead_body_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_dead_body_06",
				"pbw_gameplay_dead_body_07",
				"pbw_gameplay_dead_body_08",
				"pbw_gameplay_dead_body_09",
				"pbw_gameplay_dead_body_10"
			},
			sound_events_duration = {
				2.8734583854675,
				2.2361874580383,
				2.1153750419617,
				3.1932499408722,
				2.448145866394
			}
		},
		pbw_gameplay_dead_end = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
			sound_events_n = 6,
			category = "guidance",
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
				"pbw_gameplay_dead_end_07",
				"pbw_gameplay_dead_end_08",
				"pbw_gameplay_dead_end_09",
				"pbw_gameplay_dead_end_10",
				"pbw_gameplay_dead_end_11",
				"pbw_gameplay_dead_end_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_dead_end_07",
				"pbw_gameplay_dead_end_08",
				"pbw_gameplay_dead_end_09",
				"pbw_gameplay_dead_end_10",
				"pbw_gameplay_dead_end_11",
				"pbw_gameplay_dead_end_12"
			},
			sound_events_duration = {
				1.3194375038147,
				1.2614166736603,
				1.1274791955948,
				2.457729101181,
				1.8249374628067,
				1.129562497139
			}
		},
		pbw_gameplay_dwarf_ranger_being_helped = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_dwarf_ranger_being_helped_up_01",
				"pbw_gameplay_dwarf_ranger_being_helped_up_04",
				"pbw_gameplay_dwarf_ranger_being_helped_up_05",
				"pbw_gameplay_dwarf_ranger_being_helped_up_06",
				"pbw_gameplay_dwarf_ranger_being_helped_up_07",
				"pbw_gameplay_dwarf_ranger_being_helped_up_08",
				"pbw_gameplay_dwarf_ranger_being_helped_up_09",
				"pbw_gameplay_dwarf_ranger_being_helped_up_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_dwarf_ranger_being_helped_up_01",
				"pbw_gameplay_dwarf_ranger_being_helped_up_04",
				"pbw_gameplay_dwarf_ranger_being_helped_up_05",
				"pbw_gameplay_dwarf_ranger_being_helped_up_06",
				"pbw_gameplay_dwarf_ranger_being_helped_up_07",
				"pbw_gameplay_dwarf_ranger_being_helped_up_08",
				"pbw_gameplay_dwarf_ranger_being_helped_up_09",
				"pbw_gameplay_dwarf_ranger_being_helped_up_10"
			},
			sound_events_duration = {
				1.7536875009537,
				1.7094583511352,
				3.6368334293366,
				2.2724583148956,
				2.7722709178925,
				2.1498749256134,
				3.4092707633972,
				1.8314167261124
			}
		},
		pbw_gameplay_dwarf_ranger_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_dwarf_ranger_dead_03",
				"pbw_gameplay_dwarf_ranger_dead_05",
				"pbw_gameplay_dwarf_ranger_dead_06",
				"pbw_gameplay_dwarf_ranger_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_dwarf_ranger_dead_03",
				"pbw_gameplay_dwarf_ranger_dead_05",
				"pbw_gameplay_dwarf_ranger_dead_06",
				"pbw_gameplay_dwarf_ranger_dead_07"
			},
			sound_events_duration = {
				1.9435625076294,
				1.9435625076294,
				2.8723125457764,
				3.2912499904633
			}
		},
		pbw_gameplay_dwarf_ranger_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "bright_wizard_honduras",
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
				"pbw_dwarf_ranger_eaten_01",
				"pbw_dwarf_ranger_eaten_02",
				"pbw_dwarf_ranger_eaten_03",
				"pbw_dwarf_ranger_eaten_04",
				"pbw_dwarf_ranger_eaten_05",
				"pbw_dwarf_ranger_eaten_06",
				"pbw_dwarf_ranger_eaten_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_dwarf_ranger_eaten_01",
				"pbw_dwarf_ranger_eaten_02",
				"pbw_dwarf_ranger_eaten_03",
				"pbw_dwarf_ranger_eaten_04",
				"pbw_dwarf_ranger_eaten_05",
				"pbw_dwarf_ranger_eaten_06",
				"pbw_dwarf_ranger_eaten_07"
			},
			sound_events_duration = {
				3.8140208721161,
				6.3936457633972,
				4.3610210418701,
				4.3971667289734,
				5.4721250534058,
				4.9333748817444,
				6.1083126068115
			}
		},
		pbw_gameplay_dwarf_ranger_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_dwarf_ranger_grabbed_07",
				"pbw_gameplay_dwarf_ranger_grabbed_08",
				"pbw_gameplay_dwarf_ranger_grabbed_09",
				"pbw_gameplay_dwarf_ranger_grabbed_10",
				"pbw_gameplay_dwarf_ranger_grabbed_11",
				"pbw_gameplay_dwarf_ranger_grabbed_12",
				"pbw_gameplay_dwarf_ranger_grabbed_13",
				"pbw_gameplay_dwarf_ranger_grabbed_14",
				"pbw_gameplay_dwarf_ranger_grabbed_15",
				"pbw_gameplay_dwarf_ranger_grabbed_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_dwarf_ranger_grabbed_07",
				"pbw_gameplay_dwarf_ranger_grabbed_08",
				"pbw_gameplay_dwarf_ranger_grabbed_09",
				"pbw_gameplay_dwarf_ranger_grabbed_10",
				"pbw_gameplay_dwarf_ranger_grabbed_11",
				"pbw_gameplay_dwarf_ranger_grabbed_12",
				"pbw_gameplay_dwarf_ranger_grabbed_13",
				"pbw_gameplay_dwarf_ranger_grabbed_14",
				"pbw_gameplay_dwarf_ranger_grabbed_15",
				"pbw_gameplay_dwarf_ranger_grabbed_16"
			},
			sound_events_duration = {
				2.2446250915527,
				4.4380416870117,
				3.395124912262,
				2.9028959274292,
				3.2889375686645,
				2.1977915763855,
				3.6754584312439,
				3.671041727066,
				2.4679584503174,
				3.5701041221619
			}
		},
		pbw_gameplay_dwarf_ranger_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_dwarf_ranger_low_on_health_01",
				"pbw_gameplay_dwarf_ranger_low_on_health_05",
				"pbw_gameplay_dwarf_ranger_low_on_health_06",
				"pbw_gameplay_dwarf_ranger_low_on_health_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_dwarf_ranger_low_on_health_01",
				"pbw_gameplay_dwarf_ranger_low_on_health_05",
				"pbw_gameplay_dwarf_ranger_low_on_health_06",
				"pbw_gameplay_dwarf_ranger_low_on_health_07"
			},
			sound_events_duration = {
				2.2264583110809,
				2.2264583110809,
				2.80433344841,
				1.534916639328
			}
		},
		pbw_gameplay_dwarf_ranger_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pbw_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pbw_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pbw_gameplay_dwarf_ranger_on_a_frenzy_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pbw_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pbw_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pbw_gameplay_dwarf_ranger_on_a_frenzy_08"
			},
			sound_events_duration = {
				2.8819167613983,
				2.2421457767487,
				2.8658542633057,
				3.8980000019074
			}
		},
		pbw_gameplay_empire_soldier_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_empire_soldier_being_helped_up_02",
				"pbw_gameplay_empire_soldier_being_helped_up_05",
				"pbw_gameplay_empire_soldier_being_helped_up_06",
				"pbw_gameplay_empire_soldier_being_helped_up_07",
				"pbw_gameplay_empire_soldier_being_helped_up_08",
				"pbw_gameplay_empire_soldier_being_helped_up_09",
				"pbw_gameplay_empire_soldier_being_helped_up_10",
				"pbw_gameplay_empire_soldier_being_helped_up_11",
				"pbw_gameplay_empire_soldier_being_helped_up_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_empire_soldier_being_helped_up_02",
				"pbw_gameplay_empire_soldier_being_helped_up_05",
				"pbw_gameplay_empire_soldier_being_helped_up_06",
				"pbw_gameplay_empire_soldier_being_helped_up_07",
				"pbw_gameplay_empire_soldier_being_helped_up_08",
				"pbw_gameplay_empire_soldier_being_helped_up_09",
				"pbw_gameplay_empire_soldier_being_helped_up_10",
				"pbw_gameplay_empire_soldier_being_helped_up_11",
				"pbw_gameplay_empire_soldier_being_helped_up_12"
			},
			sound_events_duration = {
				1.6042292118073,
				2.303729057312,
				2.6612915992737,
				3.1944999694824,
				2.6099791526794,
				1.9544166326523,
				1.705374956131,
				2.0736041069031,
				2.3040416240692
			}
		},
		pbw_gameplay_empire_soldier_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_empire_soldier_dead_02",
				"pbw_gameplay_empire_soldier_dead_05",
				"pbw_gameplay_empire_soldier_dead_06",
				"pbw_gameplay_empire_soldier_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_empire_soldier_dead_02",
				"pbw_gameplay_empire_soldier_dead_05",
				"pbw_gameplay_empire_soldier_dead_06",
				"pbw_gameplay_empire_soldier_dead_07"
			},
			sound_events_duration = {
				1.4603958129883,
				1.4603958129883,
				2.2594792842865,
				2.2577707767487
			}
		},
		pbw_gameplay_empire_soldier_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "bright_wizard_honduras",
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
				"pbw_empire_soldier_eaten_01",
				"pbw_empire_soldier_eaten_02",
				"pbw_empire_soldier_eaten_03",
				"pbw_empire_soldier_eaten_04",
				"pbw_empire_soldier_eaten_05",
				"pbw_empire_soldier_eaten_06",
				"pbw_empire_soldier_eaten_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_empire_soldier_eaten_01",
				"pbw_empire_soldier_eaten_02",
				"pbw_empire_soldier_eaten_03",
				"pbw_empire_soldier_eaten_04",
				"pbw_empire_soldier_eaten_05",
				"pbw_empire_soldier_eaten_06",
				"pbw_empire_soldier_eaten_07"
			},
			sound_events_duration = {
				4.3874269723892,
				6.5331249237061,
				6.0676250457764,
				6.7808542251587,
				5.8223123550415,
				4.0438229441643,
				4.8215832710266
			}
		},
		pbw_gameplay_empire_soldier_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_empire_soldier_grabbed_03",
				"pbw_gameplay_empire_soldier_grabbed_06",
				"pbw_gameplay_empire_soldier_grabbed_07",
				"pbw_gameplay_empire_soldier_grabbed_08",
				"pbw_gameplay_empire_soldier_grabbed_09",
				"pbw_gameplay_empire_soldier_grabbed_10",
				"pbw_gameplay_empire_soldier_grabbed_11",
				"pbw_gameplay_empire_soldier_grabbed_12",
				"pbw_gameplay_empire_soldier_grabbed_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_empire_soldier_grabbed_03",
				"pbw_gameplay_empire_soldier_grabbed_06",
				"pbw_gameplay_empire_soldier_grabbed_07",
				"pbw_gameplay_empire_soldier_grabbed_08",
				"pbw_gameplay_empire_soldier_grabbed_09",
				"pbw_gameplay_empire_soldier_grabbed_10",
				"pbw_gameplay_empire_soldier_grabbed_11",
				"pbw_gameplay_empire_soldier_grabbed_12",
				"pbw_gameplay_empire_soldier_grabbed_13"
			},
			sound_events_duration = {
				3.2694582939148,
				5.4102501869202,
				4.9294376373291,
				4.6363959312439,
				3.7103334069252,
				4.9670834541321,
				2.1553957462311,
				5.4229998588562,
				3.1416666507721
			}
		},
		pbw_gameplay_empire_soldier_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_empire_soldier_low_on_health_05",
				"pbw_gameplay_empire_soldier_low_on_health_06",
				"pbw_gameplay_empire_soldier_low_on_health_07",
				"pbw_gameplay_empire_soldier_low_on_health_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_empire_soldier_low_on_health_05",
				"pbw_gameplay_empire_soldier_low_on_health_06",
				"pbw_gameplay_empire_soldier_low_on_health_07",
				"pbw_gameplay_empire_soldier_low_on_health_08"
			},
			sound_events_duration = {
				2.1397082805634,
				2.2135624885559,
				2.5332915782928,
				2.4681875705719
			}
		},
		pbw_gameplay_empire_soldier_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_empire_soldier_on_a_frenzy_05",
				"pbw_gameplay_empire_soldier_on_a_frenzy_06",
				"pbw_gameplay_empire_soldier_on_a_frenzy_07",
				"pbw_gameplay_empire_soldier_on_a_frenzy_08",
				"pbw_gameplay_empire_soldier_on_a_frenzy_09",
				"pbw_gameplay_empire_soldier_on_a_frenzy_10",
				"pbw_gameplay_empire_soldier_on_a_frenzy_11",
				"pbw_gameplay_empire_soldier_on_a_frenzy_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_empire_soldier_on_a_frenzy_05",
				"pbw_gameplay_empire_soldier_on_a_frenzy_06",
				"pbw_gameplay_empire_soldier_on_a_frenzy_07",
				"pbw_gameplay_empire_soldier_on_a_frenzy_08",
				"pbw_gameplay_empire_soldier_on_a_frenzy_09",
				"pbw_gameplay_empire_soldier_on_a_frenzy_10",
				"pbw_gameplay_empire_soldier_on_a_frenzy_11",
				"pbw_gameplay_empire_soldier_on_a_frenzy_12"
			},
			sound_events_duration = {
				2.4411458969116,
				2.8248958587647,
				2.0378749370575,
				3.3367083072662,
				4.6405415534973,
				2.6338748931885,
				5.3831458091736,
				4.9340624809265
			}
		},
		pbw_gameplay_encouraging_words = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "bright_wizard_honduras",
			sound_events_n = 11,
			category = "casual_talk",
			dialogue_animations_n = 11,
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
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_encouraging_words_07",
				"pbw_gameplay_encouraging_words_08",
				"pbw_gameplay_encouraging_words_09",
				"pbw_gameplay_encouraging_words_10",
				"pbw_gameplay_encouraging_words_11",
				"pbw_gameplay_encouraging_words_12",
				"pbw_gameplay_encouraging_words_13",
				"pbw_gameplay_encouraging_words_14",
				"pbw_gameplay_encouraging_words_15",
				"pbw_gameplay_encouraging_words_16",
				"pbw_gameplay_encouraging_words_17"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_encouraging_words_07",
				"pbw_gameplay_encouraging_words_08",
				"pbw_gameplay_encouraging_words_09",
				"pbw_gameplay_encouraging_words_10",
				"pbw_gameplay_encouraging_words_11",
				"pbw_gameplay_encouraging_words_12",
				"pbw_gameplay_encouraging_words_13",
				"pbw_gameplay_encouraging_words_14",
				"pbw_gameplay_encouraging_words_15",
				"pbw_gameplay_encouraging_words_16",
				"pbw_gameplay_encouraging_words_17"
			},
			sound_events_duration = {
				2.1350207328796,
				3.4615623950958,
				3.7342290878296,
				2.9417083263397,
				2.1350207328796,
				3.4615623950958,
				3.7342290878296,
				2.9417083263397,
				2.1363749504089,
				2.3259999752045,
				2.9300625324249
			}
		},
		pbw_gameplay_friendly_fire_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_friendly_fire_dwarf_ranger_05",
				"pbw_gameplay_friendly_fire_dwarf_ranger_06",
				"pbw_gameplay_friendly_fire_dwarf_ranger_07",
				"pbw_gameplay_friendly_fire_dwarf_ranger_08",
				"pbw_gameplay_friendly_fire_dwarf_ranger_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_friendly_fire_dwarf_ranger_05",
				"pbw_gameplay_friendly_fire_dwarf_ranger_06",
				"pbw_gameplay_friendly_fire_dwarf_ranger_07",
				"pbw_gameplay_friendly_fire_dwarf_ranger_08",
				"pbw_gameplay_friendly_fire_dwarf_ranger_09"
			},
			sound_events_duration = {
				2.9248332977295,
				2.7182083129883,
				2.9121251106262,
				2.2930417060852,
				3.5499999523163
			}
		},
		pbw_gameplay_friendly_fire_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_friendly_fire_empire_soldier_05",
				"pbw_gameplay_friendly_fire_empire_soldier_06",
				"pbw_gameplay_friendly_fire_empire_soldier_07",
				"pbw_gameplay_friendly_fire_empire_soldier_08",
				"pbw_gameplay_friendly_fire_empire_soldier_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_friendly_fire_empire_soldier_05",
				"pbw_gameplay_friendly_fire_empire_soldier_06",
				"pbw_gameplay_friendly_fire_empire_soldier_07",
				"pbw_gameplay_friendly_fire_empire_soldier_08",
				"pbw_gameplay_friendly_fire_empire_soldier_09"
			},
			sound_events_duration = {
				2.9984583854675,
				1.8351041078568,
				2.569854259491,
				2.0312917232513,
				3.9130625724792
			}
		},
		pbw_gameplay_friendly_fire_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_friendly_fire_witch_hunter_02",
				"pbw_gameplay_friendly_fire_witch_hunter_05",
				"pbw_gameplay_friendly_fire_witch_hunter_06",
				"pbw_gameplay_friendly_fire_witch_hunter_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_friendly_fire_witch_hunter_02",
				"pbw_gameplay_friendly_fire_witch_hunter_05",
				"pbw_gameplay_friendly_fire_witch_hunter_06",
				"pbw_gameplay_friendly_fire_witch_hunter_07"
			},
			sound_events_duration = {
				2.15660405159,
				2.15660405159,
				2.424124956131,
				2.6000833511352
			}
		},
		pbw_gameplay_friendly_fire_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_friendly_fire_wood_elf_01",
				"pbw_gameplay_friendly_fire_wood_elf_03",
				"pbw_gameplay_friendly_fire_wood_elf_05",
				"pbw_gameplay_friendly_fire_wood_elf_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_friendly_fire_wood_elf_01",
				"pbw_gameplay_friendly_fire_wood_elf_03",
				"pbw_gameplay_friendly_fire_wood_elf_05",
				"pbw_gameplay_friendly_fire_wood_elf_06"
			},
			sound_events_duration = {
				1.2641667127609,
				2.1018540859222,
				1.2641667127609,
				2.1018540859222
			}
		},
		pbw_gameplay_globadier_guck = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_globadier_guck_01",
				"pbw_gameplay_globadier_guck_02",
				"pbw_gameplay_globadier_guck_07",
				"pbw_gameplay_globadier_guck_08",
				"pbw_gameplay_globadier_guck_09",
				"pbw_gameplay_globadier_guck_10",
				"pbw_gameplay_globadier_guck_11",
				"pbw_gameplay_globadier_guck_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_globadier_guck_01",
				"pbw_gameplay_globadier_guck_02",
				"pbw_gameplay_globadier_guck_07",
				"pbw_gameplay_globadier_guck_08",
				"pbw_gameplay_globadier_guck_09",
				"pbw_gameplay_globadier_guck_10",
				"pbw_gameplay_globadier_guck_11",
				"pbw_gameplay_globadier_guck_12"
			},
			sound_events_duration = {
				1.3954999446869,
				1.8086041212082,
				1.4441250562668,
				0.96220833063126,
				1.3954999446869,
				1.8086041212082,
				1.4441250562668,
				0.96220833063126
			}
		},
		pbw_gameplay_healing_draught = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_healing_draught_01",
				"pbw_gameplay_healing_draught_08",
				"pbw_gameplay_healing_draught_09",
				"pbw_gameplay_healing_draught_10",
				"pbw_gameplay_healing_draught_11",
				"pbw_gameplay_healing_draught_12",
				"pbw_gameplay_healing_draught_13",
				"pbw_gameplay_healing_draught_14",
				"pbw_gameplay_healing_draught_15",
				"pbw_gameplay_healing_draught_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_healing_draught_01",
				"pbw_gameplay_healing_draught_08",
				"pbw_gameplay_healing_draught_09",
				"pbw_gameplay_healing_draught_10",
				"pbw_gameplay_healing_draught_11",
				"pbw_gameplay_healing_draught_12",
				"pbw_gameplay_healing_draught_13",
				"pbw_gameplay_healing_draught_14",
				"pbw_gameplay_healing_draught_15",
				"pbw_gameplay_healing_draught_16"
			},
			sound_events_duration = {
				1.2832083702087,
				1.141104221344,
				1.2832083702087,
				1.141104221344,
				1.7506666183472,
				1.5041874647141,
				1.7153749465942,
				1.5084166526794,
				1.2167500257492,
				1.6612083911896
			}
		},
		pbw_gameplay_healing_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_healing_dwarf_ranger_05",
				"pbw_gameplay_healing_dwarf_ranger_06",
				"pbw_gameplay_healing_dwarf_ranger_07",
				"pbw_gameplay_healing_dwarf_ranger_08",
				"pbw_gameplay_healing_dwarf_ranger_09",
				"pbw_gameplay_healing_dwarf_ranger_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_healing_dwarf_ranger_05",
				"pbw_gameplay_healing_dwarf_ranger_06",
				"pbw_gameplay_healing_dwarf_ranger_07",
				"pbw_gameplay_healing_dwarf_ranger_08",
				"pbw_gameplay_healing_dwarf_ranger_09",
				"pbw_gameplay_healing_dwarf_ranger_14"
			},
			sound_events_duration = {
				1.5319792032242,
				1.2002083063126,
				1.9663749933243,
				2.4315416812897,
				2.7979791164398,
				1.4670833349228
			}
		},
		pbw_gameplay_healing_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_healing_empire_soldier_01",
				"pbw_gameplay_healing_empire_soldier_02",
				"pbw_gameplay_healing_empire_soldier_03",
				"pbw_gameplay_healing_empire_soldier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_healing_empire_soldier_01",
				"pbw_gameplay_healing_empire_soldier_02",
				"pbw_gameplay_healing_empire_soldier_03",
				"pbw_gameplay_healing_empire_soldier_04"
			},
			sound_events_duration = {
				2.3668541908264,
				2.0301041603088,
				2.6865832805634,
				1.7408958673477
			}
		},
		pbw_gameplay_healing_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_healing_witch_hunter_01",
				"pbw_gameplay_healing_witch_hunter_02",
				"pbw_gameplay_healing_witch_hunter_03",
				"pbw_gameplay_healing_witch_hunter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_healing_witch_hunter_01",
				"pbw_gameplay_healing_witch_hunter_02",
				"pbw_gameplay_healing_witch_hunter_03",
				"pbw_gameplay_healing_witch_hunter_04"
			},
			sound_events_duration = {
				3.3711042404175,
				2.4998958110809,
				3.585104227066,
				2.4523854255676
			}
		},
		pbw_gameplay_healing_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_healing_wood_elf_01",
				"pbw_gameplay_healing_wood_elf_02",
				"pbw_gameplay_healing_wood_elf_03",
				"pbw_gameplay_healing_wood_elf_04"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pbw_gameplay_healing_wood_elf_04 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pbw_gameplay_healing_wood_elf_01",
				"pbw_gameplay_healing_wood_elf_02",
				"pbw_gameplay_healing_wood_elf_03",
				"pbw_gameplay_healing_wood_elf_04"
			},
			sound_events_duration = {
				3.4666042327881,
				2.1620209217072,
				2.5591042041779,
				2.7740520238876
			}
		},
		pbw_gameplay_heard_dwarf_ranger_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_07"
			},
			sound_events_duration = {
				1.4887917041779,
				1.4887917041779,
				1.7024583816528,
				2.9942917823791
			}
		},
		pbw_gameplay_heard_empire_soldier_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_heard_empire_soldier_in_trouble_03",
				"pbw_gameplay_heard_empire_soldier_in_trouble_05",
				"pbw_gameplay_heard_empire_soldier_in_trouble_06",
				"pbw_gameplay_heard_empire_soldier_in_trouble_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_heard_empire_soldier_in_trouble_03",
				"pbw_gameplay_heard_empire_soldier_in_trouble_05",
				"pbw_gameplay_heard_empire_soldier_in_trouble_06",
				"pbw_gameplay_heard_empire_soldier_in_trouble_07"
			},
			sound_events_duration = {
				1.6243749856949,
				1.6243749856949,
				1.7200208902359,
				2.6290209293366
			}
		},
		pbw_gameplay_heard_witch_hunter_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_heard_witch_hunter_in_trouble_01",
				"pbw_gameplay_heard_witch_hunter_in_trouble_02",
				"pbw_gameplay_heard_witch_hunter_in_trouble_03",
				"pbw_gameplay_heard_witch_hunter_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_heard_witch_hunter_in_trouble_01",
				"pbw_gameplay_heard_witch_hunter_in_trouble_02",
				"pbw_gameplay_heard_witch_hunter_in_trouble_03",
				"pbw_gameplay_heard_witch_hunter_in_trouble_04"
			},
			sound_events_duration = {
				1.870020866394,
				2.3537707328796,
				1.1103541851044,
				1.7883541584015
			}
		},
		pbw_gameplay_heard_wood_elf_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_heard_wood_elf_in_trouble_01",
				"pbw_gameplay_heard_wood_elf_in_trouble_03",
				"pbw_gameplay_heard_wood_elf_in_trouble_05",
				"pbw_gameplay_heard_wood_elf_in_trouble_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_heard_wood_elf_in_trouble_01",
				"pbw_gameplay_heard_wood_elf_in_trouble_03",
				"pbw_gameplay_heard_wood_elf_in_trouble_05",
				"pbw_gameplay_heard_wood_elf_in_trouble_06"
			},
			sound_events_duration = {
				1.5703749656677,
				1.7235000133514,
				1.5703749656677,
				1.7235000133514
			}
		},
		pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			sound_events_duration = {
				1.4961667060852,
				2.1861457824707,
				1.1348541975021,
				1.5720416307449,
				1.112104177475,
				0.85039585828781
			}
		},
		pbw_gameplay_hearing_a_chaos_spawn_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_chaos_spawn_combat_01",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_02",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_03",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_04",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_05",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_06",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_07",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_chaos_spawn_combat_01",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_02",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_03",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_04",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_05",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_06",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_07",
				"pbw_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			sound_events_duration = {
				1.844645857811,
				1.1449583768845,
				1.2098333835602,
				1.2448749542236,
				1.278416633606,
				2.202187538147,
				1.1199791431427,
				1.4624791145325
			}
		},
		pbw_gameplay_hearing_a_chaos_warrior_champion_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_01",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_02",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_03",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_04",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_05",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_06",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_07",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_01",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_02",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_03",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_04",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_05",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_06",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_07",
				"pbw_gameplay_hearing_a_chaos_warrior_champion_combat_08"
			},
			sound_events_duration = {
				0.91412502527237,
				1.4169166088104,
				1.920041680336,
				1.7456041574478,
				2.6035208106041,
				1.4307500123978,
				1.5076458454132,
				2.5463540554047
			}
		},
		pbw_gameplay_hearing_a_chaos_warrior_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_chaos_warrior_combat_01",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_02",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_03",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_04",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_05",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_06",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_07",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_chaos_warrior_combat_01",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_02",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_03",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_04",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_05",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_06",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_07",
				"pbw_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			sound_events_duration = {
				1.1565208435059,
				1.673468708992,
				2.2968773841858,
				1.4133958816528,
				2.6903958320618,
				1.7296249866486,
				1.2656874656677,
				1.9992291927338
			}
		},
		pbw_gameplay_hearing_a_chaos_wizard_plague_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pbw_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pbw_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pbw_gameplay_hearing_a_chaos_wizard_plague_combat_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pbw_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pbw_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pbw_gameplay_hearing_a_chaos_wizard_plague_combat_04"
			},
			sound_events_duration = {
				2.6909167766571,
				3.0132501125336,
				2.8606667518616,
				2.985791683197
			}
		},
		pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pbw_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			sound_events_duration = {
				3.604291677475,
				1.4907083511352,
				1.4877916574478,
				1.3153125047684,
				2.2265207767487,
				1.7606250047684,
				3.0526041984558,
				1.745437502861
			}
		},
		pbw_gameplay_hearing_a_chaos_wizard_wind_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pbw_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pbw_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pbw_gameplay_hearing_a_chaos_wizard_wind_combat_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pbw_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pbw_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pbw_gameplay_hearing_a_chaos_wizard_wind_combat_04"
			},
			sound_events_duration = {
				1.4014999866486,
				2.2050728797913,
				2.4304583072662,
				1.4863125085831
			}
		},
		pbw_gameplay_hearing_a_gutter_runner_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_gutter_runner_combat_03",
				"pbw_gameplay_hearing_a_gutter_runner_combat_04",
				"pbw_gameplay_hearing_a_gutter_runner_combat_05",
				"pbw_gameplay_hearing_a_gutter_runner_combat_06",
				"pbw_gameplay_hearing_a_gutter_runner_combat_07",
				"pbw_gameplay_hearing_a_gutter_runner_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_gutter_runner_combat_03",
				"pbw_gameplay_hearing_a_gutter_runner_combat_04",
				"pbw_gameplay_hearing_a_gutter_runner_combat_05",
				"pbw_gameplay_hearing_a_gutter_runner_combat_06",
				"pbw_gameplay_hearing_a_gutter_runner_combat_07",
				"pbw_gameplay_hearing_a_gutter_runner_combat_08"
			},
			sound_events_duration = {
				1.055583357811,
				1.820791721344,
				1.0172499418259,
				2.8050000667572,
				1.5511457920075,
				1.9767916202545
			}
		},
		pbw_gameplay_hearing_a_minotaur = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_minotaur_01",
				"pbw_gameplay_hearing_a_minotaur_02",
				"pbw_gameplay_hearing_a_minotaur_03",
				"pbw_gameplay_hearing_a_minotaur_04",
				"pbw_gameplay_hearing_a_minotaur_05",
				"pbw_gameplay_hearing_a_minotaur_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_minotaur_01",
				"pbw_gameplay_hearing_a_minotaur_02",
				"pbw_gameplay_hearing_a_minotaur_03",
				"pbw_gameplay_hearing_a_minotaur_04",
				"pbw_gameplay_hearing_a_minotaur_05",
				"pbw_gameplay_hearing_a_minotaur_06"
			},
			sound_events_duration = {
				2.861145734787,
				2.7380833625794,
				2.4560625553131,
				3.5585000514984,
				3.686666727066,
				3.7892291545868
			}
		},
		pbw_gameplay_hearing_a_skaven_rat_ogre_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
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
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_03",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_03",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pbw_gameplay_hearing_a_Skaven_rat_ogre_combat_08"
			},
			sound_events_duration = {
				1.0499792098999,
				1.4516041278839,
				1.336833357811,
				1.9377291202545,
				2.075875043869,
				2.3411042690277
			}
		},
		pbw_gameplay_hearing_a_skaven_ratling_gun = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_08"
			},
			sound_events_duration = {
				1.13045835495,
				1.7427707910538,
				0.99185419082642,
				1.619958281517,
				1.6660000085831
			}
		},
		pbw_gameplay_hearing_a_skaven_ratling_gun_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pbw_gameplay_hearing_a_Skaven_ratling_gun_combat_08"
			},
			sound_events_duration = {
				1.13045835495,
				1.7427707910538,
				0.99185419082642,
				1.619958281517,
				1.6660000085831
			}
		},
		pbw_gameplay_hearing_a_standard_bearer = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
			sound_events_n = 4,
			category = "enemy_alerts",
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
				"pbw_gameplay_hearing_a_standard_bearer_01",
				"pbw_gameplay_hearing_a_standard_bearer_02",
				"pbw_gameplay_hearing_a_standard_bearer_04",
				"pbw_gameplay_hearing_a_standard_bearer_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_standard_bearer_01",
				"pbw_gameplay_hearing_a_standard_bearer_02",
				"pbw_gameplay_hearing_a_standard_bearer_04",
				"pbw_gameplay_hearing_a_standard_bearer_combat_06"
			},
			sound_events_duration = {
				3.0302083492279,
				3.7458958625794,
				2.7605624198914,
				2.6605417728424
			}
		},
		pbw_gameplay_hearing_a_standard_bearer_crater = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
			sound_events_n = 4,
			category = "enemy_alerts",
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
				"pbw_gameplay_hearing_a_standard_bearer_01",
				"pbw_gameplay_hearing_a_standard_bearer_02",
				"pbw_gameplay_hearing_a_standard_bearer_04",
				"pbw_gameplay_hearing_a_standard_bearer_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_standard_bearer_01",
				"pbw_gameplay_hearing_a_standard_bearer_02",
				"pbw_gameplay_hearing_a_standard_bearer_04",
				"pbw_gameplay_hearing_a_standard_bearer_combat_06"
			},
			sound_events_duration = {
				3.0302083492279,
				3.7458958625794,
				2.7605624198914,
				2.6605417728424
			}
		},
		pbw_gameplay_hearing_a_stormfiend_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_stormfiend_combat_01",
				"pbw_gameplay_hearing_a_stormfiend_combat_02",
				"pbw_gameplay_hearing_a_stormfiend_combat_03",
				"pbw_gameplay_hearing_a_stormfiend_combat_04",
				"pbw_gameplay_hearing_a_stormfiend_combat_05",
				"pbw_gameplay_hearing_a_stormfiend_combat_06",
				"pbw_gameplay_hearing_a_stormfiend_combat_07",
				"pbw_gameplay_hearing_a_stormfiend_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_stormfiend_combat_01",
				"pbw_gameplay_hearing_a_stormfiend_combat_02",
				"pbw_gameplay_hearing_a_stormfiend_combat_03",
				"pbw_gameplay_hearing_a_stormfiend_combat_04",
				"pbw_gameplay_hearing_a_stormfiend_combat_05",
				"pbw_gameplay_hearing_a_stormfiend_combat_06",
				"pbw_gameplay_hearing_a_stormfiend_combat_07",
				"pbw_gameplay_hearing_a_stormfiend_combat_08"
			},
			sound_events_duration = {
				1.6554374694824,
				1.6616458892822,
				1.0318332910538,
				1.750416636467,
				1.439333319664,
				1.9845625162125,
				2.1118125915527,
				1.2663124799728
			}
		},
		pbw_gameplay_hearing_a_troll_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_a_troll_combat_01",
				"pbw_gameplay_hearing_a_troll_combat_02",
				"pbw_gameplay_hearing_a_troll_combat_03",
				"pbw_gameplay_hearing_a_troll_combat_04",
				"pbw_gameplay_hearing_a_troll_combat_05",
				"pbw_gameplay_hearing_a_troll_combat_06",
				"pbw_gameplay_hearing_a_troll_combat_07",
				"pbw_gameplay_hearing_a_troll_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_a_troll_combat_01",
				"pbw_gameplay_hearing_a_troll_combat_02",
				"pbw_gameplay_hearing_a_troll_combat_03",
				"pbw_gameplay_hearing_a_troll_combat_04",
				"pbw_gameplay_hearing_a_troll_combat_05",
				"pbw_gameplay_hearing_a_troll_combat_06",
				"pbw_gameplay_hearing_a_troll_combat_07",
				"pbw_gameplay_hearing_a_troll_combat_08"
			},
			sound_events_duration = {
				0.71435415744782,
				1.5524166822434,
				2.6047291755676,
				1.2777500152588,
				0.9355416893959,
				1.2258125543594,
				1.4531146287918,
				2.2717916965485
			}
		},
		pbw_gameplay_hearing_marauder_berserker_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_hearing_marauder_berserker_combat_01",
				"pbw_gameplay_hearing_marauder_berserker_combat_02",
				"pbw_gameplay_hearing_marauder_berserker_combat_03",
				"pbw_gameplay_hearing_marauder_berserker_combat_04",
				"pbw_gameplay_hearing_marauder_berserker_combat_05",
				"pbw_gameplay_hearing_marauder_berserker_combat_06",
				"pbw_gameplay_hearing_marauder_berserker_combat_07",
				"pbw_gameplay_hearing_marauder_berserker_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hearing_marauder_berserker_combat_01",
				"pbw_gameplay_hearing_marauder_berserker_combat_02",
				"pbw_gameplay_hearing_marauder_berserker_combat_03",
				"pbw_gameplay_hearing_marauder_berserker_combat_04",
				"pbw_gameplay_hearing_marauder_berserker_combat_05",
				"pbw_gameplay_hearing_marauder_berserker_combat_06",
				"pbw_gameplay_hearing_marauder_berserker_combat_07",
				"pbw_gameplay_hearing_marauder_berserker_combat_08"
			},
			sound_events_duration = {
				2.1054792404175,
				1.4811458587647,
				1.7659167051315,
				1.7934999465942,
				0.8221041560173,
				1,
				2.0288333892822,
				1.6499999761581
			}
		},
		pbw_gameplay_hears_incoming_horde = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "bright_wizard_honduras",
			sound_events_n = 12,
			category = "enemy_alerts_high",
			dialogue_animations_n = 12,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
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
				"face_contempt"
			},
			localization_strings = {
				"pbw_gameplay_hears_incoming_horde_01",
				"pbw_gameplay_hears_incoming_horde_02",
				"pbw_gameplay_hears_incoming_horde_03",
				"pbw_gameplay_hears_incoming_horde_05",
				"pbw_gameplay_hears_incoming_horde_07",
				"pbw_gameplay_hears_incoming_horde_10",
				"pbw_gameplay_hears_incoming_horde_11",
				"pbw_gameplay_hears_incoming_horde_12",
				"pbw_gameplay_hears_incoming_horde_13",
				"pbw_gameplay_hears_incoming_horde_14",
				"pbw_gameplay_hears_incoming_horde_15",
				"pbw_gameplay_hears_incoming_horde_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hears_incoming_horde_01",
				"pbw_gameplay_hears_incoming_horde_02",
				"pbw_gameplay_hears_incoming_horde_03",
				"pbw_gameplay_hears_incoming_horde_05",
				"pbw_gameplay_hears_incoming_horde_07",
				"pbw_gameplay_hears_incoming_horde_10",
				"pbw_gameplay_hears_incoming_horde_11",
				"pbw_gameplay_hears_incoming_horde_12",
				"pbw_gameplay_hears_incoming_horde_13",
				"pbw_gameplay_hears_incoming_horde_14",
				"pbw_gameplay_hears_incoming_horde_15",
				"pbw_gameplay_hears_incoming_horde_16"
			},
			sound_events_duration = {
				1.3212708234787,
				2,
				1.2503541707993,
				2.1103541851044,
				3.0883896350861,
				1.5528957843781,
				1.4198541641235,
				3.3412499427795,
				2.4601874351502,
				2.9245624542236,
				4.6996250152588,
				3.4326040744781
			}
		},
		pbw_gameplay_helped_by_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_helped_by_dwarf_ranger_03",
				"pbw_gameplay_helped_by_dwarf_ranger_05",
				"pbw_gameplay_helped_by_dwarf_ranger_06",
				"pbw_gameplay_helped_by_dwarf_ranger_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_helped_by_dwarf_ranger_03",
				"pbw_gameplay_helped_by_dwarf_ranger_05",
				"pbw_gameplay_helped_by_dwarf_ranger_06",
				"pbw_gameplay_helped_by_dwarf_ranger_07"
			},
			sound_events_duration = {
				1.1928124427795,
				1.1928124427795,
				2.1330208778381,
				1.4213750362396
			}
		},
		pbw_gameplay_helped_by_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_helped_by_empire_soldier_01",
				"pbw_gameplay_helped_by_empire_soldier_05",
				"pbw_gameplay_helped_by_empire_soldier_06",
				"pbw_gameplay_helped_by_empire_soldier_07",
				"pbw_gameplay_healing_empire_soldier_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_helped_by_empire_soldier_01",
				"pbw_gameplay_helped_by_empire_soldier_05",
				"pbw_gameplay_helped_by_empire_soldier_06",
				"pbw_gameplay_helped_by_empire_soldier_07",
				"pbw_gameplay_healing_empire_soldier_09"
			},
			sound_events_duration = {
				1.2418541908264,
				1.2418541908264,
				1.3056458234787,
				1.4301458597183,
				2.4242084026337
			}
		},
		pbw_gameplay_helped_by_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_helped_by_witch_hunter_04",
				"pbw_gameplay_helped_by_witch_hunter_05",
				"pbw_gameplay_helped_by_witch_hunter_06",
				"pbw_gameplay_helped_by_witch_hunter_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_helped_by_witch_hunter_04",
				"pbw_gameplay_helped_by_witch_hunter_05",
				"pbw_gameplay_helped_by_witch_hunter_06",
				"pbw_gameplay_helped_by_witch_hunter_07"
			},
			sound_events_duration = {
				1.7616666555405,
				1.7616666555405,
				1.93850004673,
				2.2696459293366
			}
		},
		pbw_gameplay_helped_by_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_helped_by_wood_elf_01",
				"pbw_gameplay_helped_by_wood_elf_05",
				"pbw_gameplay_helped_by_wood_elf_06",
				"pbw_gameplay_helped_by_wood_elf_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_helped_by_wood_elf_01",
				"pbw_gameplay_helped_by_wood_elf_05",
				"pbw_gameplay_helped_by_wood_elf_06",
				"pbw_gameplay_helped_by_wood_elf_07"
			},
			sound_events_duration = {
				1.3215416669846,
				1.3215416669846,
				1.2043333053589,
				2.0004999637604
			}
		},
		pbw_gameplay_hit_by_goo = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			localization_strings = {
				"pbw_gameplay_hit_by_goo_01",
				"pbw_gameplay_hit_by_goo_02",
				"pbw_gameplay_hit_by_goo_03",
				"pbw_gameplay_hit_by_goo_04",
				"pbw_gameplay_hit_by_goo_05",
				"pbw_gameplay_hit_by_goo_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_hit_by_goo_01",
				"pbw_gameplay_hit_by_goo_02",
				"pbw_gameplay_hit_by_goo_03",
				"pbw_gameplay_hit_by_goo_04",
				"pbw_gameplay_hit_by_goo_05",
				"pbw_gameplay_hit_by_goo_06"
			},
			sound_events_duration = {
				4.9989166259766,
				3.3011040687561,
				5.5829582214356,
				5.4883751869202,
				3.0682499408722,
				8.4565000534058
			}
		},
		pbw_gameplay_incoming_attack = {
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "bright_wizard_honduras",
			sound_events_n = 14,
			category = "enemy_alerts_high",
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
				"pbw_gameplay_seeing_a_minotaur_01",
				"pbw_gameplay_seeing_a_minotaur_02",
				"pbw_gameplay_seeing_a_minotaur_03",
				"pbw_gameplay_seeing_a_minotaur_04",
				"pbw_gameplay_seeing_a_minotaur_05",
				"pbw_gameplay_seeing_a_minotaur_06",
				"pbw_gameplay_seeing_a_minotaur_07",
				"pbw_gameplay_seeing_a_minotaur_08",
				"pbw_gameplay_hearing_a_minotaur_combat_01",
				"pbw_gameplay_hearing_a_minotaur_combat_02",
				"pbw_gameplay_hearing_a_minotaur_combat_03",
				"pbw_gameplay_hearing_a_minotaur_combat_04",
				"pbw_gameplay_hearing_a_minotaur_combat_05",
				"pbw_gameplay_hearing_a_minotaur_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_minotaur_01",
				"pbw_gameplay_seeing_a_minotaur_02",
				"pbw_gameplay_seeing_a_minotaur_03",
				"pbw_gameplay_seeing_a_minotaur_04",
				"pbw_gameplay_seeing_a_minotaur_05",
				"pbw_gameplay_seeing_a_minotaur_06",
				"pbw_gameplay_seeing_a_minotaur_07",
				"pbw_gameplay_seeing_a_minotaur_08",
				"pbw_gameplay_hearing_a_minotaur_combat_01",
				"pbw_gameplay_hearing_a_minotaur_combat_02",
				"pbw_gameplay_hearing_a_minotaur_combat_03",
				"pbw_gameplay_hearing_a_minotaur_combat_04",
				"pbw_gameplay_hearing_a_minotaur_combat_05",
				"pbw_gameplay_hearing_a_minotaur_combat_06"
			},
			sound_events_duration = {
				3.7557916641235,
				2.1306042671204,
				2.4215624332428,
				4.1187500953674,
				4.1187291145325,
				4.0574480295181,
				2.4910209178925,
				1.2455208301544,
				2.1944582462311,
				2.7829375267029,
				3.5229165554047,
				3.1364374160767,
				2.4675416946411,
				3.7359790802002
			}
		},
		pbw_gameplay_incoming_bestigor_attack = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_incoming_bestigor_attack_01",
				"pbw_gameplay_incoming_bestigor_attack_02",
				"pbw_gameplay_incoming_bestigor_attack_03",
				"pbw_gameplay_incoming_bestigor_attack_04",
				"pbw_gameplay_incoming_bestigor_attack_05",
				"pbw_gameplay_incoming_bestigor_attack_06",
				"pbw_gameplay_incoming_bestigor_attack_07",
				"pbw_gameplay_incoming_bestigor_attack_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_incoming_bestigor_attack_01",
				"pbw_gameplay_incoming_bestigor_attack_02",
				"pbw_gameplay_incoming_bestigor_attack_03",
				"pbw_gameplay_incoming_bestigor_attack_04",
				"pbw_gameplay_incoming_bestigor_attack_05",
				"pbw_gameplay_incoming_bestigor_attack_06",
				"pbw_gameplay_incoming_bestigor_attack_07",
				"pbw_gameplay_incoming_bestigor_attack_08"
			},
			sound_events_duration = {
				2.1571667194366,
				1.4915208816528,
				1.4843125343323,
				1.812020778656,
				1.6000000238419,
				1.5989791154861,
				1.2603958845139,
				1.9022500514984
			}
		},
		pbw_gameplay_incoming_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_incoming_globadier_01",
				"pbw_gameplay_incoming_globadier_02",
				"pbw_gameplay_incoming_globadier_03",
				"pbw_gameplay_incoming_globadier_04",
				"pbw_gameplay_incoming_globadier_05",
				"pbw_gameplay_incoming_globadier_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_incoming_globadier_01",
				"pbw_gameplay_incoming_globadier_02",
				"pbw_gameplay_incoming_globadier_03",
				"pbw_gameplay_incoming_globadier_04",
				"pbw_gameplay_incoming_globadier_05",
				"pbw_gameplay_incoming_globadier_06"
			},
			sound_events_duration = {
				0.75501042604446,
				3.5180833339691,
				1.9794791936874,
				2.4151248931885,
				1.9418541491032,
				2.0971457958221
			}
		},
		pbw_gameplay_incoming_skaven_rat_ogre = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_incoming_skaven_rat_ogre_01",
				"pbw_gameplay_incoming_skaven_rat_ogre_02",
				"pbw_gameplay_incoming_Skaven_rat_ogre_09",
				"pbw_gameplay_incoming_Skaven_rat_ogre_10",
				"pbw_gameplay_incoming_Skaven_rat_ogre_11",
				"pbw_gameplay_incoming_Skaven_rat_ogre_12",
				"pbw_gameplay_incoming_Skaven_rat_ogre_13",
				"pbw_gameplay_incoming_Skaven_rat_ogre_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_incoming_skaven_rat_ogre_01",
				"pbw_gameplay_incoming_skaven_rat_ogre_02",
				"pbw_gameplay_incoming_Skaven_rat_ogre_09",
				"pbw_gameplay_incoming_Skaven_rat_ogre_10",
				"pbw_gameplay_incoming_Skaven_rat_ogre_11",
				"pbw_gameplay_incoming_Skaven_rat_ogre_12",
				"pbw_gameplay_incoming_Skaven_rat_ogre_13",
				"pbw_gameplay_incoming_Skaven_rat_ogre_14"
			},
			sound_events_duration = {
				1.4208542108536,
				1.3828542232513,
				1.2081458568573,
				3.0825624465942,
				1.3749375045299,
				2.2492084503174,
				1.5242291688919,
				1.4535207748413
			}
		},
		pbw_gameplay_killing_a_chaos_warrior = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_a_chaos_warrior_01",
				"pbw_gameplay_killing_a_chaos_warrior_02",
				"pbw_gameplay_killing_a_chaos_warrior_03",
				"pbw_gameplay_killing_a_chaos_warrior_04",
				"pbw_gameplay_killing_a_chaos_warrior_05",
				"pbw_gameplay_killing_a_chaos_warrior_06",
				"pbw_gameplay_killing_a_chaos_warrior_07",
				"pbw_gameplay_killing_a_chaos_warrior_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_a_chaos_warrior_01",
				"pbw_gameplay_killing_a_chaos_warrior_02",
				"pbw_gameplay_killing_a_chaos_warrior_03",
				"pbw_gameplay_killing_a_chaos_warrior_04",
				"pbw_gameplay_killing_a_chaos_warrior_05",
				"pbw_gameplay_killing_a_chaos_warrior_06",
				"pbw_gameplay_killing_a_chaos_warrior_07",
				"pbw_gameplay_killing_a_chaos_warrior_08"
			},
			sound_events_duration = {
				3.0988750457764,
				2.1317291259766,
				2.5179166793823,
				2.3296248912811,
				2.3906042575836,
				3.5757708549499,
				4.008291721344,
				2.7562708854675
			}
		},
		pbw_gameplay_killing_a_chaos_warrior_champion = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_a_chaos_warrior_champion_01",
				"pbw_gameplay_killing_a_chaos_warrior_champion_02",
				"pbw_gameplay_killing_a_chaos_warrior_champion_03",
				"pbw_gameplay_killing_a_chaos_warrior_champion_04",
				"pbw_gameplay_killing_a_chaos_warrior_champion_05",
				"pbw_gameplay_killing_a_chaos_warrior_champion_06",
				"pbw_gameplay_killing_a_chaos_warrior_champion_07",
				"pbw_gameplay_killing_a_chaos_warrior_champion_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_a_chaos_warrior_champion_01",
				"pbw_gameplay_killing_a_chaos_warrior_champion_02",
				"pbw_gameplay_killing_a_chaos_warrior_champion_03",
				"pbw_gameplay_killing_a_chaos_warrior_champion_04",
				"pbw_gameplay_killing_a_chaos_warrior_champion_05",
				"pbw_gameplay_killing_a_chaos_warrior_champion_06",
				"pbw_gameplay_killing_a_chaos_warrior_champion_07",
				"pbw_gameplay_killing_a_chaos_warrior_champion_08"
			},
			sound_events_duration = {
				3.5064165592194,
				2.7337915897369,
				2.9902708530426,
				2.8949792385101,
				2.8149375915527,
				4.3797707557678,
				2.718270778656,
				2.6975834369659
			}
		},
		pbw_gameplay_killing_a_chaos_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_a_chaos_wizard_plague_01",
				"pbw_gameplay_killing_a_chaos_wizard_plague_02",
				"pbw_gameplay_killing_a_chaos_wizard_plague_03",
				"pbw_gameplay_killing_a_chaos_wizard_plague_04",
				"pbw_gameplay_killing_a_chaos_wizard_plague_05",
				"pbw_gameplay_killing_a_chaos_wizard_plague_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_a_chaos_wizard_plague_01",
				"pbw_gameplay_killing_a_chaos_wizard_plague_02",
				"pbw_gameplay_killing_a_chaos_wizard_plague_03",
				"pbw_gameplay_killing_a_chaos_wizard_plague_04",
				"pbw_gameplay_killing_a_chaos_wizard_plague_05",
				"pbw_gameplay_killing_a_chaos_wizard_plague_06"
			},
			sound_events_duration = {
				2.588770866394,
				2.754604101181,
				4.9023957252502,
				2.9250416755676,
				1.2523958683014,
				1.4528958797455
			}
		},
		pbw_gameplay_killing_a_chaos_wizard_tentacle = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			sound_events_duration = {
				2.1643126010895,
				2.7968125343323,
				2.9404165744781,
				2.1820833683014,
				3.2365624904633,
				1.39162504673
			}
		},
		pbw_gameplay_killing_a_chaos_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_a_chaos_wizard_wind_01",
				"pbw_gameplay_killing_a_chaos_wizard_wind_02",
				"pbw_gameplay_killing_a_chaos_wizard_wind_03",
				"pbw_gameplay_killing_a_chaos_wizard_wind_04",
				"pbw_gameplay_killing_a_chaos_wizard_wind_05",
				"pbw_gameplay_killing_a_chaos_wizard_wind_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_a_chaos_wizard_wind_01",
				"pbw_gameplay_killing_a_chaos_wizard_wind_02",
				"pbw_gameplay_killing_a_chaos_wizard_wind_03",
				"pbw_gameplay_killing_a_chaos_wizard_wind_04",
				"pbw_gameplay_killing_a_chaos_wizard_wind_05",
				"pbw_gameplay_killing_a_chaos_wizard_wind_06"
			},
			sound_events_duration = {
				3.7983748912811,
				1.8550624847412,
				2.0462915897369,
				3.3470833301544,
				2.0906040668488,
				2.0048542022705
			}
		},
		pbw_gameplay_killing_a_minotaur = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_a_minotaur_01",
				"pbw_gameplay_killing_a_minotaur_02",
				"pbw_gameplay_killing_a_minotaur_03",
				"pbw_gameplay_killing_a_minotaur_04",
				"pbw_gameplay_killing_a_minotaur_05",
				"pbw_gameplay_killing_a_minotaur_06",
				"pbw_gameplay_killing_a_minotaur_07",
				"pbw_gameplay_killing_a_minotaur_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_a_minotaur_01",
				"pbw_gameplay_killing_a_minotaur_02",
				"pbw_gameplay_killing_a_minotaur_03",
				"pbw_gameplay_killing_a_minotaur_04",
				"pbw_gameplay_killing_a_minotaur_05",
				"pbw_gameplay_killing_a_minotaur_06",
				"pbw_gameplay_killing_a_minotaur_07",
				"pbw_gameplay_killing_a_minotaur_08"
			},
			sound_events_duration = {
				3.7360000610352,
				3.539895772934,
				2.8288125991821,
				3.5224269628525,
				2.4183750152588,
				3.072208404541,
				5.0621876716614,
				5.1298751831055
			}
		},
		pbw_gameplay_killing_a_skaven_warpfire_thrower = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pbw_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			sound_events_duration = {
				2.0427916049957,
				4.0211043357849,
				1.5100833177566,
				3.0448124408722,
				4.1617498397827,
				5.5103335380554,
				1.9893333911896,
				5.0868124961853
			}
		},
		pbw_gameplay_killing_a_stormfiend = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_a_stormfiend_01",
				"pbw_gameplay_killing_a_stormfiend_02",
				"pbw_gameplay_killing_a_stormfiend_03",
				"pbw_gameplay_killing_a_stormfiend_04",
				"pbw_gameplay_killing_a_stormfiend_05",
				"pbw_gameplay_killing_a_stormfiend_06",
				"pbw_gameplay_killing_a_stormfiend_07",
				"pbw_gameplay_killing_a_stormfiend_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_a_stormfiend_01",
				"pbw_gameplay_killing_a_stormfiend_02",
				"pbw_gameplay_killing_a_stormfiend_03",
				"pbw_gameplay_killing_a_stormfiend_04",
				"pbw_gameplay_killing_a_stormfiend_05",
				"pbw_gameplay_killing_a_stormfiend_06",
				"pbw_gameplay_killing_a_stormfiend_07",
				"pbw_gameplay_killing_a_stormfiend_08"
			},
			sound_events_duration = {
				2.228354215622,
				3.391104221344,
				2.8451249599457,
				3.7110834121704,
				2.3971457481384,
				2.5882709026337,
				4.0003957748413,
				3.5962707996368
			}
		},
		pbw_gameplay_killing_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_globadier_05",
				"pbw_gameplay_killing_globadier_06",
				"pbw_gameplay_killing_globadier_07",
				"pbw_gameplay_killing_globadier_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_globadier_05",
				"pbw_gameplay_killing_globadier_06",
				"pbw_gameplay_killing_globadier_07",
				"pbw_gameplay_killing_globadier_08"
			},
			sound_events_duration = {
				1.8879166841507,
				2.4911041259766,
				2.8723750114441,
				2.7813124656677
			}
		},
		pbw_gameplay_killing_gutterrunner = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_gutterrunner_01",
				"pbw_gameplay_killing_gutterrunner_05",
				"pbw_gameplay_killing_gutterrunner_06",
				"pbw_gameplay_killing_gutterrunner_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_gutterrunner_01",
				"pbw_gameplay_killing_gutterrunner_05",
				"pbw_gameplay_killing_gutterrunner_06",
				"pbw_gameplay_killing_gutterrunner_07"
			},
			sound_events_duration = {
				1.932458281517,
				1.932458281517,
				1.8917499780655,
				1.6289166212082
			}
		},
		pbw_gameplay_killing_lootrat = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_lootrat_05",
				"pbw_gameplay_killing_lootrat_06",
				"pbw_gameplay_killing_lootrat_07",
				"pbw_gameplay_killing_lootrat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_lootrat_05",
				"pbw_gameplay_killing_lootrat_06",
				"pbw_gameplay_killing_lootrat_07",
				"pbw_gameplay_killing_lootrat_08"
			},
			sound_events_duration = {
				2.9621665477753,
				1.331375002861,
				4.1983542442322,
				3.0835626125336
			}
		},
		pbw_gameplay_killing_packmaster = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_packmaster_05",
				"pbw_gameplay_killing_packmaster_06",
				"pbw_gameplay_killing_packmaster_07",
				"pbw_gameplay_killing_packmaster_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_packmaster_05",
				"pbw_gameplay_killing_packmaster_06",
				"pbw_gameplay_killing_packmaster_07",
				"pbw_gameplay_killing_packmaster_08"
			},
			sound_events_duration = {
				3.0562291145325,
				2.5496666431427,
				3.1418333053589,
				2.4908542633057
			}
		},
		pbw_gameplay_killing_ratling = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_killing_ratling_05",
				"pbw_gameplay_killing_ratling_06",
				"pbw_gameplay_killing_ratling_07",
				"pbw_gameplay_killing_ratling_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_killing_ratling_05",
				"pbw_gameplay_killing_ratling_06",
				"pbw_gameplay_killing_ratling_07",
				"pbw_gameplay_killing_ratling_08"
			},
			sound_events_duration = {
				3.1981248855591,
				3.3706874847412,
				1.2501875162125,
				2.0763957500458
			}
		},
		pbw_gameplay_knocked_down = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"face_angry",
				"face_fear",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_06",
				"pbw_gameplay_knocked_down_07",
				"pbw_gameplay_knocked_down_08",
				"pbw_gameplay_knocked_down_09",
				"pbw_gameplay_knocked_down_10",
				"pbw_gameplay_knocked_down_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_06",
				"pbw_gameplay_knocked_down_07",
				"pbw_gameplay_knocked_down_08",
				"pbw_gameplay_knocked_down_09",
				"pbw_gameplay_knocked_down_10",
				"pbw_gameplay_knocked_down_11"
			},
			sound_events_duration = {
				2.6722707748413,
				1.7201978564262,
				1.86172914505,
				1.9887708425522,
				1.6805624961853,
				1.9529270529747,
				2.4146041870117,
				2.8696458339691
			}
		},
		pbw_gameplay_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"face_exhausted"
			},
			localization_strings = {
				"pbw_gameplay_low_on_health_05",
				"pbw_gameplay_low_on_health_09",
				"pbw_gameplay_low_on_health_10",
				"pbw_gameplay_low_on_health_11",
				"pbw_gameplay_low_on_health_12",
				"pbw_gameplay_low_on_health_13",
				"pbw_gameplay_low_on_health_14",
				"pbw_gameplay_low_on_health_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_low_on_health_05",
				"pbw_gameplay_low_on_health_09",
				"pbw_gameplay_low_on_health_10",
				"pbw_gameplay_low_on_health_11",
				"pbw_gameplay_low_on_health_12",
				"pbw_gameplay_low_on_health_13",
				"pbw_gameplay_low_on_health_14",
				"pbw_gameplay_low_on_health_15"
			},
			sound_events_duration = {
				1.4831666946411,
				1.4831666946411,
				2.9396250247955,
				1.79787504673,
				2.364354133606,
				1.8741562366486,
				2.2006042003632,
				2.7965834140778
			}
		},
		pbw_gameplay_no_nearby_teammates = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_no_nearby_teammates_09",
				"pbw_gameplay_no_nearby_teammates_10",
				"pbw_gameplay_no_nearby_teammates_11",
				"pbw_gameplay_no_nearby_teammates_12",
				"pbw_gameplay_no_nearby_teammates_13",
				"pbw_gameplay_no_nearby_teammates_14",
				"pbw_gameplay_no_nearby_teammates_15",
				"pbw_gameplay_no_nearby_teammates_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_no_nearby_teammates_09",
				"pbw_gameplay_no_nearby_teammates_10",
				"pbw_gameplay_no_nearby_teammates_11",
				"pbw_gameplay_no_nearby_teammates_12",
				"pbw_gameplay_no_nearby_teammates_13",
				"pbw_gameplay_no_nearby_teammates_14",
				"pbw_gameplay_no_nearby_teammates_15",
				"pbw_gameplay_no_nearby_teammates_16"
			},
			sound_events_duration = {
				2.2669582366943,
				2.7697501182556,
				2.6823124885559,
				2.6362707614899,
				2.8647499084473,
				1.9212708473206,
				3.1251459121704,
				3.3063542842865
			}
		},
		pbw_gameplay_overcharge = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_overcharge_05",
				"pbw_gameplay_overcharge_07",
				"pbw_gameplay_overcharge_08",
				"pbw_gameplay_overcharge_09",
				"pbw_gameplay_overcharge_10",
				"pbw_gameplay_overcharge_12",
				"pbw_gameplay_overcharge_13",
				"pbw_gameplay_overcharge_14"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pbw_gameplay_overcharge_13 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				},
				pbw_gameplay_overcharge_14 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pbw_gameplay_overcharge_05",
				"pbw_gameplay_overcharge_07",
				"pbw_gameplay_overcharge_08",
				"pbw_gameplay_overcharge_09",
				"pbw_gameplay_overcharge_10",
				"pbw_gameplay_overcharge_12",
				"pbw_gameplay_overcharge_13",
				"pbw_gameplay_overcharge_14"
			},
			sound_events_duration = {
				3.4356665611267,
				3.5413959026337,
				4.3920727968216,
				4.4796147346497,
				4.3748123645782,
				4.3479478359222,
				3.7656770944595,
				5.8112292289734
			}
		},
		pbw_gameplay_parry_dwarf_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_parry_dwarf_ranger_01",
				"pbw_gameplay_parry_dwarf_ranger_02",
				"pbw_gameplay_parry_dwarf_ranger_03",
				"pbw_gameplay_parry_dwarf_ranger_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_parry_dwarf_ranger_01",
				"pbw_gameplay_parry_dwarf_ranger_02",
				"pbw_gameplay_parry_dwarf_ranger_03",
				"pbw_gameplay_parry_dwarf_ranger_04"
			},
			sound_events_duration = {
				1.5937708616257,
				2.0848958492279,
				1.8478749990463,
				1.7763957977295
			}
		},
		pbw_gameplay_parry_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_parry_empire_soldier_01",
				"pbw_gameplay_parry_empire_soldier_02",
				"pbw_gameplay_parry_empire_soldier_03",
				"pbw_gameplay_parry_empire_soldier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_parry_empire_soldier_01",
				"pbw_gameplay_parry_empire_soldier_02",
				"pbw_gameplay_parry_empire_soldier_03",
				"pbw_gameplay_parry_empire_soldier_04"
			},
			sound_events_duration = {
				1.5740208625793,
				1.9814374446869,
				1.9655417203903,
				2.3188333511352
			}
		},
		pbw_gameplay_parry_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_parry_witch_hunter_01",
				"pbw_gameplay_parry_witch_hunter_02",
				"pbw_gameplay_parry_witch_hunter_03",
				"pbw_gameplay_parry_witch_hunter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_parry_witch_hunter_01",
				"pbw_gameplay_parry_witch_hunter_02",
				"pbw_gameplay_parry_witch_hunter_03",
				"pbw_gameplay_parry_witch_hunter_04"
			},
			sound_events_duration = {
				1.5384792089462,
				1.5924999713898,
				1.7701250314713,
				2.0768542289734
			}
		},
		pbw_gameplay_parry_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_parry_wood_elf_01",
				"pbw_gameplay_parry_wood_elf_02",
				"pbw_gameplay_parry_wood_elf_03",
				"pbw_gameplay_parry_wood_elf_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_parry_wood_elf_01",
				"pbw_gameplay_parry_wood_elf_02",
				"pbw_gameplay_parry_wood_elf_03",
				"pbw_gameplay_parry_wood_elf_04"
			},
			sound_events_duration = {
				2.208208322525,
				1.9045208692551,
				1.3587291240692,
				1.8435416221619
			}
		},
		pbw_gameplay_player_pounced = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_gameplay_player_pounced_01",
				"pbw_gameplay_player_pounced_02",
				"pbw_gameplay_player_pounced_03",
				"pbw_gameplay_player_pounced_04",
				"pbw_gameplay_player_pounced_05",
				"pbw_gameplay_player_pounced_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_player_pounced_01",
				"pbw_gameplay_player_pounced_02",
				"pbw_gameplay_player_pounced_03",
				"pbw_gameplay_player_pounced_04",
				"pbw_gameplay_player_pounced_05",
				"pbw_gameplay_player_pounced_06"
			},
			sound_events_duration = {
				1.7718333005905,
				0.80414581298828,
				2.8928542137146,
				0.81095832586288,
				3.9640207290649,
				2.8849792480469
			}
		},
		pbw_gameplay_seeing_a_Skaven_warpfire_thrower = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pbw_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			sound_events_duration = {
				3.597062587738,
				2.8307292461395,
				2.0537707805634,
				3.0204999446869,
				5.4553127288818,
				3.6602292060852,
				4.3384790420532,
				3.9912083148956
			}
		},
		pbw_gameplay_seeing_a_chaos_spawn = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_chaos_spawn_01",
				"pbw_gameplay_seeing_a_chaos_spawn_02",
				"pbw_gameplay_seeing_a_chaos_spawn_03",
				"pbw_gameplay_seeing_a_chaos_spawn_04",
				"pbw_gameplay_seeing_a_chaos_spawn_05",
				"pbw_gameplay_seeing_a_chaos_spawn_06",
				"pbw_gameplay_seeing_a_chaos_spawn_07",
				"pbw_gameplay_seeing_a_chaos_spawn_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_spawn_01",
				"pbw_gameplay_seeing_a_chaos_spawn_02",
				"pbw_gameplay_seeing_a_chaos_spawn_03",
				"pbw_gameplay_seeing_a_chaos_spawn_04",
				"pbw_gameplay_seeing_a_chaos_spawn_05",
				"pbw_gameplay_seeing_a_chaos_spawn_06",
				"pbw_gameplay_seeing_a_chaos_spawn_07",
				"pbw_gameplay_seeing_a_chaos_spawn_08"
			},
			sound_events_duration = {
				4.5718126296997,
				2.5718123912811,
				4.3003540039063,
				4.5713334083557,
				1.7646666765213,
				2.6483750343323,
				2.0226459503174,
				3.8768124580383
			}
		},
		pbw_gameplay_seeing_a_chaos_warrior = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_chaos_warrior_01",
				"pbw_gameplay_seeing_a_chaos_warrior_02",
				"pbw_gameplay_seeing_a_chaos_warrior_03",
				"pbw_gameplay_seeing_a_chaos_warrior_04",
				"pbw_gameplay_seeing_a_chaos_warrior_05",
				"pbw_gameplay_seeing_a_chaos_warrior_06",
				"pbw_gameplay_seeing_a_chaos_warrior_07",
				"pbw_gameplay_seeing_a_chaos_warrior_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_warrior_01",
				"pbw_gameplay_seeing_a_chaos_warrior_02",
				"pbw_gameplay_seeing_a_chaos_warrior_03",
				"pbw_gameplay_seeing_a_chaos_warrior_04",
				"pbw_gameplay_seeing_a_chaos_warrior_05",
				"pbw_gameplay_seeing_a_chaos_warrior_06",
				"pbw_gameplay_seeing_a_chaos_warrior_07",
				"pbw_gameplay_seeing_a_chaos_warrior_08"
			},
			sound_events_duration = {
				3.9117708206177,
				3.3820416927338,
				1.471895813942,
				3.8545417785645,
				4.156750202179,
				3.0422291755676,
				4.3150730133057,
				3.5143542289734
			}
		},
		pbw_gameplay_seeing_a_chaos_warrior_champion_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pbw_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			sound_events_duration = {
				2.9866666793823,
				3.6398541927338,
				2.2180209159851,
				3.4857499599457,
				5.4154376983643,
				4.2248959541321,
				3.7869791984558,
				4.0698957443237
			}
		},
		pbw_gameplay_seeing_a_chaos_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_chaos_wizard_plague_01",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_02",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_03",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_wizard_plague_01",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_02",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_03",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			sound_events_duration = {
				4.0935206413269,
				3.9944999217987,
				7.5737290382385,
				4.461395740509
			}
		},
		pbw_gameplay_seeing_a_chaos_wizard_tentacle = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			sound_events_duration = {
				4.601541519165,
				3.7303333282471,
				2.7143542766571,
				3.902937412262
			}
		},
		pbw_gameplay_seeing_a_chaos_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_chaos_wizard_wind_01",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_02",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_03",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_wizard_wind_01",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_02",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_03",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			sound_events_duration = {
				4.8703956604004,
				3.974312543869,
				3.6810417175293,
				3.7641041278839
			}
		},
		pbw_gameplay_seeing_a_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_globadier_01",
				"pbw_gameplay_seeing_a_globadier_02",
				"pbw_gameplay_seeing_a_globadier_03",
				"pbw_gameplay_seeing_a_globadier_06",
				"pbw_gameplay_seeing_a_globadier_07",
				"pbw_gameplay_seeing_a_globadier_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_globadier_01",
				"pbw_gameplay_seeing_a_globadier_02",
				"pbw_gameplay_seeing_a_globadier_03",
				"pbw_gameplay_seeing_a_globadier_06",
				"pbw_gameplay_seeing_a_globadier_07",
				"pbw_gameplay_seeing_a_globadier_08"
			},
			sound_events_duration = {
				0.90679168701172,
				1.2430416345596,
				1.0505625009537,
				1.7316666841507,
				1.9557917118073,
				2.0025625228882
			}
		},
		pbw_gameplay_seeing_a_gutter_runner = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_gutter_runner_02",
				"pbw_gameplay_seeing_a_gutter_runner_04",
				"pbw_gameplay_seeing_a_gutter_runner_07",
				"pbw_gameplay_seeing_a_gutter_runner_08",
				"pbw_gameplay_seeing_a_gutter_runner_09",
				"pbw_gameplay_seeing_a_gutter_runner_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_gutter_runner_02",
				"pbw_gameplay_seeing_a_gutter_runner_04",
				"pbw_gameplay_seeing_a_gutter_runner_07",
				"pbw_gameplay_seeing_a_gutter_runner_08",
				"pbw_gameplay_seeing_a_gutter_runner_09",
				"pbw_gameplay_seeing_a_gutter_runner_10"
			},
			sound_events_duration = {
				0.99937498569489,
				1.0250416994095,
				1.265104174614,
				1.9196875095367,
				1.5871875286102,
				1.2333333492279
			}
		},
		pbw_gameplay_seeing_a_pm = {
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_pm_01",
				"pbw_gameplay_seeing_a_pm_02",
				"pbw_gameplay_seeing_a_pm_03",
				"pbw_gameplay_seeing_a_pm_04",
				"pbw_gameplay_seeing_a_pm_05",
				"pbw_gameplay_seeing_a_pm_06",
				"pbw_gameplay_seeing_a_pm_07",
				"pbw_gameplay_seeing_a_pm_08",
				"pbw_gameplay_seeing_a_plague_monk_01",
				"pbw_gameplay_seeing_a_plague_monk_02",
				"pbw_gameplay_seeing_a_plague_monk_03",
				"pbw_gameplay_seeing_a_plague_monk_04",
				"pbw_gameplay_seeing_a_plague_monk_05",
				"pbw_gameplay_seeing_a_plague_monk_06",
				"pbw_gameplay_seeing_a_plague_monk_07",
				"pbw_gameplay_seeing_a_plague_monk_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_pm_01",
				"pbw_gameplay_seeing_a_pm_02",
				"pbw_gameplay_seeing_a_pm_03",
				"pbw_gameplay_seeing_a_pm_04",
				"pbw_gameplay_seeing_a_pm_05",
				"pbw_gameplay_seeing_a_pm_06",
				"pbw_gameplay_seeing_a_pm_07",
				"pbw_gameplay_seeing_a_pm_08",
				"pbw_gameplay_seeing_a_plague_monk_01",
				"pbw_gameplay_seeing_a_plague_monk_02",
				"pbw_gameplay_seeing_a_plague_monk_03",
				"pbw_gameplay_seeing_a_plague_monk_04",
				"pbw_gameplay_seeing_a_plague_monk_05",
				"pbw_gameplay_seeing_a_plague_monk_06",
				"pbw_gameplay_seeing_a_plague_monk_07",
				"pbw_gameplay_seeing_a_plague_monk_08"
			},
			sound_events_duration = {
				0.87633335590363,
				1.0878541469574,
				1.313395857811,
				1.2875833511352,
				1.1419792175293,
				1.6913958787918,
				1.4061249494553,
				1.1703333854675,
				3.1865208148956,
				5.2673749923706,
				4.4918751716614,
				5.045437335968,
				2.1971249580383,
				2.5055208206177,
				3.7887291908264,
				2.8049166202545
			}
		},
		pbw_gameplay_seeing_a_scr = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_scr_01",
				"pbw_gameplay_seeing_a_scr_02",
				"pbw_gameplay_seeing_a_scr_03",
				"pbw_gameplay_seeing_a_scr_04",
				"pbw_gameplay_seeing_a_scr_05",
				"pbw_gameplay_seeing_a_scr_06",
				"pbw_gameplay_seeing_a_scr_07",
				"pbw_gameplay_seeing_a_shield_clanrat_01",
				"pbw_gameplay_seeing_a_shield_clanrat_02",
				"pbw_gameplay_seeing_a_shield_clanrat_03",
				"pbw_gameplay_seeing_a_shield_clanrat_04",
				"pbw_gameplay_seeing_a_shield_clanrat_05",
				"pbw_gameplay_seeing_a_shield_clanrat_06",
				"pbw_gameplay_seeing_a_shield_clanrat_07",
				"pbw_gameplay_seeing_a_shield_clanrat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_scr_01",
				"pbw_gameplay_seeing_a_scr_02",
				"pbw_gameplay_seeing_a_scr_03",
				"pbw_gameplay_seeing_a_scr_04",
				"pbw_gameplay_seeing_a_scr_05",
				"pbw_gameplay_seeing_a_scr_06",
				"pbw_gameplay_seeing_a_scr_07",
				"pbw_gameplay_seeing_a_shield_clanrat_01",
				"pbw_gameplay_seeing_a_shield_clanrat_02",
				"pbw_gameplay_seeing_a_shield_clanrat_03",
				"pbw_gameplay_seeing_a_shield_clanrat_04",
				"pbw_gameplay_seeing_a_shield_clanrat_05",
				"pbw_gameplay_seeing_a_shield_clanrat_06",
				"pbw_gameplay_seeing_a_shield_clanrat_07",
				"pbw_gameplay_seeing_a_shield_clanrat_08"
			},
			sound_events_duration = {
				1.3769999742508,
				1.4703958034515,
				1.9910833835602,
				1.6001042127609,
				2.395604133606,
				2.7910208702087,
				2.9149167537689,
				1.1306041479111,
				1.3849166631699,
				2.4013750553131,
				1.8164583444595,
				2.0038332939148,
				2.9868750572205,
				3.5969791412353,
				1.2484791278839
			}
		},
		pbw_gameplay_seeing_a_shield_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_shield_stormvermin_01",
				"pbw_gameplay_seeing_a_shield_stormvermin_02",
				"pbw_gameplay_seeing_a_shield_stormvermin_03",
				"pbw_gameplay_seeing_a_shield_stormvermin_04",
				"pbw_gameplay_seeing_a_shield_stormvermin_05",
				"pbw_gameplay_seeing_a_shield_stormvermin_06",
				"pbw_gameplay_seeing_a_shield_stormvermin_07",
				"pbw_gameplay_seeing_a_shield_stormvermin_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_shield_stormvermin_01",
				"pbw_gameplay_seeing_a_shield_stormvermin_02",
				"pbw_gameplay_seeing_a_shield_stormvermin_03",
				"pbw_gameplay_seeing_a_shield_stormvermin_04",
				"pbw_gameplay_seeing_a_shield_stormvermin_05",
				"pbw_gameplay_seeing_a_shield_stormvermin_06",
				"pbw_gameplay_seeing_a_shield_stormvermin_07",
				"pbw_gameplay_seeing_a_shield_stormvermin_08"
			},
			sound_events_duration = {
				1.7303333282471,
				1.7015000581741,
				1.3197083473206,
				1.672770857811,
				2.023916721344,
				3.4452707767487,
				2.9876041412353,
				2.2380623817444
			}
		},
		pbw_gameplay_seeing_a_skaven_patrol_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "bright_wizard_honduras",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pbw_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pbw_gameplay_seeing_a_Skaven_patrol_stormvermin_12"
			},
			sound_events_duration = {
				1.0457500219345,
				1.8261874914169,
				2.3045312166214,
				1.9060833454132,
				4.0087914466858,
				1.9437291622162,
				2.0587499141693
			}
		},
		pbw_gameplay_seeing_a_skaven_rat_ogre = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_skaven_rat_ogre_01",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_04",
				"pbw_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pbw_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pbw_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pbw_gameplay_seeing_a_Skaven_rat_ogre_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_rat_ogre_01",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_04",
				"pbw_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pbw_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pbw_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pbw_gameplay_seeing_a_Skaven_rat_ogre_10"
			},
			sound_events_duration = {
				0.86841666698456,
				0.92958331108093,
				2.533041715622,
				2.8873958587647,
				2.7890207767487,
				3.2004792690277
			}
		},
		pbw_gameplay_seeing_a_skaven_ratling_gun = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_skaven_ratling_gun_05",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_07",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_11",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_ratling_gun_05",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_07",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_11",
				"pbw_gameplay_seeing_a_Skaven_ratling_gun_12"
			},
			sound_events_duration = {
				1.4486042261124,
				1.9582187533379,
				2.6974582672119,
				2.2867915630341,
				2.5659167766571,
				2.5693333148956,
				2.50745844841
			}
		},
		pbw_gameplay_seeing_a_skaven_slaver = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_Skaven_slaver_09",
				"pbw_gameplay_seeing_a_Skaven_slaver_10",
				"pbw_gameplay_seeing_a_Skaven_slaver_11",
				"pbw_gameplay_seeing_a_Skaven_slaver_12",
				"pbw_gameplay_seeing_a_Skaven_slaver_13",
				"pbw_gameplay_seeing_a_Skaven_slaver_14",
				"pbw_gameplay_seeing_a_Skaven_slaver_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_slaver_01",
				"pbw_gameplay_seeing_a_Skaven_slaver_09",
				"pbw_gameplay_seeing_a_Skaven_slaver_10",
				"pbw_gameplay_seeing_a_Skaven_slaver_11",
				"pbw_gameplay_seeing_a_Skaven_slaver_12",
				"pbw_gameplay_seeing_a_Skaven_slaver_13",
				"pbw_gameplay_seeing_a_Skaven_slaver_14",
				"pbw_gameplay_seeing_a_Skaven_slaver_15"
			},
			sound_events_duration = {
				1.0244166851044,
				1.3778749704361,
				2.4977707862854,
				2.3833334445953,
				2.4939999580383,
				1.5650000572205,
				1.9119999408722,
				1.3412499427795
			}
		},
		pbw_gameplay_seeing_a_stormfiend = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_stormfiend_01",
				"pbw_gameplay_seeing_a_stormfiend_02",
				"pbw_gameplay_seeing_a_stormfiend_03",
				"pbw_gameplay_seeing_a_stormfiend_04",
				"pbw_gameplay_seeing_a_stormfiend_05",
				"pbw_gameplay_seeing_a_stormfiend_06",
				"pbw_gameplay_seeing_a_stormfiend_07",
				"pbw_gameplay_seeing_a_stormfiend_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_stormfiend_01",
				"pbw_gameplay_seeing_a_stormfiend_02",
				"pbw_gameplay_seeing_a_stormfiend_03",
				"pbw_gameplay_seeing_a_stormfiend_04",
				"pbw_gameplay_seeing_a_stormfiend_05",
				"pbw_gameplay_seeing_a_stormfiend_06",
				"pbw_gameplay_seeing_a_stormfiend_07",
				"pbw_gameplay_seeing_a_stormfiend_08"
			},
			sound_events_duration = {
				3.8489582538605,
				3.3945000171661,
				2.8553750514984,
				3.3263957500458,
				3.6858124732971,
				3.4801666736603,
				3.0999584197998,
				3.0158958435059
			}
		},
		pbw_gameplay_seeing_a_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "bright_wizard_honduras",
			sound_events_n = 11,
			category = "enemy_alerts",
			dialogue_animations_n = 11,
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
				"face_contempt",
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
				"pbw_gameplay_seeing_a_stormvermin_01",
				"pbw_gameplay_seeing_a_stormvermin_04",
				"pbw_gameplay_seeing_a_stormvermin_08",
				"pbw_gameplay_seeing_a_stormvermin_09",
				"pbw_gameplay_seeing_a_stormvermin_10",
				"pbw_gameplay_seeing_a_stormvermin_11",
				"pbw_gameplay_seeing_a_stormvermin_12",
				"pbw_gameplay_seeing_a_stormvermin_13",
				"pbw_gameplay_seeing_a_stormvermin_14",
				"pbw_gameplay_seeing_a_stormvermin_13",
				"pbw_gameplay_seeing_a_stormvermin_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_stormvermin_01",
				"pbw_gameplay_seeing_a_stormvermin_04",
				"pbw_gameplay_seeing_a_stormvermin_08",
				"pbw_gameplay_seeing_a_stormvermin_09",
				"pbw_gameplay_seeing_a_stormvermin_10",
				"pbw_gameplay_seeing_a_stormvermin_11",
				"pbw_gameplay_seeing_a_stormvermin_12",
				"pbw_gameplay_seeing_a_stormvermin_13",
				"pbw_gameplay_seeing_a_stormvermin_14",
				"pbw_gameplay_seeing_a_stormvermin_13",
				"pbw_gameplay_seeing_a_stormvermin_14"
			},
			sound_events_duration = {
				1.4211666584015,
				0.74827080965042,
				1.1080000400543,
				1.0761041641235,
				3.5983126163483,
				2.8182916641235,
				1.6207083463669,
				1.5187916755676,
				2.953958272934,
				1.5187916755676,
				2.953958272934
			}
		},
		pbw_gameplay_seeing_a_troll = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_troll_01",
				"pbw_gameplay_seeing_a_troll_02",
				"pbw_gameplay_seeing_a_troll_03",
				"pbw_gameplay_seeing_a_troll_04",
				"pbw_gameplay_seeing_a_troll_05",
				"pbw_gameplay_seeing_a_troll_06",
				"pbw_gameplay_seeing_a_troll_07",
				"pbw_gameplay_seeing_a_troll_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_troll_01",
				"pbw_gameplay_seeing_a_troll_02",
				"pbw_gameplay_seeing_a_troll_03",
				"pbw_gameplay_seeing_a_troll_04",
				"pbw_gameplay_seeing_a_troll_05",
				"pbw_gameplay_seeing_a_troll_06",
				"pbw_gameplay_seeing_a_troll_07",
				"pbw_gameplay_seeing_a_troll_08"
			},
			sound_events_duration = {
				3.5281250476837,
				3.006500005722,
				2.0891873836517,
				3.1313126087189,
				2.6326875686645,
				3.6568124294281,
				3.3017292022705,
				2.5472083091736
			}
		},
		pbw_gameplay_seeing_a_ungor_archer = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_seeing_a_ungor_archer_01",
				"pbw_gameplay_seeing_a_ungor_archer_02",
				"pbw_gameplay_seeing_a_ungor_archer_03",
				"pbw_gameplay_seeing_a_ungor_archer_04",
				"pbw_gameplay_seeing_a_ungor_archer_05",
				"pbw_gameplay_seeing_a_ungor_archer_06",
				"pbw_gameplay_seeing_a_ungor_archer_07",
				"pbw_gameplay_seeing_a_ungor_archer_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_seeing_a_ungor_archer_01",
				"pbw_gameplay_seeing_a_ungor_archer_02",
				"pbw_gameplay_seeing_a_ungor_archer_03",
				"pbw_gameplay_seeing_a_ungor_archer_04",
				"pbw_gameplay_seeing_a_ungor_archer_05",
				"pbw_gameplay_seeing_a_ungor_archer_06",
				"pbw_gameplay_seeing_a_ungor_archer_07",
				"pbw_gameplay_seeing_a_ungor_archer_08"
			},
			sound_events_duration = {
				1.2689583301544,
				1.1532499790192,
				1.5427082777023,
				3.1730415821075,
				1.6177291870117,
				2.9178750514984,
				2.2228333950043,
				3.2124583721161
			}
		},
		pbw_gameplay_self_heal = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_self_heal_06",
				"pbw_gameplay_self_heal_07",
				"pbw_gameplay_self_heal_08",
				"pbw_gameplay_self_heal_09",
				"pbw_gameplay_self_heal_10",
				"pbw_gameplay_self_heal_11",
				"pbw_gameplay_self_heal_12",
				"pbw_gameplay_self_heal_13",
				"pbw_gameplay_self_heal_14",
				"pbw_gameplay_self_heal_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_self_heal_06",
				"pbw_gameplay_self_heal_07",
				"pbw_gameplay_self_heal_08",
				"pbw_gameplay_self_heal_09",
				"pbw_gameplay_self_heal_10",
				"pbw_gameplay_self_heal_11",
				"pbw_gameplay_self_heal_12",
				"pbw_gameplay_self_heal_13",
				"pbw_gameplay_self_heal_14",
				"pbw_gameplay_self_heal_15"
			},
			sound_events_duration = {
				1.0158958435059,
				2.9664583206177,
				1.9679374694824,
				2.9622082710266,
				3.7604374885559,
				3.3597707748413,
				2.89027094841,
				3.3087084293366,
				3.2199790477753,
				3.3332290649414
			}
		},
		pbw_gameplay_special_enemy_kill_melee = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_special_enemy_kill_melee_10",
				"pbw_gameplay_special_enemy_kill_melee_15",
				"pbw_gameplay_special_enemy_kill_melee_16",
				"pbw_gameplay_special_enemy_kill_melee_17",
				"pbw_gameplay_special_enemy_kill_melee_18"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_special_enemy_kill_melee_10",
				"pbw_gameplay_special_enemy_kill_melee_15",
				"pbw_gameplay_special_enemy_kill_melee_16",
				"pbw_gameplay_special_enemy_kill_melee_17",
				"pbw_gameplay_special_enemy_kill_melee_18"
			},
			sound_events_duration = {
				1.3173333406448,
				3.0802292823791,
				2.8620417118073,
				3.4042084217072,
				3.3293750286102
			}
		},
		pbw_gameplay_special_enemy_kill_ranged = {
			randomize_indexes_n = 0,
			face_animations_n = 19,
			database = "bright_wizard_honduras",
			sound_events_n = 19,
			category = "player_feedback",
			dialogue_animations_n = 19,
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
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_special_enemy_kill_ranged_03",
				"pbw_gameplay_special_enemy_kill_ranged_09",
				"pbw_gameplay_special_enemy_kill_ranged_10",
				"pbw_gameplay_special_enemy_kill_ranged_11",
				"pbw_gameplay_special_enemy_kill_ranged_12",
				"pbw_gameplay_special_enemy_kill_ranged_13",
				"pbw_gameplay_special_enemy_kill_ranged_14",
				"pbw_gameplay_special_enemy_kill_ranged_15",
				"pbw_gameplay_special_enemy_kill_ranged_16",
				"pbw_gameplay_special_enemy_kill_ranged_17",
				"pbw_gameplay_special_enemy_kill_ranged_18",
				"pbw_gameplay_special_enemy_kill_ranged_19",
				"pbw_gameplay_special_enemy_kill_ranged_20",
				"pbw_gameplay_special_enemy_kill_ranged_21",
				"pbw_gameplay_special_enemy_kill_ranged_22",
				"pbw_gameplay_special_enemy_kill_ranged_23",
				"pbw_gameplay_special_enemy_kill_ranged_24",
				"pbw_gameplay_special_enemy_kill_ranged_25",
				"pbw_gameplay_special_enemy_kill_ranged_26"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_special_enemy_kill_ranged_03",
				"pbw_gameplay_special_enemy_kill_ranged_09",
				"pbw_gameplay_special_enemy_kill_ranged_10",
				"pbw_gameplay_special_enemy_kill_ranged_11",
				"pbw_gameplay_special_enemy_kill_ranged_12",
				"pbw_gameplay_special_enemy_kill_ranged_13",
				"pbw_gameplay_special_enemy_kill_ranged_14",
				"pbw_gameplay_special_enemy_kill_ranged_15",
				"pbw_gameplay_special_enemy_kill_ranged_16",
				"pbw_gameplay_special_enemy_kill_ranged_17",
				"pbw_gameplay_special_enemy_kill_ranged_18",
				"pbw_gameplay_special_enemy_kill_ranged_19",
				"pbw_gameplay_special_enemy_kill_ranged_20",
				"pbw_gameplay_special_enemy_kill_ranged_21",
				"pbw_gameplay_special_enemy_kill_ranged_22",
				"pbw_gameplay_special_enemy_kill_ranged_23",
				"pbw_gameplay_special_enemy_kill_ranged_24",
				"pbw_gameplay_special_enemy_kill_ranged_25",
				"pbw_gameplay_special_enemy_kill_ranged_26"
			},
			sound_events_duration = {
				1.3091249465942,
				2.1395416259766,
				1.8646041154861,
				2.5414583683014,
				3.655791759491,
				2.7008333206177,
				3.1561458110809,
				1.5555000305176,
				1.9262083768845,
				3.3121249675751,
				3.4336667060852,
				2.9781458377838,
				2.4768126010895,
				2.5399582386017,
				2.9615416526794,
				3.400312423706,
				5.5229167938232,
				3.4855208396912,
				3.4070208072662
			}
		},
		pbw_gameplay_spots_ammo = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_spots_ammo_02",
				"pbw_gameplay_spots_ammo_05",
				"pbw_gameplay_spots_ammo_06",
				"pbw_gameplay_spots_ammo_07",
				"pbw_gameplay_spots_ammo_08",
				"pbw_gameplay_spots_ammo_09",
				"pbw_gameplay_spots_ammo_10",
				"pbw_gameplay_spots_ammo_11",
				"pbw_gameplay_spots_ammo_12",
				"pbw_gameplay_spots_ammo_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_spots_ammo_02",
				"pbw_gameplay_spots_ammo_05",
				"pbw_gameplay_spots_ammo_06",
				"pbw_gameplay_spots_ammo_07",
				"pbw_gameplay_spots_ammo_08",
				"pbw_gameplay_spots_ammo_09",
				"pbw_gameplay_spots_ammo_10",
				"pbw_gameplay_spots_ammo_11",
				"pbw_gameplay_spots_ammo_12",
				"pbw_gameplay_spots_ammo_13"
			},
			sound_events_duration = {
				1.2568333148956,
				1.1633958816528,
				1.8527708053589,
				1.3273750543594,
				2.4029583930969,
				1.4858125448227,
				1.9462916851044,
				1.5837500095367,
				2.2690207958221,
				2.5338542461395
			}
		},
		pbw_gameplay_spots_bomb = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_spots_bomb_01",
				"pbw_gameplay_spots_bomb_03",
				"pbw_gameplay_spots_bomb_06",
				"pbw_gameplay_spots_bomb_07",
				"pbw_gameplay_spots_bomb_08",
				"pbw_gameplay_spots_bomb_09",
				"pbw_gameplay_spots_bomb_10",
				"pbw_gameplay_spots_bomb_11",
				"pbw_gameplay_spots_bomb_12",
				"pbw_gameplay_spots_bomb_13",
				"pbw_gameplay_spots_bomb_14",
				"pbw_gameplay_spots_bomb_15",
				"pbw_gameplay_spots_bomb_16",
				"pbw_gameplay_spots_bomb_17",
				"pbw_gameplay_spots_bomb_18"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_spots_bomb_01",
				"pbw_gameplay_spots_bomb_03",
				"pbw_gameplay_spots_bomb_06",
				"pbw_gameplay_spots_bomb_07",
				"pbw_gameplay_spots_bomb_08",
				"pbw_gameplay_spots_bomb_09",
				"pbw_gameplay_spots_bomb_10",
				"pbw_gameplay_spots_bomb_11",
				"pbw_gameplay_spots_bomb_12",
				"pbw_gameplay_spots_bomb_13",
				"pbw_gameplay_spots_bomb_14",
				"pbw_gameplay_spots_bomb_15",
				"pbw_gameplay_spots_bomb_16",
				"pbw_gameplay_spots_bomb_17",
				"pbw_gameplay_spots_bomb_18"
			},
			sound_events_duration = {
				0.55416667461395,
				0.7821249961853,
				1.8770833015442,
				2.6650416851044,
				2.5662083625794,
				1.6423541307449,
				1.3711458444595,
				1.1496249437332,
				2.642395734787,
				1.3044375181198,
				0.91660416126251,
				0.89635413885117,
				0.96643751859665,
				1.6388332843781,
				1.248687505722
			}
		},
		pbw_gameplay_spots_health = {
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "bright_wizard_honduras",
			sound_events_n = 13,
			category = "seen_items",
			dialogue_animations_n = 13,
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_health_02",
				"pbw_gameplay_spots_health_04",
				"pbw_gameplay_spots_health_06",
				"pbw_gameplay_spots_health_07",
				"pbw_gameplay_spots_health_08",
				"pbw_gameplay_spots_health_09",
				"pbw_gameplay_spots_health_10",
				"pbw_gameplay_spots_health_11",
				"pbw_gameplay_spots_health_12",
				"pbw_gameplay_spots_health_13",
				"pbw_gameplay_spots_health_14",
				"pbw_gameplay_spots_health_15",
				"pbw_gameplay_spots_health_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_spots_health_02",
				"pbw_gameplay_spots_health_04",
				"pbw_gameplay_spots_health_06",
				"pbw_gameplay_spots_health_07",
				"pbw_gameplay_spots_health_08",
				"pbw_gameplay_spots_health_09",
				"pbw_gameplay_spots_health_10",
				"pbw_gameplay_spots_health_11",
				"pbw_gameplay_spots_health_12",
				"pbw_gameplay_spots_health_13",
				"pbw_gameplay_spots_health_14",
				"pbw_gameplay_spots_health_15",
				"pbw_gameplay_spots_health_16"
			},
			sound_events_duration = {
				1.3064166307449,
				1.52443754673,
				1.6213958263397,
				1.730708360672,
				2.8236875534058,
				2.3509376049042,
				1.5527917146683,
				1.104333281517,
				1.5285832881927,
				1.5772082805634,
				1.4914166927338,
				1.7586041688919,
				2.2575209140778
			}
		},
		pbw_gameplay_spots_potion = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_spots_potion_02",
				"pbw_gameplay_spots_potion_03",
				"pbw_gameplay_spots_potion_04",
				"pbw_gameplay_spots_potion_05",
				"pbw_gameplay_spots_potion_06",
				"pbw_gameplay_spots_potion_07",
				"pbw_gameplay_spots_potion_08",
				"pbw_gameplay_spots_potion_09",
				"pbw_gameplay_spots_potion_10",
				"pbw_gameplay_spots_potion_11",
				"pbw_gameplay_spots_potion_12",
				"pbw_gameplay_spots_potion_13",
				"pbw_gameplay_spots_potion_14",
				"pbw_gameplay_spots_potion_15",
				"pbw_gameplay_spots_potion_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_spots_potion_02",
				"pbw_gameplay_spots_potion_03",
				"pbw_gameplay_spots_potion_04",
				"pbw_gameplay_spots_potion_05",
				"pbw_gameplay_spots_potion_06",
				"pbw_gameplay_spots_potion_07",
				"pbw_gameplay_spots_potion_08",
				"pbw_gameplay_spots_potion_09",
				"pbw_gameplay_spots_potion_10",
				"pbw_gameplay_spots_potion_11",
				"pbw_gameplay_spots_potion_12",
				"pbw_gameplay_spots_potion_13",
				"pbw_gameplay_spots_potion_14",
				"pbw_gameplay_spots_potion_15",
				"pbw_gameplay_spots_potion_16"
			},
			sound_events_duration = {
				0.80279165506363,
				0.88877081871033,
				0.77170830965042,
				1.6242500543594,
				1.6242500543594,
				2.4931042194366,
				3.5491666793823,
				2.4626874923706,
				2.0013542175293,
				1.5433332920075,
				0.880062520504,
				1.2631042003632,
				2.8706042766571,
				1.578541636467,
				1.620437502861
			}
		},
		pbw_gameplay_standard_bearer_buff_active = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_standard_bearer_buff_active_01",
				"pbw_gameplay_standard_bearer_buff_active_02",
				"pbw_gameplay_standard_bearer_buff_active_03",
				"pbw_gameplay_standard_bearer_buff_active_04",
				"pbw_gameplay_standard_bearer_buff_active_05",
				"pbw_gameplay_standard_bearer_buff_active_06",
				"pbw_gameplay_standard_bearer_buff_active_07",
				"pbw_gameplay_standard_bearer_buff_active_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_standard_bearer_buff_active_01",
				"pbw_gameplay_standard_bearer_buff_active_02",
				"pbw_gameplay_standard_bearer_buff_active_03",
				"pbw_gameplay_standard_bearer_buff_active_04",
				"pbw_gameplay_standard_bearer_buff_active_05",
				"pbw_gameplay_standard_bearer_buff_active_06",
				"pbw_gameplay_standard_bearer_buff_active_07",
				"pbw_gameplay_standard_bearer_buff_active_08"
			},
			sound_events_duration = {
				2.6702082157135,
				2.204916715622,
				3.017520904541,
				3.490291595459,
				1.9968124628067,
				2.6706874370575,
				2.343906223774,
				2.2544791698456
			}
		},
		pbw_gameplay_standard_bearer_buff_deactivated = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_standard_bearer_buff_deactivated_01",
				"pbw_gameplay_standard_bearer_buff_deactivated_02",
				"pbw_gameplay_standard_bearer_buff_deactivated_03",
				"pbw_gameplay_standard_bearer_buff_deactivated_04",
				"pbw_gameplay_standard_bearer_buff_deactivated_05",
				"pbw_gameplay_standard_bearer_buff_deactivated_06",
				"pbw_gameplay_standard_bearer_buff_deactivated_07",
				"pbw_gameplay_standard_bearer_buff_deactivated_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_standard_bearer_buff_deactivated_01",
				"pbw_gameplay_standard_bearer_buff_deactivated_02",
				"pbw_gameplay_standard_bearer_buff_deactivated_03",
				"pbw_gameplay_standard_bearer_buff_deactivated_04",
				"pbw_gameplay_standard_bearer_buff_deactivated_05",
				"pbw_gameplay_standard_bearer_buff_deactivated_06",
				"pbw_gameplay_standard_bearer_buff_deactivated_07",
				"pbw_gameplay_standard_bearer_buff_deactivated_08"
			},
			sound_events_duration = {
				1.6053750514984,
				5.0638751983643,
				2.2842082977295,
				4.1125416755676,
				4.1472501754761,
				2.1950209140778,
				2.7350833415985,
				2.4328541755676
			}
		},
		pbw_gameplay_standard_bearer_has_planted_standard = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_standard_bearer_has_planted_standard_01",
				"pbw_gameplay_standard_bearer_has_planted_standard_02",
				"pbw_gameplay_standard_bearer_has_planted_standard_03",
				"pbw_gameplay_standard_bearer_has_planted_standard_04",
				"pbw_gameplay_standard_bearer_has_planted_standard_05",
				"pbw_gameplay_standard_bearer_has_planted_standard_06",
				"pbw_gameplay_standard_bearer_has_planted_standard_07",
				"pbw_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_standard_bearer_has_planted_standard_01",
				"pbw_gameplay_standard_bearer_has_planted_standard_02",
				"pbw_gameplay_standard_bearer_has_planted_standard_03",
				"pbw_gameplay_standard_bearer_has_planted_standard_04",
				"pbw_gameplay_standard_bearer_has_planted_standard_05",
				"pbw_gameplay_standard_bearer_has_planted_standard_06",
				"pbw_gameplay_standard_bearer_has_planted_standard_07",
				"pbw_gameplay_standard_bearer_has_planted_standard_08"
			},
			sound_events_duration = {
				1.8382707834244,
				1.382395863533,
				2.3532292842865,
				2.1087915897369,
				2.4852499961853,
				3.1859791278839,
				4.1026458740234,
				2.9630208015442
			}
		},
		pbw_gameplay_standard_bearer_has_planted_standard_crater = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_standard_bearer_has_planted_standard_01",
				"pbw_gameplay_standard_bearer_has_planted_standard_02",
				"pbw_gameplay_standard_bearer_has_planted_standard_03",
				"pbw_gameplay_standard_bearer_has_planted_standard_04",
				"pbw_gameplay_standard_bearer_has_planted_standard_05",
				"pbw_gameplay_standard_bearer_has_planted_standard_06",
				"pbw_gameplay_standard_bearer_has_planted_standard_07",
				"pbw_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_standard_bearer_has_planted_standard_01",
				"pbw_gameplay_standard_bearer_has_planted_standard_02",
				"pbw_gameplay_standard_bearer_has_planted_standard_03",
				"pbw_gameplay_standard_bearer_has_planted_standard_04",
				"pbw_gameplay_standard_bearer_has_planted_standard_05",
				"pbw_gameplay_standard_bearer_has_planted_standard_06",
				"pbw_gameplay_standard_bearer_has_planted_standard_07",
				"pbw_gameplay_standard_bearer_has_planted_standard_08"
			},
			sound_events_duration = {
				1.8382707834244,
				1.382395863533,
				2.3532292842865,
				2.1087915897369,
				2.4852499961853,
				3.1859791278839,
				4.1026458740234,
				2.9630208015442
			}
		},
		pbw_gameplay_taking_heavy_damage = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_honduras",
			sound_events_n = 10,
			category = "player_alerts",
			dialogue_animations_n = 10,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_pain",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pbw_gameplay_taking_heavy_damage_09",
				"pbw_gameplay_taking_heavy_damage_10",
				"pbw_gameplay_taking_heavy_damage_11",
				"pbw_gameplay_taking_heavy_damage_12",
				"pbw_gameplay_taking_heavy_damage_13",
				"pbw_gameplay_taking_heavy_damage_14",
				"pbw_gameplay_taking_heavy_damage_15",
				"pbw_gameplay_taking_heavy_damage_16",
				"pbw_gameplay_taking_heavy_damage_17",
				"pbw_gameplay_taking_heavy_damage_18"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_taking_heavy_damage_09",
				"pbw_gameplay_taking_heavy_damage_10",
				"pbw_gameplay_taking_heavy_damage_11",
				"pbw_gameplay_taking_heavy_damage_12",
				"pbw_gameplay_taking_heavy_damage_13",
				"pbw_gameplay_taking_heavy_damage_14",
				"pbw_gameplay_taking_heavy_damage_15",
				"pbw_gameplay_taking_heavy_damage_16",
				"pbw_gameplay_taking_heavy_damage_17",
				"pbw_gameplay_taking_heavy_damage_18"
			},
			sound_events_duration = {
				2.8960208892822,
				2.8172500133514,
				4.1741666793823,
				3.1364583969116,
				4.4547290802002,
				1.8908125162125,
				3.2682707309723,
				2.637479186058,
				4.464958190918,
				4.3817706108093
			}
		},
		pbw_gameplay_tension_no_enemies = {
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "bright_wizard_honduras",
			sound_events_n = 16,
			category = "casual_talk",
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
				"face_angry",
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
				"pbw_gameplay_tension_no_enemies_09",
				"pbw_gameplay_tension_no_enemies_10",
				"pbw_gameplay_tension_no_enemies_11",
				"pbw_gameplay_tension_no_enemies_12",
				"pbw_gameplay_tension_no_enemies_13",
				"pbw_gameplay_tension_no_enemies_14",
				"pbw_gameplay_tension_no_enemies_15",
				"pbw_gameplay_tension_no_enemies_16",
				"pbw_gameplay_tension_no_enemies_17",
				"pbw_gameplay_tension_no_enemies_18",
				"pbw_gameplay_tension_no_enemies_19",
				"pbw_gameplay_tension_no_enemies_20",
				"pbw_gameplay_tension_no_enemies_21",
				"pbw_gameplay_tension_no_enemies_22",
				"pbw_gameplay_tension_no_enemies_23",
				"pbw_gameplay_tension_no_enemies_24"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_tension_no_enemies_09",
				"pbw_gameplay_tension_no_enemies_10",
				"pbw_gameplay_tension_no_enemies_11",
				"pbw_gameplay_tension_no_enemies_12",
				"pbw_gameplay_tension_no_enemies_13",
				"pbw_gameplay_tension_no_enemies_14",
				"pbw_gameplay_tension_no_enemies_15",
				"pbw_gameplay_tension_no_enemies_16",
				"pbw_gameplay_tension_no_enemies_17",
				"pbw_gameplay_tension_no_enemies_18",
				"pbw_gameplay_tension_no_enemies_19",
				"pbw_gameplay_tension_no_enemies_20",
				"pbw_gameplay_tension_no_enemies_21",
				"pbw_gameplay_tension_no_enemies_22",
				"pbw_gameplay_tension_no_enemies_23",
				"pbw_gameplay_tension_no_enemies_24"
			},
			sound_events_duration = {
				3.1762082576752,
				4.4414582252502,
				2.716854095459,
				4.6128749847412,
				3.0125625133514,
				4.8290414810181,
				4.1129584312439,
				4.0959582328796,
				5.4608335494995,
				3.8886249065399,
				3.5069375038147,
				3.5621249675751,
				3.4235832691193,
				5.1732707023621,
				5.0053124427795,
				4.4706873893738
			}
		},
		pbw_gameplay_throwing_bomb = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_throwing_bomb_05",
				"pbw_gameplay_throwing_bomb_06",
				"pbw_gameplay_throwing_bomb_07",
				"pbw_gameplay_throwing_bomb_08",
				"pbw_gameplay_throwing_bomb_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_throwing_bomb_05",
				"pbw_gameplay_throwing_bomb_06",
				"pbw_gameplay_throwing_bomb_07",
				"pbw_gameplay_throwing_bomb_08",
				"pbw_gameplay_throwing_bomb_09"
			},
			sound_events_duration = {
				1.1946458816528,
				0.776187479496,
				2.3602917194366,
				1.0254583358765,
				2.1760833263397
			}
		},
		pbw_gameplay_tips_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_tips_wizard_plague_01",
				"pbw_gameplay_tips_wizard_plague_02",
				"pbw_gameplay_tips_wizard_plague_03",
				"pbw_gameplay_tips_wizard_plague_04",
				"pbw_gameplay_tips_wizard_plague_05",
				"pbw_gameplay_tips_wizard_plague_06",
				"pbw_gameplay_tips_wizard_plague_07",
				"pbw_gameplay_tips_wizard_plague_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_tips_wizard_plague_01",
				"pbw_gameplay_tips_wizard_plague_02",
				"pbw_gameplay_tips_wizard_plague_03",
				"pbw_gameplay_tips_wizard_plague_04",
				"pbw_gameplay_tips_wizard_plague_05",
				"pbw_gameplay_tips_wizard_plague_06",
				"pbw_gameplay_tips_wizard_plague_07",
				"pbw_gameplay_tips_wizard_plague_08"
			},
			sound_events_duration = {
				2.9707915782928,
				2.5829582214356,
				3.2548959255219,
				2.6724374294281,
				3.3229374885559,
				4.2234168052673,
				3.2771458625794,
				5.262176990509
			}
		},
		pbw_gameplay_tips_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_tips_wizard_wind_01",
				"pbw_gameplay_tips_wizard_wind_02",
				"pbw_gameplay_tips_wizard_wind_03",
				"pbw_gameplay_tips_wizard_wind_04",
				"pbw_gameplay_tips_wizard_wind_05",
				"pbw_gameplay_tips_wizard_wind_06",
				"pbw_gameplay_tips_wizard_wind_07",
				"pbw_gameplay_tips_wizard_wind_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_tips_wizard_wind_01",
				"pbw_gameplay_tips_wizard_wind_02",
				"pbw_gameplay_tips_wizard_wind_03",
				"pbw_gameplay_tips_wizard_wind_04",
				"pbw_gameplay_tips_wizard_wind_05",
				"pbw_gameplay_tips_wizard_wind_06",
				"pbw_gameplay_tips_wizard_wind_07",
				"pbw_gameplay_tips_wizard_wind_08"
			},
			sound_events_duration = {
				2.8841874599457,
				2.5507082939148,
				3.5539374351502,
				3.9364790916443,
				3.8694584369659,
				4.4812917709351,
				3.3092501163483,
				4.6115207672119
			}
		},
		pbw_gameplay_using_potion = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "bright_wizard_honduras",
			sound_events_n = 11,
			category = "player_feedback",
			dialogue_animations_n = 11,
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
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_using_potion_01",
				"pbw_gameplay_using_potion_06",
				"pbw_gameplay_using_potion_07",
				"pbw_gameplay_using_potion_08",
				"pbw_gameplay_using_potion_09",
				"pbw_gameplay_using_potion_10",
				"pbw_gameplay_using_potion_11",
				"pbw_gameplay_using_potion_12",
				"pbw_gameplay_using_potion_13",
				"pbw_gameplay_using_potion_14",
				"pbw_gameplay_using_potion_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_using_potion_01",
				"pbw_gameplay_using_potion_06",
				"pbw_gameplay_using_potion_07",
				"pbw_gameplay_using_potion_08",
				"pbw_gameplay_using_potion_09",
				"pbw_gameplay_using_potion_10",
				"pbw_gameplay_using_potion_11",
				"pbw_gameplay_using_potion_12",
				"pbw_gameplay_using_potion_13",
				"pbw_gameplay_using_potion_14",
				"pbw_gameplay_using_potion_15"
			},
			sound_events_duration = {
				1.173666715622,
				2.1610832214356,
				1.497750043869,
				1.5499999523163,
				1.5359791517258,
				4.1066250801086,
				1.5932083129883,
				0.98477083444595,
				1.5917083024979,
				1.7187291383743,
				1.0396875143051
			}
		},
		pbw_gameplay_weapon_flair_defensive = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_activating_magic_weapon_defensive_01",
				"pbw_gameplay_activating_magic_weapon_defensive_02",
				"pbw_gameplay_activating_magic_weapon_defensive_03",
				"pbw_gameplay_activating_magic_weapon_defensive_04",
				"pbw_gameplay_activating_magic_weapon_defensive_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_activating_magic_weapon_defensive_01",
				"pbw_gameplay_activating_magic_weapon_defensive_02",
				"pbw_gameplay_activating_magic_weapon_defensive_03",
				"pbw_gameplay_activating_magic_weapon_defensive_04",
				"pbw_gameplay_activating_magic_weapon_defensive_05"
			},
			sound_events_duration = {
				1.7441874742508,
				2.0288541316986,
				1.7999999523163,
				1.5846666097641,
				2.1734375953674
			}
		},
		pbw_gameplay_weapon_flair_offensive = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_activating_magic_weapon_offensive_01",
				"pbw_gameplay_activating_magic_weapon_offensive_02",
				"pbw_gameplay_activating_magic_weapon_offensive_03",
				"pbw_gameplay_activating_magic_weapon_offensive_04",
				"pbw_gameplay_activating_magic_weapon_offensive_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_activating_magic_weapon_offensive_01",
				"pbw_gameplay_activating_magic_weapon_offensive_02",
				"pbw_gameplay_activating_magic_weapon_offensive_03",
				"pbw_gameplay_activating_magic_weapon_offensive_04",
				"pbw_gameplay_activating_magic_weapon_offensive_05"
			},
			sound_events_duration = {
				2.5337500572205,
				1.5811666250229,
				1.4913333654404,
				1.5462083816528,
				1.829541683197
			}
		},
		pbw_gameplay_witch_hunter_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "bright_wizard_honduras",
			sound_events_n = 7,
			category = "player_feedback",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pbw_gameplay_witch_hunter_being_helped_up_04",
				"pbw_gameplay_witch_hunter_being_helped_up_05",
				"pbw_gameplay_witch_hunter_being_helped_up_06",
				"pbw_gameplay_witch_hunter_being_helped_up_07",
				"pbw_gameplay_witch_hunter_being_helped_up_08",
				"pbw_gameplay_witch_hunter_being_helped_up_09",
				"pbw_gameplay_witch_hunter_being_helped_up_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_witch_hunter_being_helped_up_04",
				"pbw_gameplay_witch_hunter_being_helped_up_05",
				"pbw_gameplay_witch_hunter_being_helped_up_06",
				"pbw_gameplay_witch_hunter_being_helped_up_07",
				"pbw_gameplay_witch_hunter_being_helped_up_08",
				"pbw_gameplay_witch_hunter_being_helped_up_09",
				"pbw_gameplay_witch_hunter_being_helped_up_11"
			},
			sound_events_duration = {
				1.9957499504089,
				2.0191667079926,
				2.6266667842865,
				2.4006667137146,
				1.8580207824707,
				3.2387707233429,
				2.0957500934601
			}
		},
		pbw_gameplay_witch_hunter_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_witch_hunter_dead_01",
				"pbw_gameplay_witch_hunter_dead_05",
				"pbw_gameplay_witch_hunter_dead_06",
				"pbw_gameplay_witch_hunter_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_witch_hunter_dead_01",
				"pbw_gameplay_witch_hunter_dead_05",
				"pbw_gameplay_witch_hunter_dead_06",
				"pbw_gameplay_witch_hunter_dead_07"
			},
			sound_events_duration = {
				1.4001250267029,
				1.5337083339691,
				1.4757499694824,
				2.6782500743866
			}
		},
		pbw_gameplay_witch_hunter_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_witch_hunter_eaten_01",
				"pbw_witch_hunter_eaten_02",
				"pbw_witch_hunter_eaten_03",
				"pbw_witch_hunter_eaten_04",
				"pbw_witch_hunter_eaten_05",
				"pbw_witch_hunter_eaten_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_witch_hunter_eaten_01",
				"pbw_witch_hunter_eaten_02",
				"pbw_witch_hunter_eaten_03",
				"pbw_witch_hunter_eaten_04",
				"pbw_witch_hunter_eaten_05",
				"pbw_witch_hunter_eaten_06"
			},
			sound_events_duration = {
				7.1603956222534,
				4.972291469574,
				8.0376253128052,
				5.766125202179,
				5.977499961853,
				3.6334373950958
			}
		},
		pbw_gameplay_witch_hunter_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_witch_hunter_grabbed_02",
				"pbw_gameplay_witch_hunter_grabbed_06",
				"pbw_gameplay_witch_hunter_grabbed_07",
				"pbw_gameplay_witch_hunter_grabbed_08",
				"pbw_gameplay_witch_hunter_grabbed_09",
				"pbw_gameplay_witch_hunter_grabbed_10",
				"pbw_gameplay_witch_hunter_grabbed_11",
				"pbw_gameplay_witch_hunter_grabbed_12",
				"pbw_gameplay_witch_hunter_grabbed_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_witch_hunter_grabbed_02",
				"pbw_gameplay_witch_hunter_grabbed_06",
				"pbw_gameplay_witch_hunter_grabbed_07",
				"pbw_gameplay_witch_hunter_grabbed_08",
				"pbw_gameplay_witch_hunter_grabbed_09",
				"pbw_gameplay_witch_hunter_grabbed_10",
				"pbw_gameplay_witch_hunter_grabbed_11",
				"pbw_gameplay_witch_hunter_grabbed_12",
				"pbw_gameplay_witch_hunter_grabbed_13"
			},
			sound_events_duration = {
				2.7377083301544,
				1.6418333053589,
				2.6623957157135,
				3.9118332862854,
				3.0397708415985,
				4.0159373283386,
				2.8115000724792,
				2.3295209407806,
				4.2177710533142
			}
		},
		pbw_gameplay_witch_hunter_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_witch_hunter_low_on_health_05",
				"pbw_gameplay_witch_hunter_low_on_health_06",
				"pbw_gameplay_witch_hunter_low_on_health_07",
				"pbw_gameplay_witch_hunter_low_on_health_08",
				"pbw_gameplay_witch_hunter_low_on_health_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_witch_hunter_low_on_health_05",
				"pbw_gameplay_witch_hunter_low_on_health_06",
				"pbw_gameplay_witch_hunter_low_on_health_07",
				"pbw_gameplay_witch_hunter_low_on_health_08",
				"pbw_gameplay_witch_hunter_low_on_health_09"
			},
			sound_events_duration = {
				1.4746249914169,
				1.6813333034515,
				1.5315833091736,
				1.7360208034515,
				2.0402290821075
			}
		},
		pbw_gameplay_witch_hunter_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_witch_hunter_on_a_frenzy_05",
				"pbw_gameplay_witch_hunter_on_a_frenzy_06",
				"pbw_gameplay_witch_hunter_on_a_frenzy_07",
				"pbw_gameplay_witch_hunter_on_a_frenzy_08",
				"pbw_gameplay_witch_hunter_on_a_frenzy_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_witch_hunter_on_a_frenzy_05",
				"pbw_gameplay_witch_hunter_on_a_frenzy_06",
				"pbw_gameplay_witch_hunter_on_a_frenzy_07",
				"pbw_gameplay_witch_hunter_on_a_frenzy_08",
				"pbw_gameplay_witch_hunter_on_a_frenzy_09"
			},
			sound_events_duration = {
				5.4635834693909,
				3.2912499904633,
				2.7642290592194,
				3.6653332710266,
				4.7044792175293
			}
		},
		pbw_gameplay_wood_elf_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_wood_elf_being_helped_up_02",
				"pbw_gameplay_wood_elf_being_helped_up_03",
				"pbw_gameplay_wood_elf_being_helped_up_05",
				"pbw_gameplay_wood_elf_being_helped_up_06",
				"pbw_gameplay_wood_elf_being_helped_up_07",
				"pbw_gameplay_wood_elf_being_helped_up_08",
				"pbw_gameplay_wood_elf_being_helped_up_09",
				"pbw_gameplay_wood_elf_being_helped_up_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_wood_elf_being_helped_up_02",
				"pbw_gameplay_wood_elf_being_helped_up_03",
				"pbw_gameplay_wood_elf_being_helped_up_05",
				"pbw_gameplay_wood_elf_being_helped_up_06",
				"pbw_gameplay_wood_elf_being_helped_up_07",
				"pbw_gameplay_wood_elf_being_helped_up_08",
				"pbw_gameplay_wood_elf_being_helped_up_09",
				"pbw_gameplay_wood_elf_being_helped_up_10"
			},
			sound_events_duration = {
				1.2530000209808,
				0.97527080774307,
				2.3344376087189,
				2.4717707633972,
				2.7072501182556,
				1.9368749856949,
				1.6324374675751,
				1.5442500114441
			}
		},
		pbw_gameplay_wood_elf_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_wood_elf_dead_04",
				"pbw_gameplay_wood_elf_dead_05",
				"pbw_gameplay_wood_elf_dead_06",
				"pbw_gameplay_wood_elf_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_wood_elf_dead_04",
				"pbw_gameplay_wood_elf_dead_05",
				"pbw_gameplay_wood_elf_dead_06",
				"pbw_gameplay_wood_elf_dead_07"
			},
			sound_events_duration = {
				1.572145819664,
				2.8683958053589,
				1.9145208597183,
				2.799124956131
			}
		},
		pbw_gameplay_wood_elf_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_wood_elf_eaten_01",
				"pbw_wood_elf_eaten_02",
				"pbw_wood_elf_eaten_03",
				"pbw_wood_elf_eaten_04",
				"pbw_wood_elf_eaten_05",
				"pbw_wood_elf_eaten_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_wood_elf_eaten_01",
				"pbw_wood_elf_eaten_02",
				"pbw_wood_elf_eaten_03",
				"pbw_wood_elf_eaten_04",
				"pbw_wood_elf_eaten_05",
				"pbw_wood_elf_eaten_06"
			},
			sound_events_duration = {
				7.7821040153503,
				4.9870834350586,
				5.2132501602173,
				7.3613748550415,
				5.8916039466858,
				5.7223958969116
			}
		},
		pbw_gameplay_wood_elf_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_wood_elf_grabbed_01",
				"pbw_gameplay_wood_elf_grabbed_03",
				"pbw_gameplay_wood_elf_grabbed_05",
				"pbw_gameplay_wood_elf_grabbed_02",
				"pbw_gameplay_wood_elf_grabbed_04",
				"pbw_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_wood_elf_grabbed_01",
				"pbw_gameplay_wood_elf_grabbed_03",
				"pbw_gameplay_wood_elf_grabbed_05",
				"pbw_gameplay_wood_elf_grabbed_02",
				"pbw_gameplay_wood_elf_grabbed_04",
				"pbw_gameplay_wood_elf_grabbed_06"
			},
			sound_events_duration = {
				2.2211666107178,
				1.1747499704361,
				1.9983333349228,
				1.8170207738876,
				1.4569791555405,
				1.2441666126251
			}
		},
		pbw_gameplay_wood_elf_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_wood_elf_low_on_health_04",
				"pbw_gameplay_wood_elf_low_on_health_05",
				"pbw_gameplay_wood_elf_low_on_health_06",
				"pbw_gameplay_wood_elf_low_on_health_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_wood_elf_low_on_health_04",
				"pbw_gameplay_wood_elf_low_on_health_05",
				"pbw_gameplay_wood_elf_low_on_health_06",
				"pbw_gameplay_wood_elf_low_on_health_07"
			},
			sound_events_duration = {
				1.6771667003632,
				1.8882083892822,
				1.7235416173935,
				1.7451666593552
			}
		},
		pbw_gameplay_wood_elf_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_gameplay_wood_elf_on_a_frenzy_05",
				"pbw_gameplay_wood_elf_on_a_frenzy_06",
				"pbw_gameplay_wood_elf_on_a_frenzy_07",
				"pbw_gameplay_wood_elf_on_a_frenzy_08",
				"pbw_gameplay_wood_elf_on_a_frenzy_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_gameplay_wood_elf_on_a_frenzy_05",
				"pbw_gameplay_wood_elf_on_a_frenzy_06",
				"pbw_gameplay_wood_elf_on_a_frenzy_07",
				"pbw_gameplay_wood_elf_on_a_frenzy_08",
				"pbw_gameplay_wood_elf_on_a_frenzy_09"
			},
			sound_events_duration = {
				5.1300415992737,
				4.2623543739319,
				5.972541809082,
				4.3555417060852,
				4.9525833129883
			}
		},
		pbw_last_hero_standing = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "bright_wizard_honduras",
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
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pbw_last_hero_standing_01",
				"pbw_last_hero_standing_02",
				"pbw_last_hero_standing_03",
				"pbw_last_hero_standing_04",
				"pbw_last_hero_standing_05",
				"pbw_last_hero_standing_06",
				"pbw_last_hero_standing_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_last_hero_standing_01",
				"pbw_last_hero_standing_02",
				"pbw_last_hero_standing_03",
				"pbw_last_hero_standing_04",
				"pbw_last_hero_standing_05",
				"pbw_last_hero_standing_06",
				"pbw_last_hero_standing_08"
			},
			sound_events_duration = {
				3.1987917423248,
				3.3617916107178,
				4.7763123512268,
				6.3445210456848,
				4.453145980835,
				5.392062664032,
				2.4772500991821
			}
		},
		pbw_objective_achieved_all_but_one_goal = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_honduras",
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
				"pbw_objective_achieved_all_but_one_goal_05",
				"pbw_objective_achieved_all_but_one_goal_06",
				"pbw_objective_achieved_all_but_one_goal_07",
				"pbw_objective_achieved_all_but_one_goal_08",
				"pbw_objective_achieved_all_but_one_goal_09",
				"pbw_objective_achieved_all_but_one_goal_10",
				"pbw_objective_achieved_all_but_one_goal_11",
				"pbw_objective_achieved_all_but_one_goal_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_achieved_all_but_one_goal_05",
				"pbw_objective_achieved_all_but_one_goal_06",
				"pbw_objective_achieved_all_but_one_goal_07",
				"pbw_objective_achieved_all_but_one_goal_08",
				"pbw_objective_achieved_all_but_one_goal_09",
				"pbw_objective_achieved_all_but_one_goal_10",
				"pbw_objective_achieved_all_but_one_goal_11",
				"pbw_objective_achieved_all_but_one_goal_12"
			},
			sound_events_duration = {
				1.8279166221619,
				2.8740832805634,
				1.7183958292007,
				1.7520416975021,
				1.7298542261124,
				3.2854375839233,
				1.7765624523163,
				1.670458316803
			}
		},
		pbw_objective_correct_path_across = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_across_01",
				"pbw_objective_correct_path_across_02",
				"pbw_objective_correct_path_across_03",
				"pbw_objective_correct_path_across_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_across_01",
				"pbw_objective_correct_path_across_02",
				"pbw_objective_correct_path_across_03",
				"pbw_objective_correct_path_across_04"
			},
			sound_events_duration = {
				1.0541249513626,
				1.1752707958221,
				1.0337083339691,
				1.7092083692551
			}
		},
		pbw_objective_correct_path_alley = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_alley_01",
				"pbw_objective_correct_path_alley_02",
				"pbw_objective_correct_path_alley_03",
				"pbw_objective_correct_path_alley_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_alley_01",
				"pbw_objective_correct_path_alley_02",
				"pbw_objective_correct_path_alley_03",
				"pbw_objective_correct_path_alley_04"
			},
			sound_events_duration = {
				0.94824999570847,
				1.58493745327,
				1.4306042194366,
				1.0355416536331
			}
		},
		pbw_objective_correct_path_bridge = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_bridge_17",
				"pbw_objective_correct_path_bridge_18",
				"pbw_objective_correct_path_bridge_19",
				"pbw_objective_correct_path_bridge_20"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_bridge_17",
				"pbw_objective_correct_path_bridge_18",
				"pbw_objective_correct_path_bridge_19",
				"pbw_objective_correct_path_bridge_20"
			},
			sound_events_duration = {
				1.3359166383743,
				1.064333319664,
				1.70077085495,
				1.5616458654404
			}
		},
		pbw_objective_correct_path_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_door_02",
				"pbw_objective_correct_path_door_04",
				"pbw_objective_correct_path_door_05",
				"pbw_objective_correct_path_door_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_door_02",
				"pbw_objective_correct_path_door_04",
				"pbw_objective_correct_path_door_05",
				"pbw_objective_correct_path_door_06"
			},
			sound_events_duration = {
				1.2023124694824,
				0.89622914791107,
				1.3599582910538,
				1.2717499732971
			}
		},
		pbw_objective_correct_path_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_down_01",
				"pbw_objective_correct_path_down_02",
				"pbw_objective_correct_path_down_03",
				"pbw_objective_correct_path_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_down_01",
				"pbw_objective_correct_path_down_02",
				"pbw_objective_correct_path_down_03",
				"pbw_objective_correct_path_down_04"
			},
			sound_events_duration = {
				0.92704164981842,
				1.1119999885559,
				1.5291249752045,
				0.84952086210251
			}
		},
		pbw_objective_correct_path_ladder_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_ladder_down_01",
				"pbw_objective_correct_path_ladder_down_02",
				"pbw_objective_correct_path_ladder_down_03",
				"pbw_objective_correct_path_ladder_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_ladder_down_01",
				"pbw_objective_correct_path_ladder_down_02",
				"pbw_objective_correct_path_ladder_down_03",
				"pbw_objective_correct_path_ladder_down_04"
			},
			sound_events_duration = {
				0.79402083158493,
				1.1640207767487,
				1.4381874799728,
				1.3085000514984
			}
		},
		pbw_objective_correct_path_ladder_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_ladder_up_01",
				"pbw_objective_correct_path_ladder_up_02",
				"pbw_objective_correct_path_ladder_up_03",
				"pbw_objective_correct_path_ladder_up_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_ladder_up_01",
				"pbw_objective_correct_path_ladder_up_02",
				"pbw_objective_correct_path_ladder_up_03",
				"pbw_objective_correct_path_ladder_up_04"
			},
			sound_events_duration = {
				0.86064583063126,
				1.6245625019074,
				1.3192291259766,
				1.2265000343323
			}
		},
		pbw_objective_correct_path_stairs_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_stairs_down_05",
				"pbw_objective_correct_path_stairs_down_06",
				"pbw_objective_correct_path_stairs_down_07",
				"pbw_objective_correct_path_stairs_down_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_stairs_down_05",
				"pbw_objective_correct_path_stairs_down_06",
				"pbw_objective_correct_path_stairs_down_07",
				"pbw_objective_correct_path_stairs_down_08"
			},
			sound_events_duration = {
				1.1720625162125,
				1.5402708053589,
				1.3797708749771,
				1.8045208454132
			}
		},
		pbw_objective_correct_path_stairs_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_stairs_up_01",
				"pbw_objective_correct_path_stairs_up_02",
				"pbw_objective_correct_path_stairs_up_05",
				"pbw_objective_correct_path_stairs_up_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_stairs_up_01",
				"pbw_objective_correct_path_stairs_up_02",
				"pbw_objective_correct_path_stairs_up_05",
				"pbw_objective_correct_path_stairs_up_06"
			},
			sound_events_duration = {
				1.2409166097641,
				1.4456666707993,
				1.0769791603088,
				1.276208281517
			}
		},
		pbw_objective_correct_path_street = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_street_02",
				"pbw_objective_correct_path_street_05",
				"pbw_objective_correct_path_street_06",
				"pbw_objective_correct_path_street_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_street_02",
				"pbw_objective_correct_path_street_05",
				"pbw_objective_correct_path_street_06",
				"pbw_objective_correct_path_street_07"
			},
			sound_events_duration = {
				1.5514166355133,
				1.7193958759308,
				1.6897292137146,
				1.6719167232513
			}
		},
		pbw_objective_correct_path_this_way = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "bright_wizard_honduras",
			sound_events_n = 7,
			category = "guidance",
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
				"pbw_objective_correct_path_this_way_01",
				"pbw_objective_correct_path_this_way_05",
				"pbw_objective_correct_path_this_way_06",
				"pbw_objective_correct_path_this_way_07",
				"pbw_objective_correct_path_this_way_08",
				"pbw_objective_correct_path_this_way_09",
				"pbw_objective_correct_path_this_way_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_this_way_01",
				"pbw_objective_correct_path_this_way_05",
				"pbw_objective_correct_path_this_way_06",
				"pbw_objective_correct_path_this_way_07",
				"pbw_objective_correct_path_this_way_08",
				"pbw_objective_correct_path_this_way_09",
				"pbw_objective_correct_path_this_way_10"
			},
			sound_events_duration = {
				0.82768750190735,
				0.8543541431427,
				0.94797915220261,
				1.0938333272934,
				1.6009374856949,
				0.81218749284744,
				1.7538332939148
			}
		},
		pbw_objective_correct_path_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_correct_path_up_01",
				"pbw_objective_correct_path_up_02",
				"pbw_objective_correct_path_up_03",
				"pbw_objective_correct_path_up_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_correct_path_up_01",
				"pbw_objective_correct_path_up_02",
				"pbw_objective_correct_path_up_03",
				"pbw_objective_correct_path_up_04"
			},
			sound_events_duration = {
				0.582270860672,
				0.84947913885117,
				1.1804583072662,
				0.93187499046326
			}
		},
		pbw_objective_dropping_grimoire = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
			sound_events_n = 4,
			category = "guidance",
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
				"pbw_objective_dropping_grimoire_05",
				"pbw_objective_dropping_grimoire_06",
				"pbw_objective_dropping_grimoire_07",
				"pbw_objective_dropping_grimoire_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_dropping_grimoire_05",
				"pbw_objective_dropping_grimoire_06",
				"pbw_objective_dropping_grimoire_07",
				"pbw_objective_dropping_grimoire_08"
			},
			sound_events_duration = {
				2.1582915782928,
				2.3470208644867,
				1.7457916736603,
				2.6073541641235
			}
		},
		pbw_objective_goal_achieved_escape = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_honduras",
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
				"pbw_objective_goal_achieved_escape_02",
				"pbw_objective_goal_achieved_escape_04",
				"pbw_objective_goal_achieved_escape_05",
				"pbw_objective_goal_achieved_escape_06",
				"pbw_objective_goal_achieved_escape_07",
				"pbw_objective_goal_achieved_escape_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_goal_achieved_escape_02",
				"pbw_objective_goal_achieved_escape_04",
				"pbw_objective_goal_achieved_escape_05",
				"pbw_objective_goal_achieved_escape_06",
				"pbw_objective_goal_achieved_escape_07",
				"pbw_objective_goal_achieved_escape_08"
			},
			sound_events_duration = {
				1.4555624723434,
				1.1863125562668,
				1.4347499608993,
				0.76614582538605,
				1.8247292041779,
				1.9472291469574
			}
		},
		pbw_objective_goal_achieved_more_left = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_honduras",
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
				"pbw_objective_goal_achieved_more_left_01",
				"pbw_objective_goal_achieved_more_left_03",
				"pbw_objective_goal_achieved_more_left_04",
				"pbw_objective_goal_achieved_more_left_05",
				"pbw_objective_goal_achieved_more_left_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_goal_achieved_more_left_01",
				"pbw_objective_goal_achieved_more_left_03",
				"pbw_objective_goal_achieved_more_left_04",
				"pbw_objective_goal_achieved_more_left_05",
				"pbw_objective_goal_achieved_more_left_06"
			},
			sound_events_duration = {
				1.5251041650772,
				0.93216669559479,
				1.0304583311081,
				3.5951249599457,
				0.90979164838791
			}
		},
		pbw_objective_interacting_with_objective = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_interacting_with_objective_01",
				"pbw_objective_interacting_with_objective_02",
				"pbw_objective_interacting_with_objective_03",
				"pbw_objective_interacting_with_objective_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_interacting_with_objective_01",
				"pbw_objective_interacting_with_objective_02",
				"pbw_objective_interacting_with_objective_03",
				"pbw_objective_interacting_with_objective_04"
			},
			sound_events_duration = {
				1.1270833015442,
				1.1185833215714,
				1.5626875162125,
				1.497166633606
			}
		},
		pbw_objective_nearing_objective_deadline = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_honduras",
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
				"pbw_objective_nearing_objective_deadline_04",
				"pbw_objective_nearing_objective_deadline_05",
				"pbw_objective_nearing_objective_deadline_06",
				"pbw_objective_nearing_objective_deadline_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_objective_nearing_objective_deadline_04",
				"pbw_objective_nearing_objective_deadline_05",
				"pbw_objective_nearing_objective_deadline_06",
				"pbw_objective_nearing_objective_deadline_07"
			},
			sound_events_duration = {
				1.4943958520889,
				1.2134166955948,
				2.1688332557678,
				1.4989166259766
			}
		},
		pbw_targeted_by_ratling = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "bright_wizard_honduras",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_targeted_by_ratling_09",
				"pbw_targeted_by_ratling_10",
				"pbw_targeted_by_ratling_11",
				"pbw_targeted_by_ratling_12",
				"pbw_targeted_by_ratling_13",
				"pbw_targeted_by_ratling_14",
				"pbw_targeted_by_ratling_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pbw_targeted_by_ratling_09",
				"pbw_targeted_by_ratling_10",
				"pbw_targeted_by_ratling_11",
				"pbw_targeted_by_ratling_12",
				"pbw_targeted_by_ratling_13",
				"pbw_targeted_by_ratling_14",
				"pbw_targeted_by_ratling_15"
			},
			sound_events_duration = {
				2.3124895691872,
				3.321145772934,
				2.5182917118073,
				2.5934998989105,
				2.2347500324249,
				4.136146068573,
				2.802791595459
			}
		}
	})
end
