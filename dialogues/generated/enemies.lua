return function ()
	define_rule({
		name = "ecr_gameplay_startled",
		response = "ecr_gameplay_startled",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"startled"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"time_since_clan_rat_startled",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_clan_rat_startled",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_running_towards_players",
		response = "ecr_gameplay_running_towards_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				6
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_running_towards_players_alone",
		response = "ecr_gameplay_running_towards_players_alone",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				6
			},
			{
				"faction_memory",
				"last_cr_running",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_player_knocked_down",
		response = "ecr_gameplay_player_knocked_down",
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
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_witch_hunter_knocked_down",
		response = "ecr_gameplay_witch_hunter_knocked_down",
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
				"skaven_clan_rat"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_bright_wizard_knocked_down",
		response = "ecr_gameplay_bright_wizard_knocked_down",
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
				"skaven_clan_rat"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_dwarf_ranger_knocked_down",
		response = "ecr_gameplay_dwarf_ranger_knocked_down",
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
				"skaven_clan_rat"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_wood_elf_knocked_down",
		response = "ecr_gameplay_wood_elf_knocked_down",
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
				"skaven_clan_rat"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_empire_soldier_knocked_down",
		response = "ecr_gameplay_empire_soldier_knocked_down",
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
				"skaven_clan_rat"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_striking_a_player",
		response = "ecr_gameplay_striking_a_player",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shouting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_cr_said_hit",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_said_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_killing_a_player",
		response = "ecr_gameplay_killing_a_player",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"killing_player"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_cr_killed_player",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_killed_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_fleeing",
		response = "ecr_gameplay_fleeing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"fleeing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_cr_killed_player",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_killed_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_running_in_horde",
		response = "ecr_gameplay_running_in_horde",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				10
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_slave"
			},
			{
				"query_context",
				"num_units",
				OP.GT,
				3
			},
			{
				"faction_memory",
				"last_cr_running",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_seeing_bomb_thrown",
		response = "ecr_gameplay_seeing_bomb_thrown",
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
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_saw_pwg_projectile",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_pwg_projectile",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_seeing_weapon_special_activated",
		response = "ecr_gameplay_seeing_weapon_special_activated",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"special_attack"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_saw_special_attack",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_saw_special_attack",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_attacking_witch_hunter_backstab",
		response = "ecr_gameplay_attacking_witch_hunter_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_attacking_bright_wizard_backstab",
		response = "ecr_gameplay_attacking_bright_wizard_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_attacking_empire_soldier_backstab",
		response = "ecr_gameplay_attacking_empire_soldier_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_attacking_dwarf_ranger_backstab",
		response = "ecr_gameplay_attacking_dwarf_ranger_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_gameplay_attacking_wood_elf_backstab",
		response = "ecr_gameplay_attacking_wood_elf_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_clan_rat"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_casual_mutterings",
		response = "epwg_gameplay_casual_mutterings",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemies_distant"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"num_units",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_pwg_casual_mutterings",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_pwg_casual_mutterings",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_throwing_globe",
		response = "epwg_gameplay_throwing_globe",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_attack"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"user_memory",
				"last_threw_globe",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"user_memory",
				"last_threw_globe",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_hitting_a_player",
		response = "epwg_gameplay_hitting_a_player",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwg_projectile_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"num_units",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_pwg_hitting_a_player",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_pwg_hitting_a_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_hitting_multiple_players",
		response = "epwg_gameplay_hitting_multiple_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwg_projectile_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"num_units",
				OP.GT,
				1
			},
			{
				"faction_memory",
				"last_pwg_hitting_a_player",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_pwg_hitting_a_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_hitting_only_skaven",
		response = "epwg_gameplay_hitting_only_skaven",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pwg_projectile_hit"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"num_units",
				OP.LT,
				1
			},
			{
				"faction_memory",
				"last_pwg_hitting_a_player",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_pwg_hitting_a_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_killing_a_player",
		response = "epwg_gameplay_killing_a_player",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_killed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"UNKNOWN"
			},
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_killing_the_witch_hunter",
		response = "epwg_gameplay_killing_the_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_killed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_killing_the_bright_wizard",
		response = "epwg_gameplay_killing_the_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_killed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_killing_the_dwarf_ranger",
		response = "epwg_gameplay_killing_the_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_killed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_killing_the_wood_elf",
		response = "epwg_gameplay_killing_the_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_killed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_killing_the_empire_soldier",
		response = "epwg_gameplay_killing_the_empire_soldier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_killed"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"killed_type",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_last_killed_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_clanrat_in_the_way",
		response = "epwg_gameplay_clanrat_in_the_way",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_clat_rat"
			},
			{
				"query_context",
				"distance",
				OP.LT,
				2
			},
			{
				"faction_memory",
				"pwg_last_complained_in_way",
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"pwg_last_complained_in_way",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epwg_gameplay_begin_suicide_run",
		response = "epwg_gameplay_begin_suicide_run",
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
				"skaven_poison_wind_globadier"
			},
			{
				"faction_memory",
				"last_pwg_suicide_run",
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_pwg_suicide_run",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_rally_fleeing_clanrats",
		response = "esv_gameplay_rally_fleeing_clanrats",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"rally_fleeing_rats"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"faction_memory",
				"esv_last_commanding",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_commanding",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_cheering_on_player_kill",
		response = "esv_gameplay_cheering_on_player_kill",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"faction_memory",
				"sv_last_cheer",
				OP.TIMEDIFF,
				OP.GT,
				15
			}
		},
		on_done = {
			{
				"faction_memory",
				"sv_last_cheer",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_startled",
		response = "esv_gameplay_startled",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"startled"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_esvc_startled",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_running_towards_players",
		response = "esv_gameplay_running_towards_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				5
			},
			{
				"query_context",
				"friends_close",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_sv_running",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_sv_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_running_towards_players_alone",
		response = "esv_gameplay_running_towards_players_alone",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				5
			},
			{
				"query_context",
				"friends_close",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_sv_running",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_sv_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_player_knocked_down",
		response = "esv_gameplay_player_knocked_down",
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
				"skaven_storm_vermin_commander"
			},
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_witch_hunter_knocked_down",
		response = "esv_gameplay_witch_hunter_knocked_down",
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
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_bright_wizard_knocked_down",
		response = "esv_gameplay_bright_wizard_knocked_down",
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
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_dwarf_ranger_knocked_down",
		response = "esv_gameplay_dwarf_ranger_knocked_down",
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
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_wood_elf_knocked_down",
		response = "esv_gameplay_wood_elf_knocked_down",
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
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_empire_soldier_knocked_down",
		response = "esv_gameplay_empire_soldier_knocked_down",
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
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_player_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_striking_a_player",
		response = "esv_gameplay_striking_a_player",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"striking"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"faction_memory",
				"esv_last_striked_player",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_striked_player",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_killing_a_player",
		response = "esv_gameplay_killing_a_player",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_death"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"query_context",
				"distance",
				OP.LT,
				3
			},
			{
				"faction_memory",
				"esv_last_player_death",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"esv_last_player_death",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_fleeing",
		response = "esv_gameplay_fleeing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"fleeing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"user_memory",
				"esv_last_flee",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"user_memory",
				"esv_last_flee",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esv_gameplay_set_on_fire",
		response = "esv_gameplay_set_on_fire",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"burning"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_storm_vermin_commander"
			},
			{
				"user_memory",
				"esv_last_burning",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"user_memory",
				"esv_last_burning",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_player_knocked_down",
		response = "esr_gameplay_player_knocked_down",
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
				"skaven_slave"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_witch_hunter_knocked_down",
		response = "esr_gameplay_witch_hunter_knocked_down",
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
				"skaven_slave"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_bright_wizard_knocked_down",
		response = "esr_gameplay_bright_wizard_knocked_down",
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
				"skaven_slave"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"bright_wizard"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_dwarf_ranger_knocked_down",
		response = "esr_gameplay_dwarf_ranger_knocked_down",
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
				"skaven_slave"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"dwarf_ranger"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_wood_elf_knocked_down",
		response = "esr_gameplay_wood_elf_knocked_down",
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
				"skaven_slave"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"wood_elf"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_empire_soldier_knocked_down",
		response = "esr_gameplay_empire_soldier_knocked_down",
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
				"skaven_slave"
			},
			{
				"query_context",
				"target_name",
				OP.EQ,
				"empire_soldier"
			},
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_seen_knockdown",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_shouting",
		response = "esr_gameplay_shouting",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shouting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_slave"
			},
			{
				"faction_memory",
				"last_cr_said_hit",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_said_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_attacking_witch_hunter_backstab",
		response = "esr_gameplay_attacking_witch_hunter_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_slave"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_attacking_bright_wizard_backstab",
		response = "esr_gameplay_attacking_bright_wizard_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_slave"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_attacking_empire_soldier_backstab",
		response = "esr_gameplay_attacking_empire_soldier_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_slave"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_attacking_dwarf_ranger_backstab",
		response = "esr_gameplay_attacking_dwarf_ranger_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_slave"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "esr_gameplay_attacking_wood_elf_backstab",
		response = "esr_gameplay_attacking_wood_elf_backstab",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"backstab"
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
				"skaven_slave"
			},
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_backstabbing",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "ecr_gameplay_fall",
		name = "ecr_gameplay_fall",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"falling"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			}
		}
	})
	define_rule({
		response = "ecr_gameplay_land",
		name = "ecr_gameplay_land",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"landing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat"
			}
		}
	})
	define_rule({
		response = "esr_gameplay_fall",
		name = "esr_gameplay_fall",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"falling"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_slave"
			}
		}
	})
	define_rule({
		response = "esr_gameplay_land",
		name = "esr_gameplay_land",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"landing"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_slave"
			}
		}
	})
	define_rule({
		response = "ecm_gameplay_comment_player_healing",
		name = "ecm_gameplay_comment_player_healing",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"heard_speak"
			},
			{
				"query_context",
				"dialogue_name_nopre",
				OP.EQ,
				"gameplay_self_heal"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_marauder"
			}
		}
	})
	define_rule({
		name = "ecm_gameplay_running_towards_players",
		response = "ecm_gameplay_running_towards_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_marauder"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				7
			},
			{
				"faction_memory",
				"time_since_ecm_gameplay_running_towards_players",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ecm_gameplay_running_towards_players",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecm_gameplay_dogpile_shouts",
		response = "ecm_gameplay_dogpile_shouts",
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
				"ecm_gameplay_dogpile_shouts"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_marauder"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				4
			},
			{
				"faction_memory",
				"time_since_ecm_gameplay_dogpile_shouts",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_ecm_gameplay_dogpile_shouts",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "epm_gameplay_startled",
		response = "epm_gameplay_startled",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"startled"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_plague_monk"
			},
			{
				"faction_memory",
				"last_epm_startled",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_epm_startled",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecm_gameplay_flanking_players",
		response = "ecm_gameplay_flanking_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"flanking"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_marauder"
			},
			{
				"faction_memory",
				"last_ecm_flanking",
				OP.TIMEDIFF,
				OP.GT,
				7
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_ecm_flanking",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecb_gameplay_running_towards_players",
		response = "ecb_gameplay_running_towards_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_berzerker"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				2
			},
			{
				"user_memory",
				"time_since_ecb_gameplay_running_towards_players",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_ecb_gameplay_running_towards_players",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_shield_gameplay_startled",
		response = "ecr_shield_gameplay_startled",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"startled"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat_with_shield"
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_cr_shield_startled",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_shield_gameplay_running_towards_players",
		response = "ecr_shield_gameplay_running_towards_players",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat_with_shield"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				6
			},
			{
				"faction_memory",
				"last_cr_shield_running",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_shield_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_shield_gameplay_running_towards_players_alone",
		response = "ecr_shield_gameplay_running_towards_players_alone",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat_with_shield"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				6
			},
			{
				"faction_memory",
				"last_cr_shield_running",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_shield_running",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_shield_gameplay_running_in_horde",
		response = "ecr_shield_gameplay_running_in_horde",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"running"
			},
			{
				"query_context",
				"distance",
				OP.GT,
				10
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat_with_shield"
			},
			{
				"query_context",
				"num_units",
				OP.GT,
				3
			},
			{
				"faction_memory",
				"last_cr_shield_running_in_horde",
				OP.TIMEDIFF,
				OP.GT,
				2
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_shield_running_in_horde",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecr_shield_gameplay_striking_a_player",
		response = "ecr_shield_gameplay_striking_a_player",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"shouting"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"skaven_clan_rat_with_shield"
			},
			{
				"faction_memory",
				"last_cr_shield_hit",
				OP.TIMEDIFF,
				OP.GT,
				3
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_cr_shield_hit",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecw_gameplay_targeting_wood_elf",
		response = "ecw_gameplay_targeting_wood_elf",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
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
				"chaos_warrior"
			},
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecw_gameplay_targeting_empire_soldier",
		response = "ecw_gameplay_targeting_empire_soldier",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
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
				"chaos_warrior"
			},
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecw_gameplay_targeting_witch_hunter",
		response = "ecw_gameplay_targeting_witch_hunter",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
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
				"chaos_warrior"
			},
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecw_gameplay_targeting_bright_wizard",
		response = "ecw_gameplay_targeting_bright_wizard",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
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
				"chaos_warrior"
			},
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecw_gameplay_targeting_dwarf_ranger",
		response = "ecw_gameplay_targeting_dwarf_ranger",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"enemy_target_changed"
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
				"chaos_warrior"
			},
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_chaos_warrior_targeting",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecw_gameplay_no_damage",
		response = "ecw_gameplay_no_damage",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"no_damage_taunt_player"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"faction_memory",
				"time_since_chaos_warrior_resilience",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_chaos_warrior_resilience",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecw_gameplay_alert",
		response = "ecw_gameplay_alert",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"startled"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"chaos_warrior"
			},
			{
				"faction_memory",
				"time_since_chaos_warrior_startled",
				OP.TIMEDIFF,
				OP.GT,
				5
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_chaos_warrior_startled",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "ecw_gameplay_downing_a_player",
		response = "ecw_gameplay_downing_a_player",
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
				"chaos_warrior"
			},
			{
				"faction_memory",
				"last_chaos_warrior_seen_knocked_down",
				OP.TIMEDIFF,
				OP.GT,
				10
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_chaos_warrior_seen_knocked_down",
				OP.TIMESET
			}
		}
	})
	add_dialogues({
		ecr_gameplay_running_towards_players_alone = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"ecr_gameplay_running_towards_players_alone_01",
				"ecr_gameplay_running_towards_players_alone_02",
				"ecr_gameplay_running_towards_players_alone_03",
				"ecr_gameplay_running_towards_players_alone_04",
				"ecr_gameplay_running_towards_players_alone_05",
				"ecr_gameplay_running_towards_players_alone_06",
				"ecr_gameplay_running_towards_players_alone_07",
				"ecr_gameplay_running_towards_players_alone_08"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_running_towards_players_alone_01",
				"ecr_gameplay_running_towards_players_alone_02",
				"ecr_gameplay_running_towards_players_alone_03",
				"ecr_gameplay_running_towards_players_alone_04",
				"ecr_gameplay_running_towards_players_alone_05",
				"ecr_gameplay_running_towards_players_alone_06",
				"ecr_gameplay_running_towards_players_alone_07",
				"ecr_gameplay_running_towards_players_alone_08"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_witch_hunter_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_witch_hunter_knocked_down_01",
				"ecr_gameplay_witch_hunter_knocked_down_02",
				"ecr_gameplay_witch_hunter_knocked_down_03",
				"ecr_gameplay_witch_hunter_knocked_down_04",
				"ecr_gameplay_witch_hunter_knocked_down_05"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_witch_hunter_knocked_down_01",
				"ecr_gameplay_witch_hunter_knocked_down_02",
				"ecr_gameplay_witch_hunter_knocked_down_03",
				"ecr_gameplay_witch_hunter_knocked_down_04",
				"ecr_gameplay_witch_hunter_knocked_down_05"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_attacking_empire_soldier_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_attacking_empire_soldier_backstab_01",
				"ecr_gameplay_attacking_empire_soldier_backstab_02",
				"ecr_gameplay_attacking_empire_soldier_backstab_03",
				"ecr_gameplay_attacking_empire_soldier_backstab_04",
				"ecr_gameplay_attacking_empire_soldier_backstab_05"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_attacking_empire_soldier_backstab_01",
				"ecr_gameplay_attacking_empire_soldier_backstab_02",
				"ecr_gameplay_attacking_empire_soldier_backstab_03",
				"ecr_gameplay_attacking_empire_soldier_backstab_04",
				"ecr_gameplay_attacking_empire_soldier_backstab_05"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_empire_soldier_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_empire_soldier_knocked_down_01",
				"ecr_gameplay_empire_soldier_knocked_down_02",
				"ecr_gameplay_empire_soldier_knocked_down_03",
				"ecr_gameplay_empire_soldier_knocked_down_04",
				"ecr_gameplay_empire_soldier_knocked_down_05"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_empire_soldier_knocked_down_01",
				"ecr_gameplay_empire_soldier_knocked_down_02",
				"ecr_gameplay_empire_soldier_knocked_down_03",
				"ecr_gameplay_empire_soldier_knocked_down_04",
				"ecr_gameplay_empire_soldier_knocked_down_05"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_begin_suicide_run = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"epwg_gameplay_begin_suicide_run_01",
				"epwg_gameplay_begin_suicide_run_02",
				"epwg_gameplay_begin_suicide_run_03",
				"epwg_gameplay_begin_suicide_run_04",
				"epwg_gameplay_begin_suicide_run_05"
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
			localization_strings = {
				"epwg_gameplay_begin_suicide_run_01",
				"epwg_gameplay_begin_suicide_run_02",
				"epwg_gameplay_begin_suicide_run_03",
				"epwg_gameplay_begin_suicide_run_04",
				"epwg_gameplay_begin_suicide_run_05"
			},
			randomize_indexes = {}
		},
		ecm_gameplay_comment_player_healing = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecm_gameplay_comment_player_healing"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "ecm_gameplay_comment_player_healing"
			}
		},
		esv_gameplay_running_towards_players_alone = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 8,
			sound_events = {
				"esv_gameplay_running_towards_players_alone_01",
				"esv_gameplay_running_towards_players_alone_02",
				"esv_gameplay_running_towards_players_alone_03",
				"esv_gameplay_running_towards_players_alone_04",
				"esv_gameplay_running_towards_players_alone_05",
				"esv_gameplay_running_towards_players_alone_06",
				"esv_gameplay_running_towards_players_alone_07",
				"esv_gameplay_running_towards_players_alone_08"
			},
			dialogue_animations = {
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_neutral"
			},
			localization_strings = {
				"esv_gameplay_running_towards_players_alone_01",
				"esv_gameplay_running_towards_players_alone_02",
				"esv_gameplay_running_towards_players_alone_03",
				"esv_gameplay_running_towards_players_alone_04",
				"esv_gameplay_running_towards_players_alone_05",
				"esv_gameplay_running_towards_players_alone_06",
				"esv_gameplay_running_towards_players_alone_07",
				"esv_gameplay_running_towards_players_alone_08"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_attacking_wood_elf_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_attacking_wood_elf_backstab_01",
				"ecr_gameplay_attacking_wood_elf_backstab_02",
				"ecr_gameplay_attacking_wood_elf_backstab_03",
				"ecr_gameplay_attacking_wood_elf_backstab_04",
				"ecr_gameplay_attacking_wood_elf_backstab_05"
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
			localization_strings = {
				"ecr_gameplay_attacking_wood_elf_backstab_01",
				"ecr_gameplay_attacking_wood_elf_backstab_02",
				"ecr_gameplay_attacking_wood_elf_backstab_03",
				"ecr_gameplay_attacking_wood_elf_backstab_04",
				"ecr_gameplay_attacking_wood_elf_backstab_05"
			},
			randomize_indexes = {}
		},
		esr_gameplay_witch_hunter_knocked_down = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 4,
			sound_events = {
				"esr_gameplay_witch_hunter_knocked_down_1",
				"esr_gameplay_witch_hunter_knocked_down_3",
				"esr_gameplay_witch_hunter_knocked_down_4",
				"esr_gameplay_witch_hunter_knocked_down_5"
			},
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
				"esr_gameplay_witch_hunter_knocked_down_1",
				"esr_gameplay_witch_hunter_knocked_down_3",
				"esr_gameplay_witch_hunter_knocked_down_4",
				"esr_gameplay_witch_hunter_knocked_down_5"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_striking_a_player = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 7,
			sound_events = {
				"ecr_gameplay_striking_a_player_01",
				"ecr_gameplay_striking_a_player_02",
				"ecr_gameplay_striking_a_player_03",
				"ecr_gameplay_striking_a_player_04",
				"ecr_gameplay_striking_a_player_05",
				"ecr_gameplay_striking_a_player_07",
				"ecr_gameplay_striking_a_player_08"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_neutral"
			},
			localization_strings = {
				"ecr_gameplay_striking_a_player_01",
				"ecr_gameplay_striking_a_player_02",
				"ecr_gameplay_striking_a_player_03",
				"ecr_gameplay_striking_a_player_04",
				"ecr_gameplay_striking_a_player_05",
				"ecr_gameplay_striking_a_player_07",
				"ecr_gameplay_striking_a_player_08"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_wood_elf_knocked_down = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 4,
			sound_events = {
				"ecr_gameplay_wood_elf_knocked_down_01",
				"ecr_gameplay_wood_elf_knocked_down_03",
				"ecr_gameplay_wood_elf_knocked_down_04",
				"ecr_gameplay_wood_elf_knocked_down_05"
			},
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
				"ecr_gameplay_wood_elf_knocked_down_01",
				"ecr_gameplay_wood_elf_knocked_down_03",
				"ecr_gameplay_wood_elf_knocked_down_04",
				"ecr_gameplay_wood_elf_knocked_down_05"
			},
			randomize_indexes = {}
		},
		esr_gameplay_attacking_empire_soldier_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_attacking_empire_soldier_backstab_1",
				"esr_gameplay_attacking_empire_soldier_backstab_2",
				"esr_gameplay_attacking_empire_soldier_backstab_3",
				"esr_gameplay_attacking_empire_soldier_backstab_5",
				"esr_gameplay_attacking_empire_soldier_backstab_4"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_attacking_empire_soldier_backstab_1",
				"esr_gameplay_attacking_empire_soldier_backstab_2",
				"esr_gameplay_attacking_empire_soldier_backstab_3",
				"esr_gameplay_attacking_empire_soldier_backstab_5",
				"esr_gameplay_attacking_empire_soldier_backstab_4"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_killing_a_player = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"ecr_gameplay_killing_a_player_01",
				"ecr_gameplay_killing_a_player_02",
				"ecr_gameplay_killing_a_player_03",
				"ecr_gameplay_killing_a_player_04",
				"ecr_gameplay_killing_a_player_05",
				"ecr_gameplay_killing_a_player_06",
				"ecr_gameplay_killing_a_player_07",
				"ecr_gameplay_killing_a_player_08"
			},
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
				"ecr_gameplay_killing_a_player_01",
				"ecr_gameplay_killing_a_player_02",
				"ecr_gameplay_killing_a_player_03",
				"ecr_gameplay_killing_a_player_04",
				"ecr_gameplay_killing_a_player_05",
				"ecr_gameplay_killing_a_player_06",
				"ecr_gameplay_killing_a_player_07",
				"ecr_gameplay_killing_a_player_08"
			},
			randomize_indexes = {}
		},
		ecr_shield_gameplay_running_towards_players = {
			sound_events_n = 13,
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 13,
			sound_events = {
				"ecr_shield_gameplay_running_towards_players_38",
				"ecr_shield_gameplay_running_towards_players_26",
				"ecr_shield_gameplay_running_towards_players_27",
				"ecr_shield_gameplay_running_towards_players_28",
				"ecr_shield_gameplay_running_towards_players_29",
				"ecr_shield_gameplay_running_towards_players_30",
				"ecr_shield_gameplay_running_towards_players_31",
				"ecr_shield_gameplay_running_towards_players_32",
				"ecr_shield_gameplay_running_towards_players_33",
				"ecr_shield_gameplay_running_towards_players_34",
				"ecr_shield_gameplay_running_towards_players_35",
				"ecr_shield_gameplay_running_towards_players_36",
				"ecr_shield_gameplay_running_towards_players_37"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_shield_gameplay_running_towards_players_38",
				"ecr_shield_gameplay_running_towards_players_26",
				"ecr_shield_gameplay_running_towards_players_27",
				"ecr_shield_gameplay_running_towards_players_28",
				"ecr_shield_gameplay_running_towards_players_29",
				"ecr_shield_gameplay_running_towards_players_30",
				"ecr_shield_gameplay_running_towards_players_31",
				"ecr_shield_gameplay_running_towards_players_32",
				"ecr_shield_gameplay_running_towards_players_33",
				"ecr_shield_gameplay_running_towards_players_34",
				"ecr_shield_gameplay_running_towards_players_35",
				"ecr_shield_gameplay_running_towards_players_36",
				"ecr_shield_gameplay_running_towards_players_37"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_hitting_only_skaven = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 8,
			sound_events = {
				"epwg_gameplay_hitting_only_skaven_01",
				"epwg_gameplay_hitting_only_skaven_02",
				"epwg_gameplay_hitting_only_skaven_03",
				"epwg_gameplay_hitting_only_skaven_04",
				"epwg_gameplay_hitting_only_skaven_05",
				"epwg_gameplay_hitting_only_skaven_06",
				"epwg_gameplay_hitting_only_skaven_07",
				"epwg_gameplay_hitting_only_skaven_08"
			},
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
				"epwg_gameplay_hitting_only_skaven_01",
				"epwg_gameplay_hitting_only_skaven_02",
				"epwg_gameplay_hitting_only_skaven_03",
				"epwg_gameplay_hitting_only_skaven_04",
				"epwg_gameplay_hitting_only_skaven_05",
				"epwg_gameplay_hitting_only_skaven_06",
				"epwg_gameplay_hitting_only_skaven_07",
				"epwg_gameplay_hitting_only_skaven_08"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_player_knocked_down = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"ecr_gameplay_player_knocked_down_01",
				"ecr_gameplay_player_knocked_down_02",
				"ecr_gameplay_player_knocked_down_03",
				"ecr_gameplay_player_knocked_down_04",
				"ecr_gameplay_player_knocked_down_05",
				"ecr_gameplay_player_knocked_down_06",
				"ecr_gameplay_player_knocked_down_07",
				"ecr_gameplay_player_knocked_down_08"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_player_knocked_down_01",
				"ecr_gameplay_player_knocked_down_02",
				"ecr_gameplay_player_knocked_down_03",
				"ecr_gameplay_player_knocked_down_04",
				"ecr_gameplay_player_knocked_down_05",
				"ecr_gameplay_player_knocked_down_06",
				"ecr_gameplay_player_knocked_down_07",
				"ecr_gameplay_player_knocked_down_08"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_dwarf_ranger_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_dwarf_ranger_knocked_down_01",
				"ecr_gameplay_dwarf_ranger_knocked_down_02",
				"ecr_gameplay_dwarf_ranger_knocked_down_03",
				"ecr_gameplay_dwarf_ranger_knocked_down_04",
				"ecr_gameplay_dwarf_ranger_knocked_down_05"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_dwarf_ranger_knocked_down_01",
				"ecr_gameplay_dwarf_ranger_knocked_down_02",
				"ecr_gameplay_dwarf_ranger_knocked_down_03",
				"ecr_gameplay_dwarf_ranger_knocked_down_04",
				"ecr_gameplay_dwarf_ranger_knocked_down_05"
			},
			randomize_indexes = {}
		},
		ecr_shield_gameplay_startled = {
			sound_events_n = 18,
			randomize_indexes_n = 0,
			face_animations_n = 18,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 18,
			sound_events = {
				"ecr_shield_startled_018",
				"ecr_shield_startled_001",
				"ecr_shield_startled_002",
				"ecr_shield_startled_003",
				"ecr_shield_startled_004",
				"ecr_shield_startled_005",
				"ecr_shield_startled_006",
				"ecr_shield_startled_007",
				"ecr_shield_startled_008",
				"ecr_shield_startled_009",
				"ecr_shield_startled_010",
				"ecr_shield_startled_011",
				"ecr_shield_startled_012",
				"ecr_shield_startled_013",
				"ecr_shield_startled_014",
				"ecr_shield_startled_015",
				"ecr_shield_startled_016",
				"ecr_shield_startled_017"
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
				"ecr_shield_startled_018",
				"ecr_shield_startled_001",
				"ecr_shield_startled_002",
				"ecr_shield_startled_003",
				"ecr_shield_startled_004",
				"ecr_shield_startled_005",
				"ecr_shield_startled_006",
				"ecr_shield_startled_007",
				"ecr_shield_startled_008",
				"ecr_shield_startled_009",
				"ecr_shield_startled_010",
				"ecr_shield_startled_011",
				"ecr_shield_startled_012",
				"ecr_shield_startled_013",
				"ecr_shield_startled_014",
				"ecr_shield_startled_015",
				"ecr_shield_startled_016",
				"ecr_shield_startled_017"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_running_in_horde = {
			sound_events_n = 11,
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 11,
			sound_events = {
				"ecr_gameplay_running_in_horde_01",
				"ecr_gameplay_running_in_horde_02",
				"ecr_gameplay_running_in_horde_03",
				"ecr_gameplay_running_in_horde_04",
				"ecr_gameplay_running_in_horde_05",
				"ecr_gameplay_running_in_horde_06",
				"ecr_gameplay_running_in_horde_07",
				"ecr_gameplay_running_in_horde_08",
				"ecr_gameplay_running_in_horde_09",
				"ecr_gameplay_running_in_horde_10",
				"ecr_gameplay_running_in_horde_11"
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
				"ecr_gameplay_running_in_horde_01",
				"ecr_gameplay_running_in_horde_02",
				"ecr_gameplay_running_in_horde_03",
				"ecr_gameplay_running_in_horde_04",
				"ecr_gameplay_running_in_horde_05",
				"ecr_gameplay_running_in_horde_06",
				"ecr_gameplay_running_in_horde_07",
				"ecr_gameplay_running_in_horde_08",
				"ecr_gameplay_running_in_horde_09",
				"ecr_gameplay_running_in_horde_10",
				"ecr_gameplay_running_in_horde_11"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_fall = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecr_gameplay_fall"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "ecr_gameplay_fall"
			}
		},
		esr_gameplay_attacking_dwarf_ranger_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_attacking_dwarf_ranger_backstab_1",
				"esr_gameplay_attacking_dwarf_ranger_backstab_2",
				"esr_gameplay_attacking_dwarf_ranger_backstab_3",
				"esr_gameplay_attacking_dwarf_ranger_backstab_4",
				"esr_gameplay_attacking_dwarf_ranger_backstab_5"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_attacking_dwarf_ranger_backstab_1",
				"esr_gameplay_attacking_dwarf_ranger_backstab_2",
				"esr_gameplay_attacking_dwarf_ranger_backstab_3",
				"esr_gameplay_attacking_dwarf_ranger_backstab_4",
				"esr_gameplay_attacking_dwarf_ranger_backstab_5"
			},
			randomize_indexes = {}
		},
		ecw_gameplay_targeting_bright_wizard = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ecw_gameplay_targeting_bright_wizard_02",
				"ecw_gameplay_targeting_bright_wizard_03",
				"ecw_gameplay_targeting_bright_wizard_04",
				"ecw_gameplay_targeting_bright_wizard_05",
				"ecw_gameplay_targeting_bright_wizard_06",
				"ecw_gameplay_targeting_bright_wizard_07",
				"ecw_gameplay_targeting_bright_wizard_08",
				"ecw_gameplay_targeting_bright_wizard_09",
				"ecw_gameplay_targeting_bright_wizard_10",
				"ecw_gameplay_targeting_bright_wizard_01"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecw_gameplay_targeting_bright_wizard_02",
				"ecw_gameplay_targeting_bright_wizard_03",
				"ecw_gameplay_targeting_bright_wizard_04",
				"ecw_gameplay_targeting_bright_wizard_05",
				"ecw_gameplay_targeting_bright_wizard_06",
				"ecw_gameplay_targeting_bright_wizard_07",
				"ecw_gameplay_targeting_bright_wizard_08",
				"ecw_gameplay_targeting_bright_wizard_09",
				"ecw_gameplay_targeting_bright_wizard_10",
				"ecw_gameplay_targeting_bright_wizard_01"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_killing_the_wood_elf = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"epwg_gameplay_killing_the_wood_elf_01",
				"epwg_gameplay_killing_the_wood_elf_02",
				"epwg_gameplay_killing_the_wood_elf_03",
				"epwg_gameplay_killing_the_wood_elf_04",
				"epwg_gameplay_killing_the_wood_elf_05"
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
			localization_strings = {
				"epwg_gameplay_killing_the_wood_elf_01",
				"epwg_gameplay_killing_the_wood_elf_02",
				"epwg_gameplay_killing_the_wood_elf_03",
				"epwg_gameplay_killing_the_wood_elf_04",
				"epwg_gameplay_killing_the_wood_elf_05"
			},
			randomize_indexes = {}
		},
		epm_gameplay_startled = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "Play_plague_monk_alerted_vce"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "Play_plague_monk_alerted_vce"
			}
		},
		ecm_gameplay_flanking_players = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecm_gameplay_flanking_players"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "ecm_gameplay_flanking_players"
			}
		},
		epwg_gameplay_hitting_a_player = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 8,
			sound_events = {
				"epwg_gameplay_hitting_a_player_01",
				"epwg_gameplay_hitting_a_player_02",
				"epwg_gameplay_hitting_a_player_03",
				"epwg_gameplay_hitting_a_player_04",
				"epwg_gameplay_hitting_a_player_05",
				"epwg_gameplay_hitting_a_player_06",
				"epwg_gameplay_hitting_a_player_07",
				"epwg_gameplay_hitting_a_player_08"
			},
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
				"epwg_gameplay_hitting_a_player_01",
				"epwg_gameplay_hitting_a_player_02",
				"epwg_gameplay_hitting_a_player_03",
				"epwg_gameplay_hitting_a_player_04",
				"epwg_gameplay_hitting_a_player_05",
				"epwg_gameplay_hitting_a_player_06",
				"epwg_gameplay_hitting_a_player_07",
				"epwg_gameplay_hitting_a_player_08"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_attacking_dwarf_ranger_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_attacking_dwarf_ranger_backstab_01",
				"ecr_gameplay_attacking_dwarf_ranger_backstab_02",
				"ecr_gameplay_attacking_dwarf_ranger_backstab_03",
				"ecr_gameplay_attacking_dwarf_ranger_backstab_04",
				"ecr_gameplay_attacking_dwarf_ranger_backstab_05"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_attacking_dwarf_ranger_backstab_01",
				"ecr_gameplay_attacking_dwarf_ranger_backstab_02",
				"ecr_gameplay_attacking_dwarf_ranger_backstab_03",
				"ecr_gameplay_attacking_dwarf_ranger_backstab_04",
				"ecr_gameplay_attacking_dwarf_ranger_backstab_05"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_bright_wizard_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_bright_wizard_knocked_down_01",
				"ecr_gameplay_bright_wizard_knocked_down_02",
				"ecr_gameplay_bright_wizard_knocked_down_03",
				"ecr_gameplay_bright_wizard_knocked_down_04",
				"ecr_gameplay_bright_wizard_knocked_down_05"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_bright_wizard_knocked_down_01",
				"ecr_gameplay_bright_wizard_knocked_down_02",
				"ecr_gameplay_bright_wizard_knocked_down_03",
				"ecr_gameplay_bright_wizard_knocked_down_04",
				"ecr_gameplay_bright_wizard_knocked_down_05"
			},
			randomize_indexes = {}
		},
		esv_gameplay_bright_wizard_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"esv_gameplay_bright_wizard_knocked_down_01",
				"esv_gameplay_bright_wizard_knocked_down_02",
				"esv_gameplay_bright_wizard_knocked_down_03",
				"esv_gameplay_bright_wizard_knocked_down_04",
				"esv_gameplay_bright_wizard_knocked_down_05"
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
			localization_strings = {
				"esv_gameplay_bright_wizard_knocked_down_01",
				"esv_gameplay_bright_wizard_knocked_down_02",
				"esv_gameplay_bright_wizard_knocked_down_03",
				"esv_gameplay_bright_wizard_knocked_down_04",
				"esv_gameplay_bright_wizard_knocked_down_05"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_killing_a_player = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 4,
			sound_events = {
				"epwg_gameplay_killing_a_player_01",
				"epwg_gameplay_killing_a_player_02",
				"epwg_gameplay_killing_a_player_03",
				"epwg_gameplay_killing_a_player_05"
			},
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
				"epwg_gameplay_killing_a_player_01",
				"epwg_gameplay_killing_a_player_02",
				"epwg_gameplay_killing_a_player_03",
				"epwg_gameplay_killing_a_player_05"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_startled = {
			sound_events_n = 16,
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 16,
			sound_events = {
				"ecr_gameplay_startled_01",
				"ecr_gameplay_startled_02",
				"ecr_gameplay_startled_03",
				"ecr_gameplay_startled_04",
				"ecr_gameplay_startled_05",
				"ecr_gameplay_startled_06",
				"ecr_gameplay_startled_07",
				"ecr_gameplay_startled_08",
				"ecr_gameplay_startled_09",
				"ecr_gameplay_startled_10",
				"ecr_gameplay_startled_11",
				"ecr_gameplay_startled_12",
				"ecr_gameplay_startled_13",
				"ecr_gameplay_startled_14",
				"ecr_gameplay_startled_15",
				"ecr_gameplay_startled_16"
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
				"ecr_gameplay_startled_01",
				"ecr_gameplay_startled_02",
				"ecr_gameplay_startled_03",
				"ecr_gameplay_startled_04",
				"ecr_gameplay_startled_05",
				"ecr_gameplay_startled_06",
				"ecr_gameplay_startled_07",
				"ecr_gameplay_startled_08",
				"ecr_gameplay_startled_09",
				"ecr_gameplay_startled_10",
				"ecr_gameplay_startled_11",
				"ecr_gameplay_startled_12",
				"ecr_gameplay_startled_13",
				"ecr_gameplay_startled_14",
				"ecr_gameplay_startled_15",
				"ecr_gameplay_startled_16"
			},
			randomize_indexes = {}
		},
		esr_gameplay_attacking_witch_hunter_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_attacking_witch_hunter_backstab_1",
				"esr_gameplay_attacking_witch_hunter_backstab_2",
				"esr_gameplay_attacking_witch_hunter_backstab_3",
				"esr_gameplay_attacking_witch_hunter_backstab_4",
				"esr_gameplay_attacking_witch_hunter_backstab_5"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_attacking_witch_hunter_backstab_1",
				"esr_gameplay_attacking_witch_hunter_backstab_2",
				"esr_gameplay_attacking_witch_hunter_backstab_3",
				"esr_gameplay_attacking_witch_hunter_backstab_4",
				"esr_gameplay_attacking_witch_hunter_backstab_5"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_land = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecr_gameplay_land"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "ecr_gameplay_land"
			}
		},
		ecr_gameplay_running_towards_players = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"ecr_gameplay_running_towards_players_01",
				"ecr_gameplay_running_towards_players_02",
				"ecr_gameplay_running_towards_players_03",
				"ecr_gameplay_running_towards_players_04",
				"ecr_gameplay_running_towards_players_05",
				"ecr_gameplay_running_towards_players_06",
				"ecr_gameplay_running_towards_players_07",
				"ecr_gameplay_running_towards_players_08"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_running_towards_players_01",
				"ecr_gameplay_running_towards_players_02",
				"ecr_gameplay_running_towards_players_03",
				"ecr_gameplay_running_towards_players_04",
				"ecr_gameplay_running_towards_players_05",
				"ecr_gameplay_running_towards_players_06",
				"ecr_gameplay_running_towards_players_07",
				"ecr_gameplay_running_towards_players_08"
			},
			randomize_indexes = {}
		},
		ecw_gameplay_downing_a_player = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 12,
			sound_events = {
				"ecw_gameplay_downing_a_player_12",
				"ecw_gameplay_downing_a_player_01",
				"ecw_gameplay_downing_a_player_02",
				"ecw_gameplay_downing_a_player_03",
				"ecw_gameplay_downing_a_player_04",
				"ecw_gameplay_downing_a_player_05",
				"ecw_gameplay_downing_a_player_06",
				"ecw_gameplay_downing_a_player_07",
				"ecw_gameplay_downing_a_player_08",
				"ecw_gameplay_downing_a_player_09",
				"ecw_gameplay_downing_a_player_10",
				"ecw_gameplay_downing_a_player_11"
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
				"ecw_gameplay_downing_a_player_12",
				"ecw_gameplay_downing_a_player_01",
				"ecw_gameplay_downing_a_player_02",
				"ecw_gameplay_downing_a_player_03",
				"ecw_gameplay_downing_a_player_04",
				"ecw_gameplay_downing_a_player_05",
				"ecw_gameplay_downing_a_player_06",
				"ecw_gameplay_downing_a_player_07",
				"ecw_gameplay_downing_a_player_08",
				"ecw_gameplay_downing_a_player_09",
				"ecw_gameplay_downing_a_player_10",
				"ecw_gameplay_downing_a_player_11"
			},
			randomize_indexes = {}
		},
		esv_gameplay_startled = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 7,
			sound_events = {
				"esv_gameplay_startled_02",
				"esv_gameplay_startled_03",
				"esv_gameplay_startled_04",
				"esv_gameplay_startled_05",
				"esv_gameplay_startled_06",
				"esv_gameplay_startled_07",
				"esv_gameplay_startled_08"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esv_gameplay_startled_02",
				"esv_gameplay_startled_03",
				"esv_gameplay_startled_04",
				"esv_gameplay_startled_05",
				"esv_gameplay_startled_06",
				"esv_gameplay_startled_07",
				"esv_gameplay_startled_08"
			},
			randomize_indexes = {}
		},
		ecw_gameplay_alert = {
			sound_events_n = 16,
			randomize_indexes_n = 0,
			face_animations_n = 16,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 16,
			sound_events = {
				"ecw_gameplay_alert_15",
				"ecw_gameplay_alert_01",
				"ecw_gameplay_alert_02",
				"ecw_gameplay_alert_03",
				"ecw_gameplay_alert_04",
				"ecw_gameplay_alert_04_alt1",
				"ecw_gameplay_alert_05",
				"ecw_gameplay_alert_06",
				"ecw_gameplay_alert_07",
				"ecw_gameplay_alert_08",
				"ecw_gameplay_alert_09",
				"ecw_gameplay_alert_10",
				"ecw_gameplay_alert_11",
				"ecw_gameplay_alert_12",
				"ecw_gameplay_alert_13",
				"ecw_gameplay_alert_14"
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
				"ecw_gameplay_alert_15",
				"ecw_gameplay_alert_01",
				"ecw_gameplay_alert_02",
				"ecw_gameplay_alert_03",
				"ecw_gameplay_alert_04",
				"ecw_gameplay_alert_04_alt1",
				"ecw_gameplay_alert_05",
				"ecw_gameplay_alert_06",
				"ecw_gameplay_alert_07",
				"ecw_gameplay_alert_08",
				"ecw_gameplay_alert_09",
				"ecw_gameplay_alert_10",
				"ecw_gameplay_alert_11",
				"ecw_gameplay_alert_12",
				"ecw_gameplay_alert_13",
				"ecw_gameplay_alert_14"
			},
			randomize_indexes = {}
		},
		esv_gameplay_dwarf_ranger_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"esv_gameplay_dwarf_ranger_knocked_down_01",
				"esv_gameplay_dwarf_ranger_knocked_down_02",
				"esv_gameplay_dwarf_ranger_knocked_down_03",
				"esv_gameplay_dwarf_ranger_knocked_down_04",
				"esv_gameplay_dwarf_ranger_knocked_down_05"
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
			localization_strings = {
				"esv_gameplay_dwarf_ranger_knocked_down_01",
				"esv_gameplay_dwarf_ranger_knocked_down_02",
				"esv_gameplay_dwarf_ranger_knocked_down_03",
				"esv_gameplay_dwarf_ranger_knocked_down_04",
				"esv_gameplay_dwarf_ranger_knocked_down_05"
			},
			randomize_indexes = {}
		},
		ecw_gameplay_no_damage = {
			sound_events_n = 11,
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 11,
			sound_events = {
				"ecw_gameplay_resilience_12",
				"ecw_gameplay_resilience_01",
				"ecw_gameplay_resilience_03",
				"ecw_gameplay_resilience_04",
				"ecw_gameplay_resilience_05",
				"ecw_gameplay_resilience_06",
				"ecw_gameplay_resilience_07",
				"ecw_gameplay_resilience_08",
				"ecw_gameplay_resilience_09",
				"ecw_gameplay_resilience_10",
				"ecw_gameplay_resilience_11"
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
				"ecw_gameplay_resilience_12",
				"ecw_gameplay_resilience_01",
				"ecw_gameplay_resilience_03",
				"ecw_gameplay_resilience_04",
				"ecw_gameplay_resilience_05",
				"ecw_gameplay_resilience_06",
				"ecw_gameplay_resilience_07",
				"ecw_gameplay_resilience_08",
				"ecw_gameplay_resilience_09",
				"ecw_gameplay_resilience_10",
				"ecw_gameplay_resilience_11"
			},
			randomize_indexes = {}
		},
		esr_gameplay_empire_soldier_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_empire_soldier_knocked_down_1",
				"esr_gameplay_empire_soldier_knocked_down_4",
				"esr_gameplay_empire_soldier_knocked_down_5",
				"esr_gameplay_empire_soldier_knocked_down_2",
				"esr_gameplay_empire_soldier_knocked_down_3"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_empire_soldier_knocked_down_1",
				"esr_gameplay_empire_soldier_knocked_down_4",
				"esr_gameplay_empire_soldier_knocked_down_5",
				"esr_gameplay_empire_soldier_knocked_down_2",
				"esr_gameplay_empire_soldier_knocked_down_3"
			},
			randomize_indexes = {}
		},
		ecw_gameplay_targeting_witch_hunter = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ecw_gameplay_targeting_witch_hunter_10",
				"ecw_gameplay_targeting_witch_hunter_01",
				"ecw_gameplay_targeting_witch_hunter_02",
				"ecw_gameplay_targeting_witch_hunter_03",
				"ecw_gameplay_targeting_witch_hunter_04",
				"ecw_gameplay_targeting_witch_hunter_05",
				"ecw_gameplay_targeting_witch_hunter_06",
				"ecw_gameplay_targeting_witch_hunter_07",
				"ecw_gameplay_targeting_witch_hunter_08",
				"ecw_gameplay_targeting_witch_hunter_09"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecw_gameplay_targeting_witch_hunter_10",
				"ecw_gameplay_targeting_witch_hunter_01",
				"ecw_gameplay_targeting_witch_hunter_02",
				"ecw_gameplay_targeting_witch_hunter_03",
				"ecw_gameplay_targeting_witch_hunter_04",
				"ecw_gameplay_targeting_witch_hunter_05",
				"ecw_gameplay_targeting_witch_hunter_06",
				"ecw_gameplay_targeting_witch_hunter_07",
				"ecw_gameplay_targeting_witch_hunter_08",
				"ecw_gameplay_targeting_witch_hunter_09"
			},
			randomize_indexes = {}
		},
		esv_gameplay_fleeing = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 8,
			sound_events = {
				"esv_gameplay_fleeing_01",
				"esv_gameplay_fleeing_02",
				"esv_gameplay_fleeing_03",
				"esv_gameplay_fleeing_04",
				"esv_gameplay_fleeing_05",
				"esv_gameplay_fleeing_06",
				"esv_gameplay_fleeing_07",
				"esv_gameplay_fleeing_08"
			},
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
				"esv_gameplay_fleeing_01",
				"esv_gameplay_fleeing_02",
				"esv_gameplay_fleeing_03",
				"esv_gameplay_fleeing_04",
				"esv_gameplay_fleeing_05",
				"esv_gameplay_fleeing_06",
				"esv_gameplay_fleeing_07",
				"esv_gameplay_fleeing_08"
			},
			randomize_indexes = {}
		},
		ecw_gameplay_targeting_empire_soldier = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ecw_gameplay_targeting_empire_soldier_10",
				"ecw_gameplay_targeting_empire_soldier_01",
				"ecw_gameplay_targeting_empire_soldier_02",
				"ecw_gameplay_targeting_empire_soldier_03",
				"ecw_gameplay_targeting_empire_soldier_04",
				"ecw_gameplay_targeting_empire_soldier_05",
				"ecw_gameplay_targeting_empire_soldier_06",
				"ecw_gameplay_targeting_empire_soldier_07",
				"ecw_gameplay_targeting_empire_soldier_08",
				"ecw_gameplay_targeting_empire_soldier_09"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecw_gameplay_targeting_empire_soldier_10",
				"ecw_gameplay_targeting_empire_soldier_01",
				"ecw_gameplay_targeting_empire_soldier_02",
				"ecw_gameplay_targeting_empire_soldier_03",
				"ecw_gameplay_targeting_empire_soldier_04",
				"ecw_gameplay_targeting_empire_soldier_05",
				"ecw_gameplay_targeting_empire_soldier_06",
				"ecw_gameplay_targeting_empire_soldier_07",
				"ecw_gameplay_targeting_empire_soldier_08",
				"ecw_gameplay_targeting_empire_soldier_09"
			},
			randomize_indexes = {}
		},
		esv_gameplay_running_towards_players = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 7,
			sound_events = {
				"esv_gameplay_running_towards_players_01",
				"esv_gameplay_running_towards_players_02",
				"esv_gameplay_running_towards_players_03",
				"esv_gameplay_running_towards_players_04",
				"esv_gameplay_running_towards_players_05",
				"esv_gameplay_running_towards_players_06",
				"esv_gameplay_running_towards_players_08"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"esv_gameplay_running_towards_players_01",
				"esv_gameplay_running_towards_players_02",
				"esv_gameplay_running_towards_players_03",
				"esv_gameplay_running_towards_players_04",
				"esv_gameplay_running_towards_players_05",
				"esv_gameplay_running_towards_players_06",
				"esv_gameplay_running_towards_players_08"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_killing_the_empire_soldier = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"epwg_gameplay_killing_the_empire_soldier_01",
				"epwg_gameplay_killing_the_empire_soldier_02",
				"epwg_gameplay_killing_the_empire_soldier_03",
				"epwg_gameplay_killing_the_empire_soldier_04",
				"epwg_gameplay_killing_the_empire_soldier_05"
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
			localization_strings = {
				"epwg_gameplay_killing_the_empire_soldier_01",
				"epwg_gameplay_killing_the_empire_soldier_02",
				"epwg_gameplay_killing_the_empire_soldier_03",
				"epwg_gameplay_killing_the_empire_soldier_04",
				"epwg_gameplay_killing_the_empire_soldier_05"
			},
			randomize_indexes = {}
		},
		ecw_gameplay_targeting_wood_elf = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ecw_gameplay_targeting_wood_elf_10",
				"ecw_gameplay_targeting_wood_elf_01",
				"ecw_gameplay_targeting_wood_elf_02",
				"ecw_gameplay_targeting_wood_elf_03",
				"ecw_gameplay_targeting_wood_elf_04",
				"ecw_gameplay_targeting_wood_elf_05",
				"ecw_gameplay_targeting_wood_elf_06",
				"ecw_gameplay_targeting_wood_elf_07",
				"ecw_gameplay_targeting_wood_elf_08",
				"ecw_gameplay_targeting_wood_elf_09"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecw_gameplay_targeting_wood_elf_10",
				"ecw_gameplay_targeting_wood_elf_01",
				"ecw_gameplay_targeting_wood_elf_02",
				"ecw_gameplay_targeting_wood_elf_03",
				"ecw_gameplay_targeting_wood_elf_04",
				"ecw_gameplay_targeting_wood_elf_05",
				"ecw_gameplay_targeting_wood_elf_06",
				"ecw_gameplay_targeting_wood_elf_07",
				"ecw_gameplay_targeting_wood_elf_08",
				"ecw_gameplay_targeting_wood_elf_09"
			},
			randomize_indexes = {}
		},
		ecr_shield_gameplay_striking_a_player = {
			sound_events_n = 11,
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 11,
			sound_events = {
				"ecr_shield_gameplay_striking_a_player_125",
				"ecr_shield_gameplay_striking_a_player_115",
				"ecr_shield_gameplay_striking_a_player_116",
				"ecr_shield_gameplay_striking_a_player_117",
				"ecr_shield_gameplay_striking_a_player_118",
				"ecr_shield_gameplay_striking_a_player_119",
				"ecr_shield_gameplay_striking_a_player_120",
				"ecr_shield_gameplay_striking_a_player_121",
				"ecr_shield_gameplay_striking_a_player_122",
				"ecr_shield_gameplay_striking_a_player_123",
				"ecr_shield_gameplay_striking_a_player_124"
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
				"ecr_shield_gameplay_striking_a_player_125",
				"ecr_shield_gameplay_striking_a_player_115",
				"ecr_shield_gameplay_striking_a_player_116",
				"ecr_shield_gameplay_striking_a_player_117",
				"ecr_shield_gameplay_striking_a_player_118",
				"ecr_shield_gameplay_striking_a_player_119",
				"ecr_shield_gameplay_striking_a_player_120",
				"ecr_shield_gameplay_striking_a_player_121",
				"ecr_shield_gameplay_striking_a_player_122",
				"ecr_shield_gameplay_striking_a_player_123",
				"ecr_shield_gameplay_striking_a_player_124"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_clanrat_in_the_way = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"epwg_gameplay_clanrat_in_the_way_01",
				"epwg_gameplay_clanrat_in_the_way_02",
				"epwg_gameplay_clanrat_in_the_way_03",
				"epwg_gameplay_clanrat_in_the_way_04",
				"epwg_gameplay_clanrat_in_the_way_05"
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
			localization_strings = {
				"epwg_gameplay_clanrat_in_the_way_01",
				"epwg_gameplay_clanrat_in_the_way_02",
				"epwg_gameplay_clanrat_in_the_way_03",
				"epwg_gameplay_clanrat_in_the_way_04",
				"epwg_gameplay_clanrat_in_the_way_05"
			},
			randomize_indexes = {}
		},
		ecr_shield_gameplay_running_in_horde = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 12,
			sound_events = {
				"ecr_shield_gameplay_running_in_horde_78",
				"ecr_shield_gameplay_running_in_horde_67",
				"ecr_shield_gameplay_running_in_horde_68",
				"ecr_shield_gameplay_running_in_horde_69",
				"ecr_shield_gameplay_running_in_horde_70",
				"ecr_shield_gameplay_running_in_horde_71",
				"ecr_shield_gameplay_running_in_horde_72",
				"ecr_shield_gameplay_running_in_horde_73",
				"ecr_shield_gameplay_running_in_horde_74",
				"ecr_shield_gameplay_running_in_horde_75",
				"ecr_shield_gameplay_running_in_horde_76",
				"ecr_shield_gameplay_running_in_horde_77"
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
				"ecr_shield_gameplay_running_in_horde_78",
				"ecr_shield_gameplay_running_in_horde_67",
				"ecr_shield_gameplay_running_in_horde_68",
				"ecr_shield_gameplay_running_in_horde_69",
				"ecr_shield_gameplay_running_in_horde_70",
				"ecr_shield_gameplay_running_in_horde_71",
				"ecr_shield_gameplay_running_in_horde_72",
				"ecr_shield_gameplay_running_in_horde_73",
				"ecr_shield_gameplay_running_in_horde_74",
				"ecr_shield_gameplay_running_in_horde_75",
				"ecr_shield_gameplay_running_in_horde_76",
				"ecr_shield_gameplay_running_in_horde_77"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_attacking_bright_wizard_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_attacking_bright_wizard_backstab_01",
				"ecr_gameplay_attacking_bright_wizard_backstab_02",
				"ecr_gameplay_attacking_bright_wizard_backstab_03",
				"ecr_gameplay_attacking_bright_wizard_backstab_04",
				"ecr_gameplay_attacking_bright_wizard_backstab_05"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_attacking_bright_wizard_backstab_01",
				"ecr_gameplay_attacking_bright_wizard_backstab_02",
				"ecr_gameplay_attacking_bright_wizard_backstab_03",
				"ecr_gameplay_attacking_bright_wizard_backstab_04",
				"ecr_gameplay_attacking_bright_wizard_backstab_05"
			},
			randomize_indexes = {}
		},
		ecr_shield_gameplay_running_towards_players_alone = {
			sound_events_n = 14,
			randomize_indexes_n = 0,
			face_animations_n = 14,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 14,
			sound_events = {
				"ecr_shield_gameplay_running_towards_players_alone_52",
				"ecr_shield_gameplay_running_towards_players_alone_39",
				"ecr_shield_gameplay_running_towards_players_alone_40",
				"ecr_shield_gameplay_running_towards_players_alone_41",
				"ecr_shield_gameplay_running_towards_players_alone_42",
				"ecr_shield_gameplay_running_towards_players_alone_43",
				"ecr_shield_gameplay_running_towards_players_alone_44",
				"ecr_shield_gameplay_running_towards_players_alone_45",
				"ecr_shield_gameplay_running_towards_players_alone_46",
				"ecr_shield_gameplay_running_towards_players_alone_47",
				"ecr_shield_gameplay_running_towards_players_alone_48",
				"ecr_shield_gameplay_running_towards_players_alone_49",
				"ecr_shield_gameplay_running_towards_players_alone_50",
				"ecr_shield_gameplay_running_towards_players_alone_51"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_shield_gameplay_running_towards_players_alone_52",
				"ecr_shield_gameplay_running_towards_players_alone_39",
				"ecr_shield_gameplay_running_towards_players_alone_40",
				"ecr_shield_gameplay_running_towards_players_alone_41",
				"ecr_shield_gameplay_running_towards_players_alone_42",
				"ecr_shield_gameplay_running_towards_players_alone_43",
				"ecr_shield_gameplay_running_towards_players_alone_44",
				"ecr_shield_gameplay_running_towards_players_alone_45",
				"ecr_shield_gameplay_running_towards_players_alone_46",
				"ecr_shield_gameplay_running_towards_players_alone_47",
				"ecr_shield_gameplay_running_towards_players_alone_48",
				"ecr_shield_gameplay_running_towards_players_alone_49",
				"ecr_shield_gameplay_running_towards_players_alone_50",
				"ecr_shield_gameplay_running_towards_players_alone_51"
			},
			randomize_indexes = {}
		},
		ecb_gameplay_running_towards_players = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecb_gameplay_running_towards_players"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "ecb_gameplay_running_towards_players"
			}
		},
		ecm_gameplay_dogpile_shouts = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecm_gameplay_dogpile_shouts"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "ecm_gameplay_dogpile_shouts"
			}
		},
		ecm_gameplay_running_towards_players = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "ecm_gameplay_running_towards_players"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "ecm_gameplay_running_towards_players"
			}
		},
		esr_gameplay_land = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "esr_gameplay_land"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "esr_gameplay_land"
			}
		},
		esr_gameplay_fall = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "esr_gameplay_fall"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "esr_gameplay_fall"
			}
		},
		esv_gameplay_wood_elf_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"esv_gameplay_wood_elf_knocked_down_01",
				"esv_gameplay_wood_elf_knocked_down_02",
				"esv_gameplay_wood_elf_knocked_down_03",
				"esv_gameplay_wood_elf_knocked_down_04",
				"esv_gameplay_wood_elf_knocked_down_05"
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
			localization_strings = {
				"esv_gameplay_wood_elf_knocked_down_01",
				"esv_gameplay_wood_elf_knocked_down_02",
				"esv_gameplay_wood_elf_knocked_down_03",
				"esv_gameplay_wood_elf_knocked_down_04",
				"esv_gameplay_wood_elf_knocked_down_05"
			},
			randomize_indexes = {}
		},
		esv_gameplay_set_on_fire = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 4,
			sound_events = {
				"esv_gameplay_set_on_fire_01",
				"esv_gameplay_set_on_fire_02",
				"esv_gameplay_set_on_fire_03",
				"esv_gameplay_set_on_fire_04"
			},
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
				"esv_gameplay_set_on_fire_01",
				"esv_gameplay_set_on_fire_02",
				"esv_gameplay_set_on_fire_03",
				"esv_gameplay_set_on_fire_04"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_killing_the_witch_hunter = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"epwg_gameplay_killing_the_witch_hunter_01",
				"epwg_gameplay_killing_the_witch_hunter_02",
				"epwg_gameplay_killing_the_witch_hunter_03",
				"epwg_gameplay_killing_the_witch_hunter_04",
				"epwg_gameplay_killing_the_witch_hunter_05"
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
			localization_strings = {
				"epwg_gameplay_killing_the_witch_hunter_01",
				"epwg_gameplay_killing_the_witch_hunter_02",
				"epwg_gameplay_killing_the_witch_hunter_03",
				"epwg_gameplay_killing_the_witch_hunter_04",
				"epwg_gameplay_killing_the_witch_hunter_05"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_killing_the_dwarf_ranger = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 4,
			sound_events = {
				"epwg_gameplay_killing_the_dwarf_ranger_01",
				"epwg_gameplay_killing_the_dwarf_ranger_02",
				"epwg_gameplay_killing_the_dwarf_ranger_03",
				"epwg_gameplay_killing_the_dwarf_ranger_05"
			},
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
				"epwg_gameplay_killing_the_dwarf_ranger_01",
				"epwg_gameplay_killing_the_dwarf_ranger_02",
				"epwg_gameplay_killing_the_dwarf_ranger_03",
				"epwg_gameplay_killing_the_dwarf_ranger_05"
			},
			randomize_indexes = {}
		},
		esr_gameplay_attacking_wood_elf_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_attacking_wood_elf_backstab_1",
				"esr_gameplay_attacking_wood_elf_backstab_2",
				"esr_gameplay_attacking_wood_elf_backstab_3",
				"esr_gameplay_attacking_wood_elf_backstab_4",
				"esr_gameplay_attacking_wood_elf_backstab_5"
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
			localization_strings = {
				"esr_gameplay_attacking_wood_elf_backstab_1",
				"esr_gameplay_attacking_wood_elf_backstab_2",
				"esr_gameplay_attacking_wood_elf_backstab_3",
				"esr_gameplay_attacking_wood_elf_backstab_4",
				"esr_gameplay_attacking_wood_elf_backstab_5"
			},
			randomize_indexes = {}
		},
		esr_gameplay_attacking_bright_wizard_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_attacking_bright_wizard_backstab_1",
				"esr_gameplay_attacking_bright_wizard_backstab_2",
				"esr_gameplay_attacking_bright_wizard_backstab_3",
				"esr_gameplay_attacking_bright_wizard_backstab_4",
				"esr_gameplay_attacking_bright_wizard_backstab_5"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_attacking_bright_wizard_backstab_1",
				"esr_gameplay_attacking_bright_wizard_backstab_2",
				"esr_gameplay_attacking_bright_wizard_backstab_3",
				"esr_gameplay_attacking_bright_wizard_backstab_4",
				"esr_gameplay_attacking_bright_wizard_backstab_5"
			},
			randomize_indexes = {}
		},
		esv_gameplay_rally_fleeing_clanrats = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"esv_gameplay_rally_fleeing_clanrats_01",
				"esv_gameplay_rally_fleeing_clanrats_02",
				"esv_gameplay_rally_fleeing_clanrats_03",
				"esv_gameplay_rally_fleeing_clanrats_04",
				"esv_gameplay_rally_fleeing_clanrats_05",
				"esv_gameplay_rally_fleeing_clanrats_06",
				"esv_gameplay_rally_fleeing_clanrats_07",
				"esv_gameplay_rally_fleeing_clanrats_08"
			},
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
				"esv_gameplay_rally_fleeing_clanrats_01",
				"esv_gameplay_rally_fleeing_clanrats_02",
				"esv_gameplay_rally_fleeing_clanrats_03",
				"esv_gameplay_rally_fleeing_clanrats_04",
				"esv_gameplay_rally_fleeing_clanrats_05",
				"esv_gameplay_rally_fleeing_clanrats_06",
				"esv_gameplay_rally_fleeing_clanrats_07",
				"esv_gameplay_rally_fleeing_clanrats_08"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_casual_mutterings = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"epwg_gameplay_casual_mutterings_01",
				"epwg_gameplay_casual_mutterings_02",
				"epwg_gameplay_casual_mutterings_03",
				"epwg_gameplay_casual_mutterings_04",
				"epwg_gameplay_casual_mutterings_05",
				"epwg_gameplay_casual_mutterings_06",
				"epwg_gameplay_casual_mutterings_07",
				"epwg_gameplay_casual_mutterings_08"
			},
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
				"epwg_gameplay_casual_mutterings_01",
				"epwg_gameplay_casual_mutterings_02",
				"epwg_gameplay_casual_mutterings_03",
				"epwg_gameplay_casual_mutterings_04",
				"epwg_gameplay_casual_mutterings_05",
				"epwg_gameplay_casual_mutterings_06",
				"epwg_gameplay_casual_mutterings_07",
				"epwg_gameplay_casual_mutterings_08"
			},
			randomize_indexes = {}
		},
		esr_gameplay_shouting = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"esr_gameplay_shouting_1",
				"esr_gameplay_shouting_2",
				"esr_gameplay_shouting_3",
				"esr_gameplay_shouting_5",
				"esr_gameplay_shouting_6",
				"esr_gameplay_shouting_8",
				"esr_gameplay_shouting_4",
				"esr_gameplay_shouting_7"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_shouting_1",
				"esr_gameplay_shouting_2",
				"esr_gameplay_shouting_3",
				"esr_gameplay_shouting_5",
				"esr_gameplay_shouting_6",
				"esr_gameplay_shouting_8",
				"esr_gameplay_shouting_4",
				"esr_gameplay_shouting_7"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_seeing_bomb_thrown = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 7,
			sound_events = {
				"ecr_gameplay_seeing_bomb_thrown_01",
				"ecr_gameplay_seeing_bomb_thrown_02",
				"ecr_gameplay_seeing_bomb_thrown_03",
				"ecr_gameplay_seeing_bomb_thrown_04",
				"ecr_gameplay_seeing_bomb_thrown_05",
				"ecr_gameplay_seeing_bomb_thrown_06",
				"ecr_gameplay_seeing_bomb_thrown_07"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_seeing_bomb_thrown_01",
				"ecr_gameplay_seeing_bomb_thrown_02",
				"ecr_gameplay_seeing_bomb_thrown_03",
				"ecr_gameplay_seeing_bomb_thrown_04",
				"ecr_gameplay_seeing_bomb_thrown_05",
				"ecr_gameplay_seeing_bomb_thrown_06",
				"ecr_gameplay_seeing_bomb_thrown_07"
			},
			randomize_indexes = {}
		},
		ecw_gameplay_targeting_dwarf_ranger = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 10,
			sound_events = {
				"ecw_gameplay_targeting_dwarf_ranger_10",
				"ecw_gameplay_targeting_dwarf_ranger_01",
				"ecw_gameplay_targeting_dwarf_ranger_02",
				"ecw_gameplay_targeting_dwarf_ranger_03",
				"ecw_gameplay_targeting_dwarf_ranger_04",
				"ecw_gameplay_targeting_dwarf_ranger_05",
				"ecw_gameplay_targeting_dwarf_ranger_06",
				"ecw_gameplay_targeting_dwarf_ranger_07",
				"ecw_gameplay_targeting_dwarf_ranger_08",
				"ecw_gameplay_targeting_dwarf_ranger_09"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecw_gameplay_targeting_dwarf_ranger_10",
				"ecw_gameplay_targeting_dwarf_ranger_01",
				"ecw_gameplay_targeting_dwarf_ranger_02",
				"ecw_gameplay_targeting_dwarf_ranger_03",
				"ecw_gameplay_targeting_dwarf_ranger_04",
				"ecw_gameplay_targeting_dwarf_ranger_05",
				"ecw_gameplay_targeting_dwarf_ranger_06",
				"ecw_gameplay_targeting_dwarf_ranger_07",
				"ecw_gameplay_targeting_dwarf_ranger_08",
				"ecw_gameplay_targeting_dwarf_ranger_09"
			},
			randomize_indexes = {}
		},
		esr_gameplay_wood_elf_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_wood_elf_knocked_down_1",
				"esr_gameplay_wood_elf_knocked_down_2",
				"esr_gameplay_wood_elf_knocked_down_3",
				"esr_gameplay_wood_elf_knocked_down_4",
				"esr_gameplay_wood_elf_knocked_down_5"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_wood_elf_knocked_down_1",
				"esr_gameplay_wood_elf_knocked_down_2",
				"esr_gameplay_wood_elf_knocked_down_3",
				"esr_gameplay_wood_elf_knocked_down_4",
				"esr_gameplay_wood_elf_knocked_down_5"
			},
			randomize_indexes = {}
		},
		esv_gameplay_witch_hunter_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"esv_gameplay_witch_hunter_knocked_down_01",
				"esv_gameplay_witch_hunter_knocked_down_02",
				"esv_gameplay_witch_hunter_knocked_down_03",
				"esv_gameplay_witch_hunter_knocked_down_04",
				"esv_gameplay_witch_hunter_knocked_down_05"
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
			localization_strings = {
				"esv_gameplay_witch_hunter_knocked_down_01",
				"esv_gameplay_witch_hunter_knocked_down_02",
				"esv_gameplay_witch_hunter_knocked_down_03",
				"esv_gameplay_witch_hunter_knocked_down_04",
				"esv_gameplay_witch_hunter_knocked_down_05"
			},
			randomize_indexes = {}
		},
		esr_gameplay_dwarf_ranger_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_dwarf_ranger_knocked_down_1",
				"esr_gameplay_dwarf_ranger_knocked_down_3",
				"esr_gameplay_dwarf_ranger_knocked_down_4",
				"esr_gameplay_dwarf_ranger_knocked_down_5",
				"esr_gameplay_dwarf_ranger_knocked_down_2"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_dwarf_ranger_knocked_down_1",
				"esr_gameplay_dwarf_ranger_knocked_down_3",
				"esr_gameplay_dwarf_ranger_knocked_down_4",
				"esr_gameplay_dwarf_ranger_knocked_down_5",
				"esr_gameplay_dwarf_ranger_knocked_down_2"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_fleeing = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 6,
			sound_events = {
				"ecr_gameplay_fleeing_01",
				"ecr_gameplay_fleeing_02",
				"ecr_gameplay_fleeing_03",
				"ecr_gameplay_fleeing_04",
				"ecr_gameplay_fleeing_06",
				"ecr_gameplay_fleeing_07"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_fleeing_01",
				"ecr_gameplay_fleeing_02",
				"ecr_gameplay_fleeing_03",
				"ecr_gameplay_fleeing_04",
				"ecr_gameplay_fleeing_06",
				"ecr_gameplay_fleeing_07"
			},
			randomize_indexes = {}
		},
		esr_gameplay_bright_wizard_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"esr_gameplay_bright_wizard_knocked_down_1",
				"esr_gameplay_bright_wizard_knocked_down_2",
				"esr_gameplay_bright_wizard_knocked_down_3",
				"esr_gameplay_bright_wizard_knocked_down_4",
				"esr_gameplay_bright_wizard_knocked_down_5"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_bright_wizard_knocked_down_1",
				"esr_gameplay_bright_wizard_knocked_down_2",
				"esr_gameplay_bright_wizard_knocked_down_3",
				"esr_gameplay_bright_wizard_knocked_down_4",
				"esr_gameplay_bright_wizard_knocked_down_5"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_hitting_multiple_players = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 8,
			sound_events = {
				"epwg_gameplay_hitting_multiple_players_01",
				"epwg_gameplay_hitting_multiple_players_02",
				"epwg_gameplay_hitting_multiple_players_03",
				"epwg_gameplay_hitting_multiple_players_04",
				"epwg_gameplay_hitting_multiple_players_05",
				"epwg_gameplay_hitting_multiple_players_06",
				"epwg_gameplay_hitting_multiple_players_07",
				"epwg_gameplay_hitting_multiple_players_08"
			},
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
				"epwg_gameplay_hitting_multiple_players_01",
				"epwg_gameplay_hitting_multiple_players_02",
				"epwg_gameplay_hitting_multiple_players_03",
				"epwg_gameplay_hitting_multiple_players_04",
				"epwg_gameplay_hitting_multiple_players_05",
				"epwg_gameplay_hitting_multiple_players_06",
				"epwg_gameplay_hitting_multiple_players_07",
				"epwg_gameplay_hitting_multiple_players_08"
			},
			randomize_indexes = {}
		},
		esr_gameplay_player_knocked_down = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_basic_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"esr_gameplay_player_knocked_down_1",
				"esr_gameplay_player_knocked_down_2",
				"esr_gameplay_player_knocked_down_3",
				"esr_gameplay_player_knocked_down_4",
				"esr_gameplay_player_knocked_down_5",
				"esr_gameplay_player_knocked_down_6",
				"esr_gameplay_player_knocked_down_7",
				"esr_gameplay_player_knocked_down_8"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esr_gameplay_player_knocked_down_1",
				"esr_gameplay_player_knocked_down_2",
				"esr_gameplay_player_knocked_down_3",
				"esr_gameplay_player_knocked_down_4",
				"esr_gameplay_player_knocked_down_5",
				"esr_gameplay_player_knocked_down_6",
				"esr_gameplay_player_knocked_down_7",
				"esr_gameplay_player_knocked_down_8"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_killing_the_bright_wizard = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 4,
			sound_events = {
				"epwg_gameplay_killing_the_bright_wizard_01",
				"epwg_gameplay_killing_the_bright_wizard_02",
				"epwg_gameplay_killing_the_bright_wizard_03",
				"epwg_gameplay_killing_the_bright_wizard_04"
			},
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
				"epwg_gameplay_killing_the_bright_wizard_01",
				"epwg_gameplay_killing_the_bright_wizard_02",
				"epwg_gameplay_killing_the_bright_wizard_03",
				"epwg_gameplay_killing_the_bright_wizard_04"
			},
			randomize_indexes = {}
		},
		esv_gameplay_empire_soldier_knocked_down = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 5,
			sound_events = {
				"esv_gameplay_empire_soldier_knocked_down_01",
				"esv_gameplay_empire_soldier_knocked_down_02",
				"esv_gameplay_empire_soldier_knocked_down_03",
				"esv_gameplay_empire_soldier_knocked_down_04",
				"esv_gameplay_empire_soldier_knocked_down_05"
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
			localization_strings = {
				"esv_gameplay_empire_soldier_knocked_down_01",
				"esv_gameplay_empire_soldier_knocked_down_02",
				"esv_gameplay_empire_soldier_knocked_down_03",
				"esv_gameplay_empire_soldier_knocked_down_04",
				"esv_gameplay_empire_soldier_knocked_down_05"
			},
			randomize_indexes = {}
		},
		esv_gameplay_killing_a_player = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 7,
			sound_events = {
				"esv_gameplay_killing_a_player_01",
				"esv_gameplay_killing_a_player_02",
				"esv_gameplay_killing_a_player_03",
				"esv_gameplay_killing_a_player_04",
				"esv_gameplay_killing_a_player_05",
				"esv_gameplay_killing_a_player_06",
				"esv_gameplay_killing_a_player_08"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"esv_gameplay_killing_a_player_01",
				"esv_gameplay_killing_a_player_02",
				"esv_gameplay_killing_a_player_03",
				"esv_gameplay_killing_a_player_04",
				"esv_gameplay_killing_a_player_05",
				"esv_gameplay_killing_a_player_06",
				"esv_gameplay_killing_a_player_08"
			},
			randomize_indexes = {}
		},
		esv_gameplay_striking_a_player = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 8,
			sound_events = {
				"esv_gameplay_striking_a_player_01",
				"esv_gameplay_striking_a_player_02",
				"esv_gameplay_striking_a_player_03",
				"esv_gameplay_striking_a_player_04",
				"esv_gameplay_striking_a_player_05",
				"esv_gameplay_striking_a_player_06",
				"esv_gameplay_striking_a_player_07",
				"esv_gameplay_striking_a_player_08"
			},
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
				"esv_gameplay_striking_a_player_01",
				"esv_gameplay_striking_a_player_02",
				"esv_gameplay_striking_a_player_03",
				"esv_gameplay_striking_a_player_04",
				"esv_gameplay_striking_a_player_05",
				"esv_gameplay_striking_a_player_06",
				"esv_gameplay_striking_a_player_07",
				"esv_gameplay_striking_a_player_08"
			},
			randomize_indexes = {}
		},
		esv_gameplay_player_knocked_down = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "default",
			dialogue_animations_n = 8,
			sound_events = {
				"esv_gameplay_player_knocked_down_01",
				"esv_gameplay_player_knocked_down_02",
				"esv_gameplay_player_knocked_down_03",
				"esv_gameplay_player_knocked_down_04",
				"esv_gameplay_player_knocked_down_05",
				"esv_gameplay_player_knocked_down_06",
				"esv_gameplay_player_knocked_down_07",
				"esv_gameplay_player_knocked_down_08"
			},
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
				"esv_gameplay_player_knocked_down_01",
				"esv_gameplay_player_knocked_down_02",
				"esv_gameplay_player_knocked_down_03",
				"esv_gameplay_player_knocked_down_04",
				"esv_gameplay_player_knocked_down_05",
				"esv_gameplay_player_knocked_down_06",
				"esv_gameplay_player_knocked_down_07",
				"esv_gameplay_player_knocked_down_08"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_attacking_witch_hunter_backstab = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 5,
			sound_events = {
				"ecr_gameplay_attacking_witch_hunter_backstab_01",
				"ecr_gameplay_attacking_witch_hunter_backstab_02",
				"ecr_gameplay_attacking_witch_hunter_backstab_03",
				"ecr_gameplay_attacking_witch_hunter_backstab_04",
				"ecr_gameplay_attacking_witch_hunter_backstab_05"
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
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"ecr_gameplay_attacking_witch_hunter_backstab_01",
				"ecr_gameplay_attacking_witch_hunter_backstab_02",
				"ecr_gameplay_attacking_witch_hunter_backstab_03",
				"ecr_gameplay_attacking_witch_hunter_backstab_04",
				"ecr_gameplay_attacking_witch_hunter_backstab_05"
			},
			randomize_indexes = {}
		},
		esv_gameplay_cheering_on_player_kill = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"esv_gameplay_cheering_on_player_kill_01",
				"esv_gameplay_cheering_on_player_kill_02",
				"esv_gameplay_cheering_on_player_kill_03",
				"esv_gameplay_cheering_on_player_kill_04",
				"esv_gameplay_cheering_on_player_kill_05",
				"esv_gameplay_cheering_on_player_kill_06",
				"esv_gameplay_cheering_on_player_kill_07",
				"esv_gameplay_cheering_on_player_kill_08"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"esv_gameplay_cheering_on_player_kill_01",
				"esv_gameplay_cheering_on_player_kill_02",
				"esv_gameplay_cheering_on_player_kill_03",
				"esv_gameplay_cheering_on_player_kill_04",
				"esv_gameplay_cheering_on_player_kill_05",
				"esv_gameplay_cheering_on_player_kill_06",
				"esv_gameplay_cheering_on_player_kill_07",
				"esv_gameplay_cheering_on_player_kill_08"
			},
			randomize_indexes = {}
		},
		epwg_gameplay_throwing_globe = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 8,
			sound_events = {
				"epwg_gameplay_throwing_globe_01",
				"epwg_gameplay_throwing_globe_02",
				"epwg_gameplay_throwing_globe_03",
				"epwg_gameplay_throwing_globe_04",
				"epwg_gameplay_throwing_globe_05",
				"epwg_gameplay_throwing_globe_06",
				"epwg_gameplay_throwing_globe_07",
				"epwg_gameplay_throwing_globe_08"
			},
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
				"epwg_gameplay_throwing_globe_01",
				"epwg_gameplay_throwing_globe_02",
				"epwg_gameplay_throwing_globe_03",
				"epwg_gameplay_throwing_globe_04",
				"epwg_gameplay_throwing_globe_05",
				"epwg_gameplay_throwing_globe_06",
				"epwg_gameplay_throwing_globe_07",
				"epwg_gameplay_throwing_globe_08"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_seeing_weapon_special_activated = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "enemies",
			category = "enemy_high_prio",
			dialogue_animations_n = 7,
			sound_events = {
				"ecr_gameplay_seeing_weapon_special_activated_01",
				"ecr_gameplay_seeing_weapon_special_activated_02",
				"ecr_gameplay_seeing_weapon_special_activated_03",
				"ecr_gameplay_seeing_weapon_special_activated_04",
				"ecr_gameplay_seeing_weapon_special_activated_05",
				"ecr_gameplay_seeing_weapon_special_activated_06",
				"ecr_gameplay_seeing_weapon_special_activated_07"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			localization_strings = {
				"ecr_gameplay_seeing_weapon_special_activated_01",
				"ecr_gameplay_seeing_weapon_special_activated_02",
				"ecr_gameplay_seeing_weapon_special_activated_03",
				"ecr_gameplay_seeing_weapon_special_activated_04",
				"ecr_gameplay_seeing_weapon_special_activated_05",
				"ecr_gameplay_seeing_weapon_special_activated_06",
				"ecr_gameplay_seeing_weapon_special_activated_07"
			},
			randomize_indexes = {}
		}
	})

	return 
end
