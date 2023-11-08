return function ()
	define_rule({
		response = "pdr_activate_ability_ranger",
		name = "pdr_activate_ability_ranger",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_ranger"
			}
		}
	})
	define_rule({
		name = "pdr_casual_songbook",
		response = "pdr_casual_songbook",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"global_context",
				"level_time",
				OP.GT,
				1200
			},
			{
				"user_memory",
				"pdr_casual_songbook_one",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMEDIFF,
				OP.GT,
				480
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_casual_quotes",
				OP.TIMESET
			},
			{
				"user_memory",
				"pdr_casual_songbook_one",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_curse",
		response = "pdr_curse",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_curse_forced",
		response = "pdr_curse_forced",
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
		name = "pdr_gameplay_ambush_horde_spawned",
		response = "pdr_gameplay_ambush_horde_spawned",
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
		name = "pdr_gameplay_armoured_enemy_bright_wizard",
		response = "pdr_gameplay_armoured_enemy_bright_wizard",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_armoured_enemy_empire_soldier",
		response = "pdr_gameplay_armoured_enemy_empire_soldier",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"profile_name",
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
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_gameplay_armoured_enemy_witch_hunter",
		response = "pdr_gameplay_armoured_enemy_witch_hunter",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_armoured_enemy_wood_elf",
		response = "pdr_gameplay_armoured_enemy_wood_elf",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_bile_troll_before_puke",
		response = "pdr_gameplay_bile_troll_before_puke",
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
		name = "pdr_gameplay_bile_troll_incapacitaded",
		response = "pdr_gameplay_bile_troll_incapacitaded",
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
				"troll_incapacitaded",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		response = "pdr_gameplay_bright_wizard_being_helped_up",
		name = "pdr_gameplay_bright_wizard_being_helped_up",
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
		name = "pdr_gameplay_bright_wizard_dead",
		response = "pdr_gameplay_bright_wizard_dead",
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
		name = "pdr_gameplay_bright_wizard_eaten",
		response = "pdr_gameplay_bright_wizard_eaten",
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
		name = "pdr_gameplay_bright_wizard_grabbed",
		response = "pdr_gameplay_bright_wizard_grabbed",
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
		name = "pdr_gameplay_bright_wizard_low_on_health",
		response = "pdr_gameplay_bright_wizard_low_on_health",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_bright_wizard_on_a_frenzy",
		response = "pdr_gameplay_bright_wizard_on_a_frenzy",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_casual_quotes",
		response = "pdr_gameplay_casual_quotes",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_gameplay_dead_body",
		response = "pdr_gameplay_dead_body",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_gameplay_dead_end",
		response = "pdr_gameplay_dead_end",
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
		response = "pdr_gameplay_empire_soldier_being_helped_up",
		name = "pdr_gameplay_empire_soldier_being_helped_up",
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
		name = "pdr_gameplay_empire_soldier_dead",
		response = "pdr_gameplay_empire_soldier_dead",
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
		name = "pdr_gameplay_empire_soldier_eaten",
		response = "pdr_gameplay_empire_soldier_eaten",
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
		name = "pdr_gameplay_empire_soldier_grabbed",
		response = "pdr_gameplay_empire_soldier_grabbed",
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
		name = "pdr_gameplay_empire_soldier_low_on_health",
		response = "pdr_gameplay_empire_soldier_low_on_health",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_empire_soldier_on_a_frenzy",
		response = "pdr_gameplay_empire_soldier_on_a_frenzy",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_encouraging_words",
		response = "pdr_gameplay_encouraging_words",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_gameplay_friendly_fire_bright_wizard",
		response = "pdr_gameplay_friendly_fire_bright_wizard",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_friendly_fire_empire_soldier",
		response = "pdr_gameplay_friendly_fire_empire_soldier",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_friendly_fire_witch_hunter",
		response = "pdr_gameplay_friendly_fire_witch_hunter",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_friendly_fire_wood_elf",
		response = "pdr_gameplay_friendly_fire_wood_elf",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_globadier_guck",
		response = "pdr_gameplay_globadier_guck",
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
		name = "pdr_gameplay_healing_bright_wizard",
		response = "pdr_gameplay_healing_bright_wizard",
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
		name = "pdr_gameplay_healing_draught",
		response = "pdr_gameplay_healing_draught",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"enemies_distant",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_healing_empire_soldier",
		response = "pdr_gameplay_healing_empire_soldier",
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
		name = "pdr_gameplay_healing_witch_hunter",
		response = "pdr_gameplay_healing_witch_hunter",
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
		name = "pdr_gameplay_healing_wood_elf",
		response = "pdr_gameplay_healing_wood_elf",
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
		name = "pdr_gameplay_heard_bright_wizard_in_trouble",
		response = "pdr_gameplay_heard_bright_wizard_in_trouble",
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
				"times_down_bright_wizard",
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
		name = "pdr_gameplay_heard_empire_soldier_in_trouble",
		response = "pdr_gameplay_heard_empire_soldier_in_trouble",
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
		name = "pdr_gameplay_heard_witch_hunter_in_trouble",
		response = "pdr_gameplay_heard_witch_hunter_in_trouble",
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
		name = "pdr_gameplay_heard_wood_elf_in_trouble",
		response = "pdr_gameplay_heard_wood_elf_in_trouble",
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
		name = "pdr_gameplay_hearing_a_Skaven_warpfire_thrower",
		response = "pdr_gameplay_hearing_a_Skaven_warpfire_thrower",
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
		name = "pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		response = "pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
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
		name = "pdr_gameplay_hearing_a_chaos_spawn",
		response = "pdr_gameplay_hearing_a_chaos_spawn",
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
		name = "pdr_gameplay_hearing_a_chaos_spawn_combat",
		response = "pdr_gameplay_hearing_a_chaos_spawn_combat",
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
		name = "pdr_gameplay_hearing_a_chaos_warrior",
		response = "pdr_gameplay_hearing_a_chaos_warrior",
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
				OP.EQ,
				0
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
		name = "pdr_gameplay_hearing_a_chaos_warrior_combat",
		response = "pdr_gameplay_hearing_a_chaos_warrior_combat",
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
		name = "pdr_gameplay_hearing_a_chaos_wizard_leech",
		response = "pdr_gameplay_hearing_a_chaos_wizard_leech",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"enemies_close",
				OP.EQ,
				0
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_gameplay_hearing_a_chaos_wizard_plague",
		response = "pdr_gameplay_hearing_a_chaos_wizard_plague",
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
		name = "pdr_gameplay_hearing_a_chaos_wizard_plague_combat",
		response = "pdr_gameplay_hearing_a_chaos_wizard_plague_combat",
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
		name = "pdr_gameplay_hearing_a_chaos_wizard_tentacle",
		response = "pdr_gameplay_hearing_a_chaos_wizard_tentacle",
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
		name = "pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		response = "pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat",
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
		name = "pdr_gameplay_hearing_a_chaos_wizard_wind",
		response = "pdr_gameplay_hearing_a_chaos_wizard_wind",
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
		name = "pdr_gameplay_hearing_a_chaos_wizard_wind_combat",
		response = "pdr_gameplay_hearing_a_chaos_wizard_wind_combat",
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
		name = "pdr_gameplay_hearing_a_globadier",
		response = "pdr_gameplay_hearing_a_globadier",
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
		name = "pdr_gameplay_hearing_a_globadier_combat",
		response = "pdr_gameplay_hearing_a_globadier_combat",
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
		name = "pdr_gameplay_hearing_a_gutter_runner",
		response = "pdr_gameplay_hearing_a_gutter_runner",
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
		name = "pdr_gameplay_hearing_a_gutter_runner_combat",
		response = "pdr_gameplay_hearing_a_gutter_runner_combat",
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
		name = "pdr_gameplay_hearing_a_minotaur",
		response = "pdr_gameplay_hearing_a_minotaur",
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
		name = "pdr_gameplay_hearing_a_pm",
		response = "pdr_gameplay_hearing_a_pm",
		criterias = {
			{
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
		name = "pdr_gameplay_hearing_a_pm_in_combat",
		response = "pdr_gameplay_hearing_a_pm_in_combat",
		criterias = {
			{
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
				OP.GT,
				0
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
		name = "pdr_gameplay_hearing_a_skaven_patrol_stormvermin",
		response = "pdr_gameplay_hearing_a_skaven_patrol_stormvermin",
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
		name = "pdr_gameplay_hearing_a_skaven_rat_ogre",
		response = "pdr_gameplay_hearing_a_skaven_rat_ogre",
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
		name = "pdr_gameplay_hearing_a_skaven_rat_ogre_combat",
		response = "pdr_gameplay_hearing_a_skaven_rat_ogre_combat",
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
		name = "pdr_gameplay_hearing_a_skaven_ratling_gun",
		response = "pdr_gameplay_hearing_a_skaven_ratling_gun",
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
		name = "pdr_gameplay_hearing_a_skaven_ratling_gun_combat",
		response = "pdr_gameplay_hearing_a_skaven_ratling_gun_combat",
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
		name = "pdr_gameplay_hearing_a_standard_bearer",
		response = "pdr_gameplay_hearing_a_standard_bearer",
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
		name = "pdr_gameplay_hearing_a_standard_bearer_crater",
		response = "pdr_gameplay_hearing_a_standard_bearer_crater",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
		name = "pdr_gameplay_hearing_a_stormfiend",
		response = "pdr_gameplay_hearing_a_stormfiend",
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
		name = "pdr_gameplay_hearing_a_stormfiend_combat",
		response = "pdr_gameplay_hearing_a_stormfiend_combat",
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
		name = "pdr_gameplay_hearing_a_troll",
		response = "pdr_gameplay_hearing_a_troll",
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
		name = "pdr_gameplay_hearing_a_troll_combat",
		response = "pdr_gameplay_hearing_a_troll_combat",
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
		name = "pdr_gameplay_hearing_marauder_berserker_combat",
		response = "pdr_gameplay_hearing_marauder_berserker_combat",
		criterias = {
			{
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
		name = "pdr_gameplay_hears_incoming_horde",
		response = "pdr_gameplay_hears_incoming_horde",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
				5
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
		name = "pdr_gameplay_helped_by_bright_wizard",
		response = "pdr_gameplay_helped_by_bright_wizard",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_helped_by_empire_soldier",
		response = "pdr_gameplay_helped_by_empire_soldier",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_helped_by_witch_hunter",
		response = "pdr_gameplay_helped_by_witch_hunter",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_helped_by_wood_elf",
		response = "pdr_gameplay_helped_by_wood_elf",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		response = "pdr_gameplay_hit_by_goo",
		name = "pdr_gameplay_hit_by_goo",
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
		name = "pdr_gameplay_incoming_attack",
		response = "pdr_gameplay_incoming_attack",
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
		name = "pdr_gameplay_incoming_bestigor_attack",
		response = "pdr_gameplay_incoming_bestigor_attack",
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
		name = "pdr_gameplay_incoming_globadier",
		response = "pdr_gameplay_incoming_globadier",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_incoming_skaven_rat_ogre",
		response = "pdr_gameplay_incoming_skaven_rat_ogre",
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
		name = "pdr_gameplay_killing_a_chaos_warrior",
		response = "pdr_gameplay_killing_a_chaos_warrior",
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_a_chaos_warrior_champion",
		response = "pdr_gameplay_killing_a_chaos_warrior_champion",
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
				"time_since_chaos_exalted_champion",
				OP.TIMEDIFF,
				OP.GT,
				5
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_a_chaos_wizard_leech",
		response = "pdr_gameplay_killing_a_chaos_wizard_leech",
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
		name = "pdr_gameplay_killing_a_chaos_wizard_plague",
		response = "pdr_gameplay_killing_a_chaos_wizard_plague",
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
				"time_since_chaos_plague_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				5
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_a_chaos_wizard_tentacle",
		response = "pdr_gameplay_killing_a_chaos_wizard_tentacle",
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
				"time_since_chaos_wizard_tentacle",
				OP.TIMEDIFF,
				OP.GT,
				5
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_a_chaos_wizard_wind",
		response = "pdr_gameplay_killing_a_chaos_wizard_wind",
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
				"time_since_chaos_vortex_sorcerer",
				OP.TIMEDIFF,
				OP.GT,
				5
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_a_minotaur",
		response = "pdr_gameplay_killing_a_minotaur",
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
				"dwarf_ranger_special_kills_in_row",
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
				"empire_soldier_special_kills_in_row",
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
		name = "pdr_gameplay_killing_a_skaven_warpfire_thrower",
		response = "pdr_gameplay_killing_a_skaven_warpfire_thrower",
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
				"time_since_skaven_warpfire_thrower",
				OP.TIMEDIFF,
				OP.GT,
				5
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_a_stormfiend",
		response = "pdr_gameplay_killing_a_stormfiend",
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_globadier",
		response = "pdr_gameplay_killing_globadier",
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_gutterrunner",
		response = "pdr_gameplay_killing_gutterrunner",
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_lootrat",
		response = "pdr_gameplay_killing_lootrat",
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_packmaster",
		response = "pdr_gameplay_killing_packmaster",
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_killing_ratling",
		response = "pdr_gameplay_killing_ratling",
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
				"dwarf_ranger_special_kills_in_row",
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
				"bright_wizard_special_kills_in_row",
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
				"wood_elf_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_knocked_down",
		response = "pdr_gameplay_knocked_down",
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
				"times_down_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_low_on_health",
		response = "pdr_gameplay_low_on_health",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0
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
		name = "pdr_gameplay_no_nearby_teammates",
		response = "pdr_gameplay_no_nearby_teammates",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_out_of_ammo",
		response = "pdr_gameplay_out_of_ammo",
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
		name = "pdr_gameplay_overcharge",
		response = "pdr_gameplay_overcharge",
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
		name = "pdr_gameplay_parry_bright_wizard",
		response = "pdr_gameplay_parry_bright_wizard",
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
		name = "pdr_gameplay_parry_empire_soldier",
		response = "pdr_gameplay_parry_empire_soldier",
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
		name = "pdr_gameplay_parry_witch_hunter",
		response = "pdr_gameplay_parry_witch_hunter",
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
		name = "pdr_gameplay_parry_wood_elf",
		response = "pdr_gameplay_parry_wood_elf",
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
		name = "pdr_gameplay_player_pounced",
		response = "pdr_gameplay_player_pounced",
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
		name = "pdr_gameplay_seeing_a_Skaven_warpfire_thrower",
		response = "pdr_gameplay_seeing_a_Skaven_warpfire_thrower",
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
		name = "pdr_gameplay_seeing_a_chaos_spawn",
		response = "pdr_gameplay_seeing_a_chaos_spawn",
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
		name = "pdr_gameplay_seeing_a_chaos_warrior",
		response = "pdr_gameplay_seeing_a_chaos_warrior",
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
		name = "pdr_gameplay_seeing_a_chaos_warrior_champion_combat",
		response = "pdr_gameplay_seeing_a_chaos_warrior_champion_combat",
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
				40
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
		name = "pdr_gameplay_seeing_a_chaos_wizard_leech",
		response = "pdr_gameplay_seeing_a_chaos_wizard_leech",
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
				"chaos_corruptor_sorcerer"
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
				"last_heard_leech",
				OP.TIMEDIFF,
				OP.GT,
				20
			},
			{
				"faction_memory",
				"last_seen_leech",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_leech",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_seeing_a_chaos_wizard_plague",
		response = "pdr_gameplay_seeing_a_chaos_wizard_plague",
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
		name = "pdr_gameplay_seeing_a_chaos_wizard_tentacle",
		response = "pdr_gameplay_seeing_a_chaos_wizard_tentacle",
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
		name = "pdr_gameplay_seeing_a_chaos_wizard_wind",
		response = "pdr_gameplay_seeing_a_chaos_wizard_wind",
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
		name = "pdr_gameplay_seeing_a_globadier",
		response = "pdr_gameplay_seeing_a_globadier",
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
				60
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
		name = "pdr_gameplay_seeing_a_gutter_runner",
		response = "pdr_gameplay_seeing_a_gutter_runner",
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
		name = "pdr_gameplay_seeing_a_pm",
		response = "pdr_gameplay_seeing_a_pm",
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
		name = "pdr_gameplay_seeing_a_scr",
		response = "pdr_gameplay_seeing_a_scr",
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
		name = "pdr_gameplay_seeing_a_shield_stormvermin",
		response = "pdr_gameplay_seeing_a_shield_stormvermin",
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
		name = "pdr_gameplay_seeing_a_skaven_patrol_stormvermin",
		response = "pdr_gameplay_seeing_a_skaven_patrol_stormvermin",
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
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				120
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
		name = "pdr_gameplay_seeing_a_skaven_rat_ogre",
		response = "pdr_gameplay_seeing_a_skaven_rat_ogre",
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
		name = "pdr_gameplay_seeing_a_skaven_ratling_gun",
		response = "pdr_gameplay_seeing_a_skaven_ratling_gun",
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
		name = "pdr_gameplay_seeing_a_skaven_slaver",
		response = "pdr_gameplay_seeing_a_skaven_slaver",
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
		name = "pdr_gameplay_seeing_a_stormfiend",
		response = "pdr_gameplay_seeing_a_stormfiend",
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
		name = "pdr_gameplay_seeing_a_stormvermin",
		response = "pdr_gameplay_seeing_a_stormvermin",
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
		name = "pdr_gameplay_seeing_a_troll",
		response = "pdr_gameplay_seeing_a_troll",
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
		name = "pdr_gameplay_seeing_a_ungor_archer",
		response = "pdr_gameplay_seeing_a_ungor_archer",
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
		name = "pdr_gameplay_self_heal",
		response = "pdr_gameplay_self_heal",
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
		name = "pdr_gameplay_special_enemy_kill_melee",
		response = "pdr_gameplay_special_enemy_kill_melee",
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
				"dwarf_ranger"
			},
			{
				"user_memory",
				"time_since_last_special_kill_melee_dwarf",
				OP.TIMEDIFF,
				OP.GT,
				640
			},
			{
				"faction_memory",
				"time_since_last_special_kill_melee",
				OP.TIMEDIFF,
				OP.GT,
				120
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_last_special_kill_melee_dwarf",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_gameplay_special_enemy_kill_ranged",
		response = "pdr_gameplay_special_enemy_kill_ranged",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_spots_ammo",
		response = "pdr_gameplay_spots_ammo",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"friends_distant",
				OP.GT,
				0
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
		name = "pdr_gameplay_spots_bomb",
		response = "pdr_gameplay_spots_bomb",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_spots_health",
		response = "pdr_gameplay_spots_health",
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
				"dwarf_ranger"
			},
			{
				"query_context",
				"enemies_distant",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_spots_potion",
		response = "pdr_gameplay_spots_potion",
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
				"dwarf_ranger"
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_standard_bearer_buff_active",
		response = "pdr_gameplay_standard_bearer_buff_active",
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
		name = "pdr_gameplay_standard_bearer_buff_deactivated",
		response = "pdr_gameplay_standard_bearer_buff_deactivated",
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
		name = "pdr_gameplay_standard_bearer_has_planted_standard",
		response = "pdr_gameplay_standard_bearer_has_planted_standard",
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
		name = "pdr_gameplay_standard_bearer_has_planted_standard_crater",
		response = "pdr_gameplay_standard_bearer_has_planted_standard_crater",
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
		name = "pdr_gameplay_taking_heavy_damage",
		response = "pdr_gameplay_taking_heavy_damage",
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
		name = "pdr_gameplay_tension_no_enemies",
		response = "pdr_gameplay_tension_no_enemies",
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
		name = "pdr_gameplay_throwing_bomb",
		response = "pdr_gameplay_throwing_bomb",
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
		name = "pdr_gameplay_tips_wizard_plague",
		response = "pdr_gameplay_tips_wizard_plague",
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
		name = "pdr_gameplay_tips_wizard_wind",
		response = "pdr_gameplay_tips_wizard_wind",
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
		name = "pdr_gameplay_using_potion",
		response = "pdr_gameplay_using_potion",
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
		name = "pdr_gameplay_weapon_flair_defensive",
		response = "pdr_gameplay_weapon_flair_defensive",
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
		name = "pdr_gameplay_weapon_flair_offensive",
		response = "pdr_gameplay_weapon_flair_offensive",
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
		response = "pdr_gameplay_witch_hunter_being_helped_up",
		name = "pdr_gameplay_witch_hunter_being_helped_up",
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
		name = "pdr_gameplay_witch_hunter_dead",
		response = "pdr_gameplay_witch_hunter_dead",
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
		name = "pdr_gameplay_witch_hunter_eaten",
		response = "pdr_gameplay_witch_hunter_eaten",
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
		name = "pdr_gameplay_witch_hunter_grabbed",
		response = "pdr_gameplay_witch_hunter_grabbed",
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
		name = "pdr_gameplay_witch_hunter_low_on_health",
		response = "pdr_gameplay_witch_hunter_low_on_health",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_witch_hunter_on_a_frenzy",
		response = "pdr_gameplay_witch_hunter_on_a_frenzy",
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
				"dwarf_ranger"
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
		response = "pdr_gameplay_wood_elf_being_helped_up",
		name = "pdr_gameplay_wood_elf_being_helped_up",
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
		name = "pdr_gameplay_wood_elf_dead",
		response = "pdr_gameplay_wood_elf_dead",
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
		name = "pdr_gameplay_wood_elf_eaten",
		response = "pdr_gameplay_wood_elf_eaten",
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
		name = "pdr_gameplay_wood_elf_grabbed",
		response = "pdr_gameplay_wood_elf_grabbed",
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
		name = "pdr_gameplay_wood_elf_low_on_health",
		response = "pdr_gameplay_wood_elf_low_on_health",
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
				"dwarf_ranger"
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
		name = "pdr_gameplay_wood_elf_on_a_frenzy",
		response = "pdr_gameplay_wood_elf_on_a_frenzy",
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
				"dwarf_ranger"
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
		response = "pdr_last_hero_standing",
		name = "pdr_last_hero_standing",
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
		name = "pdr_objective_achieved_all_but_one_goal",
		response = "pdr_objective_achieved_all_but_one_goal",
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
		name = "pdr_objective_correct_path_across",
		response = "pdr_objective_correct_path_across",
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
		name = "pdr_objective_correct_path_alley",
		response = "pdr_objective_correct_path_alley",
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
		name = "pdr_objective_correct_path_bridge",
		response = "pdr_objective_correct_path_bridge",
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
		name = "pdr_objective_correct_path_door",
		response = "pdr_objective_correct_path_door",
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
		name = "pdr_objective_correct_path_down",
		response = "pdr_objective_correct_path_down",
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
		name = "pdr_objective_correct_path_ladder_down",
		response = "pdr_objective_correct_path_ladder_down",
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
				15
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
		name = "pdr_objective_correct_path_ladder_up",
		response = "pdr_objective_correct_path_ladder_up",
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
				15
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
		name = "pdr_objective_correct_path_stairs_down",
		response = "pdr_objective_correct_path_stairs_down",
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
		name = "pdr_objective_correct_path_stairs_up",
		response = "pdr_objective_correct_path_stairs_up",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
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
		name = "pdr_objective_correct_path_street",
		response = "pdr_objective_correct_path_street",
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
		name = "pdr_objective_correct_path_this_way",
		response = "pdr_objective_correct_path_this_way",
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
		name = "pdr_objective_correct_path_up",
		response = "pdr_objective_correct_path_up",
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
		name = "pdr_objective_dropping_grimoire",
		response = "pdr_objective_dropping_grimoire",
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
		name = "pdr_objective_goal_achieved_escape",
		response = "pdr_objective_goal_achieved_escape",
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
		name = "pdr_objective_goal_achieved_more_left",
		response = "pdr_objective_goal_achieved_more_left",
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
		name = "pdr_objective_interacting_with_objective",
		response = "pdr_objective_interacting_with_objective",
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
		name = "pdr_objective_nearing_objective_deadline",
		response = "pdr_objective_nearing_objective_deadline",
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
		name = "pdr_objective_picking_up_grimoire",
		response = "pdr_objective_picking_up_grimoire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"on_pickup"
			},
			{
				"query_context",
				"pickup_name",
				OP.EQ,
				"pickup_grimoire"
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
				"time_since_picking_up_grimoire",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_picking_up_grimoire",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pdr_special_ability_ironbreaker",
		name = "pdr_special_ability_ironbreaker",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			}
		}
	})
	define_rule({
		response = "pdr_special_ability_ironbreaker_taunt",
		name = "pdr_special_ability_ironbreaker_taunt",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"activate_ability_taunt"
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
				"user_context",
				"player_career",
				OP.EQ,
				"dr_ironbreaker"
			}
		}
	})
	define_rule({
		response = "pdr_special_ability_slayer",
		name = "pdr_special_ability_slayer",
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
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"dr_slayer"
			}
		}
	})
	define_rule({
		name = "pdr_spotting_ferry_lady",
		response = "pdr_spotting_ferry_lady",
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
				"generic_spotting_ferry_lady"
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
				"time_since_spotting_ferry_lady",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_spotting_ferry_lady",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pdr_targeted_by_ratling",
		response = "pdr_targeted_by_ratling",
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
		pdr_activate_ability_ranger = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "dwarf_ranger_honduras",
			sound_events_n = 11,
			category = "activate_ability",
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
				"pdr_activate_ability_ranger_01",
				"pdr_activate_ability_ranger_02",
				"pdr_activate_ability_ranger_03",
				"pdr_activate_ability_ranger_04",
				"pdr_activate_ability_ranger_05",
				"pdr_activate_ability_ranger_07",
				"pdr_activate_ability_ranger_08",
				"pdr_activate_ability_ranger_09",
				"pdr_activate_ability_ranger_10",
				"pdr_activate_ability_ranger_11",
				"pdr_activate_ability_ranger_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_activate_ability_ranger_01",
				"pdr_activate_ability_ranger_02",
				"pdr_activate_ability_ranger_03",
				"pdr_activate_ability_ranger_04",
				"pdr_activate_ability_ranger_05",
				"pdr_activate_ability_ranger_07",
				"pdr_activate_ability_ranger_08",
				"pdr_activate_ability_ranger_09",
				"pdr_activate_ability_ranger_10",
				"pdr_activate_ability_ranger_11",
				"pdr_activate_ability_ranger_12"
			},
			sound_events_duration = {
				2.7109792232513,
				1.7349375486374,
				1.5270416736603,
				1.6450624465942,
				3.9065415859222,
				1.6409791707993,
				1.9706041812897,
				2.2644166946411,
				1.7699583768845,
				1.63381254673,
				1.9777916669846
			}
		},
		pdr_casual_songbook = {
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "dwarf_ranger_honduras",
			sound_events_n = 13,
			category = "casual_talk",
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_neutral",
				"face_happy",
				"face_neutral",
				"face_happy",
				"face_neutral",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_songbook_one_01",
				"pdr_songbook_one_02",
				"pdr_songbook_one_03",
				"pdr_songbook_one_04",
				"pdr_songbook_one_07",
				"pdr_songbook_one_09",
				"pdr_bar_brawl_drink_04",
				"pdr_gameplay_activating_magic_weapon_defensive_04",
				"pdr_bardin_song_06",
				"pdr_bardin_song_07",
				"pdr_bardin_song_08",
				"pdr_bardin_song_09",
				"pdr_bardin_song_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_songbook_one_01",
				"pdr_songbook_one_02",
				"pdr_songbook_one_03",
				"pdr_songbook_one_04",
				"pdr_songbook_one_07",
				"pdr_songbook_one_09",
				"pdr_bar_brawl_drink_04",
				"pdr_gameplay_activating_magic_weapon_defensive_04",
				"pdr_bardin_song_06",
				"pdr_bardin_song_07",
				"pdr_bardin_song_08",
				"pdr_bardin_song_09",
				"pdr_bardin_song_10"
			},
			sound_events_duration = {
				14.274499893189,
				8.3229379653931,
				8.8372917175293,
				11.685646057129,
				8.4958333969116,
				8.8501043319702,
				5.191999912262,
				7.2561459541321,
				8.210000038147,
				7.4000000953674,
				6.5517916679382,
				6.6199998855591,
				8.8467712402344
			}
		},
		pdr_curse = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "dwarf_ranger_honduras",
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
				"pdr_curse_01",
				"pdr_curse_02",
				"pdr_curse_03",
				"pdr_curse_04",
				"pdr_curse_05",
				"pdr_curse_06",
				"pdr_curse_07",
				"pdr_curse_08",
				"pdr_curse_09",
				"pdr_curse_10",
				"pdr_curse_11",
				"pdr_curse_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_curse_01",
				"pdr_curse_02",
				"pdr_curse_03",
				"pdr_curse_04",
				"pdr_curse_05",
				"pdr_curse_06",
				"pdr_curse_07",
				"pdr_curse_08",
				"pdr_curse_09",
				"pdr_curse_10",
				"pdr_curse_11",
				"pdr_curse_12"
			},
			sound_events_duration = {
				1.2289375066757,
				3.2648749351502,
				1.3074791431427,
				1.2764999866486,
				1.8557916879654,
				0.83985418081284,
				1.3999999761581,
				0.99960416555405,
				1.2764999866486,
				1.7378749847412,
				1.3994582891464,
				2.0407707691193
			}
		},
		pdr_curse_forced = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "dwarf_ranger_honduras",
			sound_events_n = 12,
			category = "mutator_special_occasion",
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
				"pdr_curse_01",
				"pdr_curse_02",
				"pdr_curse_03",
				"pdr_curse_04",
				"pdr_curse_05",
				"pdr_curse_06",
				"pdr_curse_07",
				"pdr_curse_08",
				"pdr_curse_09",
				"pdr_curse_10",
				"pdr_curse_11",
				"pdr_curse_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_curse_01",
				"pdr_curse_02",
				"pdr_curse_03",
				"pdr_curse_04",
				"pdr_curse_05",
				"pdr_curse_06",
				"pdr_curse_07",
				"pdr_curse_08",
				"pdr_curse_09",
				"pdr_curse_10",
				"pdr_curse_11",
				"pdr_curse_12"
			},
			sound_events_duration = {
				1.2289375066757,
				3.2648749351502,
				1.3074791431427,
				1.2764999866486,
				1.8557916879654,
				0.83985418081284,
				1.3999999761581,
				0.99960416555405,
				1.2764999866486,
				1.7378749847412,
				1.3994582891464,
				2.0407707691193
			}
		},
		pdr_gameplay_ambush_horde_spawned = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "dwarf_ranger_honduras",
			sound_events_n = 12,
			category = "enemy_alerts_high",
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
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
				"pdr_gameplay_ambush_horde_spawned_01",
				"pdr_gameplay_ambush_horde_spawned_03",
				"pdr_gameplay_ambush_horde_spawned_04",
				"pdr_gameplay_ambush_horde_spawned_05",
				"pdr_gameplay_ambush_horde_spawned_07",
				"pdr_gameplay_ambush_horde_spawned_08",
				"pdr_gameplay_ambush_horde_spawned_09",
				"pdr_gameplay_ambush_horde_spawned_10",
				"pdr_gameplay_ambush_horde_spawned_11",
				"pdr_gameplay_ambush_horde_spawned_12",
				"pdr_gameplay_ambush_horde_spawned_13",
				"pdr_gameplay_ambush_horde_spawned_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_ambush_horde_spawned_01",
				"pdr_gameplay_ambush_horde_spawned_03",
				"pdr_gameplay_ambush_horde_spawned_04",
				"pdr_gameplay_ambush_horde_spawned_05",
				"pdr_gameplay_ambush_horde_spawned_07",
				"pdr_gameplay_ambush_horde_spawned_08",
				"pdr_gameplay_ambush_horde_spawned_09",
				"pdr_gameplay_ambush_horde_spawned_10",
				"pdr_gameplay_ambush_horde_spawned_11",
				"pdr_gameplay_ambush_horde_spawned_12",
				"pdr_gameplay_ambush_horde_spawned_13",
				"pdr_gameplay_ambush_horde_spawned_14"
			},
			sound_events_duration = {
				1.8507499694824,
				2.5736665725708,
				1.1299166679382,
				1.9277708530426,
				2.0216040611267,
				1.3750624656677,
				1.7952708005905,
				3.7713541984558,
				3.0114374160767,
				2.7961874008179,
				2.2943749427795,
				2.5062084197998
			}
		},
		pdr_gameplay_armoured_enemy_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_armoured_enemy_bright_wizard_04",
				"pdr_gameplay_armoured_enemy_bright_wizard_05",
				"pdr_gameplay_armoured_enemy_bright_wizard_06",
				"pdr_gameplay_armoured_enemy_bright_wizard_07",
				"pdr_gameplay_armoured_enemy_bright_wizard_08",
				"pdr_gameplay_armoured_enemy_bright_wizard_09",
				"pdr_gameplay_armoured_enemy_bright_wizard_10",
				"pdr_gameplay_armoured_enemy_bright_wizard_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_armoured_enemy_bright_wizard_04",
				"pdr_gameplay_armoured_enemy_bright_wizard_05",
				"pdr_gameplay_armoured_enemy_bright_wizard_06",
				"pdr_gameplay_armoured_enemy_bright_wizard_07",
				"pdr_gameplay_armoured_enemy_bright_wizard_08",
				"pdr_gameplay_armoured_enemy_bright_wizard_09",
				"pdr_gameplay_armoured_enemy_bright_wizard_10",
				"pdr_gameplay_armoured_enemy_bright_wizard_11"
			},
			sound_events_duration = {
				2.6918125152588,
				1.9908541440964,
				2.200395822525,
				2.1768958568573,
				1.6397500038147,
				2.2068333625794,
				1.8769583702087,
				1.6165208816528
			}
		},
		pdr_gameplay_armoured_enemy_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_armoured_enemy_empire_soldier_04",
				"pdr_gameplay_armoured_enemy_empire_soldier_05",
				"pdr_gameplay_armoured_enemy_empire_soldier_06",
				"pdr_gameplay_armoured_enemy_empire_soldier_07",
				"pdr_gameplay_armoured_enemy_empire_soldier_08",
				"pdr_gameplay_armoured_enemy_empire_soldier_09",
				"pdr_gameplay_armoured_enemy_empire_soldier_10",
				"pdr_gameplay_armoured_enemy_empire_soldier_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_armoured_enemy_empire_soldier_04",
				"pdr_gameplay_armoured_enemy_empire_soldier_05",
				"pdr_gameplay_armoured_enemy_empire_soldier_06",
				"pdr_gameplay_armoured_enemy_empire_soldier_07",
				"pdr_gameplay_armoured_enemy_empire_soldier_08",
				"pdr_gameplay_armoured_enemy_empire_soldier_09",
				"pdr_gameplay_armoured_enemy_empire_soldier_10",
				"pdr_gameplay_armoured_enemy_empire_soldier_11"
			},
			sound_events_duration = {
				3.8387498855591,
				3.8501250743866,
				4.4819169044495,
				2.6882708072662,
				2.6136875152588,
				2.7955207824707,
				2.8854582309723,
				2.8795833587647
			}
		},
		pdr_gameplay_armoured_enemy_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_armoured_enemy_witch_hunter_04",
				"pdr_gameplay_armoured_enemy_witch_hunter_05",
				"pdr_gameplay_armoured_enemy_witch_hunter_06",
				"pdr_gameplay_armoured_enemy_witch_hunter_07",
				"pdr_gameplay_armoured_enemy_witch_hunter_08",
				"pdr_gameplay_armoured_enemy_witch_hunter_09",
				"pdr_gameplay_armoured_enemy_witch_hunter_10",
				"pdr_gameplay_armoured_enemy_witch_hunter_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_armoured_enemy_witch_hunter_04",
				"pdr_gameplay_armoured_enemy_witch_hunter_05",
				"pdr_gameplay_armoured_enemy_witch_hunter_06",
				"pdr_gameplay_armoured_enemy_witch_hunter_07",
				"pdr_gameplay_armoured_enemy_witch_hunter_08",
				"pdr_gameplay_armoured_enemy_witch_hunter_09",
				"pdr_gameplay_armoured_enemy_witch_hunter_10",
				"pdr_gameplay_armoured_enemy_witch_hunter_11"
			},
			sound_events_duration = {
				2.4032082557678,
				2.3679583072662,
				2.5074791908264,
				2.6559791564941,
				2.3264791965485,
				2.0064375400543,
				2.1926667690277,
				1.7682708501816
			}
		},
		pdr_gameplay_armoured_enemy_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_armoured_enemy_wood_elf_04",
				"pdr_gameplay_armoured_enemy_wood_elf_05",
				"pdr_gameplay_armoured_enemy_wood_elf_06",
				"pdr_gameplay_armoured_enemy_wood_elf_07",
				"pdr_gameplay_armoured_enemy_wood_elf_08",
				"pdr_gameplay_armoured_enemy_wood_elf_09",
				"pdr_gameplay_armoured_enemy_wood_elf_10",
				"pdr_gameplay_armoured_enemy_wood_elf_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_armoured_enemy_wood_elf_04",
				"pdr_gameplay_armoured_enemy_wood_elf_05",
				"pdr_gameplay_armoured_enemy_wood_elf_06",
				"pdr_gameplay_armoured_enemy_wood_elf_07",
				"pdr_gameplay_armoured_enemy_wood_elf_08",
				"pdr_gameplay_armoured_enemy_wood_elf_09",
				"pdr_gameplay_armoured_enemy_wood_elf_10",
				"pdr_gameplay_armoured_enemy_wood_elf_11"
			},
			sound_events_duration = {
				3.1899166107178,
				2.604291677475,
				3.657083272934,
				2.5525000095367,
				1.9170416593552,
				2.6793541908264,
				2.0733957290649,
				2.2687499523163
			}
		},
		pdr_gameplay_bile_troll_before_puke = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_bile_troll_before_puke_01",
				"pdr_gameplay_bile_troll_before_puke_02",
				"pdr_gameplay_bile_troll_before_puke_03",
				"pdr_gameplay_bile_troll_before_puke_04",
				"pdr_gameplay_bile_troll_before_puke_05",
				"pdr_gameplay_bile_troll_before_puke_06",
				"pdr_gameplay_bile_troll_before_puke_07",
				"pdr_gameplay_bile_troll_before_puke_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_bile_troll_before_puke_01",
				"pdr_gameplay_bile_troll_before_puke_02",
				"pdr_gameplay_bile_troll_before_puke_03",
				"pdr_gameplay_bile_troll_before_puke_04",
				"pdr_gameplay_bile_troll_before_puke_05",
				"pdr_gameplay_bile_troll_before_puke_06",
				"pdr_gameplay_bile_troll_before_puke_07",
				"pdr_gameplay_bile_troll_before_puke_08"
			},
			sound_events_duration = {
				1.6169791221619,
				1.6796666383743,
				1.4274791479111,
				1.2602916955948,
				1.6797083616257,
				1.5047916173935,
				2.4403750896454,
				1.8630625009537
			}
		},
		pdr_gameplay_bile_troll_incapacitaded = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_bile_troll_incapacitaded_01",
				"pdr_gameplay_bile_troll_incapacitaded_02",
				"pdr_gameplay_bile_troll_incapacitaded_03",
				"pdr_gameplay_bile_troll_incapacitaded_04",
				"pdr_gameplay_bile_troll_incapacitaded_05",
				"pdr_gameplay_bile_troll_incapacitaded_06",
				"pdr_gameplay_bile_troll_incapacitaded_07",
				"pdr_gameplay_bile_troll_incapacitaded_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_bile_troll_incapacitaded_01",
				"pdr_gameplay_bile_troll_incapacitaded_02",
				"pdr_gameplay_bile_troll_incapacitaded_03",
				"pdr_gameplay_bile_troll_incapacitaded_04",
				"pdr_gameplay_bile_troll_incapacitaded_05",
				"pdr_gameplay_bile_troll_incapacitaded_06",
				"pdr_gameplay_bile_troll_incapacitaded_07",
				"pdr_gameplay_bile_troll_incapacitaded_08"
			},
			sound_events_duration = {
				2.3426249027252,
				1.2840416431427,
				3.3726251125336,
				2.1568541526794,
				1.8756666183472,
				1.7514582872391,
				1.8858958482742,
				2.6134583950043
			}
		},
		pdr_gameplay_bright_wizard_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_bright_wizard_being_helped_up_01",
				"pdr_gameplay_bright_wizard_being_helped_up_02",
				"pdr_gameplay_bright_wizard_being_helped_up_03",
				"pdr_gameplay_bright_wizard_being_helped_up_04",
				"pdr_gameplay_bright_wizard_being_helped_up_05",
				"pdr_gameplay_bright_wizard_being_helped_up_06",
				"pdr_gameplay_bright_wizard_being_helped_up_07",
				"pdr_gameplay_bright_wizard_being_helped_up_08",
				"pdr_gameplay_bright_wizard_being_helped_up_09",
				"pdr_gameplay_bright_wizard_being_helped_up_10",
				"pdr_gameplay_bright_wizard_being_helped_up_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_bright_wizard_being_helped_up_01",
				"pdr_gameplay_bright_wizard_being_helped_up_02",
				"pdr_gameplay_bright_wizard_being_helped_up_03",
				"pdr_gameplay_bright_wizard_being_helped_up_04",
				"pdr_gameplay_bright_wizard_being_helped_up_05",
				"pdr_gameplay_bright_wizard_being_helped_up_06",
				"pdr_gameplay_bright_wizard_being_helped_up_07",
				"pdr_gameplay_bright_wizard_being_helped_up_08",
				"pdr_gameplay_bright_wizard_being_helped_up_09",
				"pdr_gameplay_bright_wizard_being_helped_up_10",
				"pdr_gameplay_bright_wizard_being_helped_up_11"
			},
			sound_events_duration = {
				1.644770860672,
				2.9065625667572,
				0.9784791469574,
				1.5072083473206,
				1.9866666793823,
				2.8461041450501,
				0.81883335113525,
				3.0595834255219,
				1.9448750019074,
				2.2999999523163,
				1.2673749923706
			}
		},
		pdr_gameplay_bright_wizard_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
			sound_events_n = 7,
			category = "player_alerts",
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
				"pdr_gameplay_bright_wizard_dead_01",
				"pdr_gameplay_bright_wizard_dead_02",
				"pdr_gameplay_bright_wizard_dead_03",
				"pdr_gameplay_bright_wizard_dead_04",
				"pdr_gameplay_bright_wizard_dead_05",
				"pdr_gameplay_bright_wizard_dead_06",
				"pdr_gameplay_bright_wizard_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_bright_wizard_dead_01",
				"pdr_gameplay_bright_wizard_dead_02",
				"pdr_gameplay_bright_wizard_dead_03",
				"pdr_gameplay_bright_wizard_dead_04",
				"pdr_gameplay_bright_wizard_dead_05",
				"pdr_gameplay_bright_wizard_dead_06",
				"pdr_gameplay_bright_wizard_dead_07"
			},
			sound_events_duration = {
				3.7971458435059,
				2.6817083358765,
				1.679208278656,
				1.6173332929611,
				1.7175416946411,
				2.0567290782928,
				2.2446458339691
			}
		},
		pdr_gameplay_bright_wizard_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"pdr_bright_wizard_eaten_01",
				"pdr_bright_wizard_eaten_02",
				"pdr_bright_wizard_eaten_03",
				"pdr_bright_wizard_eaten_04",
				"pdr_bright_wizard_eaten_05",
				"pdr_bright_wizard_eaten_06",
				"pdr_bright_wizard_eaten_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_bright_wizard_eaten_01",
				"pdr_bright_wizard_eaten_02",
				"pdr_bright_wizard_eaten_03",
				"pdr_bright_wizard_eaten_04",
				"pdr_bright_wizard_eaten_05",
				"pdr_bright_wizard_eaten_06",
				"pdr_bright_wizard_eaten_07"
			},
			sound_events_duration = {
				4.3756456375122,
				4.4724998474121,
				4.8125834465027,
				5.0266666412353,
				5.5416460037231,
				4.9128127098083,
				3.8297500610352
			}
		},
		pdr_gameplay_bright_wizard_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "dwarf_ranger_honduras",
			sound_events_n = 13,
			category = "player_alerts",
			dialogue_animations_n = 13,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
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
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_bright_wizard_grabbed_01",
				"pdr_gameplay_bright_wizard_grabbed_02",
				"pdr_gameplay_bright_wizard_grabbed_03",
				"pdr_gameplay_bright_wizard_grabbed_04",
				"pdr_gameplay_bright_wizard_grabbed_05",
				"pdr_gameplay_bright_wizard_grabbed_06",
				"pdr_gameplay_bright_wizard_grabbed_07",
				"pdr_gameplay_bright_wizard_grabbed_08",
				"pdr_gameplay_bright_wizard_grabbed_09",
				"pdr_gameplay_bright_wizard_grabbed_10",
				"pdr_gameplay_bright_wizard_grabbed_11",
				"pdr_gameplay_bright_wizard_grabbed_12",
				"pdr_gameplay_bright_wizard_grabbed_13"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_gameplay_bright_wizard_grabbed_05 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				},
				pdr_gameplay_bright_wizard_grabbed_06 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pdr_gameplay_bright_wizard_grabbed_01",
				"pdr_gameplay_bright_wizard_grabbed_02",
				"pdr_gameplay_bright_wizard_grabbed_03",
				"pdr_gameplay_bright_wizard_grabbed_04",
				"pdr_gameplay_bright_wizard_grabbed_05",
				"pdr_gameplay_bright_wizard_grabbed_06",
				"pdr_gameplay_bright_wizard_grabbed_07",
				"pdr_gameplay_bright_wizard_grabbed_08",
				"pdr_gameplay_bright_wizard_grabbed_09",
				"pdr_gameplay_bright_wizard_grabbed_10",
				"pdr_gameplay_bright_wizard_grabbed_11",
				"pdr_gameplay_bright_wizard_grabbed_12",
				"pdr_gameplay_bright_wizard_grabbed_13"
			},
			sound_events_duration = {
				2.8293540477753,
				2.5886459350586,
				3.0292084217072,
				1.9528332948685,
				2.2222917079926,
				1.4103125333786,
				2.8293540477753,
				1.7716666460037,
				2.6246249675751,
				2.4000000953674,
				1.395708322525,
				2.8242499828339,
				3.5508542060852
			}
		},
		pdr_gameplay_bright_wizard_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_bright_wizard_low_on_health_01",
				"pdr_gameplay_bright_wizard_low_on_health_02",
				"pdr_gameplay_bright_wizard_low_on_health_03",
				"pdr_gameplay_bright_wizard_low_on_health_04",
				"pdr_gameplay_bright_wizard_low_on_health_05",
				"pdr_gameplay_bright_wizard_low_on_health_06",
				"pdr_gameplay_bright_wizard_low_on_health_07",
				"pdr_gameplay_bright_wizard_low_on_health_08"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_gameplay_bright_wizard_low_on_health_04 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pdr_gameplay_bright_wizard_low_on_health_01",
				"pdr_gameplay_bright_wizard_low_on_health_02",
				"pdr_gameplay_bright_wizard_low_on_health_03",
				"pdr_gameplay_bright_wizard_low_on_health_04",
				"pdr_gameplay_bright_wizard_low_on_health_05",
				"pdr_gameplay_bright_wizard_low_on_health_06",
				"pdr_gameplay_bright_wizard_low_on_health_07",
				"pdr_gameplay_bright_wizard_low_on_health_08"
			},
			sound_events_duration = {
				1.9268125295639,
				2.1494998931885,
				2.1160209178925,
				2.2001042366028,
				2.2359790802002,
				2.2799582481384,
				1.5912499427795,
				1.504979133606
			}
		},
		pdr_gameplay_bright_wizard_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_bright_wizard_on_a_frenzy_01",
				"pdr_gameplay_bright_wizard_on_a_frenzy_02",
				"pdr_gameplay_bright_wizard_on_a_frenzy_03",
				"pdr_gameplay_bright_wizard_on_a_frenzy_04",
				"pdr_gameplay_bright_wizard_on_a_frenzy_05",
				"pdr_gameplay_bright_wizard_on_a_frenzy_06",
				"pdr_gameplay_bright_wizard_on_a_frenzy_07",
				"pdr_gameplay_bright_wizard_on_a_frenzy_08"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_gameplay_bright_wizard_on_a_frenzy_03 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pdr_gameplay_bright_wizard_on_a_frenzy_01",
				"pdr_gameplay_bright_wizard_on_a_frenzy_02",
				"pdr_gameplay_bright_wizard_on_a_frenzy_03",
				"pdr_gameplay_bright_wizard_on_a_frenzy_04",
				"pdr_gameplay_bright_wizard_on_a_frenzy_05",
				"pdr_gameplay_bright_wizard_on_a_frenzy_06",
				"pdr_gameplay_bright_wizard_on_a_frenzy_07",
				"pdr_gameplay_bright_wizard_on_a_frenzy_08"
			},
			sound_events_duration = {
				3.0432291030884,
				3.067125082016,
				4.7162709236145,
				3.1833333969116,
				3.0069167613983,
				2.0909583568573,
				1.8613541126251,
				2.7424166202545
			}
		},
		pdr_gameplay_casual_quotes = {
			randomize_indexes_n = 0,
			face_animations_n = 29,
			database = "dwarf_ranger_honduras",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_casual_quotes_03",
				"pdr_gameplay_casual_quotes_10",
				"pdr_gameplay_casual_quotes_11",
				"pdr_gameplay_casual_quotes_12",
				"pdr_gameplay_casual_quotes_13",
				"pdr_gameplay_casual_quotes_14",
				"pdr_gameplay_casual_quotes_15",
				"pdr_gameplay_casual_quotes_16",
				"pdr_gameplay_casual_quotes_17",
				"pdr_gameplay_casual_quotes_18",
				"pdr_gameplay_casual_quotes_19",
				"pdr_gameplay_casual_quotes_20",
				"pdr_gameplay_casual_quotes_21",
				"pdr_gameplay_casual_quotes_22",
				"pdr_gameplay_casual_quotes_23",
				"pdr_gameplay_casual_quotes_24",
				"pdr_gameplay_casual_quotes_25",
				"pdr_gameplay_casual_quotes_26",
				"pdr_gameplay_casual_quotes_27",
				"pdr_gameplay_casual_quotes_28",
				"pdr_gameplay_casual_quotes_29",
				"pdr_gameplay_casual_quotes_30",
				"pdr_gameplay_casual_quotes_31",
				"pdr_gameplay_casual_quotes_32",
				"pdr_gameplay_casual_quotes_33",
				"pdr_gameplay_casual_quotes_34",
				"pdr_gameplay_casual_quotes_35",
				"pdr_gameplay_casual_quotes_36",
				"pdr_gameplay_casual_quotes_37"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_casual_quotes_03",
				"pdr_gameplay_casual_quotes_10",
				"pdr_gameplay_casual_quotes_11",
				"pdr_gameplay_casual_quotes_12",
				"pdr_gameplay_casual_quotes_13",
				"pdr_gameplay_casual_quotes_14",
				"pdr_gameplay_casual_quotes_15",
				"pdr_gameplay_casual_quotes_16",
				"pdr_gameplay_casual_quotes_17",
				"pdr_gameplay_casual_quotes_18",
				"pdr_gameplay_casual_quotes_19",
				"pdr_gameplay_casual_quotes_20",
				"pdr_gameplay_casual_quotes_21",
				"pdr_gameplay_casual_quotes_22",
				"pdr_gameplay_casual_quotes_23",
				"pdr_gameplay_casual_quotes_24",
				"pdr_gameplay_casual_quotes_25",
				"pdr_gameplay_casual_quotes_26",
				"pdr_gameplay_casual_quotes_27",
				"pdr_gameplay_casual_quotes_28",
				"pdr_gameplay_casual_quotes_29",
				"pdr_gameplay_casual_quotes_30",
				"pdr_gameplay_casual_quotes_31",
				"pdr_gameplay_casual_quotes_32",
				"pdr_gameplay_casual_quotes_33",
				"pdr_gameplay_casual_quotes_34",
				"pdr_gameplay_casual_quotes_35",
				"pdr_gameplay_casual_quotes_36",
				"pdr_gameplay_casual_quotes_37"
			},
			sound_events_duration = {
				6.9847707748413,
				3.7199790477753,
				7.2793126106262,
				8.8783330917358,
				5.622624874115,
				3.7502291202545,
				5.6648335456848,
				7.7772498130798,
				8.6001873016357,
				8.2532920837402,
				9.1791458129883,
				5.8921456336975,
				2.9844791889191,
				1.9268125295639,
				5.1900415420532,
				6.0868539810181,
				4.4704375267029,
				4.6458539962769,
				8.0341873168945,
				6.3527708053589,
				3.1992440223694,
				4.7748126983643,
				5.5911664962769,
				2.3660209178925,
				3.1480624675751,
				2.8187916278839,
				5.1469373703003,
				3.481645822525,
				4.0305418968201
			}
		},
		pdr_gameplay_dead_body = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "dwarf_ranger_honduras",
			sound_events_n = 10,
			category = "casual_talk",
			dialogue_animations_n = 10,
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
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
			localization_strings = {
				"pdr_gameplay_dead_body_01",
				"pdr_gameplay_dead_body_02",
				"pdr_gameplay_dead_body_03",
				"pdr_gameplay_dead_body_04",
				"pdr_gameplay_dead_body_05",
				"pdr_gameplay_dead_body_06",
				"pdr_gameplay_dead_body_07",
				"pdr_gameplay_dead_body_08",
				"pdr_gameplay_dead_body_09",
				"pdr_gameplay_dead_body_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_dead_body_01",
				"pdr_gameplay_dead_body_02",
				"pdr_gameplay_dead_body_03",
				"pdr_gameplay_dead_body_04",
				"pdr_gameplay_dead_body_05",
				"pdr_gameplay_dead_body_06",
				"pdr_gameplay_dead_body_07",
				"pdr_gameplay_dead_body_08",
				"pdr_gameplay_dead_body_09",
				"pdr_gameplay_dead_body_10"
			},
			sound_events_duration = {
				2.0429792404175,
				4.6735835075378,
				4.8799166679382,
				3.9110832214356,
				5.2396664619446,
				3.6888959407806,
				2.3681874275208,
				1.7851458787918,
				2.0791041851044,
				1.9563125371933
			}
		},
		pdr_gameplay_dead_end = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_dead_end_01",
				"pdr_gameplay_dead_end_02",
				"pdr_gameplay_dead_end_03",
				"pdr_gameplay_dead_end_04",
				"pdr_gameplay_dead_end_05",
				"pdr_gameplay_dead_end_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_dead_end_01",
				"pdr_gameplay_dead_end_02",
				"pdr_gameplay_dead_end_03",
				"pdr_gameplay_dead_end_04",
				"pdr_gameplay_dead_end_05",
				"pdr_gameplay_dead_end_06"
			},
			sound_events_duration = {
				1.6146041154861,
				2.7413125038147,
				1.7290832996368,
				1.201291680336,
				1.6176874637604,
				1.5034166574478
			}
		},
		pdr_gameplay_empire_soldier_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_empire_soldier_being_helped_up_01",
				"pdr_gameplay_empire_soldier_being_helped_up_02",
				"pdr_gameplay_empire_soldier_being_helped_up_03",
				"pdr_gameplay_empire_soldier_being_helped_up_04",
				"pdr_gameplay_empire_soldier_being_helped_up_05",
				"pdr_gameplay_empire_soldier_being_helped_up_06",
				"pdr_gameplay_empire_soldier_being_helped_up_07",
				"pdr_gameplay_empire_soldier_being_helped_up_08",
				"pdr_gameplay_empire_soldier_being_helped_up_09",
				"pdr_gameplay_empire_soldier_being_helped_up_10",
				"pdr_gameplay_empire_soldier_being_helped_up_11",
				"pdr_gameplay_empire_soldier_being_helped_up_12",
				"pdr_gameplay_empire_soldier_being_helped_up_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_empire_soldier_being_helped_up_01",
				"pdr_gameplay_empire_soldier_being_helped_up_02",
				"pdr_gameplay_empire_soldier_being_helped_up_03",
				"pdr_gameplay_empire_soldier_being_helped_up_04",
				"pdr_gameplay_empire_soldier_being_helped_up_05",
				"pdr_gameplay_empire_soldier_being_helped_up_06",
				"pdr_gameplay_empire_soldier_being_helped_up_07",
				"pdr_gameplay_empire_soldier_being_helped_up_08",
				"pdr_gameplay_empire_soldier_being_helped_up_09",
				"pdr_gameplay_empire_soldier_being_helped_up_10",
				"pdr_gameplay_empire_soldier_being_helped_up_11",
				"pdr_gameplay_empire_soldier_being_helped_up_12",
				"pdr_gameplay_empire_soldier_being_helped_up_13"
			},
			sound_events_duration = {
				1.2736666202545,
				2.0709373950958,
				2.9567084312439,
				2.8201665878296,
				2.0419583320618,
				2.3932707309723,
				1.600625038147,
				2.7467501163483,
				3.0650417804718,
				2.4041874408722,
				2.2159583568573,
				2.5668957233429,
				1.4860625267029
			}
		},
		pdr_gameplay_empire_soldier_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
			sound_events_n = 7,
			category = "player_alerts",
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
				"pdr_gameplay_empire_soldier_dead_01",
				"pdr_gameplay_empire_soldier_dead_02",
				"pdr_gameplay_empire_soldier_dead_03",
				"pdr_gameplay_empire_soldier_dead_04",
				"pdr_gameplay_empire_soldier_dead_05",
				"pdr_gameplay_empire_soldier_dead_06",
				"pdr_gameplay_empire_soldier_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_empire_soldier_dead_01",
				"pdr_gameplay_empire_soldier_dead_02",
				"pdr_gameplay_empire_soldier_dead_03",
				"pdr_gameplay_empire_soldier_dead_04",
				"pdr_gameplay_empire_soldier_dead_05",
				"pdr_gameplay_empire_soldier_dead_06",
				"pdr_gameplay_empire_soldier_dead_07"
			},
			sound_events_duration = {
				2.6016042232513,
				1.1069166660309,
				1.914958357811,
				1.3749375343323,
				1.1069166660309,
				1.6329166889191,
				2.5398333072662
			}
		},
		pdr_gameplay_empire_soldier_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"pdr_empire_soldier_eaten_01",
				"pdr_empire_soldier_eaten_02",
				"pdr_empire_soldier_eaten_03",
				"pdr_empire_soldier_eaten_04",
				"pdr_empire_soldier_eaten_05",
				"pdr_empire_soldier_eaten_06",
				"pdr_empire_soldier_eaten_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_empire_soldier_eaten_01",
				"pdr_empire_soldier_eaten_02",
				"pdr_empire_soldier_eaten_03",
				"pdr_empire_soldier_eaten_04",
				"pdr_empire_soldier_eaten_05",
				"pdr_empire_soldier_eaten_06",
				"pdr_empire_soldier_eaten_07"
			},
			sound_events_duration = {
				5.3680834770203,
				3.6860208511352,
				5.1799168586731,
				3.9699165821075,
				4.0701251029968,
				5.1974582672119,
				5.4243125915527
			}
		},
		pdr_gameplay_empire_soldier_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "dwarf_ranger_honduras",
			sound_events_n = 13,
			category = "player_alerts",
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
				"pdr_gameplay_empire_soldier_grabbed_01",
				"pdr_gameplay_empire_soldier_grabbed_02",
				"pdr_gameplay_empire_soldier_grabbed_03",
				"pdr_gameplay_empire_soldier_grabbed_04",
				"pdr_gameplay_empire_soldier_grabbed_05",
				"pdr_gameplay_empire_soldier_grabbed_06",
				"pdr_gameplay_empire_soldier_grabbed_07",
				"pdr_gameplay_empire_soldier_grabbed_08",
				"pdr_gameplay_empire_soldier_grabbed_09",
				"pdr_gameplay_empire_soldier_grabbed_10",
				"pdr_gameplay_empire_soldier_grabbed_11",
				"pdr_gameplay_empire_soldier_grabbed_12",
				"pdr_gameplay_empire_soldier_grabbed_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_empire_soldier_grabbed_01",
				"pdr_gameplay_empire_soldier_grabbed_02",
				"pdr_gameplay_empire_soldier_grabbed_03",
				"pdr_gameplay_empire_soldier_grabbed_04",
				"pdr_gameplay_empire_soldier_grabbed_05",
				"pdr_gameplay_empire_soldier_grabbed_06",
				"pdr_gameplay_empire_soldier_grabbed_07",
				"pdr_gameplay_empire_soldier_grabbed_08",
				"pdr_gameplay_empire_soldier_grabbed_09",
				"pdr_gameplay_empire_soldier_grabbed_10",
				"pdr_gameplay_empire_soldier_grabbed_11",
				"pdr_gameplay_empire_soldier_grabbed_12",
				"pdr_gameplay_empire_soldier_grabbed_13"
			},
			sound_events_duration = {
				1.8123333454132,
				3.0456249713898,
				1.3761041164398,
				1.4493541717529,
				2.7625832557678,
				3.6173748970032,
				3.6173748970032,
				2.6134583950043,
				2.7363958358765,
				3.4063541889191,
				5.1488752365112,
				5.2965416908264,
				4.8476247787476
			}
		},
		pdr_gameplay_empire_soldier_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
			sound_events_n = 6,
			category = "player_feedback",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_empire_soldier_low_on_health_03",
				"pdr_gameplay_empire_soldier_low_on_health_04",
				"pdr_gameplay_empire_soldier_low_on_health_05",
				"pdr_gameplay_empire_soldier_low_on_health_06",
				"pdr_gameplay_empire_soldier_low_on_health_07",
				"pdr_gameplay_empire_soldier_low_on_health_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_empire_soldier_low_on_health_03",
				"pdr_gameplay_empire_soldier_low_on_health_04",
				"pdr_gameplay_empire_soldier_low_on_health_05",
				"pdr_gameplay_empire_soldier_low_on_health_06",
				"pdr_gameplay_empire_soldier_low_on_health_07",
				"pdr_gameplay_empire_soldier_low_on_health_08"
			},
			sound_events_duration = {
				3.7133541107178,
				3.7033541202545,
				1.6284166574478,
				3.2151041030884,
				2.6705832481384,
				2.3964166641235
			}
		},
		pdr_gameplay_empire_soldier_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_empire_soldier_on_a_frenzy_01",
				"pdr_gameplay_empire_soldier_on_a_frenzy_02",
				"pdr_gameplay_empire_soldier_on_a_frenzy_03",
				"pdr_gameplay_empire_soldier_on_a_frenzy_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_empire_soldier_on_a_frenzy_01",
				"pdr_gameplay_empire_soldier_on_a_frenzy_02",
				"pdr_gameplay_empire_soldier_on_a_frenzy_03",
				"pdr_gameplay_empire_soldier_on_a_frenzy_04"
			},
			sound_events_duration = {
				3.5686249732971,
				2.1702709197998,
				3.4112708568573,
				3.2000000476837
			}
		},
		pdr_gameplay_encouraging_words = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "dwarf_ranger_honduras",
			sound_events_n = 15,
			category = "casual_talk",
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
				"pdr_gameplay_encouraging_words_01",
				"pdr_gameplay_encouraging_words_02",
				"pdr_gameplay_encouraging_words_03",
				"pdr_gameplay_encouraging_words_04",
				"pdr_gameplay_encouraging_words_05",
				"pdr_gameplay_encouraging_words_06",
				"pdr_gameplay_encouraging_words_07",
				"pdr_gameplay_encouraging_words_08",
				"pdr_gameplay_encouraging_words_09",
				"pdr_gameplay_encouraging_words_10",
				"pdr_gameplay_encouraging_words_11",
				"pdr_gameplay_encouraging_words_12",
				"pdr_gameplay_encouraging_words_13",
				"pdr_gameplay_encouraging_words_14",
				"pdr_gameplay_encouraging_words_15"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_encouraging_words_01",
				"pdr_gameplay_encouraging_words_02",
				"pdr_gameplay_encouraging_words_03",
				"pdr_gameplay_encouraging_words_04",
				"pdr_gameplay_encouraging_words_05",
				"pdr_gameplay_encouraging_words_06",
				"pdr_gameplay_encouraging_words_07",
				"pdr_gameplay_encouraging_words_08",
				"pdr_gameplay_encouraging_words_09",
				"pdr_gameplay_encouraging_words_10",
				"pdr_gameplay_encouraging_words_11",
				"pdr_gameplay_encouraging_words_12",
				"pdr_gameplay_encouraging_words_13",
				"pdr_gameplay_encouraging_words_14",
				"pdr_gameplay_encouraging_words_15"
			},
			sound_events_duration = {
				1.4488333463669,
				1.5360208749771,
				2.0637290477753,
				1.5359582901001,
				1.9353749752045,
				2.3237917423248,
				3.2432916164398,
				2.5720624923706,
				4.6772084236145,
				2.0557291507721,
				2.2692708969116,
				4.500458240509,
				3.3153750896454,
				5.2543125152588,
				3.428375005722
			}
		},
		pdr_gameplay_friendly_fire_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_friendly_fire_bright_wizard_01",
				"pdr_gameplay_friendly_fire_bright_wizard_02",
				"pdr_gameplay_friendly_fire_bright_wizard_03",
				"pdr_gameplay_friendly_fire_bright_wizard_04",
				"pdr_gameplay_friendly_fire_bright_wizard_05",
				"pdr_gameplay_friendly_fire_bright_wizard_06",
				"pdr_gameplay_friendly_fire_bright_wizard_07",
				"pdr_gameplay_friendly_fire_bright_wizard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_friendly_fire_bright_wizard_01",
				"pdr_gameplay_friendly_fire_bright_wizard_02",
				"pdr_gameplay_friendly_fire_bright_wizard_03",
				"pdr_gameplay_friendly_fire_bright_wizard_04",
				"pdr_gameplay_friendly_fire_bright_wizard_05",
				"pdr_gameplay_friendly_fire_bright_wizard_06",
				"pdr_gameplay_friendly_fire_bright_wizard_07",
				"pdr_gameplay_friendly_fire_bright_wizard_08"
			},
			sound_events_duration = {
				3.2221040725708,
				1.4814374446869,
				1.7179583311081,
				2.5068333148956,
				2.6680417060852,
				1.654000043869,
				2.876312494278,
				2.8222708702087
			}
		},
		pdr_gameplay_friendly_fire_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_friendly_fire_empire_soldier_01",
				"pdr_gameplay_friendly_fire_empire_soldier_02",
				"pdr_gameplay_friendly_fire_empire_soldier_03",
				"pdr_gameplay_friendly_fire_empire_soldier_04",
				"pdr_gameplay_friendly_fire_empire_soldier_05",
				"pdr_gameplay_friendly_fire_empire_soldier_06",
				"pdr_gameplay_friendly_fire_empire_soldier_07",
				"pdr_gameplay_friendly_fire_empire_soldier_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_friendly_fire_empire_soldier_01",
				"pdr_gameplay_friendly_fire_empire_soldier_02",
				"pdr_gameplay_friendly_fire_empire_soldier_03",
				"pdr_gameplay_friendly_fire_empire_soldier_04",
				"pdr_gameplay_friendly_fire_empire_soldier_05",
				"pdr_gameplay_friendly_fire_empire_soldier_06",
				"pdr_gameplay_friendly_fire_empire_soldier_07",
				"pdr_gameplay_friendly_fire_empire_soldier_08"
			},
			sound_events_duration = {
				4.5900831222534,
				3.1218540668488,
				2.3187708854675,
				3.0404584407806,
				1.7670832872391,
				2.8310000896454,
				1.8809374570847,
				1.7145208120346
			}
		},
		pdr_gameplay_friendly_fire_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_friendly_fire_witch_hunter_01",
				"pdr_gameplay_friendly_fire_witch_hunter_02",
				"pdr_gameplay_friendly_fire_witch_hunter_03",
				"pdr_gameplay_friendly_fire_witch_hunter_04",
				"pdr_gameplay_friendly_fire_witch_hunter_05",
				"pdr_gameplay_friendly_fire_witch_hunter_06",
				"pdr_gameplay_friendly_fire_witch_hunter_07",
				"pdr_gameplay_friendly_fire_witch_hunter_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_friendly_fire_witch_hunter_01",
				"pdr_gameplay_friendly_fire_witch_hunter_02",
				"pdr_gameplay_friendly_fire_witch_hunter_03",
				"pdr_gameplay_friendly_fire_witch_hunter_04",
				"pdr_gameplay_friendly_fire_witch_hunter_05",
				"pdr_gameplay_friendly_fire_witch_hunter_06",
				"pdr_gameplay_friendly_fire_witch_hunter_07",
				"pdr_gameplay_friendly_fire_witch_hunter_08"
			},
			sound_events_duration = {
				3.1496040821075,
				2.4701459407806,
				3.7880001068115,
				3.6604375839233,
				2.2968125343323,
				2.2146248817444,
				3.7078957557678,
				2.6258749961853
			}
		},
		pdr_gameplay_friendly_fire_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pdr_gameplay_friendly_fire_wood_elf_01",
				"pdr_gameplay_friendly_fire_wood_elf_02",
				"pdr_gameplay_friendly_fire_wood_elf_03",
				"pdr_gameplay_friendly_fire_wood_elf_04",
				"pdr_gameplay_friendly_fire_wood_elf_05",
				"pdr_gameplay_friendly_fire_wood_elf_06",
				"pdr_gameplay_friendly_fire_wood_elf_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_friendly_fire_wood_elf_01",
				"pdr_gameplay_friendly_fire_wood_elf_02",
				"pdr_gameplay_friendly_fire_wood_elf_03",
				"pdr_gameplay_friendly_fire_wood_elf_04",
				"pdr_gameplay_friendly_fire_wood_elf_05",
				"pdr_gameplay_friendly_fire_wood_elf_06",
				"pdr_gameplay_friendly_fire_wood_elf_07"
			},
			sound_events_duration = {
				3.7512083053589,
				3.0756666660309,
				3.4313750267029,
				2.476083278656,
				2.6028332710266,
				1.9352707862854,
				2.5543749332428
			}
		},
		pdr_gameplay_globadier_guck = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "dwarf_ranger_honduras",
			sound_events_n = 12,
			category = "player_alerts",
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
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
				"pdr_gameplay_globadier_guck_01",
				"pdr_gameplay_globadier_guck_02",
				"pdr_gameplay_globadier_guck_03",
				"pdr_gameplay_globadier_guck_04",
				"pdr_gameplay_globadier_guck_05",
				"pdr_gameplay_globadier_guck_06",
				"pdr_gameplay_globadier_guck_07",
				"pdr_gameplay_globadier_guck_08",
				"pdr_gameplay_globadier_guck_09",
				"pdr_gameplay_globadier_guck_10",
				"pdr_gameplay_globadier_guck_11",
				"pdr_gameplay_globadier_guck_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_globadier_guck_01",
				"pdr_gameplay_globadier_guck_02",
				"pdr_gameplay_globadier_guck_03",
				"pdr_gameplay_globadier_guck_04",
				"pdr_gameplay_globadier_guck_05",
				"pdr_gameplay_globadier_guck_06",
				"pdr_gameplay_globadier_guck_07",
				"pdr_gameplay_globadier_guck_08",
				"pdr_gameplay_globadier_guck_09",
				"pdr_gameplay_globadier_guck_10",
				"pdr_gameplay_globadier_guck_11",
				"pdr_gameplay_globadier_guck_12"
			},
			sound_events_duration = {
				0.83218747377396,
				1.324458360672,
				1.3447707891464,
				0.96589583158493,
				2.2039792537689,
				1.8250000476837,
				1.9831249713898,
				1.0416041612625,
				1.5299999713898,
				1.8992708921433,
				1.6574167013168,
				1.7933125495911
			}
		},
		pdr_gameplay_healing_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_healing_bright_wizard_01",
				"pdr_gameplay_healing_bright_wizard_02",
				"pdr_gameplay_healing_bright_wizard_03",
				"pdr_gameplay_healing_bright_wizard_04",
				"pdr_gameplay_healing_bright_wizard_05",
				"pdr_gameplay_healing_bright_wizard_06",
				"pdr_gameplay_healing_bright_wizard_07",
				"pdr_gameplay_healing_bright_wizard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_healing_bright_wizard_01",
				"pdr_gameplay_healing_bright_wizard_02",
				"pdr_gameplay_healing_bright_wizard_03",
				"pdr_gameplay_healing_bright_wizard_04",
				"pdr_gameplay_healing_bright_wizard_05",
				"pdr_gameplay_healing_bright_wizard_06",
				"pdr_gameplay_healing_bright_wizard_07",
				"pdr_gameplay_healing_bright_wizard_08"
			},
			sound_events_duration = {
				2.266562461853,
				2.5626666545868,
				2.6732292175293,
				1.4492499828339,
				2.5811042785645,
				2.606166601181,
				3.2202708721161,
				1.9624999761581
			}
		},
		pdr_gameplay_healing_draught = {
			randomize_indexes_n = 0,
			face_animations_n = 17,
			database = "dwarf_ranger_honduras",
			sound_events_n = 17,
			category = "seen_items",
			dialogue_animations_n = 17,
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
				"pdr_gameplay_healing_draught_08",
				"pdr_gameplay_healing_draught_09",
				"pdr_gameplay_healing_draught_10",
				"pdr_gameplay_healing_draught_11",
				"pdr_gameplay_healing_draught_12",
				"pdr_gameplay_healing_draught_13",
				"pdr_gameplay_healing_draught_14",
				"pdr_gameplay_healing_draught_15",
				"pdr_gameplay_healing_draught_16",
				"pdr_gameplay_healing_draught_17"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_healing_draught_01",
				"pdr_gameplay_healing_draught_02",
				"pdr_gameplay_healing_draught_03",
				"pdr_gameplay_healing_draught_04",
				"pdr_gameplay_healing_draught_05",
				"pdr_gameplay_healing_draught_06",
				"pdr_gameplay_healing_draught_07",
				"pdr_gameplay_healing_draught_08",
				"pdr_gameplay_healing_draught_09",
				"pdr_gameplay_healing_draught_10",
				"pdr_gameplay_healing_draught_11",
				"pdr_gameplay_healing_draught_12",
				"pdr_gameplay_healing_draught_13",
				"pdr_gameplay_healing_draught_14",
				"pdr_gameplay_healing_draught_15",
				"pdr_gameplay_healing_draught_16",
				"pdr_gameplay_healing_draught_17"
			},
			sound_events_duration = {
				1.200395822525,
				1.2401041984558,
				1.9977916479111,
				1.9578125476837,
				1.3660416603088,
				1.4826458692551,
				1.624583363533,
				1.987520813942,
				2.0971250534058,
				2.0309166908264,
				1.448083281517,
				2.2762916088104,
				1.6705416440964,
				1.8598958253861,
				3.1731667518616,
				2.325395822525,
				2.3882083892822
			}
		},
		pdr_gameplay_healing_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_healing_empire_soldier_01",
				"pdr_gameplay_healing_empire_soldier_02",
				"pdr_gameplay_healing_empire_soldier_03",
				"pdr_gameplay_healing_empire_soldier_04",
				"pdr_gameplay_healing_empire_soldier_05",
				"pdr_gameplay_healing_empire_soldier_06",
				"pdr_gameplay_healing_empire_soldier_07",
				"pdr_gameplay_healing_empire_soldier_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_healing_empire_soldier_01",
				"pdr_gameplay_healing_empire_soldier_02",
				"pdr_gameplay_healing_empire_soldier_03",
				"pdr_gameplay_healing_empire_soldier_04",
				"pdr_gameplay_healing_empire_soldier_05",
				"pdr_gameplay_healing_empire_soldier_06",
				"pdr_gameplay_healing_empire_soldier_07",
				"pdr_gameplay_healing_empire_soldier_09"
			},
			sound_events_duration = {
				1.9819166660309,
				1.9733333587647,
				1.7332708835602,
				2.7581250667572,
				3.028062582016,
				1.8691458702087,
				2.0488750934601,
				2.2167499065399
			}
		},
		pdr_gameplay_healing_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_healing_witch_hunter_01",
				"pdr_gameplay_healing_witch_hunter_02",
				"pdr_gameplay_healing_witch_hunter_03",
				"pdr_gameplay_healing_witch_hunter_04",
				"pdr_gameplay_healing_witch_hunter_05",
				"pdr_gameplay_healing_witch_hunter_06",
				"pdr_gameplay_healing_witch_hunter_07",
				"pdr_gameplay_healing_witch_hunter_08",
				"pdr_gameplay_healing_witch_hunter_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_healing_witch_hunter_01",
				"pdr_gameplay_healing_witch_hunter_02",
				"pdr_gameplay_healing_witch_hunter_03",
				"pdr_gameplay_healing_witch_hunter_04",
				"pdr_gameplay_healing_witch_hunter_05",
				"pdr_gameplay_healing_witch_hunter_06",
				"pdr_gameplay_healing_witch_hunter_07",
				"pdr_gameplay_healing_witch_hunter_08",
				"pdr_gameplay_healing_witch_hunter_09"
			},
			sound_events_duration = {
				2.1914999485016,
				2.5508124828339,
				2.5824167728424,
				2.6364998817444,
				2.4157917499542,
				2.6819167137146,
				2.7626249790192,
				1.9421249628067,
				2.5376665592194
			}
		},
		pdr_gameplay_healing_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_healing_wood_elf_01",
				"pdr_gameplay_healing_wood_elf_02",
				"pdr_gameplay_healing_wood_elf_03",
				"pdr_gameplay_healing_wood_elf_04",
				"pdr_gameplay_healing_wood_elf_05",
				"pdr_gameplay_healing_wood_elf_06",
				"pdr_gameplay_healing_wood_elf_07",
				"pdr_gameplay_healing_wood_elf_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_healing_wood_elf_01",
				"pdr_gameplay_healing_wood_elf_02",
				"pdr_gameplay_healing_wood_elf_03",
				"pdr_gameplay_healing_wood_elf_04",
				"pdr_gameplay_healing_wood_elf_05",
				"pdr_gameplay_healing_wood_elf_06",
				"pdr_gameplay_healing_wood_elf_07",
				"pdr_gameplay_healing_wood_elf_08"
			},
			sound_events_duration = {
				3.0564999580383,
				3.1419999599457,
				2.25,
				2.0576040744781,
				2.4252500534058,
				2.5296041965485,
				2.7420833110809,
				1.5248333215714
			}
		},
		pdr_gameplay_heard_bright_wizard_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_heard_bright_wizard_in_trouble_01",
				"pdr_gameplay_heard_bright_wizard_in_trouble_02",
				"pdr_gameplay_heard_bright_wizard_in_trouble_03",
				"pdr_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {},
			sound_event_filters = {
				pdr_gameplay_heard_bright_wizard_in_trouble_01 = {
					{
						"global_context",
						"bw_necromancer",
						OP.EQ,
						true
					}
				}
			},
			sound_events = {
				"pdr_gameplay_heard_bright_wizard_in_trouble_01",
				"pdr_gameplay_heard_bright_wizard_in_trouble_02",
				"pdr_gameplay_heard_bright_wizard_in_trouble_03",
				"pdr_gameplay_heard_bright_wizard_in_trouble_04"
			},
			sound_events_duration = {
				1.5651667118073,
				1.6471458673477,
				1.8375208377838,
				2.138729095459
			}
		},
		pdr_gameplay_heard_empire_soldier_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_heard_empire_soldier_in_trouble_01",
				"pdr_gameplay_heard_empire_soldier_in_trouble_02",
				"pdr_gameplay_heard_empire_soldier_in_trouble_03",
				"pdr_gameplay_heard_empire_soldier_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_heard_empire_soldier_in_trouble_01",
				"pdr_gameplay_heard_empire_soldier_in_trouble_02",
				"pdr_gameplay_heard_empire_soldier_in_trouble_03",
				"pdr_gameplay_heard_empire_soldier_in_trouble_04"
			},
			sound_events_duration = {
				1.2592083215714,
				1.5378750562668,
				2.0759375095367,
				2.2247290611267
			}
		},
		pdr_gameplay_heard_witch_hunter_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_heard_witch_hunter_in_trouble_01",
				"pdr_gameplay_heard_witch_hunter_in_trouble_02",
				"pdr_gameplay_heard_witch_hunter_in_trouble_03",
				"pdr_gameplay_heard_witch_hunter_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_heard_witch_hunter_in_trouble_01",
				"pdr_gameplay_heard_witch_hunter_in_trouble_02",
				"pdr_gameplay_heard_witch_hunter_in_trouble_03",
				"pdr_gameplay_heard_witch_hunter_in_trouble_04"
			},
			sound_events_duration = {
				1.3812500238419,
				1.6709166765213,
				1.2552708387375,
				1.0518125295639
			}
		},
		pdr_gameplay_heard_wood_elf_in_trouble = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_heard_wood_elf_in_trouble_01",
				"pdr_gameplay_heard_wood_elf_in_trouble_02",
				"pdr_gameplay_heard_wood_elf_in_trouble_03",
				"pdr_gameplay_heard_wood_elf_in_trouble_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_heard_wood_elf_in_trouble_01",
				"pdr_gameplay_heard_wood_elf_in_trouble_02",
				"pdr_gameplay_heard_wood_elf_in_trouble_03",
				"pdr_gameplay_heard_wood_elf_in_trouble_04"
			},
			sound_events_duration = {
				3.2454373836517,
				2.9572291374206,
				1.6475207805634,
				1.9035416841507
			}
		},
		pdr_gameplay_hearing_a_Skaven_warpfire_thrower = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			sound_events_duration = {
				1.700395822525,
				2.0572707653046,
				1.8263750076294,
				2.8980207443237,
				1.891520857811,
				1.0387707948685
			}
		},
		pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pdr_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			sound_events_duration = {
				2.3980207443237,
				1.3486042022705,
				2.4221041202545,
				1.1622707843781,
				1.637791633606,
				1.5051666498184
			}
		},
		pdr_gameplay_hearing_a_chaos_spawn = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
			sound_events_n = 4,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_hearing_a_chaos_spawn_01",
				"pdr_gameplay_hearing_a_chaos_spawn_02",
				"pdr_gameplay_hearing_a_chaos_spawn_03",
				"pdr_gameplay_hearing_a_chaos_spawn_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_spawn_01",
				"pdr_gameplay_hearing_a_chaos_spawn_02",
				"pdr_gameplay_hearing_a_chaos_spawn_03",
				"pdr_gameplay_hearing_a_chaos_spawn_04"
			},
			sound_events_duration = {
				3.2391667366028,
				3.5926041603088,
				3.4100625514984,
				3.0591666698456
			}
		},
		pdr_gameplay_hearing_a_chaos_spawn_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_chaos_spawn_combat_01",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_02",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_03",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_04",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_05",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_06",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_07",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_spawn_combat_01",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_02",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_03",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_04",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_05",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_06",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_07",
				"pdr_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			sound_events_duration = {
				2.2703957557678,
				2.5832707881927,
				2.2373957633972,
				2.2540416717529,
				3.1335000991821,
				0.91722917556763,
				1.5132083892822,
				1.6647917032242
			}
		},
		pdr_gameplay_hearing_a_chaos_warrior = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
			sound_events_n = 8,
			category = "enemy_alerts",
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
				"pdr_gameplay_hearing_a_chaos_warrior_01",
				"pdr_gameplay_hearing_a_chaos_warrior_02",
				"pdr_gameplay_hearing_a_chaos_warrior_03",
				"pdr_gameplay_hearing_a_chaos_warrior_04",
				"pdr_gameplay_hearing_a_chaos_warrior_05",
				"pdr_gameplay_hearing_a_chaos_warrior_06",
				"pdr_gameplay_hearing_a_chaos_warrior_07",
				"pdr_gameplay_hearing_a_chaos_warrior_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_warrior_01",
				"pdr_gameplay_hearing_a_chaos_warrior_02",
				"pdr_gameplay_hearing_a_chaos_warrior_03",
				"pdr_gameplay_hearing_a_chaos_warrior_04",
				"pdr_gameplay_hearing_a_chaos_warrior_05",
				"pdr_gameplay_hearing_a_chaos_warrior_06",
				"pdr_gameplay_hearing_a_chaos_warrior_07",
				"pdr_gameplay_hearing_a_chaos_warrior_08"
			},
			sound_events_duration = {
				2.284083366394,
				3.4603540897369,
				2.3666665554047,
				3.3632082939148,
				1.0924999713898,
				2.4325416088104,
				2.8851666450501,
				2.1025624275208
			}
		},
		pdr_gameplay_hearing_a_chaos_warrior_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_chaos_warrior_combat_01",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_02",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_03",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_04",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_05",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_06",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_07",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_warrior_combat_01",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_02",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_03",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_04",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_05",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_06",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_07",
				"pdr_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			sound_events_duration = {
				1.0303958654404,
				1.0929583311081,
				1.2392708063126,
				1.87600004673,
				2.7841041088104,
				1.5898749828339,
				1.9598333835602,
				1.7859582901001
			}
		},
		pdr_gameplay_hearing_a_chaos_wizard_leech = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_chaos_wizard_leech_08",
				"pdr_gameplay_hearing_a_chaos_wizard_leech_09",
				"pdr_gameplay_hearing_a_chaos_wizard_leech_10",
				"pdr_gameplay_hearing_a_chaos_wizard_leech_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_wizard_leech_08",
				"pdr_gameplay_hearing_a_chaos_wizard_leech_09",
				"pdr_gameplay_hearing_a_chaos_wizard_leech_10",
				"pdr_gameplay_hearing_a_chaos_wizard_leech_11"
			},
			sound_events_duration = {
				1.7481458187103,
				3.15625,
				1.8512707948685,
				2.7781457901001
			}
		},
		pdr_gameplay_hearing_a_chaos_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_chaos_wizard_plague_01",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_02",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_03",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_04",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_05",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_06",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_07",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_wizard_plague_01",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_02",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_03",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_04",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_05",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_06",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_07",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			sound_events_duration = {
				2.8820624351502,
				4.383749961853,
				4.6732501983643,
				4.0685625076294,
				2.8148334026337,
				1.7653125524521,
				2.7246458530426,
				1.8456457853317
			}
		},
		pdr_gameplay_hearing_a_chaos_wizard_plague_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pdr_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			sound_events_duration = {
				1.149854183197,
				1.715916633606,
				2.5952291488648,
				2.2131249904633,
				3.0794792175293,
				1.7285624742508,
				2.540854215622,
				1.9057916402817
			}
		},
		pdr_gameplay_hearing_a_chaos_wizard_tentacle = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			sound_events_duration = {
				2.3987083435059,
				3.7745208740234,
				5.135666847229,
				4.6956248283386,
				1.5554791688919,
				1.5115208625793,
				1.3789792060852,
				1.3547291755676
			}
		},
		pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pdr_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			sound_events_duration = {
				1.1444166898727,
				0.85822916030884,
				1.612208366394,
				1.3907916545868,
				1.3550416231155,
				1.81931245327,
				2.0142500400543,
				1.759229183197
			}
		},
		pdr_gameplay_hearing_a_chaos_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_chaos_wizard_wind_01",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_02",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_03",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_04",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_05",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_06",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_07",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_wizard_wind_01",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_02",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_03",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_04",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_05",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_06",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_07",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			sound_events_duration = {
				4.0048751831055,
				3.1664373874664,
				3.4642083644867,
				5.5401873588562,
				1.9348332881927,
				1.7930208444595,
				5.71639585495,
				1.7296667098999
			}
		},
		pdr_gameplay_hearing_a_chaos_wizard_wind_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pdr_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			sound_events_duration = {
				1.1691249608993,
				1.2636250257492,
				1.8851041793823,
				2.0283749103546,
				2.0979375839233,
				1.9772499799728,
				3.3033542633057
			}
		},
		pdr_gameplay_hearing_a_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_globadier_07",
				"pdr_gameplay_hearing_a_globadier_08",
				"pdr_gameplay_hearing_a_globadier_09",
				"pdr_gameplay_hearing_a_globadier_10",
				"pdr_gameplay_hearing_a_globadier_11",
				"pdr_gameplay_hearing_a_globadier_12",
				"pdr_gameplay_hearing_a_globadier_13",
				"pdr_gameplay_hearing_a_globadier_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_globadier_07",
				"pdr_gameplay_hearing_a_globadier_08",
				"pdr_gameplay_hearing_a_globadier_09",
				"pdr_gameplay_hearing_a_globadier_10",
				"pdr_gameplay_hearing_a_globadier_11",
				"pdr_gameplay_hearing_a_globadier_12",
				"pdr_gameplay_hearing_a_globadier_13",
				"pdr_gameplay_hearing_a_globadier_14"
			},
			sound_events_duration = {
				1.8374166488648,
				3.180166721344,
				2.1710207462311,
				2.6172292232513,
				3.3150207996368,
				3.0870833396912,
				1.587249994278,
				2.3888750076294
			}
		},
		pdr_gameplay_hearing_a_globadier_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pdr_hearing_a_globadier_combat_01",
				"pdr_hearing_a_globadier_combat_02",
				"pdr_hearing_a_globadier_combat_03",
				"pdr_hearing_a_globadier_combat_04",
				"pdr_hearing_a_globadier_combat_05",
				"pdr_hearing_a_globadier_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_hearing_a_globadier_combat_01",
				"pdr_hearing_a_globadier_combat_02",
				"pdr_hearing_a_globadier_combat_03",
				"pdr_hearing_a_globadier_combat_04",
				"pdr_hearing_a_globadier_combat_05",
				"pdr_hearing_a_globadier_combat_06"
			},
			sound_events_duration = {
				1.3579791784286,
				1.8113958835602,
				1.8472291231155,
				2.5362708568573,
				1.7155208587647,
				2.3541250228882
			}
		},
		pdr_gameplay_hearing_a_gutter_runner = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_gutter_runner_07",
				"pdr_gameplay_hearing_a_gutter_runner_08",
				"pdr_gameplay_hearing_a_gutter_runner_09",
				"pdr_gameplay_hearing_a_gutter_runner_10",
				"pdr_gameplay_hearing_a_gutter_runner_11",
				"pdr_gameplay_hearing_a_gutter_runner_12",
				"pdr_gameplay_hearing_a_gutter_runner_13",
				"pdr_gameplay_hearing_a_gutter_runner_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_gutter_runner_07",
				"pdr_gameplay_hearing_a_gutter_runner_08",
				"pdr_gameplay_hearing_a_gutter_runner_09",
				"pdr_gameplay_hearing_a_gutter_runner_10",
				"pdr_gameplay_hearing_a_gutter_runner_11",
				"pdr_gameplay_hearing_a_gutter_runner_12",
				"pdr_gameplay_hearing_a_gutter_runner_13",
				"pdr_gameplay_hearing_a_gutter_runner_14"
			},
			sound_events_duration = {
				2.0125625133514,
				2.7335834503174,
				2.5777082443237,
				1.4609792232513,
				1.7960416078568,
				3.0035834312439,
				3.1851251125336,
				1.8163750171661
			}
		},
		pdr_gameplay_hearing_a_gutter_runner_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "dwarf_ranger_honduras",
			sound_events_n = 10,
			category = "enemy_alerts_high",
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
				"pdr_gameplay_seeing_a_gutter_runner_02",
				"pdr_gameplay_seeing_a_gutter_runner_03",
				"pdr_gameplay_hearing_a_gutter_runner_combat_03",
				"pdr_gameplay_hearing_a_gutter_runner_combat_04",
				"pdr_gameplay_hearing_a_gutter_runner_combat_05",
				"pdr_gameplay_hearing_a_gutter_runner_combat_06",
				"pdr_gameplay_hearing_a_gutter_runner_combat_07",
				"pdr_gameplay_hearing_a_gutter_runner_combat_08",
				"pdr_gameplay_hearing_a_gutter_runner_combat_09",
				"pdr_gameplay_hearing_a_gutter_runner_combat_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_gutter_runner_02",
				"pdr_gameplay_seeing_a_gutter_runner_03",
				"pdr_gameplay_hearing_a_gutter_runner_combat_03",
				"pdr_gameplay_hearing_a_gutter_runner_combat_04",
				"pdr_gameplay_hearing_a_gutter_runner_combat_05",
				"pdr_gameplay_hearing_a_gutter_runner_combat_06",
				"pdr_gameplay_hearing_a_gutter_runner_combat_07",
				"pdr_gameplay_hearing_a_gutter_runner_combat_08",
				"pdr_gameplay_hearing_a_gutter_runner_combat_09",
				"pdr_gameplay_hearing_a_gutter_runner_combat_10"
			},
			sound_events_duration = {
				0.96768748760223,
				1.4616249799728,
				0.78477084636688,
				0.89235419034958,
				3.331312417984,
				2.3940000534058,
				2.0148959159851,
				1.6499583721161,
				1.8651249408722,
				1.0747708082199
			}
		},
		pdr_gameplay_hearing_a_minotaur = {
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "dwarf_ranger_honduras",
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
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_hearing_a_minotaur_01",
				"pdr_gameplay_hearing_a_minotaur_02",
				"pdr_gameplay_hearing_a_minotaur_03",
				"pdr_gameplay_hearing_a_minotaur_04",
				"pdr_gameplay_hearing_a_minotaur_05",
				"pdr_gameplay_hearing_a_minotaur_06",
				"pdr_gameplay_hearing_a_minotaur_combat_01",
				"pdr_gameplay_hearing_a_minotaur_combat_02",
				"pdr_gameplay_hearing_a_minotaur_combat_03",
				"pdr_gameplay_hearing_a_minotaur_combat_04",
				"pdr_gameplay_hearing_a_minotaur_combat_05",
				"pdr_gameplay_hearing_a_minotaur_combat_06",
				"pdr_gameplay_hearing_a_minotaur_combat_07",
				"pdr_gameplay_hearing_a_minotaur_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_minotaur_01",
				"pdr_gameplay_hearing_a_minotaur_02",
				"pdr_gameplay_hearing_a_minotaur_03",
				"pdr_gameplay_hearing_a_minotaur_04",
				"pdr_gameplay_hearing_a_minotaur_05",
				"pdr_gameplay_hearing_a_minotaur_06",
				"pdr_gameplay_hearing_a_minotaur_combat_01",
				"pdr_gameplay_hearing_a_minotaur_combat_02",
				"pdr_gameplay_hearing_a_minotaur_combat_03",
				"pdr_gameplay_hearing_a_minotaur_combat_04",
				"pdr_gameplay_hearing_a_minotaur_combat_05",
				"pdr_gameplay_hearing_a_minotaur_combat_06",
				"pdr_gameplay_hearing_a_minotaur_combat_07",
				"pdr_gameplay_hearing_a_minotaur_combat_08"
			},
			sound_events_duration = {
				3.5811667442322,
				2.3269791603088,
				2.8815417289734,
				3.1302917003632,
				2.5187499523163,
				4.8975625038147,
				2.0160417556763,
				2.5239374637604,
				1.3682082891464,
				1.6273332834244,
				3.3220417499542,
				2.8141458034515,
				4.2549166679382,
				2.482479095459
			}
		},
		pdr_gameplay_hearing_a_pm = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "dwarf_ranger_honduras",
			sound_events_n = 11,
			category = "enemy_alerts",
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
				"pdr_gameplay_hearing_a_pm_01",
				"pdr_gameplay_hearing_a_pm_02",
				"pdr_gameplay_hearing_a_pm_03",
				"pdr_gameplay_hearing_a_pm_04",
				"pdr_gameplay_hearing_a_plague_monk_01",
				"pdr_gameplay_hearing_a_plague_monk_02",
				"pdr_gameplay_hearing_a_plague_monk_03",
				"pdr_gameplay_hearing_a_plague_monk_04",
				"pdr_gameplay_hearing_a_plague_monk_05",
				"pdr_gameplay_hearing_a_plague_monk_06",
				"pdr_gameplay_hearing_a_plague_monk_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_pm_01",
				"pdr_gameplay_hearing_a_pm_02",
				"pdr_gameplay_hearing_a_pm_03",
				"pdr_gameplay_hearing_a_pm_04",
				"pdr_gameplay_hearing_a_plague_monk_01",
				"pdr_gameplay_hearing_a_plague_monk_02",
				"pdr_gameplay_hearing_a_plague_monk_03",
				"pdr_gameplay_hearing_a_plague_monk_04",
				"pdr_gameplay_hearing_a_plague_monk_05",
				"pdr_gameplay_hearing_a_plague_monk_06",
				"pdr_gameplay_hearing_a_plague_monk_07"
			},
			sound_events_duration = {
				2.9557917118073,
				3.2227292060852,
				2.3392708301544,
				2.6841666698456,
				3.9656457901001,
				4.1432709693909,
				4.5286459922791,
				4.1946043968201,
				1.2226250171661,
				1.9351249933243,
				1.655770778656
			}
		},
		pdr_gameplay_hearing_a_pm_in_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_pm_in_combat_01",
				"pdr_gameplay_hearing_a_pm_in_combat_02",
				"pdr_gameplay_hearing_a_pm_in_combat_03",
				"pdr_gameplay_hearing_a_pm_in_combat_04",
				"pdr_gameplay_hearing_a_plague_monk_combat_01",
				"pdr_gameplay_hearing_a_plague_monk_combat_02",
				"pdr_gameplay_hearing_a_plague_monk_combat_03",
				"pdr_gameplay_hearing_a_plague_monk_combat_04",
				"pdr_gameplay_hearing_a_plague_monk_combat_05",
				"pdr_gameplay_hearing_a_plague_monk_combat_06",
				"pdr_gameplay_hearing_a_plague_monk_combat_07",
				"pdr_gameplay_hearing_a_plague_monk_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_pm_in_combat_01",
				"pdr_gameplay_hearing_a_pm_in_combat_02",
				"pdr_gameplay_hearing_a_pm_in_combat_03",
				"pdr_gameplay_hearing_a_pm_in_combat_04",
				"pdr_gameplay_hearing_a_plague_monk_combat_01",
				"pdr_gameplay_hearing_a_plague_monk_combat_02",
				"pdr_gameplay_hearing_a_plague_monk_combat_03",
				"pdr_gameplay_hearing_a_plague_monk_combat_04",
				"pdr_gameplay_hearing_a_plague_monk_combat_05",
				"pdr_gameplay_hearing_a_plague_monk_combat_06",
				"pdr_gameplay_hearing_a_plague_monk_combat_07",
				"pdr_gameplay_hearing_a_plague_monk_combat_08"
			},
			sound_events_duration = {
				1.6828750371933,
				1.4644166231155,
				1.4663125276566,
				2.444375038147,
				1.8339583873749,
				1.7893958091736,
				1.6279375553131,
				2.8586666584015,
				1.5751667022705,
				1.3816666603088,
				1.3742500543594,
				1.554208278656
			}
		},
		pdr_gameplay_hearing_a_skaven_patrol_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"face_concerned",
				"face_concerned",
				"face_nervous",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pdr_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			sound_events_duration = {
				2.7820208072662,
				2.9383125305176,
				2.5463750362396,
				2.6670832633972,
				1.6935416460037,
				2.6639583110809
			}
		},
		pdr_gameplay_hearing_a_skaven_rat_ogre = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
			sound_events_n = 6,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_contempt",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_12"
			},
			sound_events_duration = {
				2.5488541126251,
				2.3384165763855,
				3.4892916679382,
				2.2055416107178,
				2.641937494278,
				2.9226665496826
			}
		},
		pdr_gameplay_hearing_a_skaven_rat_ogre_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_03",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_03",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pdr_gameplay_hearing_a_Skaven_rat_ogre_combat_08"
			},
			sound_events_duration = {
				1.841916680336,
				1.1012916564941,
				1.5525624752045,
				2.3223958015442,
				2.7347707748413,
				1.759645819664
			}
		},
		pdr_gameplay_hearing_a_skaven_ratling_gun = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "dwarf_ranger_honduras",
			sound_events_n = 11,
			category = "enemy_alerts_high",
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
				"pdr_gameplay_hearing_a_skaven_ratling_gun_03",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_17"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_skaven_ratling_gun_03",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_17"
			},
			sound_events_duration = {
				1.9628958702087,
				2.8416874408722,
				2.3765416145325,
				2.5336875915527,
				2.2982082366943,
				1.9676666259766,
				2.4909584522247,
				1.5102291107178,
				4.1408748626709,
				2.2550001144409,
				1.6384375095367
			}
		},
		pdr_gameplay_hearing_a_skaven_ratling_gun_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_02",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_02",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pdr_gameplay_hearing_a_Skaven_ratling_gun_combat_08"
			},
			sound_events_duration = {
				2.9988334178925,
				0.81514585018158,
				0.87752085924149,
				1.6280208826065,
				1.1711041927338,
				3.6813957691193
			}
		},
		pdr_gameplay_hearing_a_standard_bearer = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "dwarf_ranger_honduras",
			sound_events_n = 9,
			category = "enemy_alerts",
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
				"dialogue_talk"
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
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_hearing_a_standard_bearer_01",
				"pdr_gameplay_hearing_a_standard_bearer_02",
				"pdr_gameplay_hearing_a_standard_bearer_03",
				"pdr_gameplay_hearing_a_standard_bearer_04",
				"pdr_gameplay_hearing_a_standard_bearer_06",
				"pdr_gameplay_hearing_a_standard_bearer_combat_03",
				"pdr_gameplay_hearing_a_standard_bearer_combat_05",
				"pdr_gameplay_hearing_a_standard_bearer_combat_08",
				"pdr_gameplay_hearing_a_standard_bearer_combat_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_standard_bearer_01",
				"pdr_gameplay_hearing_a_standard_bearer_02",
				"pdr_gameplay_hearing_a_standard_bearer_03",
				"pdr_gameplay_hearing_a_standard_bearer_04",
				"pdr_gameplay_hearing_a_standard_bearer_06",
				"pdr_gameplay_hearing_a_standard_bearer_combat_03",
				"pdr_gameplay_hearing_a_standard_bearer_combat_05",
				"pdr_gameplay_hearing_a_standard_bearer_combat_08",
				"pdr_gameplay_hearing_a_standard_bearer_combat_06"
			},
			sound_events_duration = {
				3.1251041889191,
				3.4723541736603,
				2.8400626182556,
				2.2855207920074,
				2.9592707157135,
				2.2172083854675,
				4.2006249427795,
				2.0574998855591,
				1.0967394113541
			}
		},
		pdr_gameplay_hearing_a_standard_bearer_crater = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_standard_bearer_01",
				"pdr_gameplay_hearing_a_standard_bearer_02",
				"pdr_gameplay_hearing_a_standard_bearer_03",
				"pdr_gameplay_hearing_a_standard_bearer_04",
				"pdr_gameplay_hearing_a_standard_bearer_06",
				"pdr_gameplay_hearing_a_standard_bearer_combat_03",
				"pdr_gameplay_hearing_a_standard_bearer_combat_05",
				"pdr_gameplay_hearing_a_standard_bearer_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_standard_bearer_01",
				"pdr_gameplay_hearing_a_standard_bearer_02",
				"pdr_gameplay_hearing_a_standard_bearer_03",
				"pdr_gameplay_hearing_a_standard_bearer_04",
				"pdr_gameplay_hearing_a_standard_bearer_06",
				"pdr_gameplay_hearing_a_standard_bearer_combat_03",
				"pdr_gameplay_hearing_a_standard_bearer_combat_05",
				"pdr_gameplay_hearing_a_standard_bearer_combat_08"
			},
			sound_events_duration = {
				3.1251041889191,
				3.4723541736603,
				2.8400626182556,
				2.2855207920074,
				2.9592707157135,
				2.2172083854675,
				4.2006249427795,
				2.0574998855591
			}
		},
		pdr_gameplay_hearing_a_stormfiend = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_stormfiend_01",
				"pdr_gameplay_hearing_a_stormfiend_02",
				"pdr_gameplay_hearing_a_stormfiend_03",
				"pdr_gameplay_hearing_a_stormfiend_04",
				"pdr_gameplay_hearing_a_stormfiend_05",
				"pdr_gameplay_hearing_a_stormfiend_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_stormfiend_01",
				"pdr_gameplay_hearing_a_stormfiend_02",
				"pdr_gameplay_hearing_a_stormfiend_03",
				"pdr_gameplay_hearing_a_stormfiend_04",
				"pdr_gameplay_hearing_a_stormfiend_05",
				"pdr_gameplay_hearing_a_stormfiend_06"
			},
			sound_events_duration = {
				3.7158541679382,
				5.0146040916443,
				4.1511874198914,
				3.2652916908264,
				1.9789375066757,
				2.0614583492279
			}
		},
		pdr_gameplay_hearing_a_stormfiend_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_stormfiend_combat_01",
				"pdr_gameplay_hearing_a_stormfiend_combat_02",
				"pdr_gameplay_hearing_a_stormfiend_combat_03",
				"pdr_gameplay_hearing_a_stormfiend_combat_04",
				"pdr_gameplay_hearing_a_stormfiend_combat_05",
				"pdr_gameplay_hearing_a_stormfiend_combat_06",
				"pdr_gameplay_hearing_a_stormfiend_combat_07",
				"pdr_gameplay_hearing_a_stormfiend_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_stormfiend_combat_01",
				"pdr_gameplay_hearing_a_stormfiend_combat_02",
				"pdr_gameplay_hearing_a_stormfiend_combat_03",
				"pdr_gameplay_hearing_a_stormfiend_combat_04",
				"pdr_gameplay_hearing_a_stormfiend_combat_05",
				"pdr_gameplay_hearing_a_stormfiend_combat_06",
				"pdr_gameplay_hearing_a_stormfiend_combat_07",
				"pdr_gameplay_hearing_a_stormfiend_combat_08"
			},
			sound_events_duration = {
				1.1514375209808,
				1.512479186058,
				1.4332708120346,
				1.9342708587647,
				1.4105207920075,
				1.8399167060852,
				1.6362082958221,
				2.6163749694824
			}
		},
		pdr_gameplay_hearing_a_troll = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_troll_01",
				"pdr_gameplay_hearing_a_troll_02",
				"pdr_gameplay_hearing_a_troll_03",
				"pdr_gameplay_hearing_a_troll_04",
				"pdr_gameplay_hearing_a_troll_05",
				"pdr_gameplay_hearing_a_troll_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_troll_01",
				"pdr_gameplay_hearing_a_troll_02",
				"pdr_gameplay_hearing_a_troll_03",
				"pdr_gameplay_hearing_a_troll_04",
				"pdr_gameplay_hearing_a_troll_05",
				"pdr_gameplay_hearing_a_troll_06"
			},
			sound_events_duration = {
				3.3918540477753,
				2.4378125667572,
				3.4300208091736,
				5.4446668624878,
				3.4500000476837,
				3.4337084293366
			}
		},
		pdr_gameplay_hearing_a_troll_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_a_troll_combat_01",
				"pdr_gameplay_hearing_a_troll_combat_02",
				"pdr_gameplay_hearing_a_troll_combat_03",
				"pdr_gameplay_hearing_a_troll_combat_04",
				"pdr_gameplay_hearing_a_troll_combat_05",
				"pdr_gameplay_hearing_a_troll_combat_06",
				"pdr_gameplay_hearing_a_troll_combat_07",
				"pdr_gameplay_hearing_a_troll_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_troll_combat_01",
				"pdr_gameplay_hearing_a_troll_combat_02",
				"pdr_gameplay_hearing_a_troll_combat_03",
				"pdr_gameplay_hearing_a_troll_combat_04",
				"pdr_gameplay_hearing_a_troll_combat_05",
				"pdr_gameplay_hearing_a_troll_combat_06",
				"pdr_gameplay_hearing_a_troll_combat_07",
				"pdr_gameplay_hearing_a_troll_combat_08"
			},
			sound_events_duration = {
				0.85964584350586,
				1.2995417118073,
				1.678791642189,
				3.350145816803,
				2.3865625858307,
				2.9872500896454,
				2.3371250629425,
				2.3057916164398
			}
		},
		pdr_gameplay_hearing_marauder_berserker_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hearing_marauder_berserker_combat_01",
				"pdr_gameplay_hearing_marauder_berserker_combat_02",
				"pdr_gameplay_hearing_marauder_berserker_combat_03",
				"pdr_gameplay_hearing_marauder_berserker_combat_04",
				"pdr_gameplay_hearing_marauder_berserker_combat_05",
				"pdr_gameplay_hearing_marauder_berserker_combat_06",
				"pdr_gameplay_hearing_marauder_berserker_combat_07",
				"pdr_gameplay_hearing_marauder_berserker_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_marauder_berserker_combat_01",
				"pdr_gameplay_hearing_marauder_berserker_combat_02",
				"pdr_gameplay_hearing_marauder_berserker_combat_03",
				"pdr_gameplay_hearing_marauder_berserker_combat_04",
				"pdr_gameplay_hearing_marauder_berserker_combat_05",
				"pdr_gameplay_hearing_marauder_berserker_combat_06",
				"pdr_gameplay_hearing_marauder_berserker_combat_07",
				"pdr_gameplay_hearing_marauder_berserker_combat_08"
			},
			sound_events_duration = {
				1.4083541631699,
				1.0705416202545,
				2.6666874885559,
				1.2847291231155,
				2.486166715622,
				2.5627708435059,
				2.0425000190735,
				2.3704791069031
			}
		},
		pdr_gameplay_hears_incoming_horde = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "dwarf_ranger_honduras",
			sound_events_n = 15,
			category = "enemy_alerts_high",
			dialogue_animations_n = 15,
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
				"face_contempt"
			},
			localization_strings = {
				"pdr_gameplay_hears_incoming_horde_10",
				"pdr_gameplay_hears_incoming_horde_11",
				"pdr_gameplay_hears_incoming_horde_12",
				"pdr_gameplay_hears_incoming_horde_13",
				"pdr_gameplay_hears_incoming_horde_14",
				"pdr_gameplay_hears_incoming_horde_15",
				"pdr_gameplay_hears_incoming_horde_16",
				"pdr_gameplay_hears_incoming_horde_17",
				"pdr_gameplay_hears_incoming_horde_18",
				"pdr_gameplay_hears_incoming_horde_19",
				"pdr_gameplay_hears_incoming_horde_20",
				"pdr_gameplay_hears_incoming_horde_21",
				"pdr_gameplay_hears_incoming_horde_22",
				"pdr_gameplay_hears_incoming_horde_23",
				"pdr_gameplay_hears_incoming_horde_24"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hears_incoming_horde_10",
				"pdr_gameplay_hears_incoming_horde_11",
				"pdr_gameplay_hears_incoming_horde_12",
				"pdr_gameplay_hears_incoming_horde_13",
				"pdr_gameplay_hears_incoming_horde_14",
				"pdr_gameplay_hears_incoming_horde_15",
				"pdr_gameplay_hears_incoming_horde_16",
				"pdr_gameplay_hears_incoming_horde_17",
				"pdr_gameplay_hears_incoming_horde_18",
				"pdr_gameplay_hears_incoming_horde_19",
				"pdr_gameplay_hears_incoming_horde_20",
				"pdr_gameplay_hears_incoming_horde_21",
				"pdr_gameplay_hears_incoming_horde_22",
				"pdr_gameplay_hears_incoming_horde_23",
				"pdr_gameplay_hears_incoming_horde_24"
			},
			sound_events_duration = {
				2.8195209503174,
				3.7647500038147,
				2.7988958358765,
				2.942125082016,
				3.3633124828339,
				2.3589999675751,
				2.4054374694824,
				1.8674999475479,
				1.590604186058,
				1.6089792251587,
				1.9621042013168,
				3.0002915859222,
				4.4359169006348,
				2.0437707901001,
				3.143812417984
			}
		},
		pdr_gameplay_helped_by_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_helped_by_bright_wizard_02",
				"pdr_gameplay_helped_by_bright_wizard_05",
				"pdr_gameplay_helped_by_bright_wizard_06",
				"pdr_gameplay_helped_by_bright_wizard_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_helped_by_bright_wizard_02",
				"pdr_gameplay_helped_by_bright_wizard_05",
				"pdr_gameplay_helped_by_bright_wizard_06",
				"pdr_gameplay_helped_by_bright_wizard_07"
			},
			sound_events_duration = {
				1.2344583272934,
				2.8325417041779,
				2.2534792423248,
				1.7668333053589
			}
		},
		pdr_gameplay_helped_by_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_helped_by_empire_soldier_01",
				"pdr_gameplay_helped_by_empire_soldier_02",
				"pdr_gameplay_helped_by_empire_soldier_03",
				"pdr_gameplay_helped_by_empire_soldier_04",
				"pdr_gameplay_helped_by_empire_soldier_05",
				"pdr_gameplay_helped_by_empire_soldier_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_helped_by_empire_soldier_01",
				"pdr_gameplay_helped_by_empire_soldier_02",
				"pdr_gameplay_helped_by_empire_soldier_03",
				"pdr_gameplay_helped_by_empire_soldier_04",
				"pdr_gameplay_helped_by_empire_soldier_05",
				"pdr_gameplay_helped_by_empire_soldier_06"
			},
			sound_events_duration = {
				1.8390624523163,
				1.5960832834244,
				2.2077083587647,
				1.8311666250229,
				2.7777917385101,
				2.8599166870117
			}
		},
		pdr_gameplay_helped_by_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_helped_by_witch_hunter_01",
				"pdr_gameplay_helped_by_witch_hunter_02",
				"pdr_gameplay_helped_by_witch_hunter_03",
				"pdr_gameplay_helped_by_witch_hunter_04",
				"pdr_gameplay_helped_by_witch_hunter_05",
				"pdr_gameplay_helped_by_witch_hunter_06",
				"pdr_gameplay_helped_by_witch_hunter_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_helped_by_witch_hunter_01",
				"pdr_gameplay_helped_by_witch_hunter_02",
				"pdr_gameplay_helped_by_witch_hunter_03",
				"pdr_gameplay_helped_by_witch_hunter_04",
				"pdr_gameplay_helped_by_witch_hunter_05",
				"pdr_gameplay_helped_by_witch_hunter_06",
				"pdr_gameplay_helped_by_witch_hunter_07"
			},
			sound_events_duration = {
				1.3961042165756,
				1.9754791259766,
				1.7438541650772,
				2.784458398819,
				1.7521250247955,
				1.4527708292007,
				1.9288541078568
			}
		},
		pdr_gameplay_helped_by_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_helped_by_wood_elf_01",
				"pdr_gameplay_helped_by_wood_elf_03",
				"pdr_gameplay_helped_by_wood_elf_05",
				"pdr_gameplay_helped_by_wood_elf_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_helped_by_wood_elf_01",
				"pdr_gameplay_helped_by_wood_elf_03",
				"pdr_gameplay_helped_by_wood_elf_05",
				"pdr_gameplay_helped_by_wood_elf_06"
			},
			sound_events_duration = {
				1.3966250419617,
				1.7445833683014,
				2.2417707443237,
				1.8280416727066
			}
		},
		pdr_gameplay_hit_by_goo = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_hit_by_goo_01",
				"pdr_gameplay_hit_by_goo_02",
				"pdr_gameplay_hit_by_goo_03",
				"pdr_gameplay_hit_by_goo_04",
				"pdr_gameplay_hit_by_goo_05",
				"pdr_gameplay_hit_by_goo_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hit_by_goo_01",
				"pdr_gameplay_hit_by_goo_02",
				"pdr_gameplay_hit_by_goo_03",
				"pdr_gameplay_hit_by_goo_04",
				"pdr_gameplay_hit_by_goo_05",
				"pdr_gameplay_hit_by_goo_06"
			},
			sound_events_duration = {
				3.2057292461395,
				2.967333316803,
				3.545104265213,
				3.3803124427795,
				3.6357917785645,
				4.2403750419617
			}
		},
		pdr_gameplay_incoming_attack = {
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "dwarf_ranger_honduras",
			sound_events_n = 11,
			category = "enemy_alerts_high",
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
				"pdr_gameplay_hearing_a_minotaur_combat_02",
				"pdr_gameplay_hearing_a_minotaur_combat_03",
				"pdr_gameplay_hearing_a_minotaur_combat_06",
				"pdr_gameplay_seeing_a_minotaur_01",
				"pdr_gameplay_seeing_a_minotaur_02",
				"pdr_gameplay_seeing_a_minotaur_03",
				"pdr_gameplay_seeing_a_minotaur_04",
				"pdr_gameplay_seeing_a_minotaur_05",
				"pdr_gameplay_seeing_a_minotaur_06",
				"pdr_gameplay_seeing_a_minotaur_07",
				"pdr_gameplay_seeing_a_minotaur_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_hearing_a_minotaur_combat_02",
				"pdr_gameplay_hearing_a_minotaur_combat_03",
				"pdr_gameplay_hearing_a_minotaur_combat_06",
				"pdr_gameplay_seeing_a_minotaur_01",
				"pdr_gameplay_seeing_a_minotaur_02",
				"pdr_gameplay_seeing_a_minotaur_03",
				"pdr_gameplay_seeing_a_minotaur_04",
				"pdr_gameplay_seeing_a_minotaur_05",
				"pdr_gameplay_seeing_a_minotaur_06",
				"pdr_gameplay_seeing_a_minotaur_07",
				"pdr_gameplay_seeing_a_minotaur_08"
			},
			sound_events_duration = {
				2.5239374637604,
				1.3682082891464,
				2.8141458034515,
				1.119437456131,
				3.0732917785645,
				3.6589167118073,
				3.1872916221619,
				2.8763542175293,
				2.0523126125336,
				4.3637709617615,
				3.5656459331513
			}
		},
		pdr_gameplay_incoming_bestigor_attack = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_incoming_bestigor_attack_01",
				"pdr_gameplay_incoming_bestigor_attack_02",
				"pdr_gameplay_incoming_bestigor_attack_03",
				"pdr_gameplay_incoming_bestigor_attack_04",
				"pdr_gameplay_incoming_bestigor_attack_05",
				"pdr_gameplay_incoming_bestigor_attack_06",
				"pdr_gameplay_incoming_bestigor_attack_07",
				"pdr_gameplay_incoming_bestigor_attack_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_incoming_bestigor_attack_01",
				"pdr_gameplay_incoming_bestigor_attack_02",
				"pdr_gameplay_incoming_bestigor_attack_03",
				"pdr_gameplay_incoming_bestigor_attack_04",
				"pdr_gameplay_incoming_bestigor_attack_05",
				"pdr_gameplay_incoming_bestigor_attack_06",
				"pdr_gameplay_incoming_bestigor_attack_07",
				"pdr_gameplay_incoming_bestigor_attack_08"
			},
			sound_events_duration = {
				1.2450833320618,
				0.5780833363533,
				0.95974999666214,
				2.0010416507721,
				1.1927083730698,
				2.2030415534973,
				1.163125038147,
				1.7742500305176
			}
		},
		pdr_gameplay_incoming_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_incoming_globadier_01",
				"pdr_gameplay_incoming_globadier_02",
				"pdr_gameplay_incoming_globadier_03",
				"pdr_gameplay_incoming_globadier_04",
				"pdr_gameplay_incoming_globadier_05",
				"pdr_gameplay_incoming_globadier_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_incoming_globadier_01",
				"pdr_gameplay_incoming_globadier_02",
				"pdr_gameplay_incoming_globadier_03",
				"pdr_gameplay_incoming_globadier_04",
				"pdr_gameplay_incoming_globadier_05",
				"pdr_gameplay_incoming_globadier_06"
			},
			sound_events_duration = {
				1.6133542060852,
				2.1898334026337,
				1.3537917137146,
				1.4900416135788,
				1.8917708396912,
				2.9164166450501
			}
		},
		pdr_gameplay_incoming_skaven_rat_ogre = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_incoming_Skaven_rat_ogre_09",
				"pdr_gameplay_incoming_Skaven_rat_ogre_10",
				"pdr_gameplay_incoming_Skaven_rat_ogre_11",
				"pdr_gameplay_incoming_Skaven_rat_ogre_12",
				"pdr_gameplay_incoming_Skaven_rat_ogre_13",
				"pdr_gameplay_incoming_Skaven_rat_ogre_14",
				"pdr_gameplay_incoming_Skaven_rat_ogre_15",
				"pdr_gameplay_incoming_Skaven_rat_ogre_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_incoming_Skaven_rat_ogre_09",
				"pdr_gameplay_incoming_Skaven_rat_ogre_10",
				"pdr_gameplay_incoming_Skaven_rat_ogre_11",
				"pdr_gameplay_incoming_Skaven_rat_ogre_12",
				"pdr_gameplay_incoming_Skaven_rat_ogre_13",
				"pdr_gameplay_incoming_Skaven_rat_ogre_14",
				"pdr_gameplay_incoming_Skaven_rat_ogre_15",
				"pdr_gameplay_incoming_Skaven_rat_ogre_16"
			},
			sound_events_duration = {
				2.692104101181,
				1.6087708473206,
				1.1320208311081,
				1.5361875295639,
				2.0944790840149,
				1.5672708749771,
				2.0704791545868,
				2.4339792728424
			}
		},
		pdr_gameplay_killing_a_chaos_warrior = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_chaos_warrior_01",
				"pdr_gameplay_killing_a_chaos_warrior_02",
				"pdr_gameplay_killing_a_chaos_warrior_03",
				"pdr_gameplay_killing_a_chaos_warrior_04",
				"pdr_gameplay_killing_a_chaos_warrior_05",
				"pdr_gameplay_killing_a_chaos_warrior_06",
				"pdr_gameplay_killing_a_chaos_warrior_07",
				"pdr_gameplay_killing_a_chaos_warrior_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_chaos_warrior_01",
				"pdr_gameplay_killing_a_chaos_warrior_02",
				"pdr_gameplay_killing_a_chaos_warrior_03",
				"pdr_gameplay_killing_a_chaos_warrior_04",
				"pdr_gameplay_killing_a_chaos_warrior_05",
				"pdr_gameplay_killing_a_chaos_warrior_06",
				"pdr_gameplay_killing_a_chaos_warrior_07",
				"pdr_gameplay_killing_a_chaos_warrior_08"
			},
			sound_events_duration = {
				1.9545832872391,
				2.4841876029968,
				1.9703124761581,
				1.8665000200272,
				2.9621665477753,
				2.3980417251587,
				3.5380001068115,
				2.0299999713898
			}
		},
		pdr_gameplay_killing_a_chaos_warrior_champion = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_chaos_warrior_champion_01",
				"pdr_gameplay_killing_a_chaos_warrior_champion_02",
				"pdr_gameplay_killing_a_chaos_warrior_champion_03",
				"pdr_gameplay_killing_a_chaos_warrior_champion_04",
				"pdr_gameplay_killing_a_chaos_warrior_champion_05",
				"pdr_gameplay_killing_a_chaos_warrior_champion_06",
				"pdr_gameplay_killing_a_chaos_warrior_champion_07",
				"pdr_gameplay_killing_a_chaos_warrior_champion_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_chaos_warrior_champion_01",
				"pdr_gameplay_killing_a_chaos_warrior_champion_02",
				"pdr_gameplay_killing_a_chaos_warrior_champion_03",
				"pdr_gameplay_killing_a_chaos_warrior_champion_04",
				"pdr_gameplay_killing_a_chaos_warrior_champion_05",
				"pdr_gameplay_killing_a_chaos_warrior_champion_06",
				"pdr_gameplay_killing_a_chaos_warrior_champion_07",
				"pdr_gameplay_killing_a_chaos_warrior_champion_08"
			},
			sound_events_duration = {
				5.5401043891907,
				2.0994582176209,
				2.0725207328796,
				1.9824999570847,
				2.8266665935516,
				2.7990832328796,
				4.767062664032,
				4.4398956298828
			}
		},
		pdr_gameplay_killing_a_chaos_wizard_leech = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_chaos_wizard_leech_01",
				"pdr_gameplay_killing_a_chaos_wizard_leech_02",
				"pdr_gameplay_killing_a_chaos_wizard_leech_03",
				"pdr_gameplay_killing_a_chaos_wizard_leech_04",
				"pdr_gameplay_killing_a_chaos_wizard_leech_05",
				"pdr_gameplay_killing_a_chaos_wizard_leech_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_chaos_wizard_leech_01",
				"pdr_gameplay_killing_a_chaos_wizard_leech_02",
				"pdr_gameplay_killing_a_chaos_wizard_leech_03",
				"pdr_gameplay_killing_a_chaos_wizard_leech_04",
				"pdr_gameplay_killing_a_chaos_wizard_leech_05",
				"pdr_gameplay_killing_a_chaos_wizard_leech_06"
			},
			sound_events_duration = {
				1.7145208120346,
				1.7940624952316,
				2.0925624370575,
				1.958104133606,
				2.8283541202545,
				2.0775208473206
			}
		},
		pdr_gameplay_killing_a_chaos_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_chaos_wizard_plague_01",
				"pdr_gameplay_killing_a_chaos_wizard_plague_02",
				"pdr_gameplay_killing_a_chaos_wizard_plague_03",
				"pdr_gameplay_killing_a_chaos_wizard_plague_04",
				"pdr_gameplay_killing_a_chaos_wizard_plague_05",
				"pdr_gameplay_killing_a_chaos_wizard_plague_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_chaos_wizard_plague_01",
				"pdr_gameplay_killing_a_chaos_wizard_plague_02",
				"pdr_gameplay_killing_a_chaos_wizard_plague_03",
				"pdr_gameplay_killing_a_chaos_wizard_plague_04",
				"pdr_gameplay_killing_a_chaos_wizard_plague_05",
				"pdr_gameplay_killing_a_chaos_wizard_plague_06"
			},
			sound_events_duration = {
				2.5245416164398,
				2.1361041069031,
				2.221937417984,
				3.2214584350586,
				2.3741874694824,
				2.4024791717529
			}
		},
		pdr_gameplay_killing_a_chaos_wizard_tentacle = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pdr_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			sound_events_duration = {
				2.1229374408722,
				2.2034375667572,
				2.0177917480469,
				4.1005835533142,
				1.1035416126251,
				1.8713749647141
			}
		},
		pdr_gameplay_killing_a_chaos_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_chaos_wizard_wind_01",
				"pdr_gameplay_killing_a_chaos_wizard_wind_02",
				"pdr_gameplay_killing_a_chaos_wizard_wind_03",
				"pdr_gameplay_killing_a_chaos_wizard_wind_04",
				"pdr_gameplay_killing_a_chaos_wizard_wind_05",
				"pdr_gameplay_killing_a_chaos_wizard_wind_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_chaos_wizard_wind_01",
				"pdr_gameplay_killing_a_chaos_wizard_wind_02",
				"pdr_gameplay_killing_a_chaos_wizard_wind_03",
				"pdr_gameplay_killing_a_chaos_wizard_wind_04",
				"pdr_gameplay_killing_a_chaos_wizard_wind_05",
				"pdr_gameplay_killing_a_chaos_wizard_wind_06"
			},
			sound_events_duration = {
				2.4911458492279,
				2.5195000171661,
				3.1604166030884,
				3.7742500305176,
				2.4138958454132,
				2.8757500648499
			}
		},
		pdr_gameplay_killing_a_minotaur = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_minotaur_01",
				"pdr_gameplay_killing_a_minotaur_02",
				"pdr_gameplay_killing_a_minotaur_03",
				"pdr_gameplay_killing_a_minotaur_04",
				"pdr_gameplay_killing_a_minotaur_05",
				"pdr_gameplay_killing_a_minotaur_06",
				"pdr_gameplay_killing_a_minotaur_07",
				"pdr_gameplay_killing_a_minotaur_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_minotaur_01",
				"pdr_gameplay_killing_a_minotaur_02",
				"pdr_gameplay_killing_a_minotaur_03",
				"pdr_gameplay_killing_a_minotaur_04",
				"pdr_gameplay_killing_a_minotaur_05",
				"pdr_gameplay_killing_a_minotaur_06",
				"pdr_gameplay_killing_a_minotaur_07",
				"pdr_gameplay_killing_a_minotaur_08"
			},
			sound_events_duration = {
				3.2391250133514,
				2.5809373855591,
				4.2341876029968,
				3.9180624485016,
				3.1095623970032,
				4.000958442688,
				5.2707085609436,
				2.9385416507721
			}
		},
		pdr_gameplay_killing_a_skaven_warpfire_thrower = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pdr_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			sound_events_duration = {
				3.3688750267029,
				4.1476664543152,
				1.9613332748413,
				2.498687505722,
				4.0379791259766,
				5.6533751487732,
				3.3138542175293,
				3.8147292137146
			}
		},
		pdr_gameplay_killing_a_stormfiend = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_a_stormfiend_01",
				"pdr_gameplay_killing_a_stormfiend_02",
				"pdr_gameplay_killing_a_stormfiend_03",
				"pdr_gameplay_killing_a_stormfiend_04",
				"pdr_gameplay_killing_a_stormfiend_05",
				"pdr_gameplay_killing_a_stormfiend_06",
				"pdr_gameplay_killing_a_stormfiend_07",
				"pdr_gameplay_killing_a_stormfiend_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_a_stormfiend_01",
				"pdr_gameplay_killing_a_stormfiend_02",
				"pdr_gameplay_killing_a_stormfiend_03",
				"pdr_gameplay_killing_a_stormfiend_04",
				"pdr_gameplay_killing_a_stormfiend_05",
				"pdr_gameplay_killing_a_stormfiend_06",
				"pdr_gameplay_killing_a_stormfiend_07",
				"pdr_gameplay_killing_a_stormfiend_08"
			},
			sound_events_duration = {
				4.4209790229797,
				3.6298749446869,
				2.4566874504089,
				4.8398752212524,
				3.069375038147,
				3.2797708511352,
				4.0683331489563,
				4.6468124389648
			}
		},
		pdr_gameplay_killing_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_globadier_02",
				"pdr_gameplay_killing_globadier_05",
				"pdr_gameplay_killing_globadier_06",
				"pdr_gameplay_killing_globadier_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_globadier_02",
				"pdr_gameplay_killing_globadier_05",
				"pdr_gameplay_killing_globadier_06",
				"pdr_gameplay_killing_globadier_07"
			},
			sound_events_duration = {
				1.5290207862854,
				1.9467083215714,
				1.9950000047684,
				1.891520857811
			}
		},
		pdr_gameplay_killing_gutterrunner = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
			sound_events_n = 7,
			category = "enemy_alerts",
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
				"pdr_gameplay_killing_gutterrunner_01",
				"pdr_gameplay_killing_gutterrunner_02",
				"pdr_gameplay_killing_gutterrunner_03",
				"pdr_gameplay_killing_gutterrunner_04",
				"pdr_gameplay_killing_gutterrunner_05",
				"pdr_gameplay_killing_gutterrunner_06",
				"pdr_gameplay_killing_gutterrunner_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_gutterrunner_01",
				"pdr_gameplay_killing_gutterrunner_02",
				"pdr_gameplay_killing_gutterrunner_03",
				"pdr_gameplay_killing_gutterrunner_04",
				"pdr_gameplay_killing_gutterrunner_05",
				"pdr_gameplay_killing_gutterrunner_06",
				"pdr_gameplay_killing_gutterrunner_07"
			},
			sound_events_duration = {
				1.6626249551773,
				1.3665833473206,
				2.0190832614899,
				2.6706874370575,
				1.9995000362396,
				1.9984166622162,
				2.9472708702087
			}
		},
		pdr_gameplay_killing_lootrat = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_lootrat_05",
				"pdr_gameplay_killing_lootrat_06",
				"pdr_gameplay_killing_lootrat_07",
				"pdr_gameplay_killing_lootrat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_lootrat_05",
				"pdr_gameplay_killing_lootrat_06",
				"pdr_gameplay_killing_lootrat_07",
				"pdr_gameplay_killing_lootrat_08"
			},
			sound_events_duration = {
				1.3934791088104,
				2.2637915611267,
				1.3413333892822,
				2.1676666736603
			}
		},
		pdr_gameplay_killing_packmaster = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_packmaster_01",
				"pdr_gameplay_killing_packmaster_02",
				"pdr_gameplay_killing_packmaster_04",
				"pdr_gameplay_killing_packmaster_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_packmaster_01",
				"pdr_gameplay_killing_packmaster_02",
				"pdr_gameplay_killing_packmaster_04",
				"pdr_gameplay_killing_packmaster_05"
			},
			sound_events_duration = {
				1.3198541402817,
				1.7195208072662,
				1.3527708053589,
				2.0613541603088
			}
		},
		pdr_gameplay_killing_ratling = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_killing_ratling_03",
				"pdr_gameplay_killing_ratling_05",
				"pdr_gameplay_killing_ratling_06",
				"pdr_gameplay_killing_ratling_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_killing_ratling_03",
				"pdr_gameplay_killing_ratling_05",
				"pdr_gameplay_killing_ratling_06",
				"pdr_gameplay_killing_ratling_07"
			},
			sound_events_duration = {
				2.1840832233429,
				1.707270860672,
				2.5048959255219,
				1.6151666641235
			}
		},
		pdr_gameplay_knocked_down = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_07",
				"pdr_gameplay_knocked_down_08",
				"pdr_gameplay_knocked_down_09",
				"pdr_gameplay_knocked_down_10",
				"pdr_gameplay_knocked_down_11",
				"pdr_gameplay_knocked_down_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_07",
				"pdr_gameplay_knocked_down_08",
				"pdr_gameplay_knocked_down_09",
				"pdr_gameplay_knocked_down_10",
				"pdr_gameplay_knocked_down_11",
				"pdr_gameplay_knocked_down_12"
			},
			sound_events_duration = {
				1.0656042098999,
				1.2492083311081,
				1.390104174614,
				1.6088124513626,
				3.0344791412353,
				2.0668749809265,
				1.7941666841507,
				3.2075417041779
			}
		},
		pdr_gameplay_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_low_on_health_01",
				"pdr_gameplay_low_on_health_02",
				"pdr_gameplay_low_on_health_03",
				"pdr_gameplay_low_on_health_04",
				"pdr_gameplay_low_on_health_05",
				"pdr_gameplay_low_on_health_06",
				"pdr_gameplay_low_on_health_07",
				"pdr_gameplay_low_on_health_08",
				"pdr_gameplay_low_on_health_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_low_on_health_01",
				"pdr_gameplay_low_on_health_02",
				"pdr_gameplay_low_on_health_03",
				"pdr_gameplay_low_on_health_04",
				"pdr_gameplay_low_on_health_05",
				"pdr_gameplay_low_on_health_06",
				"pdr_gameplay_low_on_health_07",
				"pdr_gameplay_low_on_health_08",
				"pdr_gameplay_low_on_health_09"
			},
			sound_events_duration = {
				3.4275417327881,
				3.7648959159851,
				3.5953540802002,
				1.7999999523163,
				1.8314583301544,
				0.97047919034958,
				1.9324375391007,
				3.5161874294281,
				2.2790832519531
			}
		},
		pdr_gameplay_no_nearby_teammates = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_no_nearby_teammates_07",
				"pdr_gameplay_no_nearby_teammates_08",
				"pdr_gameplay_no_nearby_teammates_09",
				"pdr_gameplay_no_nearby_teammates_10",
				"pdr_gameplay_no_nearby_teammates_11",
				"pdr_gameplay_no_nearby_teammates_12",
				"pdr_gameplay_no_nearby_teammates_13",
				"pdr_gameplay_no_nearby_teammates_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_no_nearby_teammates_07",
				"pdr_gameplay_no_nearby_teammates_08",
				"pdr_gameplay_no_nearby_teammates_09",
				"pdr_gameplay_no_nearby_teammates_10",
				"pdr_gameplay_no_nearby_teammates_11",
				"pdr_gameplay_no_nearby_teammates_12",
				"pdr_gameplay_no_nearby_teammates_13",
				"pdr_gameplay_no_nearby_teammates_14"
			},
			sound_events_duration = {
				5.3807916641235,
				2.5750417709351,
				1.667791724205,
				2.1100208759308,
				3.3932917118073,
				1.8192917108536,
				4.4151668548584,
				2.010541677475
			}
		},
		pdr_gameplay_out_of_ammo = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_out_of_ammo_01",
				"pdr_gameplay_out_of_ammo_02",
				"pdr_gameplay_out_of_ammo_03",
				"pdr_gameplay_out_of_ammo_04",
				"pdr_gameplay_out_of_ammo_05",
				"pdr_gameplay_out_of_ammo_06",
				"pdr_gameplay_out_of_ammo_07",
				"pdr_gameplay_out_of_ammo_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_out_of_ammo_01",
				"pdr_gameplay_out_of_ammo_02",
				"pdr_gameplay_out_of_ammo_03",
				"pdr_gameplay_out_of_ammo_04",
				"pdr_gameplay_out_of_ammo_05",
				"pdr_gameplay_out_of_ammo_06",
				"pdr_gameplay_out_of_ammo_07",
				"pdr_gameplay_out_of_ammo_08"
			},
			sound_events_duration = {
				1.7999999523163,
				1.7781666517258,
				0.75170832872391,
				1.1845624446869,
				1.7942500114441,
				2.3383541107178,
				3.0143332481384,
				1.712249994278
			}
		},
		pdr_gameplay_overcharge = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			localization_strings = {
				"pdr_gameplay_overcharge_06",
				"pdr_gameplay_overcharge_07",
				"pdr_gameplay_overcharge_08",
				"pdr_gameplay_overcharge_09",
				"pdr_gameplay_overcharge_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_overcharge_06",
				"pdr_gameplay_overcharge_07",
				"pdr_gameplay_overcharge_08",
				"pdr_gameplay_overcharge_09",
				"pdr_gameplay_overcharge_10"
			},
			sound_events_duration = {
				1.9935417175293,
				1.5871875286102,
				1.6283750534058,
				2.3705415725708,
				1.4684375524521
			}
		},
		pdr_gameplay_parry_bright_wizard = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_parry_bright_wizard_01",
				"pdr_gameplay_parry_bright_wizard_02",
				"pdr_gameplay_parry_bright_wizard_03",
				"pdr_gameplay_parry_bright_wizard_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_parry_bright_wizard_01",
				"pdr_gameplay_parry_bright_wizard_02",
				"pdr_gameplay_parry_bright_wizard_03",
				"pdr_gameplay_parry_bright_wizard_04"
			},
			sound_events_duration = {
				1.7264583110809,
				1.1595833301544,
				1.7202291488648,
				1.5449999570847
			}
		},
		pdr_gameplay_parry_empire_soldier = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_parry_empire_soldier_01",
				"pdr_gameplay_parry_empire_soldier_02",
				"pdr_gameplay_parry_empire_soldier_03",
				"pdr_gameplay_parry_empire_soldier_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_parry_empire_soldier_01",
				"pdr_gameplay_parry_empire_soldier_02",
				"pdr_gameplay_parry_empire_soldier_03",
				"pdr_gameplay_parry_empire_soldier_04"
			},
			sound_events_duration = {
				1.2175208330154,
				1.7434583902359,
				1.1917916536331,
				1.1735208034515
			}
		},
		pdr_gameplay_parry_witch_hunter = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_parry_witch_hunter_01",
				"pdr_gameplay_parry_witch_hunter_02",
				"pdr_gameplay_parry_witch_hunter_03",
				"pdr_gameplay_parry_witch_hunter_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_parry_witch_hunter_01",
				"pdr_gameplay_parry_witch_hunter_02",
				"pdr_gameplay_parry_witch_hunter_03",
				"pdr_gameplay_parry_witch_hunter_04"
			},
			sound_events_duration = {
				1.2243958711624,
				1.6711666584015,
				2.2655832767487,
				1.6454374790192
			}
		},
		pdr_gameplay_parry_wood_elf = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_parry_wood_elf_01",
				"pdr_gameplay_parry_wood_elf_02",
				"pdr_gameplay_parry_wood_elf_03",
				"pdr_gameplay_parry_wood_elf_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_parry_wood_elf_01",
				"pdr_gameplay_parry_wood_elf_02",
				"pdr_gameplay_parry_wood_elf_03",
				"pdr_gameplay_parry_wood_elf_04"
			},
			sound_events_duration = {
				2.274270772934,
				1.7373750209808,
				2.1342916488648,
				1.8464374542236
			}
		},
		pdr_gameplay_player_pounced = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_player_pounced_07",
				"pdr_gameplay_player_pounced_08",
				"pdr_gameplay_player_pounced_09",
				"pdr_gameplay_player_pounced_10",
				"pdr_gameplay_player_pounced_11",
				"pdr_gameplay_player_pounced_12",
				"pdr_gameplay_player_pounced_13",
				"pdr_gameplay_player_pounced_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_player_pounced_07",
				"pdr_gameplay_player_pounced_08",
				"pdr_gameplay_player_pounced_09",
				"pdr_gameplay_player_pounced_10",
				"pdr_gameplay_player_pounced_11",
				"pdr_gameplay_player_pounced_12",
				"pdr_gameplay_player_pounced_13",
				"pdr_gameplay_player_pounced_14"
			},
			sound_events_duration = {
				2.2548959255219,
				2.8181457519531,
				1.6240832805634,
				1.6749583482742,
				2.1349167823791,
				2.4520416259766,
				1.7493958473206,
				2.5704374313355
			}
		},
		pdr_gameplay_seeing_a_Skaven_warpfire_thrower = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pdr_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			sound_events_duration = {
				3.4702916145325,
				3.9453542232513,
				5.2642917633057,
				5.1113333702087,
				2.9765000343323,
				3.1801042556763,
				2.7923123836517,
				3.0999999046326
			}
		},
		pdr_gameplay_seeing_a_chaos_spawn = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_chaos_spawn_01",
				"pdr_gameplay_seeing_a_chaos_spawn_02",
				"pdr_gameplay_seeing_a_chaos_spawn_03",
				"pdr_gameplay_seeing_a_chaos_spawn_04",
				"pdr_gameplay_seeing_a_chaos_spawn_05",
				"pdr_gameplay_seeing_a_chaos_spawn_06",
				"pdr_gameplay_seeing_a_chaos_spawn_07",
				"pdr_gameplay_seeing_a_chaos_spawn_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_chaos_spawn_01",
				"pdr_gameplay_seeing_a_chaos_spawn_02",
				"pdr_gameplay_seeing_a_chaos_spawn_03",
				"pdr_gameplay_seeing_a_chaos_spawn_04",
				"pdr_gameplay_seeing_a_chaos_spawn_05",
				"pdr_gameplay_seeing_a_chaos_spawn_06",
				"pdr_gameplay_seeing_a_chaos_spawn_07",
				"pdr_gameplay_seeing_a_chaos_spawn_08"
			},
			sound_events_duration = {
				2.6954584121704,
				2.9217915534973,
				4.365270614624,
				5.453145980835,
				6.1229791641235,
				3.2267291545868,
				4.5871667861939,
				3.057416677475
			}
		},
		pdr_gameplay_seeing_a_chaos_warrior = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_chaos_warrior_01",
				"pdr_gameplay_seeing_a_chaos_warrior_02",
				"pdr_gameplay_seeing_a_chaos_warrior_03",
				"pdr_gameplay_seeing_a_chaos_warrior_04",
				"pdr_gameplay_seeing_a_chaos_warrior_05",
				"pdr_gameplay_seeing_a_chaos_warrior_06",
				"pdr_gameplay_seeing_a_chaos_warrior_07",
				"pdr_gameplay_seeing_a_chaos_warrior_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_chaos_warrior_01",
				"pdr_gameplay_seeing_a_chaos_warrior_02",
				"pdr_gameplay_seeing_a_chaos_warrior_03",
				"pdr_gameplay_seeing_a_chaos_warrior_04",
				"pdr_gameplay_seeing_a_chaos_warrior_05",
				"pdr_gameplay_seeing_a_chaos_warrior_06",
				"pdr_gameplay_seeing_a_chaos_warrior_07",
				"pdr_gameplay_seeing_a_chaos_warrior_08"
			},
			sound_events_duration = {
				2.4782500267029,
				2.5368957519531,
				2.8637499809265,
				2.7619791030884,
				2.307416677475,
				2.6562917232513,
				3.6081666946411,
				3.4215416908264
			}
		},
		pdr_gameplay_seeing_a_chaos_warrior_champion_combat = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pdr_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			sound_events_duration = {
				4.4047918319702,
				3.8876249790192,
				3.3473749160767,
				2.6633958816528,
				3.5005834102631,
				5.4983749389648,
				3.2895834445953,
				3.6521248817444
			}
		},
		pdr_gameplay_seeing_a_chaos_wizard_leech = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_chaos_wizard_leech_01",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_02",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_04",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_05",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_06",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_07",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_chaos_wizard_leech_01",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_02",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_04",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_05",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_06",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_07",
				"pdr_gameplay_seeing_a_chaos_wizard_leech_08"
			},
			sound_events_duration = {
				1.4673750400543,
				2.5944583415985,
				2.1161458492279,
				1.6105208396912,
				1.2439166307449,
				1.1098749637604,
				2.0007083415985
			}
		},
		pdr_gameplay_seeing_a_chaos_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_chaos_wizard_plague_01",
				"pdr_gameplay_seeing_a_chaos_wizard_plague_02",
				"pdr_gameplay_seeing_a_chaos_wizard_plague_03",
				"pdr_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_chaos_wizard_plague_01",
				"pdr_gameplay_seeing_a_chaos_wizard_plague_02",
				"pdr_gameplay_seeing_a_chaos_wizard_plague_03",
				"pdr_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			sound_events_duration = {
				4.3074584007263,
				4.108895778656,
				6.086874961853,
				3.4476666450501
			}
		},
		pdr_gameplay_seeing_a_chaos_wizard_tentacle = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pdr_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pdr_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pdr_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pdr_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pdr_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pdr_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			sound_events_duration = {
				4.0671668052673,
				3.7822499275208,
				4.2732081413269,
				5.6753540039063
			}
		},
		pdr_gameplay_seeing_a_chaos_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_chaos_wizard_wind_01",
				"pdr_gameplay_seeing_a_chaos_wizard_wind_02",
				"pdr_gameplay_seeing_a_chaos_wizard_wind_03",
				"pdr_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_chaos_wizard_wind_01",
				"pdr_gameplay_seeing_a_chaos_wizard_wind_02",
				"pdr_gameplay_seeing_a_chaos_wizard_wind_03",
				"pdr_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			sound_events_duration = {
				3.5250208377838,
				3.4666249752045,
				3.2856667041779,
				5.3243751525879
			}
		},
		pdr_gameplay_seeing_a_globadier = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_globadier_01",
				"pdr_gameplay_seeing_a_globadier_02",
				"pdr_gameplay_seeing_a_globadier_03",
				"pdr_gameplay_seeing_a_globadier_04",
				"pdr_gameplay_seeing_a_globadier_05",
				"pdr_gameplay_seeing_a_globadier_06",
				"pdr_gameplay_seeing_a_globadier_07",
				"pdr_gameplay_seeing_a_globadier_08",
				"pdr_gameplay_seeing_a_globadier_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_globadier_01",
				"pdr_gameplay_seeing_a_globadier_02",
				"pdr_gameplay_seeing_a_globadier_03",
				"pdr_gameplay_seeing_a_globadier_04",
				"pdr_gameplay_seeing_a_globadier_05",
				"pdr_gameplay_seeing_a_globadier_06",
				"pdr_gameplay_seeing_a_globadier_07",
				"pdr_gameplay_seeing_a_globadier_08",
				"pdr_gameplay_seeing_a_globadier_09"
			},
			sound_events_duration = {
				0.78350001573563,
				2.3795416355133,
				1.7310416698456,
				2.2000000476837,
				2.2583959102631,
				1.7092916965485,
				1.5992708206177,
				1.8794583082199,
				3.2603125572205
			}
		},
		pdr_gameplay_seeing_a_gutter_runner = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_gutter_runner_07",
				"pdr_gameplay_seeing_a_gutter_runner_08",
				"pdr_gameplay_seeing_a_gutter_runner_09",
				"pdr_gameplay_seeing_a_gutter_runner_10",
				"pdr_gameplay_seeing_a_gutter_runner_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_gutter_runner_07",
				"pdr_gameplay_seeing_a_gutter_runner_08",
				"pdr_gameplay_seeing_a_gutter_runner_09",
				"pdr_gameplay_seeing_a_gutter_runner_10",
				"pdr_gameplay_seeing_a_gutter_runner_11"
			},
			sound_events_duration = {
				0.96768748760223,
				2.2829582691193,
				2.6864166259766,
				2.4646248817444,
				2.1197917461395
			}
		},
		pdr_gameplay_seeing_a_pm = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_pm_01",
				"pdr_gameplay_seeing_a_pm_02",
				"pdr_gameplay_seeing_a_pm_03",
				"pdr_gameplay_seeing_a_pm_04",
				"pdr_gameplay_seeing_a_pm_05",
				"pdr_gameplay_seeing_a_pm_06",
				"pdr_gameplay_seeing_a_pm_07",
				"pdr_gameplay_seeing_a_plague_monk_01",
				"pdr_gameplay_seeing_a_plague_monk_02",
				"pdr_gameplay_seeing_a_plague_monk_03",
				"pdr_gameplay_seeing_a_plague_monk_04",
				"pdr_gameplay_seeing_a_plague_monk_05",
				"pdr_gameplay_seeing_a_plague_monk_06",
				"pdr_gameplay_seeing_a_plague_monk_07",
				"pdr_gameplay_seeing_a_plague_monk_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_pm_01",
				"pdr_gameplay_seeing_a_pm_02",
				"pdr_gameplay_seeing_a_pm_03",
				"pdr_gameplay_seeing_a_pm_04",
				"pdr_gameplay_seeing_a_pm_05",
				"pdr_gameplay_seeing_a_pm_06",
				"pdr_gameplay_seeing_a_pm_07",
				"pdr_gameplay_seeing_a_plague_monk_01",
				"pdr_gameplay_seeing_a_plague_monk_02",
				"pdr_gameplay_seeing_a_plague_monk_03",
				"pdr_gameplay_seeing_a_plague_monk_04",
				"pdr_gameplay_seeing_a_plague_monk_05",
				"pdr_gameplay_seeing_a_plague_monk_06",
				"pdr_gameplay_seeing_a_plague_monk_07",
				"pdr_gameplay_seeing_a_plague_monk_08"
			},
			sound_events_duration = {
				1.1570625305176,
				1.3308333158493,
				1.0141041278839,
				0.89633333683014,
				1.0311458110809,
				1.1569792032242,
				1.6576249599457,
				2.1554999351502,
				2.4966666698456,
				1.9229166507721,
				2.9006042480469,
				2.7704999446869,
				3.2760417461395,
				2.1264791488648,
				3.4228959083557
			}
		},
		pdr_gameplay_seeing_a_scr = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_scr_01",
				"pdr_gameplay_seeing_a_scr_02",
				"pdr_gameplay_seeing_a_scr_03",
				"pdr_gameplay_seeing_a_scr_04",
				"pdr_gameplay_seeing_a_scr_05",
				"pdr_gameplay_seeing_a_scr_06",
				"pdr_gameplay_seeing_a_scr_07",
				"pdr_gameplay_seeing_a_shield_clanrat_01",
				"pdr_gameplay_seeing_a_shield_clanrat_02",
				"pdr_gameplay_seeing_a_shield_clanrat_03",
				"pdr_gameplay_seeing_a_shield_clanrat_04",
				"pdr_gameplay_seeing_a_shield_clanrat_05",
				"pdr_gameplay_seeing_a_shield_clanrat_06",
				"pdr_gameplay_seeing_a_shield_clanrat_07",
				"pdr_gameplay_seeing_a_shield_clanrat_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_scr_01",
				"pdr_gameplay_seeing_a_scr_02",
				"pdr_gameplay_seeing_a_scr_03",
				"pdr_gameplay_seeing_a_scr_04",
				"pdr_gameplay_seeing_a_scr_05",
				"pdr_gameplay_seeing_a_scr_06",
				"pdr_gameplay_seeing_a_scr_07",
				"pdr_gameplay_seeing_a_shield_clanrat_01",
				"pdr_gameplay_seeing_a_shield_clanrat_02",
				"pdr_gameplay_seeing_a_shield_clanrat_03",
				"pdr_gameplay_seeing_a_shield_clanrat_04",
				"pdr_gameplay_seeing_a_shield_clanrat_05",
				"pdr_gameplay_seeing_a_shield_clanrat_06",
				"pdr_gameplay_seeing_a_shield_clanrat_07",
				"pdr_gameplay_seeing_a_shield_clanrat_08"
			},
			sound_events_duration = {
				1.7586041688919,
				2.0534791946411,
				1.0517916679382,
				1.6665208339691,
				1.9989166259766,
				1.8721874952316,
				2.204999923706,
				2.7097084522247,
				2.2739791870117,
				1.1825000047684,
				1.4385833740234,
				3.5803542137146,
				1.6978958845139,
				1.8895208835602,
				2.6033959388733
			}
		},
		pdr_gameplay_seeing_a_shield_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_shield_stormvermin_01",
				"pdr_gameplay_seeing_a_shield_stormvermin_02",
				"pdr_gameplay_seeing_a_shield_stormvermin_03",
				"pdr_gameplay_seeing_a_shield_stormvermin_04",
				"pdr_gameplay_seeing_a_shield_stormvermin_05",
				"pdr_gameplay_seeing_a_shield_stormvermin_06",
				"pdr_gameplay_seeing_a_shield_stormvermin_07",
				"pdr_gameplay_seeing_a_shield_stormvermin_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_shield_stormvermin_01",
				"pdr_gameplay_seeing_a_shield_stormvermin_02",
				"pdr_gameplay_seeing_a_shield_stormvermin_03",
				"pdr_gameplay_seeing_a_shield_stormvermin_04",
				"pdr_gameplay_seeing_a_shield_stormvermin_05",
				"pdr_gameplay_seeing_a_shield_stormvermin_06",
				"pdr_gameplay_seeing_a_shield_stormvermin_07",
				"pdr_gameplay_seeing_a_shield_stormvermin_08"
			},
			sound_events_duration = {
				2.0519375801086,
				2.3899583816528,
				2.6576459407806,
				3.999062538147,
				2.344708442688,
				2.2834582328796,
				2.5283749103546,
				3.4430000782013
			}
		},
		pdr_gameplay_seeing_a_skaven_patrol_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"face_neutral",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_12",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_12",
				"pdr_gameplay_seeing_a_Skaven_patrol_stormvermin_13"
			},
			sound_events_duration = {
				2.274270772934,
				3.1917707920074,
				2.2294790744781,
				3.2726249694824,
				2.7592084407806,
				2.9855208396912,
				2.9887499809265
			}
		},
		pdr_gameplay_seeing_a_skaven_rat_ogre = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_skaven_rat_ogre_01",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_rat_ogre_01",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pdr_gameplay_seeing_a_Skaven_rat_ogre_11"
			},
			sound_events_duration = {
				0.90260416269302,
				2.7978541851044,
				2.7718541622162,
				4.5,
				2.1122915744781,
				2.0869998931885
			}
		},
		pdr_gameplay_seeing_a_skaven_ratling_gun = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_11",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_12",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_13",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_11",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_12",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_13",
				"pdr_gameplay_seeing_a_Skaven_ratling_gun_14"
			},
			sound_events_duration = {
				2.7785625457764,
				2.1923332214356,
				1.8374791145325,
				2.2097709178925,
				1.805999994278,
				1.8596458435059,
				1.8471041917801
			}
		},
		pdr_gameplay_seeing_a_skaven_slaver = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_skaven_slaver_04",
				"pdr_gameplay_seeing_a_skaven_slaver_08",
				"pdr_gameplay_seeing_a_Skaven_slaver_09",
				"pdr_gameplay_seeing_a_Skaven_slaver_10",
				"pdr_gameplay_seeing_a_Skaven_slaver_11",
				"pdr_gameplay_seeing_a_Skaven_slaver_12",
				"pdr_gameplay_seeing_a_Skaven_slaver_13",
				"pdr_gameplay_seeing_a_Skaven_slaver_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_slaver_04",
				"pdr_gameplay_seeing_a_skaven_slaver_08",
				"pdr_gameplay_seeing_a_Skaven_slaver_09",
				"pdr_gameplay_seeing_a_Skaven_slaver_10",
				"pdr_gameplay_seeing_a_Skaven_slaver_11",
				"pdr_gameplay_seeing_a_Skaven_slaver_12",
				"pdr_gameplay_seeing_a_Skaven_slaver_13",
				"pdr_gameplay_seeing_a_Skaven_slaver_14"
			},
			sound_events_duration = {
				0.72427082061768,
				0.81135416030884,
				2.1086459159851,
				2.2213542461395,
				2.028041601181,
				1.4562916755676,
				2.0901458263397,
				2.1785624027252
			}
		},
		pdr_gameplay_seeing_a_stormfiend = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_stormfiend_01",
				"pdr_gameplay_seeing_a_stormfiend_02",
				"pdr_gameplay_seeing_a_stormfiend_03",
				"pdr_gameplay_seeing_a_stormfiend_04",
				"pdr_gameplay_seeing_a_stormfiend_05",
				"pdr_gameplay_seeing_a_stormfiend_06",
				"pdr_gameplay_seeing_a_stormfiend_07",
				"pdr_gameplay_seeing_a_stormfiend_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_stormfiend_01",
				"pdr_gameplay_seeing_a_stormfiend_02",
				"pdr_gameplay_seeing_a_stormfiend_03",
				"pdr_gameplay_seeing_a_stormfiend_04",
				"pdr_gameplay_seeing_a_stormfiend_05",
				"pdr_gameplay_seeing_a_stormfiend_06",
				"pdr_gameplay_seeing_a_stormfiend_07",
				"pdr_gameplay_seeing_a_stormfiend_08"
			},
			sound_events_duration = {
				3.2501459121704,
				2.4382915496826,
				3.2673542499542,
				3.0572707653046,
				4.304229259491,
				2.3039374351502,
				2.5896875858307,
				3.6971666812897
			}
		},
		pdr_gameplay_seeing_a_stormvermin = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_stormvermin_02",
				"pdr_gameplay_seeing_a_stormvermin_08",
				"pdr_gameplay_seeing_a_stormvermin_09",
				"pdr_gameplay_seeing_a_stormvermin_10",
				"pdr_gameplay_seeing_a_stormvermin_11",
				"pdr_gameplay_seeing_a_stormvermin_12",
				"pdr_gameplay_seeing_a_stormvermin_13",
				"pdr_gameplay_seeing_a_stormvermin_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_stormvermin_02",
				"pdr_gameplay_seeing_a_stormvermin_08",
				"pdr_gameplay_seeing_a_stormvermin_09",
				"pdr_gameplay_seeing_a_stormvermin_10",
				"pdr_gameplay_seeing_a_stormvermin_11",
				"pdr_gameplay_seeing_a_stormvermin_12",
				"pdr_gameplay_seeing_a_stormvermin_13",
				"pdr_gameplay_seeing_a_stormvermin_14"
			},
			sound_events_duration = {
				1.4101041555405,
				1.1241666078568,
				2.0186874866486,
				2.2667708396912,
				1.6321666240692,
				1.6453541517258,
				1.8053541183472,
				1.3980624675751
			}
		},
		pdr_gameplay_seeing_a_troll = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_troll_01",
				"pdr_gameplay_seeing_a_troll_02",
				"pdr_gameplay_seeing_a_troll_03",
				"pdr_gameplay_seeing_a_troll_04",
				"pdr_gameplay_seeing_a_troll_05",
				"pdr_gameplay_seeing_a_troll_06",
				"pdr_gameplay_seeing_a_troll_07",
				"pdr_gameplay_seeing_a_troll_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_troll_01",
				"pdr_gameplay_seeing_a_troll_02",
				"pdr_gameplay_seeing_a_troll_03",
				"pdr_gameplay_seeing_a_troll_04",
				"pdr_gameplay_seeing_a_troll_05",
				"pdr_gameplay_seeing_a_troll_06",
				"pdr_gameplay_seeing_a_troll_07",
				"pdr_gameplay_seeing_a_troll_08"
			},
			sound_events_duration = {
				4.8307709693909,
				4.8025207519531,
				4.4529376029968,
				4.1213331222534,
				4.1690831184387,
				4.7344999313355,
				4.2116665840149,
				3.7068541049957
			}
		},
		pdr_gameplay_seeing_a_ungor_archer = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_seeing_a_ungor_archer_01",
				"pdr_gameplay_seeing_a_ungor_archer_02",
				"pdr_gameplay_seeing_a_ungor_archer_03",
				"pdr_gameplay_seeing_a_ungor_archer_04",
				"pdr_gameplay_seeing_a_ungor_archer_05",
				"pdr_gameplay_seeing_a_ungor_archer_06",
				"pdr_gameplay_seeing_a_ungor_archer_07",
				"pdr_gameplay_seeing_a_ungor_archer_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_seeing_a_ungor_archer_01",
				"pdr_gameplay_seeing_a_ungor_archer_02",
				"pdr_gameplay_seeing_a_ungor_archer_03",
				"pdr_gameplay_seeing_a_ungor_archer_04",
				"pdr_gameplay_seeing_a_ungor_archer_05",
				"pdr_gameplay_seeing_a_ungor_archer_06",
				"pdr_gameplay_seeing_a_ungor_archer_07",
				"pdr_gameplay_seeing_a_ungor_archer_08"
			},
			sound_events_duration = {
				0.63312500715256,
				1.1757500171661,
				1.412645816803,
				2.2681457996368,
				2.2639167308807,
				1.8029791116715,
				2.6275832653046,
				1.199979186058
			}
		},
		pdr_gameplay_self_heal = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pdr_gameplay_self_heal_06",
				"pdr_gameplay_self_heal_07",
				"pdr_gameplay_self_heal_08",
				"pdr_gameplay_self_heal_09",
				"pdr_gameplay_self_heal_10"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_self_heal_06",
				"pdr_gameplay_self_heal_07",
				"pdr_gameplay_self_heal_08",
				"pdr_gameplay_self_heal_09",
				"pdr_gameplay_self_heal_10"
			},
			sound_events_duration = {
				2.2452082633972,
				2.5398750305176,
				3.1612708568573,
				2.4914584159851,
				3.1698334217072
			}
		},
		pdr_gameplay_special_enemy_kill_melee = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "dwarf_ranger_honduras",
			sound_events_n = 15,
			category = "player_feedback",
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
				"pdr_gameplay_special_enemy_kill_melee_09",
				"pdr_gameplay_special_enemy_kill_melee_10",
				"pdr_gameplay_special_enemy_kill_melee_11",
				"pdr_gameplay_special_enemy_kill_melee_12",
				"pdr_gameplay_special_enemy_kill_melee_13",
				"pdr_gameplay_special_enemy_kill_melee_14",
				"pdr_gameplay_special_enemy_kill_melee_15",
				"pdr_gameplay_special_enemy_kill_melee_16",
				"pdr_gameplay_special_enemy_kill_melee_17",
				"pdr_gameplay_special_enemy_kill_melee_18",
				"pdr_gameplay_special_enemy_kill_melee_19",
				"pdr_gameplay_special_enemy_kill_melee_20",
				"pdr_gameplay_special_enemy_kill_melee_21",
				"pdr_gameplay_special_enemy_kill_melee_22",
				"pdr_gameplay_special_enemy_kill_melee_23"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_special_enemy_kill_melee_09",
				"pdr_gameplay_special_enemy_kill_melee_10",
				"pdr_gameplay_special_enemy_kill_melee_11",
				"pdr_gameplay_special_enemy_kill_melee_12",
				"pdr_gameplay_special_enemy_kill_melee_13",
				"pdr_gameplay_special_enemy_kill_melee_14",
				"pdr_gameplay_special_enemy_kill_melee_15",
				"pdr_gameplay_special_enemy_kill_melee_16",
				"pdr_gameplay_special_enemy_kill_melee_17",
				"pdr_gameplay_special_enemy_kill_melee_18",
				"pdr_gameplay_special_enemy_kill_melee_19",
				"pdr_gameplay_special_enemy_kill_melee_20",
				"pdr_gameplay_special_enemy_kill_melee_21",
				"pdr_gameplay_special_enemy_kill_melee_22",
				"pdr_gameplay_special_enemy_kill_melee_23"
			},
			sound_events_duration = {
				1.9939166307449,
				1.797354221344,
				2.8428957462311,
				1.7889583110809,
				2.3811666965485,
				1.7709374427795,
				2.0555832386017,
				2.7123749256134,
				3.7848749160767,
				3.3626041412353,
				4.1688122749329,
				2.4645624160767,
				2.4530415534973,
				3.205958366394,
				2.2741458415985
			}
		},
		pdr_gameplay_special_enemy_kill_ranged = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_special_enemy_kill_ranged_09",
				"pdr_gameplay_special_enemy_kill_ranged_10",
				"pdr_gameplay_special_enemy_kill_ranged_11",
				"pdr_gameplay_special_enemy_kill_ranged_12",
				"pdr_gameplay_special_enemy_kill_ranged_13",
				"pdr_gameplay_special_enemy_kill_ranged_14",
				"pdr_gameplay_special_enemy_kill_ranged_15",
				"pdr_gameplay_special_enemy_kill_ranged_16",
				"pdr_gameplay_special_enemy_kill_ranged_17",
				"pdr_gameplay_special_enemy_kill_ranged_18",
				"pdr_gameplay_special_enemy_kill_ranged_19",
				"pdr_gameplay_special_enemy_kill_ranged_20"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_special_enemy_kill_ranged_09",
				"pdr_gameplay_special_enemy_kill_ranged_10",
				"pdr_gameplay_special_enemy_kill_ranged_11",
				"pdr_gameplay_special_enemy_kill_ranged_12",
				"pdr_gameplay_special_enemy_kill_ranged_13",
				"pdr_gameplay_special_enemy_kill_ranged_14",
				"pdr_gameplay_special_enemy_kill_ranged_15",
				"pdr_gameplay_special_enemy_kill_ranged_16",
				"pdr_gameplay_special_enemy_kill_ranged_17",
				"pdr_gameplay_special_enemy_kill_ranged_18",
				"pdr_gameplay_special_enemy_kill_ranged_19",
				"pdr_gameplay_special_enemy_kill_ranged_20"
			},
			sound_events_duration = {
				1.643354177475,
				2.1733748912811,
				2.3468959331513,
				2.6942501068115,
				2.9944584369659,
				2.7184374332428,
				2.4368958473206,
				2.408041715622,
				3.3804376125336,
				3.2633125782013,
				2.4389584064484,
				2.1199584007263
			}
		},
		pdr_gameplay_spots_ammo = {
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_spots_ammo_01",
				"pdr_gameplay_spots_ammo_06",
				"pdr_gameplay_spots_ammo_07",
				"pdr_gameplay_spots_ammo_08",
				"pdr_gameplay_spots_ammo_09",
				"pdr_gameplay_spots_ammo_10",
				"pdr_gameplay_spots_ammo_11",
				"pdr_gameplay_spots_ammo_12",
				"pdr_gameplay_spots_ammo_13",
				"pdr_gameplay_spots_ammo_14"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_spots_ammo_01",
				"pdr_gameplay_spots_ammo_06",
				"pdr_gameplay_spots_ammo_07",
				"pdr_gameplay_spots_ammo_08",
				"pdr_gameplay_spots_ammo_09",
				"pdr_gameplay_spots_ammo_10",
				"pdr_gameplay_spots_ammo_11",
				"pdr_gameplay_spots_ammo_12",
				"pdr_gameplay_spots_ammo_13",
				"pdr_gameplay_spots_ammo_14"
			},
			sound_events_duration = {
				1.0678958892822,
				1.0678958892822,
				2.2196667194366,
				1.8813542127609,
				2.8519375324249,
				2.7655415534973,
				3.4181249141693,
				1.7340208292007,
				1.8232707977295,
				1.3774791955948
			}
		},
		pdr_gameplay_spots_bomb = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_spots_bomb_10",
				"pdr_gameplay_spots_bomb_11",
				"pdr_gameplay_spots_bomb_12",
				"pdr_gameplay_spots_bomb_13",
				"pdr_gameplay_spots_bomb_14",
				"pdr_gameplay_spots_bomb_15",
				"pdr_gameplay_spots_bomb_16",
				"pdr_gameplay_spots_bomb_17"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_spots_bomb_10",
				"pdr_gameplay_spots_bomb_11",
				"pdr_gameplay_spots_bomb_12",
				"pdr_gameplay_spots_bomb_13",
				"pdr_gameplay_spots_bomb_14",
				"pdr_gameplay_spots_bomb_15",
				"pdr_gameplay_spots_bomb_16",
				"pdr_gameplay_spots_bomb_17"
			},
			sound_events_duration = {
				1.5848749876022,
				2.0525624752045,
				2.7321875095367,
				2.8272082805634,
				2.6578333377838,
				2.1991250514984,
				1.8385208845139,
				2.5205416679382
			}
		},
		pdr_gameplay_spots_health = {
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_spots_health_01",
				"pdr_gameplay_spots_health_06",
				"pdr_gameplay_spots_health_07",
				"pdr_gameplay_spots_health_08",
				"pdr_gameplay_spots_health_09",
				"pdr_gameplay_spots_health_10",
				"pdr_gameplay_spots_health_11",
				"pdr_gameplay_spots_health_12",
				"pdr_gameplay_spots_health_13",
				"pdr_gameplay_spots_health_14",
				"pdr_gameplay_spots_health_15",
				"pdr_gameplay_spots_health_16",
				"pdr_gameplay_spots_health_17"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_spots_health_01",
				"pdr_gameplay_spots_health_06",
				"pdr_gameplay_spots_health_07",
				"pdr_gameplay_spots_health_08",
				"pdr_gameplay_spots_health_09",
				"pdr_gameplay_spots_health_10",
				"pdr_gameplay_spots_health_11",
				"pdr_gameplay_spots_health_12",
				"pdr_gameplay_spots_health_13",
				"pdr_gameplay_spots_health_14",
				"pdr_gameplay_spots_health_15",
				"pdr_gameplay_spots_health_16",
				"pdr_gameplay_spots_health_17"
			},
			sound_events_duration = {
				1.4754999876022,
				1.7034167051315,
				2.2538332939148,
				1.2027708292007,
				1.983479142189,
				3.0477292537689,
				1.6343333721161,
				1.5346666574478,
				1.8017499446869,
				1.8647916316986,
				1.8595416545868,
				2.2534167766571,
				2.651645898819
			}
		},
		pdr_gameplay_spots_potion = {
			randomize_indexes_n = 0,
			face_animations_n = 18,
			database = "dwarf_ranger_honduras",
			sound_events_n = 18,
			category = "seen_items",
			dialogue_animations_n = 18,
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_potion_01",
				"pdr_gameplay_spots_potion_02",
				"pdr_gameplay_spots_potion_03",
				"pdr_gameplay_spots_potion_04",
				"pdr_gameplay_spots_potion_05",
				"pdr_gameplay_spots_potion_06",
				"pdr_gameplay_spots_potion_07",
				"pdr_gameplay_spots_potion_08",
				"pdr_gameplay_spots_potion_09",
				"pdr_gameplay_spots_potion_10",
				"pdr_gameplay_spots_potion_11",
				"pdr_gameplay_spots_potion_12",
				"pdr_gameplay_spots_potion_13",
				"pdr_gameplay_spots_potion_14",
				"pdr_gameplay_spots_potion_15",
				"pdr_gameplay_spots_potion_16",
				"pdr_gameplay_spots_potion_17",
				"pdr_gameplay_spots_potion_18"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_spots_potion_01",
				"pdr_gameplay_spots_potion_02",
				"pdr_gameplay_spots_potion_03",
				"pdr_gameplay_spots_potion_04",
				"pdr_gameplay_spots_potion_05",
				"pdr_gameplay_spots_potion_06",
				"pdr_gameplay_spots_potion_07",
				"pdr_gameplay_spots_potion_08",
				"pdr_gameplay_spots_potion_09",
				"pdr_gameplay_spots_potion_10",
				"pdr_gameplay_spots_potion_11",
				"pdr_gameplay_spots_potion_12",
				"pdr_gameplay_spots_potion_13",
				"pdr_gameplay_spots_potion_14",
				"pdr_gameplay_spots_potion_15",
				"pdr_gameplay_spots_potion_16",
				"pdr_gameplay_spots_potion_17",
				"pdr_gameplay_spots_potion_18"
			},
			sound_events_duration = {
				1.9800208806992,
				2.2517499923706,
				1.0111875534058,
				1.3843958377838,
				2.8736250400543,
				1.5711874961853,
				1.9842708110809,
				1.3550208806992,
				1.3444166183472,
				2.795104265213,
				1.4787917137146,
				1.7689791917801,
				2.761125087738,
				1.5863958597183,
				1.1244583129883,
				1.7350624799728,
				1.7498542070389,
				4.4524998664856
			}
		},
		pdr_gameplay_standard_bearer_buff_active = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_standard_bearer_buff_active_01",
				"pdr_gameplay_standard_bearer_buff_active_02",
				"pdr_gameplay_standard_bearer_buff_active_03",
				"pdr_gameplay_standard_bearer_buff_active_04",
				"pdr_gameplay_standard_bearer_buff_active_05",
				"pdr_gameplay_standard_bearer_buff_active_06",
				"pdr_gameplay_standard_bearer_buff_active_07",
				"pdr_gameplay_standard_bearer_buff_active_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_standard_bearer_buff_active_01",
				"pdr_gameplay_standard_bearer_buff_active_02",
				"pdr_gameplay_standard_bearer_buff_active_03",
				"pdr_gameplay_standard_bearer_buff_active_04",
				"pdr_gameplay_standard_bearer_buff_active_05",
				"pdr_gameplay_standard_bearer_buff_active_06",
				"pdr_gameplay_standard_bearer_buff_active_07",
				"pdr_gameplay_standard_bearer_buff_active_08"
			},
			sound_events_duration = {
				2.204437494278,
				2.1200833320618,
				2.3000209331513,
				2.1988124847412,
				3.0086250305176,
				2.8905000686645,
				3.5203542709351,
				2.8286459445953
			}
		},
		pdr_gameplay_standard_bearer_buff_deactivated = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_standard_bearer_buff_deactivated_01",
				"pdr_gameplay_standard_bearer_buff_deactivated_02",
				"pdr_gameplay_standard_bearer_buff_deactivated_03",
				"pdr_gameplay_standard_bearer_buff_deactivated_04",
				"pdr_gameplay_standard_bearer_buff_deactivated_05",
				"pdr_gameplay_standard_bearer_buff_deactivated_06",
				"pdr_gameplay_standard_bearer_buff_deactivated_07",
				"pdr_gameplay_standard_bearer_buff_deactivated_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_standard_bearer_buff_deactivated_01",
				"pdr_gameplay_standard_bearer_buff_deactivated_02",
				"pdr_gameplay_standard_bearer_buff_deactivated_03",
				"pdr_gameplay_standard_bearer_buff_deactivated_04",
				"pdr_gameplay_standard_bearer_buff_deactivated_05",
				"pdr_gameplay_standard_bearer_buff_deactivated_06",
				"pdr_gameplay_standard_bearer_buff_deactivated_07",
				"pdr_gameplay_standard_bearer_buff_deactivated_08"
			},
			sound_events_duration = {
				2.3995416164398,
				2.3528957366943,
				4.2808332443237,
				2.3321666717529,
				2.6794166564941,
				2.5550208091736,
				1.9020208120346,
				2.9592707157135
			}
		},
		pdr_gameplay_standard_bearer_has_planted_standard = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_standard_bearer_has_planted_standard_01",
				"pdr_gameplay_standard_bearer_has_planted_standard_02",
				"pdr_gameplay_standard_bearer_has_planted_standard_03",
				"pdr_gameplay_standard_bearer_has_planted_standard_04",
				"pdr_gameplay_standard_bearer_has_planted_standard_05",
				"pdr_gameplay_standard_bearer_has_planted_standard_06",
				"pdr_gameplay_standard_bearer_has_planted_standard_07",
				"pdr_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_standard_bearer_has_planted_standard_01",
				"pdr_gameplay_standard_bearer_has_planted_standard_02",
				"pdr_gameplay_standard_bearer_has_planted_standard_03",
				"pdr_gameplay_standard_bearer_has_planted_standard_04",
				"pdr_gameplay_standard_bearer_has_planted_standard_05",
				"pdr_gameplay_standard_bearer_has_planted_standard_06",
				"pdr_gameplay_standard_bearer_has_planted_standard_07",
				"pdr_gameplay_standard_bearer_has_planted_standard_08"
			},
			sound_events_duration = {
				1.7657916545868,
				1.827645778656,
				1.9682500362396,
				2.1931874752045,
				2.5643541812897,
				1.9176458120346,
				1.6758333444595,
				2.9073958396912
			}
		},
		pdr_gameplay_standard_bearer_has_planted_standard_crater = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_standard_bearer_has_planted_standard_01",
				"pdr_gameplay_standard_bearer_has_planted_standard_02",
				"pdr_gameplay_standard_bearer_has_planted_standard_03",
				"pdr_gameplay_standard_bearer_has_planted_standard_04",
				"pdr_gameplay_standard_bearer_has_planted_standard_05",
				"pdr_gameplay_standard_bearer_has_planted_standard_06",
				"pdr_gameplay_standard_bearer_has_planted_standard_07",
				"pdr_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_standard_bearer_has_planted_standard_01",
				"pdr_gameplay_standard_bearer_has_planted_standard_02",
				"pdr_gameplay_standard_bearer_has_planted_standard_03",
				"pdr_gameplay_standard_bearer_has_planted_standard_04",
				"pdr_gameplay_standard_bearer_has_planted_standard_05",
				"pdr_gameplay_standard_bearer_has_planted_standard_06",
				"pdr_gameplay_standard_bearer_has_planted_standard_07",
				"pdr_gameplay_standard_bearer_has_planted_standard_08"
			},
			sound_events_duration = {
				1.7657916545868,
				1.827645778656,
				1.9682500362396,
				2.1931874752045,
				2.5643541812897,
				1.9176458120346,
				1.6758333444595,
				2.9073958396912
			}
		},
		pdr_gameplay_taking_heavy_damage = {
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "dwarf_ranger_honduras",
			sound_events_n = 13,
			category = "player_alerts",
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
				"face_pain",
				"face_pain",
				"face_pain",
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
				"pdr_gameplay_taking_heavy_damage_09",
				"pdr_gameplay_taking_heavy_damage_10",
				"pdr_gameplay_taking_heavy_damage_11",
				"pdr_gameplay_taking_heavy_damage_12",
				"pdr_gameplay_taking_heavy_damage_13",
				"pdr_gameplay_taking_heavy_damage_14",
				"pdr_gameplay_taking_heavy_damage_15",
				"pdr_gameplay_taking_heavy_damage_16",
				"pdr_gameplay_taking_heavy_damage_17",
				"pdr_gameplay_taking_heavy_damage_18",
				"pdr_gameplay_taking_heavy_damage_19",
				"pdr_gameplay_taking_heavy_damage_20",
				"pdr_gameplay_taking_heavy_damage_21"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_taking_heavy_damage_09",
				"pdr_gameplay_taking_heavy_damage_10",
				"pdr_gameplay_taking_heavy_damage_11",
				"pdr_gameplay_taking_heavy_damage_12",
				"pdr_gameplay_taking_heavy_damage_13",
				"pdr_gameplay_taking_heavy_damage_14",
				"pdr_gameplay_taking_heavy_damage_15",
				"pdr_gameplay_taking_heavy_damage_16",
				"pdr_gameplay_taking_heavy_damage_17",
				"pdr_gameplay_taking_heavy_damage_18",
				"pdr_gameplay_taking_heavy_damage_19",
				"pdr_gameplay_taking_heavy_damage_20",
				"pdr_gameplay_taking_heavy_damage_21"
			},
			sound_events_duration = {
				2.4023957252502,
				3.4316875934601,
				2.1414375305176,
				2.4370625019074,
				2.0383124351502,
				5.8552293777466,
				2.2678332328796,
				3.4957082271576,
				3.1333541870117,
				2.8144791126251,
				4.7867708206177,
				3.5399167537689,
				2.0071458816528
			}
		},
		pdr_gameplay_tension_no_enemies = {
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "dwarf_ranger_honduras",
			sound_events_n = 15,
			category = "casual_talk",
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
				"pdr_gameplay_tension_no_enemies_07",
				"pdr_gameplay_tension_no_enemies_08",
				"pdr_gameplay_tension_no_enemies_09",
				"pdr_gameplay_tension_no_enemies_10",
				"pdr_gameplay_tension_no_enemies_11",
				"pdr_gameplay_tension_no_enemies_12",
				"pdr_gameplay_tension_no_enemies_13",
				"pdr_gameplay_tension_no_enemies_14",
				"pdr_gameplay_tension_no_enemies_15",
				"pdr_gameplay_tension_no_enemies_17",
				"pdr_gameplay_tension_no_enemies_18",
				"pdr_gameplay_tension_no_enemies_19",
				"pdr_gameplay_tension_no_enemies_20",
				"pdr_gameplay_tension_no_enemies_21",
				"pdr_gameplay_tension_no_enemies_22"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_tension_no_enemies_07",
				"pdr_gameplay_tension_no_enemies_08",
				"pdr_gameplay_tension_no_enemies_09",
				"pdr_gameplay_tension_no_enemies_10",
				"pdr_gameplay_tension_no_enemies_11",
				"pdr_gameplay_tension_no_enemies_12",
				"pdr_gameplay_tension_no_enemies_13",
				"pdr_gameplay_tension_no_enemies_14",
				"pdr_gameplay_tension_no_enemies_15",
				"pdr_gameplay_tension_no_enemies_17",
				"pdr_gameplay_tension_no_enemies_18",
				"pdr_gameplay_tension_no_enemies_19",
				"pdr_gameplay_tension_no_enemies_20",
				"pdr_gameplay_tension_no_enemies_21",
				"pdr_gameplay_tension_no_enemies_22"
			},
			sound_events_duration = {
				2.1407916545868,
				2.4251248836517,
				1.3935208320618,
				1.1989375352859,
				1.4896874427795,
				1.3637499809265,
				1.606124997139,
				1.6308125257492,
				4.9673957824707,
				3.8936042785645,
				5.3106460571289,
				5.2926459312439,
				4.0723333358765,
				3.6564791202545,
				3.2876875400543
			}
		},
		pdr_gameplay_throwing_bomb = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_throwing_bomb_01",
				"pdr_gameplay_throwing_bomb_06",
				"pdr_gameplay_throwing_bomb_07",
				"pdr_gameplay_throwing_bomb_08",
				"pdr_gameplay_throwing_bomb_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_throwing_bomb_01",
				"pdr_gameplay_throwing_bomb_06",
				"pdr_gameplay_throwing_bomb_07",
				"pdr_gameplay_throwing_bomb_08",
				"pdr_gameplay_throwing_bomb_09"
			},
			sound_events_duration = {
				1.71875,
				3.9343333244324,
				1.522958278656,
				3.0660207271576,
				1.7718958854675
			}
		},
		pdr_gameplay_tips_wizard_plague = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_tips_wizard_plague_01",
				"pdr_gameplay_tips_wizard_plague_02",
				"pdr_gameplay_tips_wizard_plague_03",
				"pdr_gameplay_tips_wizard_plague_04",
				"pdr_gameplay_tips_wizard_plague_05",
				"pdr_gameplay_tips_wizard_plague_06",
				"pdr_gameplay_tips_wizard_plague_07",
				"pdr_gameplay_tips_wizard_plague_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_tips_wizard_plague_01",
				"pdr_gameplay_tips_wizard_plague_02",
				"pdr_gameplay_tips_wizard_plague_03",
				"pdr_gameplay_tips_wizard_plague_04",
				"pdr_gameplay_tips_wizard_plague_05",
				"pdr_gameplay_tips_wizard_plague_06",
				"pdr_gameplay_tips_wizard_plague_07",
				"pdr_gameplay_tips_wizard_plague_08"
			},
			sound_events_duration = {
				3.546041727066,
				3.2760624885559,
				3.0765416622162,
				2.9327292442322,
				4.4487290382385,
				3.858437538147,
				3.5709166526794,
				4.4137916564941
			}
		},
		pdr_gameplay_tips_wizard_wind = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_tips_wizard_wind_01",
				"pdr_gameplay_tips_wizard_wind_02",
				"pdr_gameplay_tips_wizard_wind_03",
				"pdr_gameplay_tips_wizard_wind_04",
				"pdr_gameplay_tips_wizard_wind_05",
				"pdr_gameplay_tips_wizard_wind_06",
				"pdr_gameplay_tips_wizard_wind_07",
				"pdr_gameplay_tips_wizard_wind_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_tips_wizard_wind_01",
				"pdr_gameplay_tips_wizard_wind_02",
				"pdr_gameplay_tips_wizard_wind_03",
				"pdr_gameplay_tips_wizard_wind_04",
				"pdr_gameplay_tips_wizard_wind_05",
				"pdr_gameplay_tips_wizard_wind_06",
				"pdr_gameplay_tips_wizard_wind_07",
				"pdr_gameplay_tips_wizard_wind_08"
			},
			sound_events_duration = {
				3.8068332672119,
				3.6478540897369,
				4.39608335495,
				2.9018957614899,
				3.1041042804718,
				2.9433541297913,
				3.1460833549499,
				4.7189998626709
			}
		},
		pdr_gameplay_using_potion = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_using_potion_01",
				"pdr_gameplay_using_potion_06",
				"pdr_gameplay_using_potion_07",
				"pdr_gameplay_using_potion_08",
				"pdr_gameplay_using_potion_09",
				"pdr_gameplay_using_potion_10",
				"pdr_gameplay_using_potion_11",
				"pdr_gameplay_using_potion_12",
				"pdr_gameplay_using_potion_13"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_using_potion_01",
				"pdr_gameplay_using_potion_06",
				"pdr_gameplay_using_potion_07",
				"pdr_gameplay_using_potion_08",
				"pdr_gameplay_using_potion_09",
				"pdr_gameplay_using_potion_10",
				"pdr_gameplay_using_potion_11",
				"pdr_gameplay_using_potion_12",
				"pdr_gameplay_using_potion_13"
			},
			sound_events_duration = {
				1.0951875448227,
				1.773020863533,
				1.7410207986832,
				3.021666765213,
				2.0722916126251,
				3.0368332862854,
				2.0759582519531,
				2.5571875572205,
				3.0571875572205
			}
		},
		pdr_gameplay_weapon_flair_defensive = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_activating_magic_weapon_defensive_01",
				"pdr_gameplay_activating_magic_weapon_defensive_02",
				"pdr_gameplay_activating_magic_weapon_defensive_03",
				"pdr_gameplay_activating_magic_weapon_defensive_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_activating_magic_weapon_defensive_01",
				"pdr_gameplay_activating_magic_weapon_defensive_02",
				"pdr_gameplay_activating_magic_weapon_defensive_03",
				"pdr_gameplay_activating_magic_weapon_defensive_05"
			},
			sound_events_duration = {
				3.6263332366943,
				2.5057499408722,
				3.3831040859222,
				4.2596874237061
			}
		},
		pdr_gameplay_weapon_flair_offensive = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"pdr_gameplay_activating_magic_weapon_offensive_01",
				"pdr_gameplay_activating_magic_weapon_offensive_03",
				"pdr_gameplay_activating_magic_weapon_offensive_04",
				"pdr_gameplay_activating_magic_weapon_offensive_05"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_activating_magic_weapon_offensive_01",
				"pdr_gameplay_activating_magic_weapon_offensive_03",
				"pdr_gameplay_activating_magic_weapon_offensive_04",
				"pdr_gameplay_activating_magic_weapon_offensive_05"
			},
			sound_events_duration = {
				2.7264165878296,
				2.9180624485016,
				3.3918957710266,
				4.4975209236145
			}
		},
		pdr_gameplay_witch_hunter_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_witch_hunter_being_helped_up_03",
				"pdr_gameplay_witch_hunter_being_helped_up_05",
				"pdr_gameplay_witch_hunter_being_helped_up_06",
				"pdr_gameplay_witch_hunter_being_helped_up_07",
				"pdr_gameplay_witch_hunter_being_helped_up_08",
				"pdr_gameplay_witch_hunter_being_helped_up_09",
				"pdr_gameplay_witch_hunter_being_helped_up_10",
				"pdr_gameplay_witch_hunter_being_helped_up_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_witch_hunter_being_helped_up_03",
				"pdr_gameplay_witch_hunter_being_helped_up_05",
				"pdr_gameplay_witch_hunter_being_helped_up_06",
				"pdr_gameplay_witch_hunter_being_helped_up_07",
				"pdr_gameplay_witch_hunter_being_helped_up_08",
				"pdr_gameplay_witch_hunter_being_helped_up_09",
				"pdr_gameplay_witch_hunter_being_helped_up_10",
				"pdr_gameplay_witch_hunter_being_helped_up_11"
			},
			sound_events_duration = {
				1.4635000228882,
				2.9000000953674,
				2.0566666126251,
				2.1768958568573,
				2.840541601181,
				1.9558750391007,
				2.4860832691193,
				2.4167082309723
			}
		},
		pdr_gameplay_witch_hunter_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_witch_hunter_dead_04",
				"pdr_gameplay_witch_hunter_dead_05",
				"pdr_gameplay_witch_hunter_dead_06",
				"pdr_gameplay_witch_hunter_dead_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_witch_hunter_dead_04",
				"pdr_gameplay_witch_hunter_dead_05",
				"pdr_gameplay_witch_hunter_dead_06",
				"pdr_gameplay_witch_hunter_dead_07"
			},
			sound_events_duration = {
				2.2298541069031,
				1.6683332920075,
				1.6719374656677,
				3.0865833759308
			}
		},
		pdr_gameplay_witch_hunter_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_witch_hunter_eaten_01",
				"pdr_witch_hunter_eaten_02",
				"pdr_witch_hunter_eaten_03",
				"pdr_witch_hunter_eaten_04",
				"pdr_witch_hunter_eaten_05",
				"pdr_witch_hunter_eaten_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_witch_hunter_eaten_01",
				"pdr_witch_hunter_eaten_02",
				"pdr_witch_hunter_eaten_03",
				"pdr_witch_hunter_eaten_04",
				"pdr_witch_hunter_eaten_05",
				"pdr_witch_hunter_eaten_06"
			},
			sound_events_duration = {
				6.511125087738,
				5.5654792785644,
				6.0040831565857,
				9.9987087249756,
				10.469041824341,
				4.9492707252502
			}
		},
		pdr_gameplay_witch_hunter_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_witch_hunter_grabbed_02",
				"pdr_gameplay_witch_hunter_grabbed_07",
				"pdr_gameplay_witch_hunter_grabbed_08",
				"pdr_gameplay_witch_hunter_grabbed_09",
				"pdr_gameplay_witch_hunter_grabbed_10",
				"pdr_gameplay_witch_hunter_grabbed_11",
				"pdr_gameplay_witch_hunter_grabbed_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_witch_hunter_grabbed_02",
				"pdr_gameplay_witch_hunter_grabbed_07",
				"pdr_gameplay_witch_hunter_grabbed_08",
				"pdr_gameplay_witch_hunter_grabbed_09",
				"pdr_gameplay_witch_hunter_grabbed_10",
				"pdr_gameplay_witch_hunter_grabbed_11",
				"pdr_gameplay_witch_hunter_grabbed_12"
			},
			sound_events_duration = {
				3.9856667518616,
				3.5567290782928,
				2.7196249961853,
				3.2752709388733,
				3.2390415668488,
				2.930624961853,
				6.3812294006348
			}
		},
		pdr_gameplay_witch_hunter_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_witch_hunter_low_on_health_05",
				"pdr_gameplay_witch_hunter_low_on_health_06",
				"pdr_gameplay_witch_hunter_low_on_health_07",
				"pdr_gameplay_witch_hunter_low_on_health_08",
				"pdr_gameplay_witch_hunter_low_on_health_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_witch_hunter_low_on_health_05",
				"pdr_gameplay_witch_hunter_low_on_health_06",
				"pdr_gameplay_witch_hunter_low_on_health_07",
				"pdr_gameplay_witch_hunter_low_on_health_08",
				"pdr_gameplay_witch_hunter_low_on_health_09"
			},
			sound_events_duration = {
				1.8022916316986,
				1.8020207881927,
				2.5752291679382,
				2.8830416202545,
				2.0553958415985
			}
		},
		pdr_gameplay_witch_hunter_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_Witch_Hunter_on_a_frenzy_04",
				"pdr_gameplay_witch_hunter_on_a_frenzy_05",
				"pdr_gameplay_witch_hunter_on_a_frenzy_06",
				"pdr_gameplay_witch_hunter_on_a_frenzy_07",
				"pdr_gameplay_witch_hunter_on_a_frenzy_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_Witch_Hunter_on_a_frenzy_04",
				"pdr_gameplay_witch_hunter_on_a_frenzy_05",
				"pdr_gameplay_witch_hunter_on_a_frenzy_06",
				"pdr_gameplay_witch_hunter_on_a_frenzy_07",
				"pdr_gameplay_witch_hunter_on_a_frenzy_09"
			},
			sound_events_duration = {
				2.548749923706,
				3.2772707939148,
				3.506041765213,
				3.6243751049042,
				5.0673956871033
			}
		},
		pdr_gameplay_wood_elf_being_helped_up = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_wood_elf_being_helped_up_05",
				"pdr_gameplay_wood_elf_being_helped_up_06",
				"pdr_gameplay_wood_elf_being_helped_up_07",
				"pdr_gameplay_wood_elf_being_helped_up_08",
				"pdr_gameplay_wood_elf_being_helped_up_09",
				"pdr_gameplay_wood_elf_being_helped_up_10",
				"pdr_gameplay_wood_elf_being_helped_up_11",
				"pdr_gameplay_wood_elf_being_helped_up_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_wood_elf_being_helped_up_05",
				"pdr_gameplay_wood_elf_being_helped_up_06",
				"pdr_gameplay_wood_elf_being_helped_up_07",
				"pdr_gameplay_wood_elf_being_helped_up_08",
				"pdr_gameplay_wood_elf_being_helped_up_09",
				"pdr_gameplay_wood_elf_being_helped_up_10",
				"pdr_gameplay_wood_elf_being_helped_up_11",
				"pdr_gameplay_wood_elf_being_helped_up_12"
			},
			sound_events_duration = {
				2.5236876010895,
				2.6273958683014,
				3.408499956131,
				3.1036667823791,
				1.4115833044052,
				3.3512709140778,
				2.4296250343323,
				1.7086458206177
			}
		},
		pdr_gameplay_wood_elf_dead = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_wood_elf_dead_05",
				"pdr_gameplay_wood_elf_dead_06",
				"pdr_gameplay_wood_elf_dead_07",
				"pdr_gameplay_wood_elf_dead_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_wood_elf_dead_05",
				"pdr_gameplay_wood_elf_dead_06",
				"pdr_gameplay_wood_elf_dead_07",
				"pdr_gameplay_wood_elf_dead_08"
			},
			sound_events_duration = {
				2.5761666297913,
				2.0738959312439,
				2.9033541679382,
				1.8751666545868
			}
		},
		pdr_gameplay_wood_elf_eaten = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_wood_elf_eaten_01",
				"pdr_wood_elf_eaten_02",
				"pdr_wood_elf_eaten_03",
				"pdr_wood_elf_eaten_04",
				"pdr_wood_elf_eaten_05",
				"pdr_wood_elf_eaten_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_wood_elf_eaten_01",
				"pdr_wood_elf_eaten_02",
				"pdr_wood_elf_eaten_03",
				"pdr_wood_elf_eaten_04",
				"pdr_wood_elf_eaten_05",
				"pdr_wood_elf_eaten_06"
			},
			sound_events_duration = {
				7.0325627326965,
				7.3592500686645,
				9.8166666030884,
				6.0652289390564,
				5.2724375724792,
				7.6364164352417
			}
		},
		pdr_gameplay_wood_elf_grabbed = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_wood_elf_grabbed_06",
				"pdr_gameplay_wood_elf_grabbed_07",
				"pdr_gameplay_wood_elf_grabbed_08",
				"pdr_gameplay_wood_elf_grabbed_09",
				"pdr_gameplay_wood_elf_grabbed_10",
				"pdr_gameplay_wood_elf_grabbed_11"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_wood_elf_grabbed_06",
				"pdr_gameplay_wood_elf_grabbed_07",
				"pdr_gameplay_wood_elf_grabbed_08",
				"pdr_gameplay_wood_elf_grabbed_09",
				"pdr_gameplay_wood_elf_grabbed_10",
				"pdr_gameplay_wood_elf_grabbed_11"
			},
			sound_events_duration = {
				2.4825208187103,
				2.1018958091736,
				2.1692707538605,
				2.6262500286102,
				2.5599999427795,
				2.0181667804718
			}
		},
		pdr_gameplay_wood_elf_low_on_health = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_wood_elf_low_on_health_05",
				"pdr_gameplay_wood_elf_low_on_health_06",
				"pdr_gameplay_wood_elf_low_on_health_07",
				"pdr_gameplay_wood_elf_low_on_health_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_wood_elf_low_on_health_05",
				"pdr_gameplay_wood_elf_low_on_health_06",
				"pdr_gameplay_wood_elf_low_on_health_07",
				"pdr_gameplay_wood_elf_low_on_health_08"
			},
			sound_events_duration = {
				2.9769375324249,
				2.0170209407806,
				2.4401249885559,
				1.8315207958221
			}
		},
		pdr_gameplay_wood_elf_on_a_frenzy = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"pdr_gameplay_wood_elf_on_a_frenzy_05",
				"pdr_gameplay_wood_elf_on_a_frenzy_06",
				"pdr_gameplay_wood_elf_on_a_frenzy_07",
				"pdr_gameplay_wood_elf_on_a_frenzy_08",
				"pdr_gameplay_wood_elf_on_a_frenzy_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_gameplay_wood_elf_on_a_frenzy_05",
				"pdr_gameplay_wood_elf_on_a_frenzy_06",
				"pdr_gameplay_wood_elf_on_a_frenzy_07",
				"pdr_gameplay_wood_elf_on_a_frenzy_08",
				"pdr_gameplay_wood_elf_on_a_frenzy_09"
			},
			sound_events_duration = {
				5.9427709579468,
				3.8943541049957,
				3.1847500801086,
				5.3530416488647,
				6.0163125991821
			}
		},
		pdr_last_hero_standing = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_last_hero_standing_01",
				"pdr_last_hero_standing_02",
				"pdr_last_hero_standing_03",
				"pdr_last_hero_standing_04",
				"pdr_last_hero_standing_05",
				"pdr_last_hero_standing_06",
				"pdr_last_hero_standing_07",
				"pdr_last_hero_standing_08"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_last_hero_standing_01",
				"pdr_last_hero_standing_02",
				"pdr_last_hero_standing_03",
				"pdr_last_hero_standing_04",
				"pdr_last_hero_standing_05",
				"pdr_last_hero_standing_06",
				"pdr_last_hero_standing_07",
				"pdr_last_hero_standing_08"
			},
			sound_events_duration = {
				3.3945000171661,
				3.2960000038147,
				5.0542707443237,
				4.3372082710266,
				5.5890207290649,
				4.4446458816528,
				3.2030208110809,
				5.0573959350586
			}
		},
		pdr_objective_achieved_all_but_one_goal = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_achieved_all_but_one_goal_01",
				"pdr_objective_achieved_all_but_one_goal_02",
				"pdr_objective_achieved_all_but_one_goal_03",
				"pdr_objective_achieved_all_but_one_goal_05",
				"pdr_objective_achieved_all_but_one_goal_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_achieved_all_but_one_goal_01",
				"pdr_objective_achieved_all_but_one_goal_02",
				"pdr_objective_achieved_all_but_one_goal_03",
				"pdr_objective_achieved_all_but_one_goal_05",
				"pdr_objective_achieved_all_but_one_goal_06"
			},
			sound_events_duration = {
				1.3669166564941,
				1.1148958206177,
				1.9802500009537,
				2.5244374275208,
				1.8137291669846
			}
		},
		pdr_objective_correct_path_across = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_across_01",
				"pdr_objective_correct_path_across_02",
				"pdr_objective_correct_path_across_03",
				"pdr_objective_correct_path_across_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_across_01",
				"pdr_objective_correct_path_across_02",
				"pdr_objective_correct_path_across_03",
				"pdr_objective_correct_path_across_04"
			},
			sound_events_duration = {
				1.4765416383743,
				1.2958542108536,
				2.0789165496826,
				2.0743958950043
			}
		},
		pdr_objective_correct_path_alley = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_alley_01",
				"pdr_objective_correct_path_alley_02",
				"pdr_objective_correct_path_alley_03",
				"pdr_objective_correct_path_alley_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_alley_01",
				"pdr_objective_correct_path_alley_02",
				"pdr_objective_correct_path_alley_03",
				"pdr_objective_correct_path_alley_04"
			},
			sound_events_duration = {
				1.3270416259766,
				1.3230208158493,
				1.6395416259766,
				3.2606041431427
			}
		},
		pdr_objective_correct_path_bridge = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_bridge_01",
				"pdr_objective_correct_path_bridge_14",
				"pdr_objective_correct_path_bridge_15",
				"pdr_objective_correct_path_bridge_16"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_bridge_01",
				"pdr_objective_correct_path_bridge_14",
				"pdr_objective_correct_path_bridge_15",
				"pdr_objective_correct_path_bridge_16"
			},
			sound_events_duration = {
				1.9352707862854,
				1.7041666507721,
				2.2467083930969,
				1.6233541965485
			}
		},
		pdr_objective_correct_path_door = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_door_03",
				"pdr_objective_correct_path_door_05",
				"pdr_objective_correct_path_door_06",
				"pdr_objective_correct_path_door_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_door_03",
				"pdr_objective_correct_path_door_05",
				"pdr_objective_correct_path_door_06",
				"pdr_objective_correct_path_door_07"
			},
			sound_events_duration = {
				1.7145832777023,
				1.8321249485016,
				1.4593125581741,
				1.1121875047684
			}
		},
		pdr_objective_correct_path_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_down_01",
				"pdr_objective_correct_path_down_04",
				"pdr_objective_correct_path_down_05",
				"pdr_objective_correct_path_down_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_down_01",
				"pdr_objective_correct_path_down_04",
				"pdr_objective_correct_path_down_05",
				"pdr_objective_correct_path_down_06"
			},
			sound_events_duration = {
				1.0530625581741,
				1.5386250019074,
				1.6673749685288,
				1.5572916269302
			}
		},
		pdr_objective_correct_path_ladder_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_ladder_down_01",
				"pdr_objective_correct_path_ladder_down_02",
				"pdr_objective_correct_path_ladder_down_03",
				"pdr_objective_correct_path_ladder_down_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_ladder_down_01",
				"pdr_objective_correct_path_ladder_down_02",
				"pdr_objective_correct_path_ladder_down_03",
				"pdr_objective_correct_path_ladder_down_04"
			},
			sound_events_duration = {
				1.1935625076294,
				1.5308958292007,
				1.3673332929611,
				1.1497083902359
			}
		},
		pdr_objective_correct_path_ladder_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_ladder_up_01",
				"pdr_objective_correct_path_ladder_up_02",
				"pdr_objective_correct_path_ladder_up_03",
				"pdr_objective_correct_path_ladder_up_04"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_ladder_up_01",
				"pdr_objective_correct_path_ladder_up_02",
				"pdr_objective_correct_path_ladder_up_03",
				"pdr_objective_correct_path_ladder_up_04"
			},
			sound_events_duration = {
				1.392458319664,
				1.9244166612625,
				1.4993333816528,
				0.95987498760223
			}
		},
		pdr_objective_correct_path_stairs_down = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_stairs_down_03",
				"pdr_objective_correct_path_stairs_down_05",
				"pdr_objective_correct_path_stairs_down_06",
				"pdr_objective_correct_path_stairs_down_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_stairs_down_03",
				"pdr_objective_correct_path_stairs_down_05",
				"pdr_objective_correct_path_stairs_down_06",
				"pdr_objective_correct_path_stairs_down_07"
			},
			sound_events_duration = {
				1.6791458129883,
				2.0020000934601,
				2.0874373912811,
				1.348416686058
			}
		},
		pdr_objective_correct_path_stairs_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_stairs_up_01",
				"pdr_objective_correct_path_stairs_up_02",
				"pdr_objective_correct_path_stairs_up_05",
				"pdr_objective_correct_path_stairs_up_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_stairs_up_01",
				"pdr_objective_correct_path_stairs_up_02",
				"pdr_objective_correct_path_stairs_up_05",
				"pdr_objective_correct_path_stairs_up_06"
			},
			sound_events_duration = {
				1.4804791212082,
				0.89908331632614,
				1.1312291622162,
				0.89908331632614
			}
		},
		pdr_objective_correct_path_street = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_street_01",
				"pdr_objective_correct_path_street_05",
				"pdr_objective_correct_path_street_06",
				"pdr_objective_correct_path_street_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_street_01",
				"pdr_objective_correct_path_street_05",
				"pdr_objective_correct_path_street_06",
				"pdr_objective_correct_path_street_07"
			},
			sound_events_duration = {
				1.8472708463669,
				1.4906666278839,
				2.2808749675751,
				1.38381254673
			}
		},
		pdr_objective_correct_path_this_way = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_this_way_01",
				"pdr_objective_correct_path_this_way_02",
				"pdr_objective_correct_path_this_way_05",
				"pdr_objective_correct_path_this_way_06",
				"pdr_objective_correct_path_this_way_07",
				"pdr_objective_correct_path_this_way_08",
				"pdr_objective_correct_path_this_way_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_this_way_01",
				"pdr_objective_correct_path_this_way_02",
				"pdr_objective_correct_path_this_way_05",
				"pdr_objective_correct_path_this_way_06",
				"pdr_objective_correct_path_this_way_07",
				"pdr_objective_correct_path_this_way_08",
				"pdr_objective_correct_path_this_way_09"
			},
			sound_events_duration = {
				0.92345833778381,
				1.0986875295639,
				1.1679791212082,
				0.86835414171219,
				1.9537708759308,
				3.3069167137146,
				1.829062461853
			}
		},
		pdr_objective_correct_path_up = {
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_correct_path_up_03",
				"pdr_objective_correct_path_up_04",
				"pdr_objective_correct_path_up_05",
				"pdr_objective_correct_path_up_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_correct_path_up_03",
				"pdr_objective_correct_path_up_04",
				"pdr_objective_correct_path_up_05",
				"pdr_objective_correct_path_up_06"
			},
			sound_events_duration = {
				1.6319583654404,
				0.96081250905991,
				0.96756249666214,
				1.0434792041779
			}
		},
		pdr_objective_dropping_grimoire = {
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_dropping_grimoire_01",
				"pdr_objective_dropping_grimoire_02",
				"pdr_objective_dropping_grimoire_03",
				"pdr_objective_dropping_grimoire_04",
				"pdr_objective_dropping_grimoire_05",
				"pdr_objective_dropping_grimoire_06",
				"pdr_objective_dropping_grimoire_07",
				"pdr_objective_dropping_grimoire_08",
				"pdr_objective_dropping_grimoire_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_dropping_grimoire_01",
				"pdr_objective_dropping_grimoire_02",
				"pdr_objective_dropping_grimoire_03",
				"pdr_objective_dropping_grimoire_04",
				"pdr_objective_dropping_grimoire_05",
				"pdr_objective_dropping_grimoire_06",
				"pdr_objective_dropping_grimoire_07",
				"pdr_objective_dropping_grimoire_08",
				"pdr_objective_dropping_grimoire_09"
			},
			sound_events_duration = {
				3.0792291164398,
				3.0447499752045,
				3.7088749408722,
				3.5489583015442,
				1.9136250019074,
				2.9593124389648,
				3.2139582633972,
				1.5361249446869,
				2.2713332176209
			}
		},
		pdr_objective_goal_achieved_escape = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_goal_achieved_escape_01",
				"pdr_objective_goal_achieved_escape_02",
				"pdr_objective_goal_achieved_escape_03",
				"pdr_objective_goal_achieved_escape_05",
				"pdr_objective_goal_achieved_escape_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_goal_achieved_escape_01",
				"pdr_objective_goal_achieved_escape_02",
				"pdr_objective_goal_achieved_escape_03",
				"pdr_objective_goal_achieved_escape_05",
				"pdr_objective_goal_achieved_escape_06"
			},
			sound_events_duration = {
				1.327708363533,
				0.64381247758865,
				1.0225833654404,
				2.028041601181,
				1.5805208683014
			}
		},
		pdr_objective_goal_achieved_more_left = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_goal_achieved_more_left_01",
				"pdr_objective_goal_achieved_more_left_04",
				"pdr_objective_goal_achieved_more_left_09",
				"pdr_objective_goal_achieved_more_left_10",
				"pdr_objective_goal_achieved_more_left_11",
				"pdr_objective_goal_achieved_more_left_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_goal_achieved_more_left_01",
				"pdr_objective_goal_achieved_more_left_04",
				"pdr_objective_goal_achieved_more_left_09",
				"pdr_objective_goal_achieved_more_left_10",
				"pdr_objective_goal_achieved_more_left_11",
				"pdr_objective_goal_achieved_more_left_12"
			},
			sound_events_duration = {
				1.7381666898727,
				2.0625834465027,
				2.279479265213,
				1.4163541793823,
				1.7153749465942,
				2.5072500705719
			}
		},
		pdr_objective_interacting_with_objective = {
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_interacting_with_objective_02",
				"pdr_objective_interacting_with_objective_04",
				"pdr_objective_interacting_with_objective_05",
				"pdr_objective_interacting_with_objective_06",
				"pdr_objective_interacting_with_objective_07"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_interacting_with_objective_02",
				"pdr_objective_interacting_with_objective_04",
				"pdr_objective_interacting_with_objective_05",
				"pdr_objective_interacting_with_objective_06",
				"pdr_objective_interacting_with_objective_07"
			},
			sound_events_duration = {
				1.0929374694824,
				1.0929374694824,
				1.3843749761581,
				1.4110416173935,
				1.5655624866486
			}
		},
		pdr_objective_nearing_objective_deadline = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_nearing_objective_deadline_04",
				"pdr_objective_nearing_objective_deadline_05",
				"pdr_objective_nearing_objective_deadline_06",
				"pdr_objective_nearing_objective_deadline_07",
				"pdr_objective_nearing_objective_deadline_08",
				"pdr_objective_nearing_objective_deadline_09"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_nearing_objective_deadline_04",
				"pdr_objective_nearing_objective_deadline_05",
				"pdr_objective_nearing_objective_deadline_06",
				"pdr_objective_nearing_objective_deadline_07",
				"pdr_objective_nearing_objective_deadline_08",
				"pdr_objective_nearing_objective_deadline_09"
			},
			sound_events_duration = {
				1.7405625581741,
				1.4401041269302,
				1.5253541469574,
				1.8650000095367,
				1.0332916975021,
				1.5918958187103
			}
		},
		pdr_objective_picking_up_grimoire = {
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "dwarf_ranger_honduras",
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
				"pdr_objective_picking_up_grimoire_05",
				"pdr_objective_picking_up_grimoire_06",
				"pdr_objective_picking_up_grimoire_07",
				"pdr_objective_picking_up_grimoire_08",
				"pdr_objective_picking_up_grimoire_09",
				"pdr_objective_picking_up_grimoire_10",
				"pdr_objective_picking_up_grimoire_11",
				"pdr_objective_picking_up_grimoire_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_objective_picking_up_grimoire_05",
				"pdr_objective_picking_up_grimoire_06",
				"pdr_objective_picking_up_grimoire_07",
				"pdr_objective_picking_up_grimoire_08",
				"pdr_objective_picking_up_grimoire_09",
				"pdr_objective_picking_up_grimoire_10",
				"pdr_objective_picking_up_grimoire_11",
				"pdr_objective_picking_up_grimoire_12"
			},
			sound_events_duration = {
				2.967791557312,
				3.1603333950043,
				3.5516042709351,
				3.5516042709351,
				2.9487292766571,
				2.4619584083557,
				2.9000833034515,
				2.0781042575836
			}
		},
		pdr_special_ability_ironbreaker = {
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "dwarf_ranger_honduras",
			sound_events_n = 7,
			category = "activate_ability",
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pdr_activate_ability_ironbreaker_12",
				"pdr_activate_ability_ironbreaker_13",
				"pdr_activate_ability_ironbreaker_15",
				"pdr_activate_ability_ironbreaker_16",
				"pdr_activate_ability_ironbreaker_17",
				"pdr_activate_ability_ironbreaker_01",
				"pdr_activate_ability_ironbreaker_23"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_activate_ability_ironbreaker_12",
				"pdr_activate_ability_ironbreaker_13",
				"pdr_activate_ability_ironbreaker_15",
				"pdr_activate_ability_ironbreaker_16",
				"pdr_activate_ability_ironbreaker_17",
				"pdr_activate_ability_ironbreaker_01",
				"pdr_activate_ability_ironbreaker_23"
			},
			sound_events_duration = {
				1.4966630935669,
				1.3235077857971,
				1.4371507167816,
				1.0002807378769,
				1.3236976861954,
				1.0672279596329,
				2.1067707538605
			}
		},
		pdr_special_ability_ironbreaker_taunt = {
			randomize_indexes_n = 0,
			face_animations_n = 21,
			database = "dwarf_ranger_honduras",
			sound_events_n = 21,
			category = "activate_ability",
			dialogue_animations_n = 21,
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
				"face_happy"
			},
			localization_strings = {
				"pdr_activate_ability_ironbreaker_02",
				"pdr_activate_ability_ironbreaker_03",
				"pdr_activate_ability_ironbreaker_04",
				"pdr_activate_ability_ironbreaker_05",
				"pdr_activate_ability_ironbreaker_06",
				"pdr_activate_ability_ironbreaker_07",
				"pdr_activate_ability_ironbreaker_08",
				"pdr_activate_ability_ironbreaker_09",
				"pdr_activate_ability_ironbreaker_10",
				"pdr_activate_ability_ironbreaker_11",
				"pdr_activate_ability_ironbreaker_18",
				"pdr_activate_ability_ironbreaker_19",
				"pdr_activate_ability_ironbreaker_20",
				"pdr_activate_ability_ironbreaker_21",
				"pdr_activate_ability_ironbreaker_22",
				"pdr_activate_ability_ironbreaker_24",
				"pdr_activate_ability_ironbreaker_25",
				"pdr_activate_ability_ironbreaker_26",
				"pdr_activate_ability_ironbreaker_27",
				"pdr_activate_ability_ironbreaker_28",
				"pdr_activate_ability_ironbreaker_29"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_activate_ability_ironbreaker_02",
				"pdr_activate_ability_ironbreaker_03",
				"pdr_activate_ability_ironbreaker_04",
				"pdr_activate_ability_ironbreaker_05",
				"pdr_activate_ability_ironbreaker_06",
				"pdr_activate_ability_ironbreaker_07",
				"pdr_activate_ability_ironbreaker_08",
				"pdr_activate_ability_ironbreaker_09",
				"pdr_activate_ability_ironbreaker_10",
				"pdr_activate_ability_ironbreaker_11",
				"pdr_activate_ability_ironbreaker_18",
				"pdr_activate_ability_ironbreaker_19",
				"pdr_activate_ability_ironbreaker_20",
				"pdr_activate_ability_ironbreaker_21",
				"pdr_activate_ability_ironbreaker_22",
				"pdr_activate_ability_ironbreaker_24",
				"pdr_activate_ability_ironbreaker_25",
				"pdr_activate_ability_ironbreaker_26",
				"pdr_activate_ability_ironbreaker_27",
				"pdr_activate_ability_ironbreaker_28",
				"pdr_activate_ability_ironbreaker_29"
			},
			sound_events_duration = {
				4.0385723114014,
				2.7845916748047,
				2.2786667346954,
				1.9462790489197,
				2.9013516902924,
				3.0104010105133,
				2.1151297092438,
				1.6795819997788,
				3.760205745697,
				3.240611076355,
				3.3439178466797,
				3.2731964588165,
				4.3211245536804,
				1.6132113933563,
				2.3189792633057,
				2.6872084140778,
				2.977979183197,
				4.040979385376,
				3.7741041183472,
				1.7441041469574,
				2.811541557312
			}
		},
		pdr_special_ability_slayer = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "dwarf_ranger_honduras",
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
				"pdr_special_ability_slayer_01",
				"pdr_special_ability_slayer_02",
				"pdr_special_ability_slayer_03",
				"pdr_special_ability_slayer_04",
				"pdr_activate_ability_slayer_05",
				"pdr_activate_ability_slayer_06",
				"pdr_activate_ability_slayer_07",
				"pdr_activate_ability_slayer_08",
				"pdr_activate_ability_slayer_09",
				"pdr_activate_ability_slayer_10",
				"pdr_activate_ability_slayer_11",
				"pdr_activate_ability_slayer_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_special_ability_slayer_01",
				"pdr_special_ability_slayer_02",
				"pdr_special_ability_slayer_03",
				"pdr_special_ability_slayer_04",
				"pdr_activate_ability_slayer_05",
				"pdr_activate_ability_slayer_06",
				"pdr_activate_ability_slayer_07",
				"pdr_activate_ability_slayer_08",
				"pdr_activate_ability_slayer_09",
				"pdr_activate_ability_slayer_10",
				"pdr_activate_ability_slayer_11",
				"pdr_activate_ability_slayer_12"
			},
			sound_events_duration = {
				3.6804165840149,
				3.6136250495911,
				3.9031875133514,
				3.6757917404175,
				1.3622708320618,
				1.3668124675751,
				2.4220623970032,
				2.7736041545868,
				2.5764582157135,
				2.0619583129883,
				3.1800625324249,
				1.8432083129883
			}
		},
		pdr_spotting_ferry_lady = {
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "dwarf_ranger_honduras",
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
				"pdr_spotting_ferry_lady_01",
				"pdr_spotting_ferry_lady_02",
				"pdr_spotting_ferry_lady_03",
				"pdr_spotting_ferry_lady_04",
				"pdr_spotting_ferry_lady_05",
				"pdr_spotting_ferry_lady_06"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_spotting_ferry_lady_01",
				"pdr_spotting_ferry_lady_02",
				"pdr_spotting_ferry_lady_03",
				"pdr_spotting_ferry_lady_04",
				"pdr_spotting_ferry_lady_05",
				"pdr_spotting_ferry_lady_06"
			},
			sound_events_duration = {
				0.7890625,
				2.7792708873749,
				2.9532709121704,
				1.3041042089462,
				2.6035833358765,
				2.3503749370575
			}
		},
		pdr_targeted_by_ratling = {
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "dwarf_ranger_honduras",
			sound_events_n = 12,
			category = "player_feedback",
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
				"pdr_targeted_by_ratling_01",
				"pdr_targeted_by_ratling_02",
				"pdr_targeted_by_ratling_03",
				"pdr_targeted_by_ratling_04",
				"pdr_targeted_by_ratling_05",
				"pdr_targeted_by_ratling_06",
				"pdr_targeted_by_ratling_07",
				"pdr_targeted_by_ratling_08",
				"pdr_targeted_by_ratling_09",
				"pdr_targeted_by_ratling_10",
				"pdr_targeted_by_ratling_11",
				"pdr_targeted_by_ratling_12"
			},
			randomize_indexes = {},
			sound_events = {
				"pdr_targeted_by_ratling_01",
				"pdr_targeted_by_ratling_02",
				"pdr_targeted_by_ratling_03",
				"pdr_targeted_by_ratling_04",
				"pdr_targeted_by_ratling_05",
				"pdr_targeted_by_ratling_06",
				"pdr_targeted_by_ratling_07",
				"pdr_targeted_by_ratling_08",
				"pdr_targeted_by_ratling_09",
				"pdr_targeted_by_ratling_10",
				"pdr_targeted_by_ratling_11",
				"pdr_targeted_by_ratling_12"
			},
			sound_events_duration = {
				2.7404375076294,
				4.4371252059936,
				4.3345417976379,
				1.9634582996368,
				2.280416727066,
				1.6878957748413,
				1.9884791374207,
				1.9483541250229,
				1.4243124723434,
				2.7445209026337,
				1.8404166698456,
				3.7476875782013
			}
		}
	})
end
