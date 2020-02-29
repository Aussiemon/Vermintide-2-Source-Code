return function ()
	define_rule({
		name = "ecr_gameplay_startled_celebration_level",
		response = "ecr_gameplay_startled_celebration_level",
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
		name = "ecr_gameplay_running_towards_players_celebration_level",
		response = "ecr_gameplay_running_towards_players_celebration_level",
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
		name = "ecr_gameplay_running_towards_players_alone_celebration_level",
		response = "ecr_gameplay_running_towards_players_alone_celebration_level",
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
		name = "ecr_gameplay_player_knocked_down_celebration_level",
		response = "ecr_gameplay_player_knocked_down_celebration_level",
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
		name = "ecr_gameplay_witch_hunter_knocked_down_celebration_level",
		response = "ecr_gameplay_witch_hunter_knocked_down_celebration_level",
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
		name = "ecr_gameplay_bright_wizard_knocked_down_celebration_level",
		response = "ecr_gameplay_bright_wizard_knocked_down_celebration_level",
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
		name = "ecr_gameplay_dwarf_ranger_knocked_down_celebration_level",
		response = "ecr_gameplay_dwarf_ranger_knocked_down_celebration_level",
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
		name = "ecr_gameplay_wood_elf_knocked_down_celebration_level",
		response = "ecr_gameplay_wood_elf_knocked_down_celebration_level",
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
		name = "ecr_gameplay_empire_soldier_knocked_down_celebration_level",
		response = "ecr_gameplay_empire_soldier_knocked_down_celebration_level",
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
		name = "ecr_gameplay_striking_a_player_celebration_level",
		response = "ecr_gameplay_striking_a_player_celebration_level",
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
		name = "ecr_gameplay_killing_a_player_celebration_level",
		response = "ecr_gameplay_killing_a_player_celebration_level",
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
		name = "ecr_gameplay_fleeing_celebration_level",
		response = "ecr_gameplay_fleeing_celebration_level",
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
		name = "ecr_gameplay_running_in_horde_celebration_level",
		response = "ecr_gameplay_running_in_horde_celebration_level",
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
		name = "ecr_gameplay_seeing_bomb_thrown_celebration_level",
		response = "ecr_gameplay_seeing_bomb_thrown_celebration_level",
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
		name = "ecr_gameplay_seeing_weapon_special_activated_celebration_level",
		response = "ecr_gameplay_seeing_weapon_special_activated_celebration_level",
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
		name = "ecr_gameplay_attacking_witch_hunter_backstab_celebration_level",
		response = "ecr_gameplay_attacking_witch_hunter_backstab_celebration_level",
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
		name = "ecr_gameplay_attacking_bright_wizard_backstab_celebration_level",
		response = "ecr_gameplay_attacking_bright_wizard_backstab_celebration_level",
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
		name = "ecr_gameplay_attacking_empire_soldier_backstab_celebration_level",
		response = "ecr_gameplay_attacking_empire_soldier_backstab_celebration_level",
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
		name = "ecr_gameplay_attacking_dwarf_ranger_backstab_celebration_level",
		response = "ecr_gameplay_attacking_dwarf_ranger_backstab_celebration_level",
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
		name = "ecr_gameplay_attacking_wood_elf_backstab_celebration_level",
		response = "ecr_gameplay_attacking_wood_elf_backstab_celebration_level",
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
		name = "epwg_gameplay_throwing_globe_celebration_level",
		response = "epwg_gameplay_throwing_globe_celebration_level",
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
		name = "epwg_gameplay_hitting_a_player_celebration_level",
		response = "epwg_gameplay_hitting_a_player_celebration_level",
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
		name = "epwg_gameplay_hitting_multiple_players_celebration_level",
		response = "epwg_gameplay_hitting_multiple_players_celebration_level",
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
		name = "epwg_gameplay_hitting_only_skaven_celebration_level",
		response = "epwg_gameplay_hitting_only_skaven_celebration_level",
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
		name = "epwg_gameplay_begin_suicide_run_celebration_level",
		response = "epwg_gameplay_begin_suicide_run_celebration_level",
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
		name = "esv_gameplay_rally_fleeing_clanrats_celebration_level",
		response = "esv_gameplay_rally_fleeing_clanrats_celebration_level",
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
		name = "esv_gameplay_cheering_on_player_kill_celebration_level",
		response = "esv_gameplay_cheering_on_player_kill_celebration_level",
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
		name = "esv_gameplay_startled_celebration_level",
		response = "esv_gameplay_startled_celebration_level",
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
		name = "esv_gameplay_running_towards_players_celebration_level",
		response = "esv_gameplay_running_towards_players_celebration_level",
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
		name = "esv_gameplay_running_towards_players_alone_celebration_level",
		response = "esv_gameplay_running_towards_players_alone_celebration_level",
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
		name = "esv_gameplay_player_knocked_down_celebration_level",
		response = "esv_gameplay_player_knocked_down_celebration_level",
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
		name = "esv_gameplay_striking_a_player_celebration_level",
		response = "esv_gameplay_striking_a_player_celebration_level",
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
		name = "esv_gameplay_killing_a_player_celebration_level",
		response = "esv_gameplay_killing_a_player_celebration_level",
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
		name = "esv_gameplay_fleeing_celebration_level",
		response = "esv_gameplay_fleeing_celebration_level",
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
		name = "esv_gameplay_set_on_fire_celebration_level",
		response = "esv_gameplay_set_on_fire_celebration_level",
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
		name = "esr_gameplay_player_knocked_down_celebration_level",
		response = "esr_gameplay_player_knocked_down_celebration_level",
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
		name = "esr_gameplay_witch_hunter_knocked_down_celebration_level",
		response = "esr_gameplay_witch_hunter_knocked_down_celebration_level",
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
		name = "esr_gameplay_bright_wizard_knocked_down_celebration_level",
		response = "esr_gameplay_bright_wizard_knocked_down_celebration_level",
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
		name = "esr_gameplay_dwarf_ranger_knocked_down_celebration_level",
		response = "esr_gameplay_dwarf_ranger_knocked_down_celebration_level",
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
		name = "esr_gameplay_wood_elf_knocked_down_celebration_level",
		response = "esr_gameplay_wood_elf_knocked_down_celebration_level",
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
		name = "esr_gameplay_empire_soldier_knocked_down_celebration_level",
		response = "esr_gameplay_empire_soldier_knocked_down_celebration_level",
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
		name = "esr_gameplay_shouting_celebration_level",
		response = "esr_gameplay_shouting_celebration_level",
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
		response = "ecr_gameplay_fall_celebration_level",
		name = "ecr_gameplay_fall_celebration_level",
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
		response = "ecr_gameplay_land_celebration_level",
		name = "ecr_gameplay_land_celebration_level",
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
		response = "esr_gameplay_fall_celebration_level",
		name = "esr_gameplay_fall_celebration_level",
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
		response = "esr_gameplay_land_celebration_level",
		name = "esr_gameplay_land_celebration_level",
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
		name = "ecm_gameplay_running_towards_players_celebration_level",
		response = "ecm_gameplay_running_towards_players_celebration_level",
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
		name = "ecm_gameplay_dogpile_shouts_celebration_level",
		response = "ecm_gameplay_dogpile_shouts_celebration_level",
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
		response = "epm_gameplay_startled_celebration_level",
		name = "epm_gameplay_startled_celebration_level",
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
			}
		}
	})
	define_rule({
		response = "epm_gameplay_running_celebration_level",
		name = "epm_gameplay_running_celebration_level",
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
				"skaven_plague_monk"
			}
		}
	})
	define_rule({
		name = "ecm_gameplay_flanking_players_celebration_level",
		response = "ecm_gameplay_flanking_players_celebration_level",
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
		response = "ecb_gameplay_running_towards_players_celebration_level",
		name = "ecb_gameplay_running_towards_players_celebration_level",
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
			}
		}
	})
	define_rule({
		name = "ecr_shield_gameplay_startled_celebration_level",
		response = "ecr_shield_gameplay_startled_celebration_level",
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
		name = "ecr_shield_gameplay_running_towards_players_celebration_level",
		response = "ecr_shield_gameplay_running_towards_players_celebration_level",
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
		name = "ecr_shield_gameplay_running_towards_players_alone_celebration_level",
		response = "ecr_shield_gameplay_running_towards_players_alone_celebration_level",
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
		name = "ecr_shield_gameplay_running_in_horde_celebration_level",
		response = "ecr_shield_gameplay_running_in_horde_celebration_level",
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
		name = "ecr_shield_gameplay_striking_a_player_celebration_level",
		response = "ecr_shield_gameplay_striking_a_player_celebration_level",
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
		name = "ecw_gameplay_targeting_wood_elf_celebration_level",
		response = "ecw_gameplay_targeting_wood_elf_celebration_level",
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
		name = "ecw_gameplay_targeting_empire_soldier_celebration_level",
		response = "ecw_gameplay_targeting_empire_soldier_celebration_level",
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
		name = "ecw_gameplay_targeting_witch_hunter_celebration_level",
		response = "ecw_gameplay_targeting_witch_hunter_celebration_level",
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
		name = "ecw_gameplay_targeting_bright_wizard_celebration_level",
		response = "ecw_gameplay_targeting_bright_wizard_celebration_level",
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
		name = "ecw_gameplay_targeting_dwarf_ranger_celebration_level",
		response = "ecw_gameplay_targeting_dwarf_ranger_celebration_level",
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
		name = "ecw_gameplay_no_damage_celebration_level",
		response = "ecw_gameplay_no_damage_celebration_level",
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
		name = "ecw_gameplay_alert_celebration_level",
		response = "ecw_gameplay_alert_celebration_level",
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
		name = "ecw_gameplay_downing_a_player_celebration_level",
		response = "ecw_gameplay_downing_a_player_celebration_level",
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
		ecm_gameplay_dogpile_shouts_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 2.4357752799988
			},
			localization_strings = {
				[1.0] = "ecm_gameplay_dogpile_shouts"
			}
		},
		ecw_gameplay_targeting_bright_wizard_celebration_level = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.4371666908264,
				2.6896667480469,
				2.01597905159,
				3.2472500801086,
				2.6469583511352,
				3.1956040859222,
				2.7164375782013,
				4.0721039772034,
				3.0967292785645,
				2.4371666908264
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
		epwg_gameplay_hitting_only_skaven_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.1648333072662,
				2.1235208511352,
				2.0627708435059,
				1.8546144962311,
				1.3992187976837,
				2.663104057312,
				1.8565312623978,
				1.6903228759766
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
		esv_gameplay_striking_a_player_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.3912396430969,
				2.0863227844238,
				1.0346145629883,
				0.99805212020874,
				0.84791660308838,
				1.8966562747955,
				1.7962603569031,
				2.5772290229797
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
		epwg_gameplay_hitting_a_player_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.347416639328,
				1.9153230190277,
				3.776385307312,
				2.309666633606,
				1.5484895706177,
				1.3098332881927,
				2.8004896640778,
				1.9037187099457
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
		ecr_gameplay_attacking_bright_wizard_backstab_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.8913855552673,
				2.8543643951416,
				2.8261458873749,
				2.8884792327881,
				1.3641090393066
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
		ecr_shield_gameplay_striking_a_player_celebration_level = {
			sound_events_n = 11,
			face_animations_n = 11,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.7672069072723,
				1.1083488464356,
				1.0823719501495,
				1.8876566886902,
				1.6105694770813,
				2.2322840690613,
				1.7574293613434,
				3.0082724094391,
				1.8706274032593,
				2.0516180992127,
				1.5086461305618
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
		ecw_gameplay_alert_celebration_level = {
			sound_events_n = 16,
			face_animations_n = 16,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				5.4635624885559,
				5.2052083015442,
				6.33047914505,
				6.1779584884644,
				7.1706252098083,
				4.6236248016357,
				5.4265832901001,
				5.6764998435974,
				5.9691042900085,
				5.0533957481384,
				5.090437412262,
				4.4456667900085,
				7.7570834159851,
				6.0019583702087,
				6.6013331413269,
				4.8120622634888
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
		ecr_gameplay_bright_wizard_knocked_down_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.8218854665756,
				2.7576665878296,
				2.8134896755219,
				2.8717396259308,
				1.5437604188919
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
		esr_gameplay_empire_soldier_knocked_down_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.0981771945953,
				3.0571548938751,
				2.2776837348938,
				2.9353897571564,
				2.4396891593933
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
		ecr_shield_gameplay_running_in_horde_celebration_level = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
			category = "enemy_basic_prio",
			dialogue_animations_n = 12,
			sound_events = {
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
				"ecr_shield_gameplay_running_in_horde_77",
				"ecr_shield_gameplay_running_in_horde_78"
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
			sound_events_duration = {
				2.5186877250671,
				2.0309009552002,
				2.0759143829346,
				1.250435590744,
				1.250435590744,
				2.0383911132813,
				2.4862542152405,
				2.6159319877624,
				2.0479538440704,
				2.328052520752,
				2.0893316268921,
				1.7563474178314
			},
			localization_strings = {
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
				"ecr_shield_gameplay_running_in_horde_77",
				"ecr_shield_gameplay_running_in_horde_78"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_striking_a_player_celebration_level = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.6096665859222,
				1.9465103149414,
				2.0407500267029,
				2.1811771392822,
				2.1893644332886,
				2.1384792327881,
				2.1038229465485
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
		esv_gameplay_rally_fleeing_clanrats_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.77208340168,
				0.98653125762939,
				2.644416809082,
				2.80823969841,
				2.744677066803,
				2.9503228664398,
				1.7425312995911,
				2.9276041984558
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
		ecr_shield_gameplay_startled_celebration_level = {
			sound_events_n = 18,
			face_animations_n = 18,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.2780106067658,
				1.3854360580444,
				0.95248734951019,
				1.6816993951798,
				1.5460240840912,
				1.3854360580444,
				1.9171694517136,
				1.9089975357056,
				1.9539339542389,
				2.2183394432068,
				2.1302342414856,
				1.96111369133,
				2.0042102336884,
				1.5466372966766,
				1.0690948963165,
				1.3535060882568,
				1.7992630004883,
				1.5014122724533
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
		esv_gameplay_startled_celebration_level = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.6041771173477,
				1.4957292079925,
				1.5103228092194,
				2.2470834255219,
				2.0863332748413,
				2.5102915763855,
				3.1294894218445
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
		esv_gameplay_running_towards_players_celebration_level = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.545218706131,
				1.2551562786102,
				2.1086564064026,
				1.522916674614,
				1.2732812166214,
				2.0187187194824,
				1.389031291008
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
		epwg_gameplay_throwing_globe_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.5051457881927,
				1.9372498989105,
				2.0225105285645,
				1.7481979131699,
				2.0402708053589,
				2.3819999694824,
				2.424364566803,
				1.2459583282471
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
		ecr_gameplay_attacking_empire_soldier_backstab_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.1762812137604,
				2.7345521450043,
				2.912187576294,
				2.5181355476379,
				2.4682395458221
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
		ecr_shield_gameplay_running_towards_players_alone_celebration_level = {
			sound_events_n = 14,
			face_animations_n = 14,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.5528464317322,
				1.7042849063873,
				1.8533816337585,
				1.9180173873901,
				0.7931621670723,
				1.8183847665787,
				1.7491130828857,
				2.7499461174011,
				2.3010687828064,
				3.0651512145996,
				3.6087362766266,
				3.3570487499237,
				3.1962084770203,
				3.1962084770203
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
		ecw_gameplay_targeting_empire_soldier_celebration_level = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				4.0159583091736,
				4.278874874115,
				4.278874874115,
				3.5030207633972,
				2.7161250114441,
				3.366229057312,
				3.4516041278839,
				3.8618125915527,
				3.4133958816528,
				3.1078958511352
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
		ecr_gameplay_running_in_horde_celebration_level = {
			sound_events_n = 11,
			face_animations_n = 11,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.595645904541,
				2.5252187252045,
				2.3333959579468,
				2.8580462932587,
				2.5198333263397,
				2.3732595443726,
				2.296416759491,
				2.7860000133514,
				2.1980936527252,
				3.2592928409576,
				2.6378126144409
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
		ecr_gameplay_running_towards_players_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.0480480194092,
				1.6026060581207,
				1.100532412529,
				1.6697001457214,
				1.7250833511352,
				2.444550037384,
				2.9767932891846,
				2.7777338027954
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
		ecr_gameplay_dwarf_ranger_knocked_down_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.8516979217529,
				1.736145734787,
				2.1220936775208,
				2.5133333206177,
				2.7856042385101
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
		epm_gameplay_startled_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 4.3576784133911
			},
			localization_strings = {
				[1.0] = "Play_plague_monk_alerted_vce"
			}
		},
		ecr_gameplay_startled_celebration_level = {
			sound_events_n = 16,
			face_animations_n = 16,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.6208343505859,
				1.9902110099793,
				2.4745981693268,
				2.3556458950043,
				1.5016041994095,
				1.5016041994095,
				1.5847500562668,
				1.8960311412811,
				1.3864063024521,
				1.2408541440964,
				1.3501875400543,
				1.8861354589462,
				1.7848541736603,
				1.7719895839691,
				1.5615208148956,
				1.9781665802002
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
		esv_gameplay_player_knocked_down_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.5284895896912,
				2.510302066803,
				1.8018333911896,
				1.1937916278839,
				1.8576250076294,
				1.0097082853317,
				1.8910937309265,
				2.817104101181
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
		epwg_gameplay_hitting_multiple_players_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.438093662262,
				2.557656288147,
				1.8583853244782,
				1.8352500200272,
				2.2074480056763,
				2.0799896717072,
				2.3486561775208,
				2.704062461853
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
		esr_gameplay_wood_elf_knocked_down_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.2165820598602,
				2.3942353725433,
				2.9860632419586,
				2.0639026165009,
				2.104850769043
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
		epm_gameplay_running_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
			category = "enemy_high_prio",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "Play_plague_monk_running_vce"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry"
			},
			sound_events_duration = {
				[1.0] = 4.3576784133911
			},
			localization_strings = {
				[1.0] = "Play_plague_monk_running_vce"
			}
		},
		esv_gameplay_running_towards_players_alone_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.4921667575836,
				1.355885386467,
				2.3659479618073,
				1.2154270410538,
				1.6010103225708,
				1.4894375801086,
				2.5883958339691,
				1.7460415363312
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
		ecm_gameplay_flanking_players_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 2.3080244064331
			},
			localization_strings = {
				[1.0] = "ecm_gameplay_flanking_players"
			}
		},
		esr_gameplay_dwarf_ranger_knocked_down_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.0404150485992,
				2.2688636779785,
				2.2885332107544,
				3.0673675537109,
				2.3134577274323
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
		esv_gameplay_killing_a_player_celebration_level = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.0138125419617,
				1.9357187747955,
				1.8026874065399,
				2.783625125885,
				1.9524478912354,
				2.9839272499084,
				2.043083190918
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
		ecr_gameplay_attacking_witch_hunter_backstab_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.429093837738,
				2.6670730113983,
				1.1734999418259,
				2.7596249580383,
				2.2379999160767
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
		ecr_gameplay_killing_a_player_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.3172292709351,
				1.134604215622,
				2.6404166221619,
				1.6570416688919,
				1.659916639328,
				1.156729221344,
				2.0708749294281,
				2.5992500782013
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
		ecr_gameplay_player_knocked_down_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.0681250095367,
				1.8678125143051,
				2.1267187595367,
				2.4797916412353,
				2.0925834178925,
				2.1811771392822,
				2.1956562995911,
				2.3006978034973
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
		ecr_gameplay_wood_elf_knocked_down_celebration_level = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.1427812576294,
				3.354052066803,
				2.171041727066,
				2.4568541049957
			},
			localization_strings = {
				"ecr_gameplay_wood_elf_knocked_down_01",
				"ecr_gameplay_wood_elf_knocked_down_03",
				"ecr_gameplay_wood_elf_knocked_down_04",
				"ecr_gameplay_wood_elf_knocked_down_05"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_running_towards_players_alone_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.7922794818878,
				2.0397655963898,
				2.6266367435455,
				2.0784459114075,
				1.7603061199188,
				1.7603061199188,
				1.7603061199188,
				1.7703518867493
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
		ecr_gameplay_attacking_dwarf_ranger_backstab_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.4948437213898,
				3.1902604103088,
				2.2633645534515,
				2.3910000324249,
				2.189031124115
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
		esv_gameplay_set_on_fire_celebration_level = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.0554790496826,
				3.8044896125794,
				3.8181977272034,
				3.8958332538605
			},
			localization_strings = {
				"esv_gameplay_set_on_fire_01",
				"esv_gameplay_set_on_fire_02",
				"esv_gameplay_set_on_fire_03",
				"esv_gameplay_set_on_fire_04"
			},
			randomize_indexes = {}
		},
		ecr_gameplay_empire_soldier_knocked_down_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.15269780159,
				3.046760559082,
				2.4099373817444,
				2.2888123989105,
				2.1333541870117
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
		esr_gameplay_shouting_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.6175208091736,
				2.2240982055664,
				1.9760384559631,
				2.0318236351013,
				2.0256657600403,
				2.5196251869202,
				2.2800567150116,
				2.7460899353027
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
		ecw_gameplay_downing_a_player_celebration_level = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.1312708854675,
				2.8968958854675,
				2.849666595459,
				3.8111457824707,
				3.0181040763855,
				4.1496248245239,
				3.7249999046326,
				2.3901250362396,
				3.9852292537689,
				2.9520626068115,
				1.1278125047684,
				2.2089791297913
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
		esv_gameplay_fleeing_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.6263333559036,
				1.5198854207993,
				1.7404687404633,
				1.2774686813355,
				2.6736562252045,
				2.2971875667572,
				2.1877083778381,
				2.0095937252045
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
		esv_gameplay_cheering_on_player_kill_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.3126873970032,
				2.4460520744324,
				3.2568438053131,
				4.0063228607178,
				3.1245520114899,
				2.6834478378296,
				2.1040625572205,
				3.7263956069946
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
		ecr_gameplay_witch_hunter_knocked_down_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.3785624504089,
				2.5637917518616,
				2.731166601181,
				1.9364895820618,
				3.0035729408264
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
		ecw_gameplay_no_damage_celebration_level = {
			sound_events_n = 11,
			face_animations_n = 11,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.3657873868942,
				1.29325568676,
				1.6440000534058,
				2.6308333873749,
				2.2638916969299,
				3.0576479434967,
				3.1109256744385,
				2.3538925647736,
				2.6216983795166,
				1.3562939167023,
				2.4985430240631
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
		ecr_gameplay_seeing_weapon_special_activated_celebration_level = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.1483333110809,
				2.1839375495911,
				1.4625624418259,
				1.369020819664,
				1.5745416879654,
				1.7800208330154,
				1.8344999551773
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
		},
		ecw_gameplay_targeting_dwarf_ranger_celebration_level = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.0581457614899,
				2.5530624389648,
				2.5530624389648,
				2.9329583644867,
				1.5283750295639,
				2.356062412262,
				2.7996249198914,
				2.6886250972748,
				4.7664999961853,
				4.0580415725708
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
		ecw_gameplay_targeting_witch_hunter_celebration_level = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				5.498083114624,
				3.5149791240692,
				3.5149791240692,
				3.308354139328,
				2.8955416679382,
				2.4309375286102,
				4.1226668357849,
				3.907666683197,
				4.3086042404175,
				3.9525415897369
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
		ecw_gameplay_targeting_wood_elf_celebration_level = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.5813958644867,
				2.1689791679382,
				2.1689791679382,
				3.3047499656677,
				2.4201667308807,
				2.1665832996368,
				3.2913959026337,
				2.9574167728424,
				2.8440208435059,
				3.5403957366943
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
		ecr_shield_gameplay_running_towards_players_celebration_level = {
			sound_events_n = 13,
			face_animations_n = 13,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.3738186359406,
				1.6594746112824,
				1.293182015419,
				2.1765778064728,
				1.96111369133,
				1.3147211074829,
				2.0257494449616,
				1.788745880127,
				1.4009139537811,
				1.96111369133,
				2.0257494449616,
				1.6503286361694,
				2.5368270874023
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
		esr_gameplay_player_knocked_down_celebration_level = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.4456083774567,
				1.6556223630905,
				1.8227429389954,
				1.8540081977844,
				2.079514503479,
				2.006293296814,
				2.1355748176575,
				2.5704188346863
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
		epwg_gameplay_begin_suicide_run_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.9501667022705,
				2.8706667423248,
				2.2869374752045,
				2.5426144599915,
				3.5704689025879
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
		ecm_gameplay_running_towards_players_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 2.7142012119293
			},
			localization_strings = {
				[1.0] = "ecm_gameplay_running_towards_players"
			}
		},
		ecb_gameplay_running_towards_players_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 2.6563487052917
			},
			localization_strings = {
				[1.0] = "ecb_gameplay_running_towards_players"
			}
		},
		esr_gameplay_land_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 1.0269469022751
			},
			localization_strings = {
				[1.0] = "esr_gameplay_land"
			}
		},
		ecr_gameplay_fleeing_celebration_level = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.3161771297455,
				1.2687916755676,
				2.4412188529968,
				1.2936353683472,
				1.7326874732971,
				2.1942603588104
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
		esr_gameplay_fall_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 3.5635516643524
			},
			localization_strings = {
				[1.0] = "esr_gameplay_fall"
			}
		},
		ecr_gameplay_land_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 1.0269469022751
			},
			localization_strings = {
				[1.0] = "ecr_gameplay_land"
			}
		},
		ecr_gameplay_fall_celebration_level = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "enemies_celebration_level",
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
			sound_events_duration = {
				[1.0] = 3.5791234970093
			},
			localization_strings = {
				[1.0] = "ecr_gameplay_fall"
			}
		},
		ecr_gameplay_seeing_bomb_thrown_celebration_level = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.1551041603088,
				1.0714583396912,
				1.2909166812897,
				1.4922083616257,
				1.3328541517258,
				1.2070416212082,
				1.8025000095367
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
		ecr_gameplay_attacking_wood_elf_backstab_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.9373124837875,
				1.9153020381927,
				1.5616965293884,
				2.7061145305634,
				2.1749062538147
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
		esr_gameplay_bright_wizard_knocked_down_celebration_level = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				2.1765139102936,
				2.2981820106506,
				2.164448261261,
				2.350643157959,
				1.4638817310333
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
		esr_gameplay_witch_hunter_knocked_down_celebration_level = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "enemies_celebration_level",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				1.3271155357361,
				1.6900753974915,
				1.9223294258118,
				2.2967426776886
			},
			localization_strings = {
				"esr_gameplay_witch_hunter_knocked_down_1",
				"esr_gameplay_witch_hunter_knocked_down_3",
				"esr_gameplay_witch_hunter_knocked_down_4",
				"esr_gameplay_witch_hunter_knocked_down_5"
			},
			randomize_indexes = {}
		}
	})
end
