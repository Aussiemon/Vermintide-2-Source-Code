return function ()
	define_rule({
		name = "pwe_curse",
		response = "pwe_curse",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_targeted_by_ratling",
		response = "pwe_targeted_by_ratling",
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
	define_rule({
		name = "pwe_curse_forced",
		response = "pwe_curse_forced",
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
		name = "pwe_gameplay_globadier_guck",
		response = "pwe_gameplay_globadier_guck",
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
		response = "pwe_gameplay_hit_by_goo",
		name = "pwe_gameplay_hit_by_goo",
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
		name = "pwe_gameplay_taking_heavy_damage",
		response = "pwe_gameplay_taking_heavy_damage",
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
		name = "pwe_gameplay_incoming_globadier",
		response = "pwe_gameplay_incoming_globadier",
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
				"wood_elf"
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
		name = "pwe_gameplay_knocked_down",
		response = "pwe_gameplay_knocked_down",
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
				"times_down_wood_elf",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_player_pounced",
		response = "pwe_gameplay_player_pounced",
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
		name = "pwe_gameplay_empire_soldier_grabbed",
		response = "pwe_gameplay_empire_soldier_grabbed",
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
		name = "pwe_gameplay_witch_hunter_grabbed",
		response = "pwe_gameplay_witch_hunter_grabbed",
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
		name = "pwe_gameplay_bright_wizard_grabbed",
		response = "pwe_gameplay_bright_wizard_grabbed",
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
		name = "pwe_gameplay_dwarf_ranger_grabbed",
		response = "pwe_gameplay_dwarf_ranger_grabbed",
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
			},
			{
				"faction_memory",
				"times_grabbed_dwarf_ranger",
				OP.ADD,
				1
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_heard_empire_soldier_in_trouble",
		response = "pwe_gameplay_heard_empire_soldier_in_trouble",
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
		name = "pwe_gameplay_heard_witch_hunter_in_trouble",
		response = "pwe_gameplay_heard_witch_hunter_in_trouble",
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
		name = "pwe_gameplay_heard_dwarf_ranger_in_trouble",
		response = "pwe_gameplay_heard_dwarf_ranger_in_trouble",
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
		name = "pwe_gameplay_heard_bright_wizard_in_trouble",
		response = "pwe_gameplay_heard_bright_wizard_in_trouble",
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
		name = "pwe_gameplay_no_nearby_teammates",
		response = "pwe_gameplay_no_nearby_teammates",
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
				"wood_elf"
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
		name = "pwe_gameplay_empire_soldier_dead",
		response = "pwe_gameplay_empire_soldier_dead",
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
		name = "pwe_gameplay_witch_hunter_dead",
		response = "pwe_gameplay_witch_hunter_dead",
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
		name = "pwe_gameplay_dwarf_ranger_dead",
		response = "pwe_gameplay_dwarf_ranger_dead",
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
		name = "pwe_gameplay_bright_wizard_dead",
		response = "pwe_gameplay_bright_wizard_dead",
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
		name = "pwe_gameplay_bile_troll_before_puke",
		response = "pwe_gameplay_bile_troll_before_puke",
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
		response = "pwe_last_hero_standing",
		name = "pwe_last_hero_standing",
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
		name = "pwe_gameplay_seeing_a_stormvermin",
		response = "pwe_gameplay_seeing_a_stormvermin",
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
		name = "pwe_gameplay_seeing_a_gutter_runner",
		response = "pwe_gameplay_seeing_a_gutter_runner",
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
		name = "pwe_gameplay_hearing_a_gutter_runner",
		response = "pwe_gameplay_hearing_a_gutter_runner",
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
		name = "pwe_gameplay_seeing_a_globadier",
		response = "pwe_gameplay_seeing_a_globadier",
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
		name = "pwe_gameplay_hearing_a_globadier",
		response = "pwe_gameplay_hearing_a_globadier",
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
		name = "pwe_gameplay_seeing_a_skaven_rat_ogre",
		response = "pwe_gameplay_seeing_a_skaven_rat_ogre",
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
		name = "pwe_gameplay_hearing_a_skaven_rat_ogre",
		response = "pwe_gameplay_hearing_a_skaven_rat_ogre",
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
		name = "pwe_gameplay_incoming_skaven_rat_ogre",
		response = "pwe_gameplay_incoming_skaven_rat_ogre",
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
		name = "pwe_gameplay_hears_incoming_horde",
		response = "pwe_gameplay_hears_incoming_horde",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_gameplay_seeing_a_skaven_patrol_stormvermin",
		response = "pwe_gameplay_seeing_a_skaven_patrol_stormvermin",
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
				"last_heard_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_gameplay_hearing_a_skaven_patrol_stormvermin",
		response = "pwe_gameplay_hearing_a_skaven_patrol_stormvermin",
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
		name = "pwe_gameplay_seeing_a_skaven_slaver",
		response = "pwe_gameplay_seeing_a_skaven_slaver",
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
		name = "pwe_gameplay_seeing_a_skaven_ratling_gun",
		response = "pwe_gameplay_seeing_a_skaven_ratling_gun",
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
		name = "pwe_gameplay_hearing_a_skaven_ratling_gun",
		response = "pwe_gameplay_hearing_a_skaven_ratling_gun",
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
		name = "pwe_gameplay_tension_no_enemies",
		response = "pwe_gameplay_tension_no_enemies",
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
		name = "pwe_gameplay_killing_globadier",
		response = "pwe_gameplay_killing_globadier",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_ratling",
		response = "pwe_gameplay_killing_ratling",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_packmaster",
		response = "pwe_gameplay_killing_packmaster",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_gutterrunner",
		response = "pwe_gameplay_killing_gutterrunner",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_lootrat",
		response = "pwe_gameplay_killing_lootrat",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_gutter_runner_combat",
		response = "pwe_gameplay_hearing_a_gutter_runner_combat",
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
		name = "pwe_gameplay_hearing_a_globadier_combat",
		response = "pwe_gameplay_hearing_a_globadier_combat",
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
		name = "pwe_gameplay_hearing_a_skaven_rat_ogre_combat",
		response = "pwe_gameplay_hearing_a_skaven_rat_ogre_combat",
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
		name = "pwe_gameplay_hearing_a_skaven_ratling_gun_combat",
		response = "pwe_gameplay_hearing_a_skaven_ratling_gun_combat",
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
		name = "pwe_gameplay_seeing_a_pm",
		response = "pwe_gameplay_seeing_a_pm",
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
		name = "pwe_gameplay_seeing_a_scr",
		response = "pwe_gameplay_seeing_a_scr",
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
		name = "pwe_gameplay_hearing_a_pm",
		response = "pwe_gameplay_hearing_a_pm",
		criterias = {
			{
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
		name = "pwe_gameplay_hearing_a_pm_in_combat",
		response = "pwe_gameplay_hearing_a_pm_in_combat",
		criterias = {
			{
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
		name = "pwe_gameplay_hearing_a_chaos_spawn_combat",
		response = "pwe_gameplay_hearing_a_chaos_spawn_combat",
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
		name = "pwe_gameplay_seeing_a_chaos_spawn",
		response = "pwe_gameplay_seeing_a_chaos_spawn",
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
		name = "pwe_gameplay_hearing_a_chaos_spawn",
		response = "pwe_gameplay_hearing_a_chaos_spawn",
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
		name = "pwe_gameplay_killing_a_stormfiend",
		response = "pwe_gameplay_killing_a_stormfiend",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_chaos_warrior",
		response = "pwe_gameplay_hearing_a_chaos_warrior",
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
		name = "pwe_gameplay_hearing_a_chaos_warrior_combat",
		response = "pwe_gameplay_hearing_a_chaos_warrior_combat",
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_plague",
		response = "pwe_gameplay_hearing_a_chaos_wizard_plague",
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_tentacle",
		response = "pwe_gameplay_hearing_a_chaos_wizard_tentacle",
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat",
		response = "pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat",
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_wind",
		response = "pwe_gameplay_hearing_a_chaos_wizard_wind",
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_wind_combat",
		response = "pwe_gameplay_hearing_a_chaos_wizard_wind_combat",
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
		name = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower",
		response = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower",
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
		name = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
		response = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat",
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
		name = "pwe_gameplay_hearing_a_stormfiend",
		response = "pwe_gameplay_hearing_a_stormfiend",
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
		name = "pwe_gameplay_hearing_a_stormfiend_combat",
		response = "pwe_gameplay_hearing_a_stormfiend_combat",
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
		name = "pwe_gameplay_hearing_a_troll",
		response = "pwe_gameplay_hearing_a_troll",
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
		name = "pwe_gameplay_hearing_a_troll_combat",
		response = "pwe_gameplay_hearing_a_troll_combat",
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
		name = "pwe_gameplay_hearing_marauder_berserker_combat",
		response = "pwe_gameplay_hearing_marauder_berserker_combat",
		criterias = {
			{
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
		name = "pwe_gameplay_killing_a_chaos_warrior",
		response = "pwe_gameplay_killing_a_chaos_warrior",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_a_chaos_warrior_champion",
		response = "pwe_gameplay_killing_a_chaos_warrior_champion",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_a_chaos_wizard_plague",
		response = "pwe_gameplay_killing_a_chaos_wizard_plague",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_a_chaos_wizard_tentacle",
		response = "pwe_gameplay_killing_a_chaos_wizard_tentacle",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_a_chaos_wizard_wind",
		response = "pwe_gameplay_killing_a_chaos_wizard_wind",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_killing_a_skaven_warpfire_thrower",
		response = "pwe_gameplay_killing_a_skaven_warpfire_thrower",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_seeing_a_chaos_warrior",
		response = "pwe_gameplay_seeing_a_chaos_warrior",
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
		name = "pwe_gameplay_seeing_a_chaos_warrior_champion_combat",
		response = "pwe_gameplay_seeing_a_chaos_warrior_champion_combat",
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
		name = "pwe_gameplay_seeing_a_chaos_wizard_plague",
		response = "pwe_gameplay_seeing_a_chaos_wizard_plague",
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
		name = "pwe_gameplay_seeing_a_chaos_wizard_tentacle",
		response = "pwe_gameplay_seeing_a_chaos_wizard_tentacle",
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
		name = "pwe_gameplay_seeing_a_chaos_wizard_wind",
		response = "pwe_gameplay_seeing_a_chaos_wizard_wind",
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
		name = "pwe_gameplay_seeing_a_shield_stormvermin",
		response = "pwe_gameplay_seeing_a_shield_stormvermin",
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
		name = "pwe_gameplay_seeing_a_Skaven_warpfire_thrower",
		response = "pwe_gameplay_seeing_a_Skaven_warpfire_thrower",
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
		name = "pwe_gameplay_seeing_a_stormfiend",
		response = "pwe_gameplay_seeing_a_stormfiend",
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
		name = "pwe_gameplay_seeing_a_troll",
		response = "pwe_gameplay_seeing_a_troll",
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_plague_combat",
		response = "pwe_gameplay_hearing_a_chaos_wizard_plague_combat",
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_leech",
		response = "pwe_gameplay_hearing_a_chaos_wizard_leech",
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
				"user_context",
				"enemies_close",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_chaos_wizard_leech",
		response = "pwe_gameplay_seeing_a_chaos_wizard_leech",
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
				"wood_elf"
			},
			{
				"query_context",
				"distance",
				OP.GTEQ,
				4
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
				60
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
		name = "pwe_gameplay_killing_a_chaos_wizard_leech",
		response = "pwe_gameplay_killing_a_chaos_wizard_leech",
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
				"wood_elf_special_kills_in_row",
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
				"dwarf_ranger_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_ambush_horde_spawned",
		response = "pwe_gameplay_ambush_horde_spawned",
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
		name = "pwe_gameplay_hearing_a_standard_bearer",
		response = "pwe_gameplay_hearing_a_standard_bearer",
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
		name = "pwe_gameplay_hearing_a_standard_bearer_crater",
		response = "pwe_gameplay_hearing_a_standard_bearer_crater",
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
		name = "pwe_gameplay_standard_bearer_has_planted_standard",
		response = "pwe_gameplay_standard_bearer_has_planted_standard",
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
		name = "pwe_gameplay_standard_bearer_has_planted_standard_crater",
		response = "pwe_gameplay_standard_bearer_has_planted_standard_crater",
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
		name = "pwe_gameplay_standard_bearer_buff_active",
		response = "pwe_gameplay_standard_bearer_buff_active",
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
		name = "pwe_gameplay_standard_bearer_buff_deactivated",
		response = "pwe_gameplay_standard_bearer_buff_deactivated",
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
		name = "pwe_gameplay_incoming_bestigor_attack",
		response = "pwe_gameplay_incoming_bestigor_attack",
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
		name = "pwe_gameplay_hearing_a_minotaur",
		response = "pwe_gameplay_hearing_a_minotaur",
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
		name = "pwe_gameplay_killing_a_minotaur",
		response = "pwe_gameplay_killing_a_minotaur",
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
				"wood_elf_special_kills_in_row",
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
				"empire_soldier_special_kills_in_row",
				OP.NUMSET,
				0
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_seeing_a_ungor_archer",
		response = "pwe_gameplay_seeing_a_ungor_archer",
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
		name = "pwe_gameplay_incoming_attack",
		response = "pwe_gameplay_incoming_attack",
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
		name = "pwe_objective_interacting_with_objective",
		response = "pwe_objective_interacting_with_objective",
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
		name = "pwe_objective_nearing_objective_deadline",
		response = "pwe_objective_nearing_objective_deadline",
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
		name = "pwe_objective_achieved_all_but_one_goal",
		response = "pwe_objective_achieved_all_but_one_goal",
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
		name = "pwe_objective_goal_achieved_more_left",
		response = "pwe_objective_goal_achieved_more_left",
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
		name = "pwe_objective_goal_achieved_escape",
		response = "pwe_objective_goal_achieved_escape",
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
		name = "pwe_objective_correct_path_this_way",
		response = "pwe_objective_correct_path_this_way",
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
				"time_since_found_way",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_up",
		response = "pwe_objective_correct_path_up",
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
				"time_since_found_way_up",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_down",
		response = "pwe_objective_correct_path_down",
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
				"time_since_found_way_down",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_bridge",
		response = "pwe_objective_correct_path_bridge",
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
				"time_since_found_way_bridge",
				OP.TIMEDIFF,
				OP.GT,
				20
			}
		},
		on_done = {
			{
				"faction_memory",
				"time_since_found way_bridge",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_objective_correct_path_street",
		response = "pwe_objective_correct_path_street",
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
				"time_since_found_way_street",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_door",
		response = "pwe_objective_correct_path_door",
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
				"time_since_found_way_door",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_stairs_up",
		response = "pwe_objective_correct_path_stairs_up",
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
				"time_since_found_way_stairs_up",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_stairs_down",
		response = "pwe_objective_correct_path_stairs_down",
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
				"time_since_found_way_stairs_down",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_spotting_ferry_lady",
		response = "pwe_spotting_ferry_lady",
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
		name = "pwe_gameplay_dead_body",
		response = "pwe_gameplay_dead_body",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_gameplay_dead_end",
		response = "pwe_gameplay_dead_end",
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
		name = "pwe_objective_correct_path_across",
		response = "pwe_objective_correct_path_across",
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
				"time_since_correct_path_across",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_alley",
		response = "pwe_objective_correct_path_alley",
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
				"time_since_correct_path_alley",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_ladder_down",
		response = "pwe_objective_correct_path_ladder_down",
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
				"time_since_correct_path_ladder_down",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_objective_correct_path_ladder_up",
		response = "pwe_objective_correct_path_ladder_up",
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
				"time_since_correct_path_ladder_up",
				OP.TIMEDIFF,
				OP.GT,
				20
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
		name = "pwe_gameplay_casual_quotes",
		response = "pwe_gameplay_casual_quotes",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		response = "pwe_gameplay_empire_soldier_being_helped_up",
		name = "pwe_gameplay_empire_soldier_being_helped_up",
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
		response = "pwe_gameplay_witch_hunter_being_helped_up",
		name = "pwe_gameplay_witch_hunter_being_helped_up",
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
		response = "pwe_gameplay_dwarf_ranger_being_helped_up",
		name = "pwe_gameplay_dwarf_ranger_being_helped_up",
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
		response = "pwe_gameplay_bright_wizard_being_helped_up",
		name = "pwe_gameplay_bright_wizard_being_helped_up",
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
		name = "pwe_gameplay_healing_empire_soldier",
		response = "pwe_gameplay_healing_empire_soldier",
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
		name = "pwe_gameplay_healing_witch_hunter",
		response = "pwe_gameplay_healing_witch_hunter",
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
		name = "pwe_gameplay_healing_dwarf_ranger",
		response = "pwe_gameplay_healing_dwarf_ranger",
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
		name = "pwe_gameplay_healing_bright_wizard",
		response = "pwe_gameplay_healing_bright_wizard",
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
		name = "pwe_gameplay_helped_by_empire_soldier",
		response = "pwe_gameplay_helped_by_empire_soldier",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_helped_by_witch_hunter",
		response = "pwe_gameplay_helped_by_witch_hunter",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_helped_by_dwarf_ranger",
		response = "pwe_gameplay_helped_by_dwarf_ranger",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_helped_by_bright_wizard",
		response = "pwe_gameplay_helped_by_bright_wizard",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_low_on_health",
		response = "pwe_gameplay_low_on_health",
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
		name = "pwe_gameplay_empire_soldier_low_on_health",
		response = "pwe_gameplay_empire_soldier_low_on_health",
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
				"wood_elf"
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
		name = "pwe_gameplay_witch_hunter_low_on_health",
		response = "pwe_gameplay_witch_hunter_low_on_health",
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
				"wood_elf"
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
		name = "pwe_gameplay_dwarf_ranger_low_on_health",
		response = "pwe_gameplay_dwarf_ranger_low_on_health",
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
				"wood_elf"
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
		name = "pwe_gameplay_bright_wizard_low_on_health",
		response = "pwe_gameplay_bright_wizard_low_on_health",
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
				"wood_elf"
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
		name = "pwe_gameplay_spots_ammo",
		response = "pwe_gameplay_spots_ammo",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_gameplay_spots_health",
		response = "pwe_gameplay_spots_health",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_healing_draught",
		response = "pwe_gameplay_healing_draught",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_spots_potion",
		response = "pwe_gameplay_spots_potion",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_spots_bomb",
		response = "pwe_gameplay_spots_bomb",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_out_of_ammo",
		response = "pwe_gameplay_out_of_ammo",
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
		name = "pwe_gameplay_using_potion",
		response = "pwe_gameplay_using_potion",
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
		name = "pwe_gameplay_self_heal",
		response = "pwe_gameplay_self_heal",
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
		name = "pwe_gameplay_throwing_bomb",
		response = "pwe_gameplay_throwing_bomb",
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
		name = "pwe_gameplay_weapon_flair_offensive",
		response = "pwe_gameplay_weapon_flair_offensive",
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
		name = "pwe_gameplay_weapon_flair_defensive",
		response = "pwe_gameplay_weapon_flair_defensive",
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
		name = "pwe_gameplay_friendly_fire_witch_hunter",
		response = "pwe_gameplay_friendly_fire_witch_hunter",
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
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_friendly_fire_dwarf_ranger",
		response = "pwe_gameplay_friendly_fire_dwarf_ranger",
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
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_friendly_fire_bright_wizard",
		response = "pwe_gameplay_friendly_fire_bright_wizard",
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
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_friendly_fire_empire_soldier",
		response = "pwe_gameplay_friendly_fire_empire_soldier",
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
				"wood_elf"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_encouraging_words",
		response = "pwe_gameplay_encouraging_words",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
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
		name = "pwe_gameplay_special_enemy_kill_melee",
		response = "pwe_gameplay_special_enemy_kill_melee",
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
				"wood_elf"
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
		name = "pwe_gameplay_special_enemy_kill_ranged",
		response = "pwe_gameplay_special_enemy_kill_ranged",
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
				"wood_elf"
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
		name = "pwe_gameplay_empire_soldier_on_a_frenzy",
		response = "pwe_gameplay_empire_soldier_on_a_frenzy",
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
				"wood_elf"
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
		name = "pwe_gameplay_witch_hunter_on_a_frenzy",
		response = "pwe_gameplay_witch_hunter_on_a_frenzy",
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
				"wood_elf"
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
		name = "pwe_gameplay_dwarf_ranger_on_a_frenzy",
		response = "pwe_gameplay_dwarf_ranger_on_a_frenzy",
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
				"wood_elf"
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
		name = "pwe_gameplay_bright_wizard_on_a_frenzy",
		response = "pwe_gameplay_bright_wizard_on_a_frenzy",
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
				"wood_elf"
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
		name = "pwe_gameplay_armoured_enemy_witch_hunter",
		response = "pwe_gameplay_armoured_enemy_witch_hunter",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_armoured_enemy_bright_wizard",
		response = "pwe_gameplay_armoured_enemy_bright_wizard",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_armoured_enemy_dwarf_ranger",
		response = "pwe_gameplay_armoured_enemy_dwarf_ranger",
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
				"wood_elf"
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
				"wood_elf"
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
		name = "pwe_gameplay_armoured_enemy_empire_soldier",
		response = "pwe_gameplay_armoured_enemy_empire_soldier",
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
				"wood_elf"
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
				"wood_elf"
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
		response = "pwe_ability_activate_shade",
		name = "pwe_ability_activate_shade",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_shade"
			}
		}
	})
	define_rule({
		response = "pwe_activate_ability_handmaiden",
		name = "pwe_activate_ability_handmaiden",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_maidenguard"
			}
		}
	})
	define_rule({
		response = "pwe_activate_ability_waystalker",
		name = "pwe_activate_ability_waystalker",
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
				"wood_elf"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			},
			{
				"user_context",
				"player_career",
				OP.EQ,
				"we_waywatcher"
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_bile_troll_incapacitaded",
		response = "pwe_gameplay_bile_troll_incapacitaded",
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
		name = "pwe_gameplay_empire_soldier_eaten",
		response = "pwe_gameplay_empire_soldier_eaten",
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
		name = "pwe_gameplay_bright_wizard_eaten",
		response = "pwe_gameplay_bright_wizard_eaten",
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
		name = "pwe_gameplay_dwarf_ranger_eaten",
		response = "pwe_gameplay_dwarf_ranger_eaten",
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
		name = "pwe_gameplay_witch_hunter_eaten",
		response = "pwe_gameplay_witch_hunter_eaten",
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
		name = "pwe_gameplay_tips_wizard_wind",
		response = "pwe_gameplay_tips_wizard_wind",
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
		name = "pwe_gameplay_tips_wizard_plague",
		response = "pwe_gameplay_tips_wizard_plague",
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
		name = "pwe_gameplay_parry_witch_hunter",
		response = "pwe_gameplay_parry_witch_hunter",
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
		name = "pwe_gameplay_parry_dwarf_ranger",
		response = "pwe_gameplay_parry_dwarf_ranger",
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
		name = "pwe_gameplay_parry_bright_wizard",
		response = "pwe_gameplay_parry_bright_wizard",
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
		name = "pwe_gameplay_parry_empire_soldier",
		response = "pwe_gameplay_parry_empire_soldier",
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
	add_dialogues({
		pwe_gameplay_spots_bomb = {
			sound_events_n = 19,
			face_animations_n = 19,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 19,
			sound_events = {
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_07",
				"pwe_gameplay_spots_bomb_08",
				"pwe_gameplay_spots_bomb_09",
				"pwe_gameplay_spots_bomb_10",
				"pwe_gameplay_spots_bomb_11",
				"pwe_gameplay_spots_bomb_12",
				"pwe_gameplay_spots_bomb_13",
				"pwe_gameplay_spots_bomb_14",
				"pwe_gameplay_spots_bomb_15",
				"pwe_gameplay_spots_bomb_16",
				"pwe_gameplay_spots_bomb_17",
				"pwe_gameplay_spots_bomb_18",
				"pwe_gameplay_spots_bomb_19",
				"pwe_gameplay_spots_bomb_20",
				"pwe_gameplay_spots_bomb_21",
				"pwe_gameplay_spots_bomb_22",
				"pwe_gameplay_spots_bomb_23"
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
				"face_happy"
			},
			sound_events_duration = {
				1.3423854112625,
				0.67687499523163,
				3.1176874637604,
				1.8123124837875,
				1.4264999628067,
				2.6566874980927,
				4.0704374313355,
				3.977874994278,
				2.6822082996368,
				1.5538749694824,
				2.1643958091736,
				1.8904999494553,
				1.8458958864212,
				2.3039584159851,
				4.2709374427795,
				3.1654167175293,
				4.2917084693909,
				1.6194791793823,
				2.5567500591278
			},
			localization_strings = {
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_07",
				"pwe_gameplay_spots_bomb_08",
				"pwe_gameplay_spots_bomb_09",
				"pwe_gameplay_spots_bomb_10",
				"pwe_gameplay_spots_bomb_11",
				"pwe_gameplay_spots_bomb_12",
				"pwe_gameplay_spots_bomb_13",
				"pwe_gameplay_spots_bomb_14",
				"pwe_gameplay_spots_bomb_15",
				"pwe_gameplay_spots_bomb_16",
				"pwe_gameplay_spots_bomb_17",
				"pwe_gameplay_spots_bomb_18",
				"pwe_gameplay_spots_bomb_19",
				"pwe_gameplay_spots_bomb_20",
				"pwe_gameplay_spots_bomb_21",
				"pwe_gameplay_spots_bomb_22",
				"pwe_gameplay_spots_bomb_23"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_chaos_wizard_wind = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_04"
			},
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
			sound_events_duration = {
				2.8364791870117,
				2.8889582157135,
				2.5443542003632,
				4.3130730390549
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_friendly_fire_dwarf_ranger = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_friendly_fire_dwarf_ranger_05",
				"pwe_gameplay_friendly_fire_dwarf_ranger_06",
				"pwe_gameplay_friendly_fire_dwarf_ranger_07",
				"pwe_gameplay_friendly_fire_dwarf_ranger_08",
				"pwe_gameplay_friendly_fire_dwarf_ranger_09"
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
				2.6254167556763,
				2.7580208778381,
				3.2763750553131,
				3.3986666202545,
				4.6755623817444
			},
			localization_strings = {
				"pwe_gameplay_friendly_fire_dwarf_ranger_05",
				"pwe_gameplay_friendly_fire_dwarf_ranger_06",
				"pwe_gameplay_friendly_fire_dwarf_ranger_07",
				"pwe_gameplay_friendly_fire_dwarf_ranger_08",
				"pwe_gameplay_friendly_fire_dwarf_ranger_09"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_stairs_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_stairs_down_01",
				"pwe_objective_correct_path_stairs_down_03",
				"pwe_objective_correct_path_stairs_down_05",
				"pwe_objective_correct_path_stairs_down_06"
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
			sound_events_duration = {
				1.3840833902359,
				1.4083541631699,
				1.6814583539963,
				1.4701875448227
			},
			localization_strings = {
				"pwe_objective_correct_path_stairs_down_01",
				"pwe_objective_correct_path_stairs_down_03",
				"pwe_objective_correct_path_stairs_down_05",
				"pwe_objective_correct_path_stairs_down_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_gutter_runner_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_gutter_runner_combat_03",
				"pwe_gameplay_hearing_a_gutter_runner_combat_05",
				"pwe_gameplay_hearing_a_gutter_runner_combat_06",
				"pwe_gameplay_hearing_a_gutter_runner_combat_07",
				"pwe_gameplay_hearing_a_gutter_runner_combat_08",
				"pwe_gameplay_hearing_a_gutter_runner_combat_09",
				"pwe_gameplay_hearing_a_gutter_runner_combat_10",
				"pwe_gameplay_hearing_a_gutter_runner_combat_11"
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				2.3342916965485,
				1.9667083024979,
				2.2597291469574,
				2.516937494278,
				3.3567292690277,
				2.3069584369659,
				2.0373332500458,
				3.6738333702087
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_gutter_runner_combat_03",
				"pwe_gameplay_hearing_a_gutter_runner_combat_05",
				"pwe_gameplay_hearing_a_gutter_runner_combat_06",
				"pwe_gameplay_hearing_a_gutter_runner_combat_07",
				"pwe_gameplay_hearing_a_gutter_runner_combat_08",
				"pwe_gameplay_hearing_a_gutter_runner_combat_09",
				"pwe_gameplay_hearing_a_gutter_runner_combat_10",
				"pwe_gameplay_hearing_a_gutter_runner_combat_11"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_across = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_across_01",
				"pwe_objective_correct_path_across_02",
				"pwe_objective_correct_path_across_03",
				"pwe_objective_correct_path_across_04"
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
			sound_events_duration = {
				0.96797919273376,
				1.2964999675751,
				1.1399166584015,
				0.82406252622604
			},
			localization_strings = {
				"pwe_objective_correct_path_across_01",
				"pwe_objective_correct_path_across_02",
				"pwe_objective_correct_path_across_03",
				"pwe_objective_correct_path_across_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_potion = {
			sound_events_n = 15,
			face_animations_n = 15,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 15,
			sound_events = {
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_06",
				"pwe_gameplay_spots_potion_07",
				"pwe_gameplay_spots_potion_08",
				"pwe_gameplay_spots_potion_09",
				"pwe_gameplay_spots_potion_10",
				"pwe_gameplay_spots_potion_11",
				"pwe_gameplay_spots_potion_12",
				"pwe_gameplay_spots_potion_13",
				"pwe_gameplay_spots_potion_14",
				"pwe_gameplay_spots_potion_15",
				"pwe_gameplay_spots_potion_16",
				"pwe_gameplay_spots_potion_17",
				"pwe_gameplay_spots_potion_18"
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
			sound_events_duration = {
				1.4769062995911,
				1.2878124713898,
				1.5954375267029,
				2.1366667747498,
				1.860687494278,
				2.0658540725708,
				1.7201458215714,
				3.5677082538605,
				2.9433541297913,
				3.028416633606,
				2.1817083358765,
				1.9546041488648,
				4.4945001602173,
				1.7592500448227,
				1.1436458826065
			},
			localization_strings = {
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_06",
				"pwe_gameplay_spots_potion_07",
				"pwe_gameplay_spots_potion_08",
				"pwe_gameplay_spots_potion_09",
				"pwe_gameplay_spots_potion_10",
				"pwe_gameplay_spots_potion_11",
				"pwe_gameplay_spots_potion_12",
				"pwe_gameplay_spots_potion_13",
				"pwe_gameplay_spots_potion_14",
				"pwe_gameplay_spots_potion_15",
				"pwe_gameplay_spots_potion_16",
				"pwe_gameplay_spots_potion_17",
				"pwe_gameplay_spots_potion_18"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_self_heal = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_self_heal_01",
				"pwe_gameplay_self_heal_06",
				"pwe_gameplay_self_heal_07",
				"pwe_gameplay_self_heal_08",
				"pwe_gameplay_self_heal_09",
				"pwe_gameplay_self_heal_10"
			},
			dialogue_animations = {
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
				"face_exhausted"
			},
			sound_events_duration = {
				1.5633333921433,
				1.4367291927338,
				3.0475833415985,
				1.8029166460037,
				2.23472905159,
				3.733416557312
			},
			localization_strings = {
				"pwe_gameplay_self_heal_01",
				"pwe_gameplay_self_heal_06",
				"pwe_gameplay_self_heal_07",
				"pwe_gameplay_self_heal_08",
				"pwe_gameplay_self_heal_09",
				"pwe_gameplay_self_heal_10"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dwarf_ranger_grabbed = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_dwarf_ranger_grabbed_07",
				"pwe_gameplay_dwarf_ranger_grabbed_08",
				"pwe_gameplay_dwarf_ranger_grabbed_09",
				"pwe_gameplay_dwarf_ranger_grabbed_10",
				"pwe_gameplay_dwarf_ranger_grabbed_11",
				"pwe_gameplay_dwarf_ranger_grabbed_12",
				"pwe_gameplay_dwarf_ranger_grabbed_13",
				"pwe_gameplay_dwarf_ranger_grabbed_14"
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
			sound_events_duration = {
				3.6150000095367,
				2.3082292079926,
				3.3894584178925,
				3.7360000610352,
				5.7177500724792,
				1.5437083244324,
				3.559666633606,
				4.6118330955505
			},
			localization_strings = {
				"pwe_gameplay_dwarf_ranger_grabbed_07",
				"pwe_gameplay_dwarf_ranger_grabbed_08",
				"pwe_gameplay_dwarf_ranger_grabbed_09",
				"pwe_gameplay_dwarf_ranger_grabbed_10",
				"pwe_gameplay_dwarf_ranger_grabbed_11",
				"pwe_gameplay_dwarf_ranger_grabbed_12",
				"pwe_gameplay_dwarf_ranger_grabbed_13",
				"pwe_gameplay_dwarf_ranger_grabbed_14"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_stormfiend_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_stormfiend_combat_01",
				"pwe_gameplay_hearing_a_stormfiend_combat_02",
				"pwe_gameplay_hearing_a_stormfiend_combat_03",
				"pwe_gameplay_hearing_a_stormfiend_combat_04",
				"pwe_gameplay_hearing_a_stormfiend_combat_05",
				"pwe_gameplay_hearing_a_stormfiend_combat_06",
				"pwe_gameplay_hearing_a_stormfiend_combat_07",
				"pwe_gameplay_hearing_a_stormfiend_combat_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.8753333091736,
				1.2236458063126,
				1.2701041698456,
				2.3158750534058,
				2.0139374732971,
				1.6896458864212,
				3.1184165477753,
				2.5741875171661
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_stormfiend_combat_01",
				"pwe_gameplay_hearing_a_stormfiend_combat_02",
				"pwe_gameplay_hearing_a_stormfiend_combat_03",
				"pwe_gameplay_hearing_a_stormfiend_combat_04",
				"pwe_gameplay_hearing_a_stormfiend_combat_05",
				"pwe_gameplay_hearing_a_stormfiend_combat_06",
				"pwe_gameplay_hearing_a_stormfiend_combat_07",
				"pwe_gameplay_hearing_a_stormfiend_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dwarf_ranger_eaten = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_dwarf_ranger_eaten_01",
				"pwe_dwarf_ranger_eaten_02",
				"pwe_dwarf_ranger_eaten_03",
				"pwe_dwarf_ranger_eaten_04",
				"pwe_dwarf_ranger_eaten_05",
				"pwe_dwarf_ranger_eaten_06",
				"pwe_dwarf_ranger_eaten_07"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				4.36172914505,
				4.0829792022705,
				3.7793333530426,
				5.2193751335144,
				4.7966041564941,
				7.7630834579468,
				7.2326040267944
			},
			localization_strings = {
				"pwe_dwarf_ranger_eaten_01",
				"pwe_dwarf_ranger_eaten_02",
				"pwe_dwarf_ranger_eaten_03",
				"pwe_dwarf_ranger_eaten_04",
				"pwe_dwarf_ranger_eaten_05",
				"pwe_dwarf_ranger_eaten_06",
				"pwe_dwarf_ranger_eaten_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_armoured_enemy_empire_soldier = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_armoured_enemy_empire_soldier_04",
				"pwe_gameplay_armoured_enemy_empire_soldier_05",
				"pwe_gameplay_armoured_enemy_empire_soldier_06",
				"pwe_gameplay_armoured_enemy_empire_soldier_07",
				"pwe_gameplay_armoured_enemy_empire_soldier_08",
				"pwe_gameplay_armoured_enemy_empire_soldier_09",
				"pwe_gameplay_armoured_enemy_empire_soldier_10",
				"pwe_gameplay_armoured_enemy_empire_soldier_11"
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
				1.8737083673477,
				1.9145208597183,
				2.5660207271576,
				1.6040208339691,
				3.7992498874664,
				2.0832707881927,
				2.2199583053589,
				3.9684584140778
			},
			localization_strings = {
				"pwe_gameplay_armoured_enemy_empire_soldier_04",
				"pwe_gameplay_armoured_enemy_empire_soldier_05",
				"pwe_gameplay_armoured_enemy_empire_soldier_06",
				"pwe_gameplay_armoured_enemy_empire_soldier_07",
				"pwe_gameplay_armoured_enemy_empire_soldier_08",
				"pwe_gameplay_armoured_enemy_empire_soldier_09",
				"pwe_gameplay_armoured_enemy_empire_soldier_10",
				"pwe_gameplay_armoured_enemy_empire_soldier_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_shield_stormvermin = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_shield_stormvermin_01",
				"pwe_gameplay_seeing_a_shield_stormvermin_02",
				"pwe_gameplay_seeing_a_shield_stormvermin_03",
				"pwe_gameplay_seeing_a_shield_stormvermin_04",
				"pwe_gameplay_seeing_a_shield_stormvermin_05",
				"pwe_gameplay_seeing_a_shield_stormvermin_06",
				"pwe_gameplay_seeing_a_shield_stormvermin_07",
				"pwe_gameplay_seeing_a_shield_stormvermin_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.1078541278839,
				2.0900626182556,
				2.6933541297913,
				3.4985208511352,
				4.4747500419617,
				3.1501874923706,
				3.7799582481384,
				1.7827708721161
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_shield_stormvermin_01",
				"pwe_gameplay_seeing_a_shield_stormvermin_02",
				"pwe_gameplay_seeing_a_shield_stormvermin_03",
				"pwe_gameplay_seeing_a_shield_stormvermin_04",
				"pwe_gameplay_seeing_a_shield_stormvermin_05",
				"pwe_gameplay_seeing_a_shield_stormvermin_06",
				"pwe_gameplay_seeing_a_shield_stormvermin_07",
				"pwe_gameplay_seeing_a_shield_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_stairs_up = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_stairs_up_03",
				"pwe_objective_correct_path_stairs_up_05",
				"pwe_objective_correct_path_stairs_up_06",
				"pwe_objective_correct_path_stairs_up_07"
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
			sound_events_duration = {
				1.3854999542236,
				1.9670000076294,
				2.7918541431427,
				1.4728333353996
			},
			localization_strings = {
				"pwe_objective_correct_path_stairs_up_03",
				"pwe_objective_correct_path_stairs_up_05",
				"pwe_objective_correct_path_stairs_up_06",
				"pwe_objective_correct_path_stairs_up_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				1.0336666107178,
				2.3504166603088,
				1.9103749990463,
				1.4423958063126,
				1.7308125495911,
				3.0026667118073,
				1.345166683197,
				1.7238750457764
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_01",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_02",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_03",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_04",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_05",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_06",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_07",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_globadier = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_killing_globadier_02",
				"pwe_gameplay_killing_globadier_05",
				"pwe_gameplay_killing_globadier_06",
				"pwe_gameplay_killing_globadier_07"
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
				1.9348750114441,
				2.9685833454132,
				2.0719792842865,
				3.7151665687561
			},
			localization_strings = {
				"pwe_gameplay_killing_globadier_02",
				"pwe_gameplay_killing_globadier_05",
				"pwe_gameplay_killing_globadier_06",
				"pwe_gameplay_killing_globadier_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_parry_bright_wizard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_parry_bright_wizard_01",
				"pwe_gameplay_parry_bright_wizard_02",
				"pwe_gameplay_parry_bright_wizard_03",
				"pwe_gameplay_parry_bright_wizard_04"
			},
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
			sound_events_duration = {
				1.5141667127609,
				2.0058333873749,
				1.8093750476837,
				2.393812417984
			},
			localization_strings = {
				"pwe_gameplay_parry_bright_wizard_01",
				"pwe_gameplay_parry_bright_wizard_02",
				"pwe_gameplay_parry_bright_wizard_03",
				"pwe_gameplay_parry_bright_wizard_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_standard_bearer_has_planted_standard = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_standard_bearer_has_planted_standard_01",
				"pwe_gameplay_standard_bearer_has_planted_standard_02",
				"pwe_gameplay_standard_bearer_has_planted_standard_03",
				"pwe_gameplay_standard_bearer_has_planted_standard_04",
				"pwe_gameplay_standard_bearer_has_planted_standard_05",
				"pwe_gameplay_standard_bearer_has_planted_standard_06",
				"pwe_gameplay_standard_bearer_has_planted_standard_07",
				"pwe_gameplay_standard_bearer_has_planted_standard_08"
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
				2.2107501029968,
				1.9117708206177,
				2.3186042308807,
				2.4476666450501,
				2.1475417017937,
				2.0728125572205,
				2.331312417984,
				2.2620208263397
			},
			localization_strings = {
				"pwe_gameplay_standard_bearer_has_planted_standard_01",
				"pwe_gameplay_standard_bearer_has_planted_standard_02",
				"pwe_gameplay_standard_bearer_has_planted_standard_03",
				"pwe_gameplay_standard_bearer_has_planted_standard_04",
				"pwe_gameplay_standard_bearer_has_planted_standard_05",
				"pwe_gameplay_standard_bearer_has_planted_standard_06",
				"pwe_gameplay_standard_bearer_has_planted_standard_07",
				"pwe_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_globadier = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_hearing_a_globadier_04",
				"pwe_gameplay_hearing_a_globadier_07",
				"pwe_gameplay_hearing_a_globadier_08",
				"pwe_gameplay_hearing_a_globadier_09",
				"pwe_gameplay_hearing_a_globadier_10",
				"pwe_gameplay_hearing_a_globadier_11",
				"pwe_gameplay_hearing_a_globadier_12"
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				1.6347291469574,
				1.5507082939148,
				3.8670415878296,
				2.2941875457764,
				2.1193749904633,
				2.5058333873749,
				2.1921875476837
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_globadier_04",
				"pwe_gameplay_hearing_a_globadier_07",
				"pwe_gameplay_hearing_a_globadier_08",
				"pwe_gameplay_hearing_a_globadier_09",
				"pwe_gameplay_hearing_a_globadier_10",
				"pwe_gameplay_hearing_a_globadier_11",
				"pwe_gameplay_hearing_a_globadier_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_incoming_bestigor_attack = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_incoming_bestigor_attack_01",
				"pwe_gameplay_incoming_bestigor_attack_02",
				"pwe_gameplay_incoming_bestigor_attack_03",
				"pwe_gameplay_incoming_bestigor_attack_04",
				"pwe_gameplay_incoming_bestigor_attack_05",
				"pwe_gameplay_incoming_bestigor_attack_06",
				"pwe_gameplay_incoming_bestigor_attack_07",
				"pwe_gameplay_incoming_bestigor_attack_08"
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
				1.5793541669846,
				1.4682083129883,
				1.7559167146683,
				1.0029375553131,
				1.7890000343323,
				2.4123125076294,
				1.7423332929611,
				1.4182708263397
			},
			localization_strings = {
				"pwe_gameplay_incoming_bestigor_attack_01",
				"pwe_gameplay_incoming_bestigor_attack_02",
				"pwe_gameplay_incoming_bestigor_attack_03",
				"pwe_gameplay_incoming_bestigor_attack_04",
				"pwe_gameplay_incoming_bestigor_attack_05",
				"pwe_gameplay_incoming_bestigor_attack_06",
				"pwe_gameplay_incoming_bestigor_attack_07",
				"pwe_gameplay_incoming_bestigor_attack_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_chaos_warrior_champion = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_killing_a_chaos_warrior_champion_01",
				"pwe_gameplay_killing_a_chaos_warrior_champion_02",
				"pwe_gameplay_killing_a_chaos_warrior_champion_03",
				"pwe_gameplay_killing_a_chaos_warrior_champion_04",
				"pwe_gameplay_killing_a_chaos_warrior_champion_05",
				"pwe_gameplay_killing_a_chaos_warrior_champion_06",
				"pwe_gameplay_killing_a_chaos_warrior_champion_07",
				"pwe_gameplay_killing_a_chaos_warrior_champion_08"
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
				2.4873957633972,
				3.0129792690277,
				2.2350208759308,
				2.7226250171661,
				3.9506459236145,
				1.8351666927338,
				5.1636247634888,
				3.9527292251587
			},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_warrior_champion_01",
				"pwe_gameplay_killing_a_chaos_warrior_champion_02",
				"pwe_gameplay_killing_a_chaos_warrior_champion_03",
				"pwe_gameplay_killing_a_chaos_warrior_champion_04",
				"pwe_gameplay_killing_a_chaos_warrior_champion_05",
				"pwe_gameplay_killing_a_chaos_warrior_champion_06",
				"pwe_gameplay_killing_a_chaos_warrior_champion_07",
				"pwe_gameplay_killing_a_chaos_warrior_champion_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_chaos_spawn = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_spawn_01",
				"pwe_gameplay_seeing_a_chaos_spawn_02",
				"pwe_gameplay_seeing_a_chaos_spawn_03",
				"pwe_gameplay_seeing_a_chaos_spawn_04",
				"pwe_gameplay_seeing_a_chaos_spawn_05",
				"pwe_gameplay_seeing_a_chaos_spawn_06",
				"pwe_gameplay_seeing_a_chaos_spawn_07",
				"pwe_gameplay_seeing_a_chaos_spawn_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				4.1153750419617,
				1.5580832958221,
				4.1264791488647,
				4.2691249847412,
				2.7594792842865,
				1.3854583501816,
				3.2393749952316,
				3.3204584121704
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_spawn_01",
				"pwe_gameplay_seeing_a_chaos_spawn_02",
				"pwe_gameplay_seeing_a_chaos_spawn_03",
				"pwe_gameplay_seeing_a_chaos_spawn_04",
				"pwe_gameplay_seeing_a_chaos_spawn_05",
				"pwe_gameplay_seeing_a_chaos_spawn_06",
				"pwe_gameplay_seeing_a_chaos_spawn_07",
				"pwe_gameplay_seeing_a_chaos_spawn_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_pm = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pwe_gameplay_hearing_a_pm_01",
				"pwe_gameplay_hearing_a_pm_02",
				"pwe_gameplay_hearing_a_pm_03",
				"pwe_gameplay_hearing_a_pm_04",
				"pwe_gameplay_hearing_a_plague_monk_01",
				"pwe_gameplay_hearing_a_plague_monk_02",
				"pwe_gameplay_hearing_a_plague_monk_03",
				"pwe_gameplay_hearing_a_plague_monk_04",
				"pwe_gameplay_hearing_a_plague_monk_05",
				"pwe_gameplay_hearing_a_plague_monk_06",
				"pwe_gameplay_hearing_a_plague_monk_07",
				"pwe_gameplay_hearing_a_plague_monk_08"
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
			sound_events_duration = {
				4.540479183197,
				2.3999791145325,
				2.5640416145325,
				2.7484166622162,
				4.326229095459,
				3.0632290840149,
				4.4501042366028,
				1.9128541946411,
				1.1345208883286,
				1.4875625371933,
				2.3826665878296,
				1.163166642189
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_pm_01",
				"pwe_gameplay_hearing_a_pm_02",
				"pwe_gameplay_hearing_a_pm_03",
				"pwe_gameplay_hearing_a_pm_04",
				"pwe_gameplay_hearing_a_plague_monk_01",
				"pwe_gameplay_hearing_a_plague_monk_02",
				"pwe_gameplay_hearing_a_plague_monk_03",
				"pwe_gameplay_hearing_a_plague_monk_04",
				"pwe_gameplay_hearing_a_plague_monk_05",
				"pwe_gameplay_hearing_a_plague_monk_06",
				"pwe_gameplay_hearing_a_plague_monk_07",
				"pwe_gameplay_hearing_a_plague_monk_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_troll = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_troll_01",
				"pwe_gameplay_seeing_a_troll_02",
				"pwe_gameplay_seeing_a_troll_03",
				"pwe_gameplay_seeing_a_troll_04",
				"pwe_gameplay_seeing_a_troll_05",
				"pwe_gameplay_seeing_a_troll_06",
				"pwe_gameplay_seeing_a_troll_07",
				"pwe_gameplay_seeing_a_troll_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.4280207157135,
				3.0064375400543,
				3.2452082633972,
				3.419625043869,
				5.0482292175293,
				4.7795000076294,
				4.9144582748413,
				3.2971875667572
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_troll_01",
				"pwe_gameplay_seeing_a_troll_02",
				"pwe_gameplay_seeing_a_troll_03",
				"pwe_gameplay_seeing_a_troll_04",
				"pwe_gameplay_seeing_a_troll_05",
				"pwe_gameplay_seeing_a_troll_06",
				"pwe_gameplay_seeing_a_troll_07",
				"pwe_gameplay_seeing_a_troll_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_healing_witch_hunter = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_healing_witch_hunter_05",
				"pwe_gameplay_healing_witch_hunter_06",
				"pwe_gameplay_healing_witch_hunter_07",
				"pwe_gameplay_healing_witch_hunter_08",
				"pwe_gameplay_healing_witch_hunter_09"
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
				2.3687915802002,
				1.6280624866486,
				2.4640624523163,
				1.8775625228882,
				2.4450833797455
			},
			localization_strings = {
				"pwe_gameplay_healing_witch_hunter_05",
				"pwe_gameplay_healing_witch_hunter_06",
				"pwe_gameplay_healing_witch_hunter_07",
				"pwe_gameplay_healing_witch_hunter_08",
				"pwe_gameplay_healing_witch_hunter_09"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_skaven_ratling_gun_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_08",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_09"
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.3391457796097,
				1.6535625457764,
				0.94308334589005,
				1.8272082805634,
				1.6771041154861,
				2.2997708320618,
				2.0325417518616,
				2.0466248989105
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_03",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_04",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_05",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_06",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_07",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_08",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_combat_09"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_chaos_wizard_plague = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_killing_a_chaos_wizard_plague_01",
				"pwe_gameplay_killing_a_chaos_wizard_plague_02",
				"pwe_gameplay_killing_a_chaos_wizard_plague_03",
				"pwe_gameplay_killing_a_chaos_wizard_plague_04",
				"pwe_gameplay_killing_a_chaos_wizard_plague_05",
				"pwe_gameplay_killing_a_chaos_wizard_plague_06"
			},
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
			sound_events_duration = {
				3.4801249504089,
				2.5972082614899,
				2.7465000152588,
				3.8047082424164,
				1.7960416078568,
				1.8494999408722
			},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_wizard_plague_01",
				"pwe_gameplay_killing_a_chaos_wizard_plague_02",
				"pwe_gameplay_killing_a_chaos_wizard_plague_03",
				"pwe_gameplay_killing_a_chaos_wizard_plague_04",
				"pwe_gameplay_killing_a_chaos_wizard_plague_05",
				"pwe_gameplay_killing_a_chaos_wizard_plague_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bright_wizard_grabbed = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_bright_wizard_grabbed_07",
				"pwe_gameplay_bright_wizard_grabbed_08",
				"pwe_gameplay_bright_wizard_grabbed_09",
				"pwe_gameplay_bright_wizard_grabbed_10",
				"pwe_gameplay_bright_wizard_grabbed_11",
				"pwe_gameplay_bright_wizard_grabbed_12",
				"pwe_gameplay_bright_wizard_grabbed_13",
				"pwe_gameplay_bright_wizard_grabbed_14"
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
			sound_events_duration = {
				1.6706875562668,
				2.7205103635788,
				2.7308542728424,
				4.3336668014526,
				3.1238958835602,
				2.5383541584015,
				3.1680207252502,
				4.13516664505
			},
			localization_strings = {
				"pwe_gameplay_bright_wizard_grabbed_07",
				"pwe_gameplay_bright_wizard_grabbed_08",
				"pwe_gameplay_bright_wizard_grabbed_09",
				"pwe_gameplay_bright_wizard_grabbed_10",
				"pwe_gameplay_bright_wizard_grabbed_11",
				"pwe_gameplay_bright_wizard_grabbed_12",
				"pwe_gameplay_bright_wizard_grabbed_13",
				"pwe_gameplay_bright_wizard_grabbed_14"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_knocked_down = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_knocked_down_07",
				"pwe_gameplay_knocked_down_08",
				"pwe_gameplay_knocked_down_09",
				"pwe_gameplay_knocked_down_10",
				"pwe_gameplay_knocked_down_11",
				"pwe_gameplay_knocked_down_12",
				"pwe_gameplay_knocked_down_13",
				"pwe_gameplay_knocked_down_14"
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
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			sound_events_duration = {
				4.210916519165,
				2.595062494278,
				1.6604583263397,
				2.0502083301544,
				3.6810207366943,
				2.3218020200729,
				2.4833126068115,
				2.5234167575836
			},
			localization_strings = {
				"pwe_gameplay_knocked_down_07",
				"pwe_gameplay_knocked_down_08",
				"pwe_gameplay_knocked_down_09",
				"pwe_gameplay_knocked_down_10",
				"pwe_gameplay_knocked_down_11",
				"pwe_gameplay_knocked_down_12",
				"pwe_gameplay_knocked_down_13",
				"pwe_gameplay_knocked_down_14"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_door = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_door_02",
				"pwe_objective_correct_path_door_05",
				"pwe_objective_correct_path_door_06",
				"pwe_objective_correct_path_door_07"
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
			sound_events_duration = {
				1.471520781517,
				1.5507916212082,
				1.4201666116715,
				1.6846874952316
			},
			localization_strings = {
				"pwe_objective_correct_path_door_02",
				"pwe_objective_correct_path_door_05",
				"pwe_objective_correct_path_door_06",
				"pwe_objective_correct_path_door_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_special_enemy_kill_ranged = {
			sound_events_n = 13,
			face_animations_n = 13,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 13,
			sound_events = {
				"pwe_gameplay_special_enemy_kill_ranged_08",
				"pwe_gameplay_special_enemy_kill_ranged_09",
				"pwe_gameplay_special_enemy_kill_ranged_10",
				"pwe_gameplay_special_enemy_kill_ranged_11",
				"pwe_gameplay_special_enemy_kill_ranged_12",
				"pwe_gameplay_special_enemy_kill_ranged_13",
				"pwe_gameplay_special_enemy_kill_ranged_14",
				"pwe_gameplay_special_enemy_kill_ranged_15",
				"pwe_gameplay_special_enemy_kill_ranged_16",
				"pwe_gameplay_special_enemy_kill_ranged_17",
				"pwe_gameplay_special_enemy_kill_ranged_18",
				"pwe_gameplay_special_enemy_kill_ranged_19",
				"pwe_gameplay_special_enemy_kill_ranged_20"
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
			sound_events_duration = {
				3.1345000267029,
				2.9286875724792,
				2.0169582366943,
				3.8683958053589,
				1.4762916564941,
				2.3885834217072,
				3.3633542060852,
				2.1989061832428,
				3.8579375743866,
				4.6542081832886,
				2.6277499198914,
				2.3764998912811,
				2.4976665973663
			},
			localization_strings = {
				"pwe_gameplay_special_enemy_kill_ranged_08",
				"pwe_gameplay_special_enemy_kill_ranged_09",
				"pwe_gameplay_special_enemy_kill_ranged_10",
				"pwe_gameplay_special_enemy_kill_ranged_11",
				"pwe_gameplay_special_enemy_kill_ranged_12",
				"pwe_gameplay_special_enemy_kill_ranged_13",
				"pwe_gameplay_special_enemy_kill_ranged_14",
				"pwe_gameplay_special_enemy_kill_ranged_15",
				"pwe_gameplay_special_enemy_kill_ranged_16",
				"pwe_gameplay_special_enemy_kill_ranged_17",
				"pwe_gameplay_special_enemy_kill_ranged_18",
				"pwe_gameplay_special_enemy_kill_ranged_19",
				"pwe_gameplay_special_enemy_kill_ranged_20"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bile_troll_incapacitaded = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_bile_troll_incapacitaded_01",
				"pwe_gameplay_bile_troll_incapacitaded_02",
				"pwe_gameplay_bile_troll_incapacitaded_03",
				"pwe_gameplay_bile_troll_incapacitaded_04",
				"pwe_gameplay_bile_troll_incapacitaded_05",
				"pwe_gameplay_bile_troll_incapacitaded_06",
				"pwe_gameplay_bile_troll_incapacitaded_07",
				"pwe_gameplay_bile_troll_incapacitaded_08"
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				1.571729183197,
				2.3687083721161,
				5.2638540267944,
				2.7717916965485,
				3.9627709388733,
				2.7539479732513,
				3.5271248817444,
				2.2590832710266
			},
			localization_strings = {
				"pwe_gameplay_bile_troll_incapacitaded_01",
				"pwe_gameplay_bile_troll_incapacitaded_02",
				"pwe_gameplay_bile_troll_incapacitaded_03",
				"pwe_gameplay_bile_troll_incapacitaded_04",
				"pwe_gameplay_bile_troll_incapacitaded_05",
				"pwe_gameplay_bile_troll_incapacitaded_06",
				"pwe_gameplay_bile_troll_incapacitaded_07",
				"pwe_gameplay_bile_troll_incapacitaded_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_street = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_street_05",
				"pwe_objective_correct_path_street_06",
				"pwe_objective_correct_path_street_07",
				"pwe_objective_correct_path_street_08"
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
			sound_events_duration = {
				1.7166041135788,
				1.7951874732971,
				2.9897084236145,
				2.3159999847412
			},
			localization_strings = {
				"pwe_objective_correct_path_street_05",
				"pwe_objective_correct_path_street_06",
				"pwe_objective_correct_path_street_07",
				"pwe_objective_correct_path_street_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_friendly_fire_empire_soldier = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_friendly_fire_empire_soldier_05",
				"pwe_gameplay_friendly_fire_empire_soldier_06",
				"pwe_gameplay_friendly_fire_empire_soldier_07",
				"pwe_gameplay_friendly_fire_empire_soldier_08",
				"pwe_gameplay_friendly_fire_empire_soldier_09"
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
				1.9592708349228,
				4.18204164505,
				2.2787499427795,
				2.7457082271576,
				3.7659479379654
			},
			localization_strings = {
				"pwe_gameplay_friendly_fire_empire_soldier_05",
				"pwe_gameplay_friendly_fire_empire_soldier_06",
				"pwe_gameplay_friendly_fire_empire_soldier_07",
				"pwe_gameplay_friendly_fire_empire_soldier_08",
				"pwe_gameplay_friendly_fire_empire_soldier_09"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_chaos_wizard_leech = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_wizard_leech_01",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_02",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_03",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_05",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_06",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_07",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_08",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_09",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_10"
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
			sound_events_duration = {
				2.2136874198914,
				1.5780208110809,
				1.7673541307449,
				2.3019062280655,
				2.5504791736603,
				2.1742916107178,
				2.9770624637604,
				0.90370833873749,
				1.1975208520889
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_wizard_leech_01",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_02",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_03",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_05",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_06",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_07",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_08",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_09",
				"pwe_gameplay_seeing_a_chaos_wizard_leech_10"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_empire_soldier_low_on_health = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_empire_soldier_low_on_health_05",
				"pwe_gameplay_empire_soldier_low_on_health_06",
				"pwe_gameplay_empire_soldier_low_on_health_07",
				"pwe_gameplay_empire_soldier_low_on_health_08"
			},
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
			sound_events_duration = {
				3.4067499637604,
				1.8652083873749,
				2.1245625019074,
				1.8896458148956
			},
			localization_strings = {
				"pwe_gameplay_empire_soldier_low_on_health_05",
				"pwe_gameplay_empire_soldier_low_on_health_06",
				"pwe_gameplay_empire_soldier_low_on_health_07",
				"pwe_gameplay_empire_soldier_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_skaven_ratling_gun = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_17"
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
			sound_events_duration = {
				3.0633542537689,
				2.9933333396912,
				5.2647500038147,
				3.941999912262,
				2.4263541698456,
				2.4330208301544,
				2.491354227066,
				3.1932499408722,
				3.1164166927338,
				2.651645898819
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_08",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_09",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_10",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_11",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_12",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_13",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_14",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_15",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_16",
				"pwe_gameplay_hearing_a_Skaven_ratling_gun_17"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
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
				1.2997291088104,
				1.1890208721161,
				1.1809791326523,
				1.8490417003632,
				1.533979177475,
				2.4010624885559
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			randomize_indexes = {}
		},
		pwe_spotting_ferry_lady = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_spotting_ferry_lady_01",
				"pwe_spotting_ferry_lady_02",
				"pwe_spotting_ferry_lady_03",
				"pwe_spotting_ferry_lady_04",
				"pwe_spotting_ferry_lady_05",
				"pwe_spotting_ferry_lady_06"
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
			sound_events_duration = {
				0.96910417079926,
				2.2713749408722,
				0.99691665172577,
				0.85199999809265,
				2.048749923706,
				3.5497291088104
			},
			localization_strings = {
				"pwe_spotting_ferry_lady_01",
				"pwe_spotting_ferry_lady_02",
				"pwe_spotting_ferry_lady_03",
				"pwe_spotting_ferry_lady_04",
				"pwe_spotting_ferry_lady_05",
				"pwe_spotting_ferry_lady_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dwarf_ranger_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_dwarf_ranger_dead_05",
				"pwe_gameplay_dwarf_ranger_dead_06",
				"pwe_gameplay_dwarf_ranger_dead_07",
				"pwe_gameplay_dwarf_ranger_dead_08"
			},
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
			sound_events_duration = {
				2.9576666355133,
				3.3159167766571,
				1.6608958244324,
				2.8911874294281
			},
			localization_strings = {
				"pwe_gameplay_dwarf_ranger_dead_05",
				"pwe_gameplay_dwarf_ranger_dead_06",
				"pwe_gameplay_dwarf_ranger_dead_07",
				"pwe_gameplay_dwarf_ranger_dead_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_skaven_rat_ogre_combat = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_08",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_09",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_10"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
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
				"face_fear"
			},
			sound_events_duration = {
				1.5336250066757,
				2.7342500686645,
				2.4608540534973,
				2.3022291660309,
				2.556479215622,
				1.3515625,
				1.9678958654404
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_04",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_05",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_06",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_07",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_08",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_09",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_combat_10"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_taking_heavy_damage = {
			sound_events_n = 21,
			face_animations_n = 21,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 21,
			sound_events = {
				"pwe_gameplay_taking_heavy_damage_01",
				"pwe_gameplay_taking_heavy_damage_02",
				"pwe_gameplay_taking_heavy_damage_05",
				"pwe_gameplay_taking_heavy_damage_06",
				"pwe_gameplay_taking_heavy_damage_07",
				"pwe_gameplay_taking_heavy_damage_09",
				"pwe_gameplay_taking_heavy_damage_10",
				"pwe_gameplay_taking_heavy_damage_11",
				"pwe_gameplay_taking_heavy_damage_12",
				"pwe_gameplay_taking_heavy_damage_13",
				"pwe_gameplay_taking_heavy_damage_14",
				"pwe_gameplay_taking_heavy_damage_15",
				"pwe_gameplay_taking_heavy_damage_16",
				"pwe_gameplay_taking_heavy_damage_17",
				"pwe_gameplay_taking_heavy_damage_18",
				"pwe_gameplay_taking_heavy_damage_19",
				"pwe_gameplay_taking_heavy_damage_20",
				"pwe_gameplay_taking_heavy_damage_21",
				"pwe_gameplay_taking_heavy_damage_22",
				"pwe_gameplay_taking_heavy_damage_23",
				"pwe_gameplay_taking_heavy_damage_24"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.9819791316986,
				1.8044375181198,
				2.89808344841,
				3.0730209350586,
				1.3533333539963,
				3.3505625724792,
				4.3298125267029,
				2.6088750362396,
				3.0020625591278,
				3.8167083263397,
				4.1374583244324,
				2.1556875705719,
				2.6318647861481,
				2.0930833816528,
				1.8387291431427,
				1.7931666374207,
				2.1901249885559,
				3.153416633606,
				2.4361250400543,
				2.0566458702087,
				2.1824791431427
			},
			localization_strings = {
				"pwe_gameplay_taking_heavy_damage_01",
				"pwe_gameplay_taking_heavy_damage_02",
				"pwe_gameplay_taking_heavy_damage_05",
				"pwe_gameplay_taking_heavy_damage_06",
				"pwe_gameplay_taking_heavy_damage_07",
				"pwe_gameplay_taking_heavy_damage_09",
				"pwe_gameplay_taking_heavy_damage_10",
				"pwe_gameplay_taking_heavy_damage_11",
				"pwe_gameplay_taking_heavy_damage_12",
				"pwe_gameplay_taking_heavy_damage_13",
				"pwe_gameplay_taking_heavy_damage_14",
				"pwe_gameplay_taking_heavy_damage_15",
				"pwe_gameplay_taking_heavy_damage_16",
				"pwe_gameplay_taking_heavy_damage_17",
				"pwe_gameplay_taking_heavy_damage_18",
				"pwe_gameplay_taking_heavy_damage_19",
				"pwe_gameplay_taking_heavy_damage_20",
				"pwe_gameplay_taking_heavy_damage_21",
				"pwe_gameplay_taking_heavy_damage_22",
				"pwe_gameplay_taking_heavy_damage_23",
				"pwe_gameplay_taking_heavy_damage_24"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_wizard_wind = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_wizard_wind_01",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_02",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_03",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_04",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_05",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_06",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_07",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.7218542098999,
				4.7617707252502,
				5.2777290344238,
				5.2157502174377,
				2.0554583072662,
				1.9348750114441,
				2.0091457366943,
				1.935666680336
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_wizard_wind_01",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_02",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_03",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_04",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_05",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_06",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_07",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_scr = {
			sound_events_n = 15,
			face_animations_n = 15,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 15,
			sound_events = {
				"pwe_gameplay_seeing_a_scr_01",
				"pwe_gameplay_seeing_a_scr_02",
				"pwe_gameplay_seeing_a_scr_03",
				"pwe_gameplay_seeing_a_scr_04",
				"pwe_gameplay_seeing_a_scr_05",
				"pwe_gameplay_seeing_a_scr_06",
				"pwe_gameplay_seeing_a_scr_07",
				"pwe_gameplay_seeing_a_shield_clanrat_01",
				"pwe_gameplay_seeing_a_shield_clanrat_02",
				"pwe_gameplay_seeing_a_shield_clanrat_03",
				"pwe_gameplay_seeing_a_shield_clanrat_04",
				"pwe_gameplay_seeing_a_shield_clanrat_05",
				"pwe_gameplay_seeing_a_shield_clanrat_06",
				"pwe_gameplay_seeing_a_shield_clanrat_07",
				"pwe_gameplay_seeing_a_shield_clanrat_08"
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
			sound_events_duration = {
				2.3698854446411,
				1.9865833520889,
				2.5302083492279,
				1.926437497139,
				3.0526666641235,
				2.0884582996368,
				2.1860415935516,
				2.0720937848091,
				1.7137291431427,
				2.2819583415985,
				1.077645778656,
				2.3552916049957,
				1.5157083272934,
				2.8628542423248,
				1.963666677475
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_scr_01",
				"pwe_gameplay_seeing_a_scr_02",
				"pwe_gameplay_seeing_a_scr_03",
				"pwe_gameplay_seeing_a_scr_04",
				"pwe_gameplay_seeing_a_scr_05",
				"pwe_gameplay_seeing_a_scr_06",
				"pwe_gameplay_seeing_a_scr_07",
				"pwe_gameplay_seeing_a_shield_clanrat_01",
				"pwe_gameplay_seeing_a_shield_clanrat_02",
				"pwe_gameplay_seeing_a_shield_clanrat_03",
				"pwe_gameplay_seeing_a_shield_clanrat_04",
				"pwe_gameplay_seeing_a_shield_clanrat_05",
				"pwe_gameplay_seeing_a_shield_clanrat_06",
				"pwe_gameplay_seeing_a_shield_clanrat_07",
				"pwe_gameplay_seeing_a_shield_clanrat_08"
			},
			randomize_indexes = {}
		},
		pwe_targeted_by_ratling = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_targeted_by_ratling_09",
				"pwe_targeted_by_ratling_10",
				"pwe_targeted_by_ratling_11",
				"pwe_targeted_by_ratling_12",
				"pwe_targeted_by_ratling_13",
				"pwe_targeted_by_ratling_14",
				"pwe_targeted_by_ratling_15",
				"pwe_targeted_by_ratling_16"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.6314792633057,
				2.4801042079926,
				1.7560833692551,
				2.0771250724792,
				2.896187543869,
				3.1538333892822,
				1.8872499465942,
				1.7381249666214
			},
			localization_strings = {
				"pwe_targeted_by_ratling_09",
				"pwe_targeted_by_ratling_10",
				"pwe_targeted_by_ratling_11",
				"pwe_targeted_by_ratling_12",
				"pwe_targeted_by_ratling_13",
				"pwe_targeted_by_ratling_14",
				"pwe_targeted_by_ratling_15",
				"pwe_targeted_by_ratling_16"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_weapon_flair_defensive = {
			sound_events_n = 3,
			face_animations_n = 3,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 3,
			sound_events = {
				"pwe_gameplay_activating_magic_weapon_defensive_02",
				"pwe_gameplay_activating_magic_weapon_defensive_04",
				"pwe_gameplay_activating_magic_weapon_defensive_05"
			},
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
			sound_events_duration = {
				2.1794791221619,
				2.6661040782928,
				4.4457292556763
			},
			localization_strings = {
				"pwe_gameplay_activating_magic_weapon_defensive_02",
				"pwe_gameplay_activating_magic_weapon_defensive_04",
				"pwe_gameplay_activating_magic_weapon_defensive_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_chaos_wizard_tentacle = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
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
			sound_events_duration = {
				3.4155416488648,
				3.2421667575836,
				2.4845209121704,
				4.1653542518616
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_warrior = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_warrior_01",
				"pwe_gameplay_hearing_a_chaos_warrior_02",
				"pwe_gameplay_hearing_a_chaos_warrior_03",
				"pwe_gameplay_hearing_a_chaos_warrior_04",
				"pwe_gameplay_hearing_a_chaos_warrior_05",
				"pwe_gameplay_hearing_a_chaos_warrior_06",
				"pwe_gameplay_hearing_a_chaos_warrior_07",
				"pwe_gameplay_hearing_a_chaos_warrior_08"
			},
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
			sound_events_duration = {
				2.9291458129883,
				2.5860624313355,
				5.0257291793823,
				3.0953750610352,
				1.8347500562668,
				1.9403958320618,
				2.1247291564941,
				2.272979259491
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_warrior_01",
				"pwe_gameplay_hearing_a_chaos_warrior_02",
				"pwe_gameplay_hearing_a_chaos_warrior_03",
				"pwe_gameplay_hearing_a_chaos_warrior_04",
				"pwe_gameplay_hearing_a_chaos_warrior_05",
				"pwe_gameplay_hearing_a_chaos_warrior_06",
				"pwe_gameplay_hearing_a_chaos_warrior_07",
				"pwe_gameplay_hearing_a_chaos_warrior_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_standard_bearer_has_planted_standard_crater = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_standard_bearer_has_planted_standard_01",
				"pwe_gameplay_standard_bearer_has_planted_standard_02",
				"pwe_gameplay_standard_bearer_has_planted_standard_03",
				"pwe_gameplay_standard_bearer_has_planted_standard_04",
				"pwe_gameplay_standard_bearer_has_planted_standard_05",
				"pwe_gameplay_standard_bearer_has_planted_standard_06",
				"pwe_gameplay_standard_bearer_has_planted_standard_07",
				"pwe_gameplay_standard_bearer_has_planted_standard_08"
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
				2.2107501029968,
				1.9117708206177,
				2.3186042308807,
				2.4476666450501,
				2.1475417017937,
				2.0728125572205,
				2.331312417984,
				2.2620208263397
			},
			localization_strings = {
				"pwe_gameplay_standard_bearer_has_planted_standard_01",
				"pwe_gameplay_standard_bearer_has_planted_standard_02",
				"pwe_gameplay_standard_bearer_has_planted_standard_03",
				"pwe_gameplay_standard_bearer_has_planted_standard_04",
				"pwe_gameplay_standard_bearer_has_planted_standard_05",
				"pwe_gameplay_standard_bearer_has_planted_standard_06",
				"pwe_gameplay_standard_bearer_has_planted_standard_07",
				"pwe_gameplay_standard_bearer_has_planted_standard_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_healing_bright_wizard = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_healing_bright_wizard_05",
				"pwe_gameplay_healing_bright_wizard_06",
				"pwe_gameplay_healing_bright_wizard_07",
				"pwe_gameplay_healing_bright_wizard_08",
				"pwe_gameplay_healing_bright_wizard_09"
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
				1.8456041812897,
				2.5021250247955,
				1.827604174614,
				2.2164583206177,
				3.5390207767487
			},
			localization_strings = {
				"pwe_gameplay_healing_bright_wizard_05",
				"pwe_gameplay_healing_bright_wizard_06",
				"pwe_gameplay_healing_bright_wizard_07",
				"pwe_gameplay_healing_bright_wizard_08",
				"pwe_gameplay_healing_bright_wizard_09"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_heard_dwarf_ranger_in_trouble = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_08"
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
			sound_events_duration = {
				2.3739583492279,
				3.0156667232513,
				3.5678749084473,
				2.8650207519531
			},
			localization_strings = {
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_skaven_patrol_stormvermin = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_12"
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
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.9352707862854,
				2.0756666660309,
				2.8507916927338,
				2.8572916984558,
				2.6026041507721,
				2.4189791679382,
				2.9497290849686
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_08",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_09",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_10",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_11",
				"pwe_gameplay_seeing_a_Skaven_patrol_stormvermin_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_gutterrunner = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_killing_gutterrunner_05",
				"pwe_gameplay_killing_gutterrunner_06",
				"pwe_gameplay_killing_gutterrunner_07",
				"pwe_gameplay_killing_gutterrunner_08"
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
				2.8600625991821,
				3.5286250114441,
				2.698520898819,
				3.8742084503174
			},
			localization_strings = {
				"pwe_gameplay_killing_gutterrunner_05",
				"pwe_gameplay_killing_gutterrunner_06",
				"pwe_gameplay_killing_gutterrunner_07",
				"pwe_gameplay_killing_gutterrunner_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_healing_dwarf_ranger = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_healing_dwarf_ranger_05",
				"pwe_gameplay_healing_dwarf_ranger_06",
				"pwe_gameplay_healing_dwarf_ranger_07",
				"pwe_gameplay_healing_dwarf_ranger_08",
				"pwe_gameplay_healing_dwarf_ranger_09"
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
				4.0243539810181,
				2.0467083454132,
				3.1160209178925,
				2.3887083530426,
				3.2338750362396
			},
			localization_strings = {
				"pwe_gameplay_healing_dwarf_ranger_05",
				"pwe_gameplay_healing_dwarf_ranger_06",
				"pwe_gameplay_healing_dwarf_ranger_07",
				"pwe_gameplay_healing_dwarf_ranger_08",
				"pwe_gameplay_healing_dwarf_ranger_09"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_heard_witch_hunter_in_trouble = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_witch_hunter_in_trouble_01",
				"pwe_gameplay_heard_witch_hunter_in_trouble_05",
				"pwe_gameplay_heard_witch_hunter_in_trouble_06",
				"pwe_gameplay_heard_witch_hunter_in_trouble_07"
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
			sound_events_duration = {
				2.0213124752045,
				2.3798542022705,
				3.4547290802002,
				2.8124375343323
			},
			localization_strings = {
				"pwe_gameplay_heard_witch_hunter_in_trouble_01",
				"pwe_gameplay_heard_witch_hunter_in_trouble_05",
				"pwe_gameplay_heard_witch_hunter_in_trouble_06",
				"pwe_gameplay_heard_witch_hunter_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_skaven_slaver = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_Skaven_slaver_09",
				"pwe_gameplay_seeing_a_Skaven_slaver_10",
				"pwe_gameplay_seeing_a_Skaven_slaver_11",
				"pwe_gameplay_seeing_a_Skaven_slaver_12",
				"pwe_gameplay_seeing_a_Skaven_slaver_13",
				"pwe_gameplay_seeing_a_Skaven_slaver_14",
				"pwe_gameplay_seeing_a_Skaven_slaver_15"
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
			sound_events_duration = {
				1.2984166145325,
				2.731645822525,
				3.6469166278839,
				3.3328750133514,
				3.0777292251587,
				1.9828541278839,
				2.7605624198914,
				1.5109374523163
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_Skaven_slaver_09",
				"pwe_gameplay_seeing_a_Skaven_slaver_10",
				"pwe_gameplay_seeing_a_Skaven_slaver_11",
				"pwe_gameplay_seeing_a_Skaven_slaver_12",
				"pwe_gameplay_seeing_a_Skaven_slaver_13",
				"pwe_gameplay_seeing_a_Skaven_slaver_14",
				"pwe_gameplay_seeing_a_Skaven_slaver_15"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_chaos_warrior_champion_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.671395778656,
				2.7449584007263,
				2.8133125305176,
				6.2264790534973,
				3.4942917823791,
				3.9296251535416,
				2.6612501144409,
				2.8425624370575
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_01",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_02",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_03",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_04",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_05",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_06",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_07",
				"pwe_gameplay_seeing_a_chaos_warrior_champion_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bile_troll_before_puke = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_bile_troll_before_puke_01",
				"pwe_gameplay_bile_troll_before_puke_02",
				"pwe_gameplay_bile_troll_before_puke_03",
				"pwe_gameplay_bile_troll_before_puke_04",
				"pwe_gameplay_bile_troll_before_puke_05",
				"pwe_gameplay_bile_troll_before_puke_06",
				"pwe_gameplay_bile_troll_before_puke_07",
				"pwe_gameplay_bile_troll_before_puke_08"
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				1.8134791851044,
				2.2251875400543,
				1.5367292165756,
				1.6198124885559,
				2.1572499275208,
				2.5197291374206,
				3.2789583206177,
				4.0355000495911
			},
			localization_strings = {
				"pwe_gameplay_bile_troll_before_puke_01",
				"pwe_gameplay_bile_troll_before_puke_02",
				"pwe_gameplay_bile_troll_before_puke_03",
				"pwe_gameplay_bile_troll_before_puke_04",
				"pwe_gameplay_bile_troll_before_puke_05",
				"pwe_gameplay_bile_troll_before_puke_06",
				"pwe_gameplay_bile_troll_before_puke_07",
				"pwe_gameplay_bile_troll_before_puke_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_gutter_runner = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_07",
				"pwe_gameplay_seeing_a_gutter_runner_08",
				"pwe_gameplay_seeing_a_gutter_runner_09",
				"pwe_gameplay_seeing_a_gutter_runner_10",
				"pwe_gameplay_seeing_a_gutter_runner_11"
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
			sound_events_duration = {
				1.0780832767487,
				2.1237709522247,
				4.3841042518616,
				2.6051874160767,
				3.0508332252502,
				1.6340833902359
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_07",
				"pwe_gameplay_seeing_a_gutter_runner_08",
				"pwe_gameplay_seeing_a_gutter_runner_09",
				"pwe_gameplay_seeing_a_gutter_runner_10",
				"pwe_gameplay_seeing_a_gutter_runner_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_stormfiend = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hearing_a_stormfiend_01",
				"pwe_gameplay_hearing_a_stormfiend_02",
				"pwe_gameplay_hearing_a_stormfiend_03",
				"pwe_gameplay_hearing_a_stormfiend_04",
				"pwe_gameplay_hearing_a_stormfiend_05",
				"pwe_gameplay_hearing_a_stormfiend_06"
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
				4.1097917556763,
				2.1117916107178,
				3.5497395992279,
				2.9161875247955,
				2.5939373970032,
				3.128312587738
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_stormfiend_01",
				"pwe_gameplay_hearing_a_stormfiend_02",
				"pwe_gameplay_hearing_a_stormfiend_03",
				"pwe_gameplay_hearing_a_stormfiend_04",
				"pwe_gameplay_hearing_a_stormfiend_05",
				"pwe_gameplay_hearing_a_stormfiend_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_empire_soldier_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_empire_soldier_dead_05",
				"pwe_gameplay_empire_soldier_dead_06",
				"pwe_gameplay_empire_soldier_dead_07",
				"pwe_gameplay_empire_soldier_dead_08"
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
				2.9168124198914,
				3.9473540782928,
				2.0078959465027,
				2.3690416812897
			},
			localization_strings = {
				"pwe_gameplay_empire_soldier_dead_05",
				"pwe_gameplay_empire_soldier_dead_06",
				"pwe_gameplay_empire_soldier_dead_07",
				"pwe_gameplay_empire_soldier_dead_08"
			},
			randomize_indexes = {}
		},
		pwe_ability_activate_shade = {
			sound_events_n = 11,
			face_animations_n = 11,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 11,
			sound_events = {
				"pwe_ability_activate_shade_01",
				"pwe_ability_activate_shade_02",
				"pwe_ability_activate_shade_04",
				"pwe_activate_ability_shade_05",
				"pwe_activate_ability_shade_06",
				"pwe_activate_ability_shade_07",
				"pwe_activate_ability_shade_08",
				"pwe_activate_ability_shade_09",
				"pwe_activate_ability_shade_10",
				"pwe_activate_ability_shade_11",
				"pwe_activate_ability_shade_12"
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
			sound_events_duration = {
				4.0820832252502,
				4.1808543205261,
				4.596978187561,
				3.1758332252502,
				4.3644790649414,
				3.2612292766571,
				2.1444582939148,
				6.0429167747498,
				3.8660833835602,
				3.9091665744781,
				5.4674167633057
			},
			localization_strings = {
				"pwe_ability_activate_shade_01",
				"pwe_ability_activate_shade_02",
				"pwe_ability_activate_shade_04",
				"pwe_activate_ability_shade_05",
				"pwe_activate_ability_shade_06",
				"pwe_activate_ability_shade_07",
				"pwe_activate_ability_shade_08",
				"pwe_activate_ability_shade_09",
				"pwe_activate_ability_shade_10",
				"pwe_activate_ability_shade_11",
				"pwe_activate_ability_shade_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_tension_no_enemies = {
			sound_events_n = 16,
			face_animations_n = 16,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 16,
			sound_events = {
				"pwe_gameplay_tension_no_enemies_06",
				"pwe_gameplay_tension_no_enemies_09",
				"pwe_gameplay_tension_no_enemies_10",
				"pwe_gameplay_tension_no_enemies_11",
				"pwe_gameplay_tension_no_enemies_12",
				"pwe_gameplay_tension_no_enemies_13",
				"pwe_gameplay_tension_no_enemies_14",
				"pwe_gameplay_tension_no_enemies_15",
				"pwe_gameplay_tension_no_enemies_16",
				"pwe_gameplay_tension_no_enemies_17",
				"pwe_gameplay_tension_no_enemies_18",
				"pwe_gameplay_tension_no_enemies_19",
				"pwe_gameplay_tension_no_enemies_20",
				"pwe_gameplay_tension_no_enemies_21",
				"pwe_gameplay_tension_no_enemies_22",
				"pwe_gameplay_tension_no_enemies_23"
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
			sound_events_duration = {
				0.97606247663498,
				3.7478542327881,
				3.1848750114441,
				1.5475624799728,
				3.4417707920074,
				1.7397291660309,
				3.412291765213,
				2.9892499446869,
				4.1875414848328,
				6.7364373207092,
				4.8997292518616,
				6.0878124237061,
				7.4380831718445,
				3.3783540725708,
				4.8996872901917,
				5.2797083854675
			},
			localization_strings = {
				"pwe_gameplay_tension_no_enemies_06",
				"pwe_gameplay_tension_no_enemies_09",
				"pwe_gameplay_tension_no_enemies_10",
				"pwe_gameplay_tension_no_enemies_11",
				"pwe_gameplay_tension_no_enemies_12",
				"pwe_gameplay_tension_no_enemies_13",
				"pwe_gameplay_tension_no_enemies_14",
				"pwe_gameplay_tension_no_enemies_15",
				"pwe_gameplay_tension_no_enemies_16",
				"pwe_gameplay_tension_no_enemies_17",
				"pwe_gameplay_tension_no_enemies_18",
				"pwe_gameplay_tension_no_enemies_19",
				"pwe_gameplay_tension_no_enemies_20",
				"pwe_gameplay_tension_no_enemies_21",
				"pwe_gameplay_tension_no_enemies_22",
				"pwe_gameplay_tension_no_enemies_23"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_parry_empire_soldier = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_parry_empire_soldier_01",
				"pwe_gameplay_parry_empire_soldier_02",
				"pwe_gameplay_parry_empire_soldier_03",
				"pwe_gameplay_parry_empire_soldier_04"
			},
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
			sound_events_duration = {
				1.5595417022705,
				2.4457499980927,
				1.9410833120346,
				2.9751040935516
			},
			localization_strings = {
				"pwe_gameplay_parry_empire_soldier_01",
				"pwe_gameplay_parry_empire_soldier_02",
				"pwe_gameplay_parry_empire_soldier_03",
				"pwe_gameplay_parry_empire_soldier_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_parry_dwarf_ranger = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_parry_dwarf_ranger_01",
				"pwe_gameplay_parry_dwarf_ranger_02",
				"pwe_gameplay_parry_dwarf_ranger_03",
				"pwe_gameplay_parry_dwarf_ranger_04"
			},
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
			sound_events_duration = {
				2.8118751049042,
				2.4433124065399,
				2.9959790706634,
				2.5185832977295
			},
			localization_strings = {
				"pwe_gameplay_parry_dwarf_ranger_01",
				"pwe_gameplay_parry_dwarf_ranger_02",
				"pwe_gameplay_parry_dwarf_ranger_03",
				"pwe_gameplay_parry_dwarf_ranger_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_incoming_attack = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_minotaur_01",
				"pwe_gameplay_seeing_a_minotaur_02",
				"pwe_gameplay_seeing_a_minotaur_03",
				"pwe_gameplay_seeing_a_minotaur_04",
				"pwe_gameplay_seeing_a_minotaur_05",
				"pwe_gameplay_seeing_a_minotaur_06",
				"pwe_gameplay_seeing_a_minotaur_07",
				"pwe_gameplay_seeing_a_minotaur_08"
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
			sound_events_duration = {
				1.0297708511352,
				1.6162291765213,
				2.545458316803,
				2.25816655159,
				1.8711041212082,
				1.9906458854675,
				3.1821250915527,
				2.8926665782928
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_minotaur_01",
				"pwe_gameplay_seeing_a_minotaur_02",
				"pwe_gameplay_seeing_a_minotaur_03",
				"pwe_gameplay_seeing_a_minotaur_04",
				"pwe_gameplay_seeing_a_minotaur_05",
				"pwe_gameplay_seeing_a_minotaur_06",
				"pwe_gameplay_seeing_a_minotaur_07",
				"pwe_gameplay_seeing_a_minotaur_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_standard_bearer_buff_deactivated = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_standard_bearer_buff_deactivated_01",
				"pwe_gameplay_standard_bearer_buff_deactivated_02",
				"pwe_gameplay_standard_bearer_buff_deactivated_03",
				"pwe_gameplay_standard_bearer_buff_deactivated_04",
				"pwe_gameplay_standard_bearer_buff_deactivated_05",
				"pwe_gameplay_standard_bearer_buff_deactivated_06",
				"pwe_gameplay_standard_bearer_buff_deactivated_07",
				"pwe_gameplay_standard_bearer_buff_deactivated_08"
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
				2.2287707328796,
				2.6145207881927,
				1.8574374914169,
				3.1237916946411,
				2.2866458892822,
				1.8677291870117,
				2.738520860672,
				3.4553959369659
			},
			localization_strings = {
				"pwe_gameplay_standard_bearer_buff_deactivated_01",
				"pwe_gameplay_standard_bearer_buff_deactivated_02",
				"pwe_gameplay_standard_bearer_buff_deactivated_03",
				"pwe_gameplay_standard_bearer_buff_deactivated_04",
				"pwe_gameplay_standard_bearer_buff_deactivated_05",
				"pwe_gameplay_standard_bearer_buff_deactivated_06",
				"pwe_gameplay_standard_bearer_buff_deactivated_07",
				"pwe_gameplay_standard_bearer_buff_deactivated_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_standard_bearer = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_hearing_a_standard_bearer_02",
				"pwe_gameplay_hearing_a_standard_bearer_03",
				"pwe_gameplay_hearing_a_standard_bearer_05",
				"pwe_gameplay_hearing_a_standard_bearer_combat_07",
				"pwe_gameplay_hearing_a_standard_bearer_combat_04"
			},
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
			sound_events_duration = {
				3.1112084388733,
				2.7929582595825,
				0.54850000143051,
				3.0630624294281,
				2.3135623931885
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_standard_bearer_02",
				"pwe_gameplay_hearing_a_standard_bearer_03",
				"pwe_gameplay_hearing_a_standard_bearer_05",
				"pwe_gameplay_hearing_a_standard_bearer_combat_07",
				"pwe_gameplay_hearing_a_standard_bearer_combat_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_tips_wizard_plague = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_tips_wizard_plague_01",
				"pwe_gameplay_tips_wizard_plague_02",
				"pwe_gameplay_tips_wizard_plague_03",
				"pwe_gameplay_tips_wizard_plague_04",
				"pwe_gameplay_tips_wizard_plague_05",
				"pwe_gameplay_tips_wizard_plague_06",
				"pwe_gameplay_tips_wizard_plague_07",
				"pwe_gameplay_tips_wizard_plague_08"
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				4.9846668243408,
				3.0215001106262,
				4.4039373397827,
				5.7241668701172,
				6.1907291412353,
				4.3703956604004,
				5.4741044044495,
				3.350729227066
			},
			localization_strings = {
				"pwe_gameplay_tips_wizard_plague_01",
				"pwe_gameplay_tips_wizard_plague_02",
				"pwe_gameplay_tips_wizard_plague_03",
				"pwe_gameplay_tips_wizard_plague_04",
				"pwe_gameplay_tips_wizard_plague_05",
				"pwe_gameplay_tips_wizard_plague_06",
				"pwe_gameplay_tips_wizard_plague_07",
				"pwe_gameplay_tips_wizard_plague_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_ladder_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_ladder_down_01",
				"pwe_objective_correct_path_ladder_down_02",
				"pwe_objective_correct_path_ladder_down_03",
				"pwe_objective_correct_path_ladder_down_04"
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
			sound_events_duration = {
				1.4844583272934,
				1.6813124418259,
				1.6881874799728,
				1.6007291078568
			},
			localization_strings = {
				"pwe_objective_correct_path_ladder_down_01",
				"pwe_objective_correct_path_ladder_down_02",
				"pwe_objective_correct_path_ladder_down_03",
				"pwe_objective_correct_path_ladder_down_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_tips_wizard_wind = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_tips_wizard_wind_01",
				"pwe_gameplay_tips_wizard_wind_02",
				"pwe_gameplay_tips_wizard_wind_03",
				"pwe_gameplay_tips_wizard_wind_04",
				"pwe_gameplay_tips_wizard_wind_05",
				"pwe_gameplay_tips_wizard_wind_06",
				"pwe_gameplay_tips_wizard_wind_07",
				"pwe_gameplay_tips_wizard_wind_08"
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				3.6884167194366,
				3.7264375686645,
				3.2633333206177,
				5.172375202179,
				2.8534998893738,
				3.5937292575836,
				2.8350417613983,
				3.9859790802002
			},
			localization_strings = {
				"pwe_gameplay_tips_wizard_wind_01",
				"pwe_gameplay_tips_wizard_wind_02",
				"pwe_gameplay_tips_wizard_wind_03",
				"pwe_gameplay_tips_wizard_wind_04",
				"pwe_gameplay_tips_wizard_wind_05",
				"pwe_gameplay_tips_wizard_wind_06",
				"pwe_gameplay_tips_wizard_wind_07",
				"pwe_gameplay_tips_wizard_wind_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_wizard_tentacle = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.5933332443237,
				5.4811873435974,
				4.2477707862854,
				2.2687082290649,
				1.6110208034515,
				2.8436458110809,
				1.9426666498184,
				1.8426458835602
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_04",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_05",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_06",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_07",
				"pwe_gameplay_hearing_a_chaos_wizard_tentacle_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_goal_achieved_more_left = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_objective_goal_achieved_more_left_02",
				"pwe_objective_goal_achieved_more_left_08",
				"pwe_objective_goal_achieved_more_left_09",
				"pwe_objective_goal_achieved_more_left_10",
				"pwe_objective_goal_achieved_more_left_11",
				"pwe_objective_goal_achieved_more_left_12"
			},
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
			sound_events_duration = {
				2.2303750514984,
				1.5519374608993,
				2.5184373855591,
				2.7533957958221,
				2.0142917633057,
				3.3105729818344
			},
			localization_strings = {
				"pwe_objective_goal_achieved_more_left_02",
				"pwe_objective_goal_achieved_more_left_08",
				"pwe_objective_goal_achieved_more_left_09",
				"pwe_objective_goal_achieved_more_left_10",
				"pwe_objective_goal_achieved_more_left_11",
				"pwe_objective_goal_achieved_more_left_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bright_wizard_eaten = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_bright_wizard_eaten_01",
				"pwe_bright_wizard_eaten_02",
				"pwe_bright_wizard_eaten_03",
				"pwe_bright_wizard_eaten_04",
				"pwe_bright_wizard_eaten_05",
				"pwe_bright_wizard_eaten_06",
				"pwe_bright_wizard_eaten_07"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.7666666507721,
				4.999041557312,
				3.8928853273392,
				6.4712915420532,
				5.0966873168945,
				3.8943333625794,
				5.2778334617615
			},
			localization_strings = {
				"pwe_bright_wizard_eaten_01",
				"pwe_bright_wizard_eaten_02",
				"pwe_bright_wizard_eaten_03",
				"pwe_bright_wizard_eaten_04",
				"pwe_bright_wizard_eaten_05",
				"pwe_bright_wizard_eaten_06",
				"pwe_bright_wizard_eaten_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_healing_empire_soldier = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_healing_empire_soldier_05",
				"pwe_gameplay_healing_empire_soldier_06",
				"pwe_gameplay_healing_empire_soldier_07",
				"pwe_gameplay_healing_empire_soldier_08",
				"pwe_gameplay_healing_empire_soldier_09"
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
				2.141583442688,
				2.064291715622,
				2.0250833034515,
				2.0695416927338,
				4.9380831718445
			},
			localization_strings = {
				"pwe_gameplay_healing_empire_soldier_05",
				"pwe_gameplay_healing_empire_soldier_06",
				"pwe_gameplay_healing_empire_soldier_07",
				"pwe_gameplay_healing_empire_soldier_08",
				"pwe_gameplay_healing_empire_soldier_09"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_pm = {
			sound_events_n = 15,
			face_animations_n = 15,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 15,
			sound_events = {
				"pwe_gameplay_seeing_a_pm_01",
				"pwe_gameplay_seeing_a_pm_02",
				"pwe_gameplay_seeing_a_pm_03",
				"pwe_gameplay_seeing_a_pm_04",
				"pwe_gameplay_seeing_a_pm_05",
				"pwe_gameplay_seeing_a_pm_06",
				"pwe_gameplay_seeing_a_pm_07",
				"pwe_gameplay_seeing_a_plague_monk_01",
				"pwe_gameplay_seeing_a_plague_monk_02",
				"pwe_gameplay_seeing_a_plague_monk_03",
				"pwe_gameplay_seeing_a_plague_monk_04",
				"pwe_gameplay_seeing_a_plague_monk_05",
				"pwe_gameplay_seeing_a_plague_monk_06",
				"pwe_gameplay_seeing_a_plague_monk_07",
				"pwe_gameplay_seeing_a_plague_monk_08"
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
			sound_events_duration = {
				1.0923124551773,
				2.1638333797455,
				1.9132083654404,
				1.1331458091736,
				1.7408332824707,
				2.0093333721161,
				1.2001249790192,
				2.6742291450501,
				2.6205208301544,
				3.8547291755676,
				4.0491042137146,
				3.2652916908264,
				2.6762917041779,
				3.1536042690277,
				2.6422083377838
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_pm_01",
				"pwe_gameplay_seeing_a_pm_02",
				"pwe_gameplay_seeing_a_pm_03",
				"pwe_gameplay_seeing_a_pm_04",
				"pwe_gameplay_seeing_a_pm_05",
				"pwe_gameplay_seeing_a_pm_06",
				"pwe_gameplay_seeing_a_pm_07",
				"pwe_gameplay_seeing_a_plague_monk_01",
				"pwe_gameplay_seeing_a_plague_monk_02",
				"pwe_gameplay_seeing_a_plague_monk_03",
				"pwe_gameplay_seeing_a_plague_monk_04",
				"pwe_gameplay_seeing_a_plague_monk_05",
				"pwe_gameplay_seeing_a_plague_monk_06",
				"pwe_gameplay_seeing_a_plague_monk_07",
				"pwe_gameplay_seeing_a_plague_monk_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_empire_soldier_eaten = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_empire_soldier_eaten_01",
				"pwe_empire_soldier_eaten_02",
				"pwe_empire_soldier_eaten_03",
				"pwe_empire_soldier_eaten_04",
				"pwe_empire_soldier_eaten_05",
				"pwe_empire_soldier_eaten_06",
				"pwe_empire_soldier_eaten_07"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				5.3830623626709,
				4.2255001068115,
				4.8115000724792,
				4.7789373397827,
				5.4008541107178,
				5.5520415306091,
				5.6791458129883
			},
			localization_strings = {
				"pwe_empire_soldier_eaten_01",
				"pwe_empire_soldier_eaten_02",
				"pwe_empire_soldier_eaten_03",
				"pwe_empire_soldier_eaten_04",
				"pwe_empire_soldier_eaten_05",
				"pwe_empire_soldier_eaten_06",
				"pwe_empire_soldier_eaten_07"
			},
			randomize_indexes = {}
		},
		pwe_activate_ability_waystalker = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_activate_ability_waystalker_01",
				"pwe_activate_ability_waystalker_02",
				"pwe_activate_ability_waystalker_03",
				"pwe_activate_ability_waystalker_04",
				"pwe_activate_ability_waystalker_05",
				"pwe_activate_ability_waystalker_06",
				"pwe_activate_ability_waystalker_07",
				"pwe_activate_ability_waystalker_08",
				"pwe_activate_ability_waystalker_09",
				"pwe_activate_ability_waystalker_12"
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
			sound_events_duration = {
				1.0872708559036,
				1.2557499408722,
				1.3246874809265,
				1.2107083797455,
				1.1946458816528,
				1.3053958415985,
				1.0167708396912,
				1.4296250343323,
				1.398916721344,
				1.6114583015442
			},
			localization_strings = {
				"pwe_activate_ability_waystalker_01",
				"pwe_activate_ability_waystalker_02",
				"pwe_activate_ability_waystalker_03",
				"pwe_activate_ability_waystalker_04",
				"pwe_activate_ability_waystalker_05",
				"pwe_activate_ability_waystalker_06",
				"pwe_activate_ability_waystalker_07",
				"pwe_activate_ability_waystalker_08",
				"pwe_activate_ability_waystalker_09",
				"pwe_activate_ability_waystalker_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_standard_bearer_crater = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_hearing_a_standard_bearer_02",
				"pwe_gameplay_hearing_a_standard_bearer_03",
				"pwe_gameplay_hearing_a_standard_bearer_05",
				"pwe_gameplay_hearing_a_standard_bearer_combat_07",
				"pwe_gameplay_hearing_a_standard_bearer_combat_04"
			},
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
			sound_events_duration = {
				3.1112084388733,
				2.7929582595825,
				0.54850000143051,
				3.0630624294281,
				2.3135623931885
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_standard_bearer_02",
				"pwe_gameplay_hearing_a_standard_bearer_03",
				"pwe_gameplay_hearing_a_standard_bearer_05",
				"pwe_gameplay_hearing_a_standard_bearer_combat_07",
				"pwe_gameplay_hearing_a_standard_bearer_combat_04"
			},
			randomize_indexes = {}
		},
		pwe_activate_ability_handmaiden = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 12,
			sound_events = {
				"pwe_activate_ability_handmaiden_01",
				"pwe_activate_ability_handmaiden_02",
				"pwe_activate_ability_handmaiden_03",
				"pwe_activate_ability_handmaiden_04",
				"pwe_activate_ability_handmaiden_05",
				"pwe_activate_ability_handmaiden_06",
				"pwe_activate_ability_handmaiden_07",
				"pwe_activate_ability_handmaiden_08",
				"pwe_activate_ability_handmaiden_09",
				"pwe_activate_ability_handmaiden_10",
				"pwe_activate_ability_handmaiden_11",
				"pwe_activate_ability_handmaiden_12"
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
			sound_events_duration = {
				0.76189583539963,
				1.0844583511352,
				1.3239375352859,
				1.1171250343323,
				1.5005208253861,
				1.196624994278,
				1.6745208501816,
				2.0054583549499,
				1.1317917108536,
				2.7861042022705,
				2.3635625839233,
				1.2719999551773
			},
			localization_strings = {
				"pwe_activate_ability_handmaiden_01",
				"pwe_activate_ability_handmaiden_02",
				"pwe_activate_ability_handmaiden_03",
				"pwe_activate_ability_handmaiden_04",
				"pwe_activate_ability_handmaiden_05",
				"pwe_activate_ability_handmaiden_06",
				"pwe_activate_ability_handmaiden_07",
				"pwe_activate_ability_handmaiden_08",
				"pwe_activate_ability_handmaiden_09",
				"pwe_activate_ability_handmaiden_10",
				"pwe_activate_ability_handmaiden_11",
				"pwe_activate_ability_handmaiden_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_chaos_wizard_leech = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_killing_a_chaos_wizard_leech_01",
				"pwe_gameplay_killing_a_chaos_wizard_leech_02",
				"pwe_gameplay_killing_a_chaos_wizard_leech_03",
				"pwe_gameplay_killing_a_chaos_wizard_leech_04",
				"pwe_gameplay_killing_a_chaos_wizard_leech_05",
				"pwe_gameplay_killing_a_chaos_wizard_leech_06"
			},
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
			sound_events_duration = {
				2.1928541660309,
				1.4164791107178,
				2.1445207595825,
				2.1141042709351,
				1.7132707834244,
				2.2379791736603
			},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_wizard_leech_01",
				"pwe_gameplay_killing_a_chaos_wizard_leech_02",
				"pwe_gameplay_killing_a_chaos_wizard_leech_03",
				"pwe_gameplay_killing_a_chaos_wizard_leech_04",
				"pwe_gameplay_killing_a_chaos_wizard_leech_05",
				"pwe_gameplay_killing_a_chaos_wizard_leech_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_warrior_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_warrior_combat_01",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_02",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_03",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_04",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_05",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_06",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_07",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.1505208015442,
				2.769770860672,
				1.3487499952316,
				1.7166874408722,
				2.2854166030884,
				2.1423332691193,
				2.5221457481384,
				2.0191042423248
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_warrior_combat_01",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_02",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_03",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_04",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_05",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_06",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_07",
				"pwe_gameplay_hearing_a_chaos_warrior_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_spawn_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_spawn_combat_01",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_02",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_03",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_04",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_05",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_06",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_07",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				0.93166667222977,
				1.6336041688919,
				1.4325000047684,
				2.5922708511352,
				2.1415207386017,
				1.3909583091736,
				2.0276250839233,
				2.0118958950043
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_spawn_combat_01",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_02",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_03",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_04",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_05",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_06",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_07",
				"pwe_gameplay_hearing_a_chaos_spawn_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_witch_hunter_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_witch_hunter_dead_01",
				"pwe_gameplay_witch_hunter_dead_05",
				"pwe_gameplay_witch_hunter_dead_06",
				"pwe_gameplay_witch_hunter_dead_07"
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
				1.5346250534058,
				1.9547499418259,
				1.9386249780655,
				3.0198125839233
			},
			localization_strings = {
				"pwe_gameplay_witch_hunter_dead_01",
				"pwe_gameplay_witch_hunter_dead_05",
				"pwe_gameplay_witch_hunter_dead_06",
				"pwe_gameplay_witch_hunter_dead_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_throwing_bomb = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_throwing_bomb_01",
				"pwe_gameplay_throwing_bomb_05",
				"pwe_gameplay_throwing_bomb_06",
				"pwe_gameplay_throwing_bomb_07",
				"pwe_gameplay_throwing_bomb_08"
			},
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
			sound_events_duration = {
				1.0842083692551,
				2.0805416107178,
				2.67222905159,
				1.8732291460037,
				2.4514791965485
			},
			localization_strings = {
				"pwe_gameplay_throwing_bomb_01",
				"pwe_gameplay_throwing_bomb_05",
				"pwe_gameplay_throwing_bomb_06",
				"pwe_gameplay_throwing_bomb_07",
				"pwe_gameplay_throwing_bomb_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_heard_empire_soldier_in_trouble = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_empire_soldier_in_trouble_05",
				"pwe_gameplay_heard_empire_soldier_in_trouble_06",
				"pwe_gameplay_heard_empire_soldier_in_trouble_07",
				"pwe_gameplay_heard_empire_soldier_in_trouble_08"
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
			sound_events_duration = {
				4.0519585609436,
				2.0967707633972,
				2.6408541202545,
				2.9773125648499
			},
			localization_strings = {
				"pwe_gameplay_heard_empire_soldier_in_trouble_05",
				"pwe_gameplay_heard_empire_soldier_in_trouble_06",
				"pwe_gameplay_heard_empire_soldier_in_trouble_07",
				"pwe_gameplay_heard_empire_soldier_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_healing_draught = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_gameplay_healing_draught_01",
				"pwe_gameplay_healing_draught_09",
				"pwe_gameplay_healing_draught_10",
				"pwe_gameplay_healing_draught_11",
				"pwe_gameplay_healing_draught_12",
				"pwe_gameplay_healing_draught_13",
				"pwe_gameplay_healing_draught_14",
				"pwe_gameplay_healing_draught_15",
				"pwe_gameplay_healing_draught_16",
				"pwe_gameplay_healing_draught_17"
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
			sound_events_duration = {
				1.1028333902359,
				1.2625625133514,
				4.4623126983643,
				1.9411457777023,
				1.480229139328,
				1.7217500209808,
				1.7191250324249,
				1.9796041250229,
				3.5395624637604,
				2.7009792327881
			},
			localization_strings = {
				"pwe_gameplay_healing_draught_01",
				"pwe_gameplay_healing_draught_09",
				"pwe_gameplay_healing_draught_10",
				"pwe_gameplay_healing_draught_11",
				"pwe_gameplay_healing_draught_12",
				"pwe_gameplay_healing_draught_13",
				"pwe_gameplay_healing_draught_14",
				"pwe_gameplay_healing_draught_15",
				"pwe_gameplay_healing_draught_16",
				"pwe_gameplay_healing_draught_17"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_chaos_wizard_wind = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_killing_a_chaos_wizard_wind_01",
				"pwe_gameplay_killing_a_chaos_wizard_wind_02",
				"pwe_gameplay_killing_a_chaos_wizard_wind_03",
				"pwe_gameplay_killing_a_chaos_wizard_wind_04",
				"pwe_gameplay_killing_a_chaos_wizard_wind_05",
				"pwe_gameplay_killing_a_chaos_wizard_wind_06"
			},
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
			sound_events_duration = {
				3.1137292385101,
				2.8432500362396,
				2.8394167423248,
				1.7517499923706,
				1.6777499914169,
				2.2009167671204
			},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_wizard_wind_01",
				"pwe_gameplay_killing_a_chaos_wizard_wind_02",
				"pwe_gameplay_killing_a_chaos_wizard_wind_03",
				"pwe_gameplay_killing_a_chaos_wizard_wind_04",
				"pwe_gameplay_killing_a_chaos_wizard_wind_05",
				"pwe_gameplay_killing_a_chaos_wizard_wind_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hit_by_goo = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hit_by_goo_01",
				"pwe_gameplay_hit_by_goo_02",
				"pwe_gameplay_hit_by_goo_03",
				"pwe_gameplay_hit_by_goo_04",
				"pwe_gameplay_hit_by_goo_07",
				"pwe_gameplay_hit_by_goo_08",
				"pwe_gameplay_hit_by_goo_09",
				"pwe_gameplay_hit_by_goo_10"
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				2.1591665744781,
				1.0292708873749,
				1.3644374608993,
				2.9260625839233,
				1.9729167222977,
				1.589604139328,
				2.3793332576752,
				1.6428542137146
			},
			localization_strings = {
				"pwe_gameplay_hit_by_goo_01",
				"pwe_gameplay_hit_by_goo_02",
				"pwe_gameplay_hit_by_goo_03",
				"pwe_gameplay_hit_by_goo_04",
				"pwe_gameplay_hit_by_goo_07",
				"pwe_gameplay_hit_by_goo_08",
				"pwe_gameplay_hit_by_goo_09",
				"pwe_gameplay_hit_by_goo_10"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_encouraging_words = {
			sound_events_n = 10,
			face_animations_n = 10,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 10,
			sound_events = {
				"pwe_gameplay_encouraging_words_07",
				"pwe_gameplay_encouraging_words_08",
				"pwe_gameplay_encouraging_words_09",
				"pwe_gameplay_encouraging_words_10",
				"pwe_gameplay_encouraging_words_11",
				"pwe_gameplay_encouraging_words_12",
				"pwe_gameplay_encouraging_words_13",
				"pwe_gameplay_encouraging_words_14",
				"pwe_gameplay_encouraging_words_15",
				"pwe_gameplay_encouraging_words_16"
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
				2.3275833129883,
				1.7452499866486,
				2.9509375095367,
				1.410916686058,
				3.3304998874664,
				3.3320207595825,
				2.7843749523163,
				4.1182084083557,
				4.1484375,
				3.493958234787
			},
			localization_strings = {
				"pwe_gameplay_encouraging_words_07",
				"pwe_gameplay_encouraging_words_08",
				"pwe_gameplay_encouraging_words_09",
				"pwe_gameplay_encouraging_words_10",
				"pwe_gameplay_encouraging_words_11",
				"pwe_gameplay_encouraging_words_12",
				"pwe_gameplay_encouraging_words_13",
				"pwe_gameplay_encouraging_words_14",
				"pwe_gameplay_encouraging_words_15",
				"pwe_gameplay_encouraging_words_16"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_globadier = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_07",
				"pwe_gameplay_seeing_a_globadier_08",
				"pwe_gameplay_seeing_a_globadier_09",
				"pwe_gameplay_seeing_a_globadier_10"
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
			sound_events_duration = {
				0.99164581298828,
				1.3089582920075,
				3.2304167747498,
				3.4629166126251,
				4.4079585075378,
				2.1170625686645
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_07",
				"pwe_gameplay_seeing_a_globadier_08",
				"pwe_gameplay_seeing_a_globadier_09",
				"pwe_gameplay_seeing_a_globadier_10"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bright_wizard_being_helped_up = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_bright_wizard_being_helped_up_02",
				"pwe_gameplay_bright_wizard_being_helped_up_05",
				"pwe_gameplay_bright_wizard_being_helped_up_06",
				"pwe_gameplay_bright_wizard_being_helped_up_07",
				"pwe_gameplay_bright_wizard_being_helped_up_08",
				"pwe_gameplay_bright_wizard_being_helped_up_09",
				"pwe_gameplay_bright_wizard_being_helped_up_10",
				"pwe_gameplay_bright_wizard_being_helped_up_11"
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
				1.4556457996368,
				2.1155207157135,
				1.8338124752045,
				2.7396874427795,
				1.984375,
				2.8809790611267,
				2.951812505722,
				2.5362915992737
			},
			localization_strings = {
				"pwe_gameplay_bright_wizard_being_helped_up_02",
				"pwe_gameplay_bright_wizard_being_helped_up_05",
				"pwe_gameplay_bright_wizard_being_helped_up_06",
				"pwe_gameplay_bright_wizard_being_helped_up_07",
				"pwe_gameplay_bright_wizard_being_helped_up_08",
				"pwe_gameplay_bright_wizard_being_helped_up_09",
				"pwe_gameplay_bright_wizard_being_helped_up_10",
				"pwe_gameplay_bright_wizard_being_helped_up_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_armoured_enemy_witch_hunter = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_armoured_enemy_witch_hunter_04",
				"pwe_gameplay_armoured_enemy_witch_hunter_05",
				"pwe_gameplay_armoured_enemy_witch_hunter_06",
				"pwe_gameplay_armoured_enemy_witch_hunter_07",
				"pwe_gameplay_armoured_enemy_witch_hunter_08",
				"pwe_gameplay_armoured_enemy_witch_hunter_09",
				"pwe_gameplay_armoured_enemy_witch_hunter_10",
				"pwe_gameplay_armoured_enemy_witch_hunter_11"
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
				3.1728541851044,
				2.948041677475,
				2.1007082462311,
				4.0728125572205,
				2.8317499160767,
				2.320770740509,
				3.1376249790192,
				3.0368542671204
			},
			localization_strings = {
				"pwe_gameplay_armoured_enemy_witch_hunter_04",
				"pwe_gameplay_armoured_enemy_witch_hunter_05",
				"pwe_gameplay_armoured_enemy_witch_hunter_06",
				"pwe_gameplay_armoured_enemy_witch_hunter_07",
				"pwe_gameplay_armoured_enemy_witch_hunter_08",
				"pwe_gameplay_armoured_enemy_witch_hunter_09",
				"pwe_gameplay_armoured_enemy_witch_hunter_10",
				"pwe_gameplay_armoured_enemy_witch_hunter_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bright_wizard_on_a_frenzy = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_bright_wizard_on_a_frenzy_05",
				"pwe_gameplay_bright_wizard_on_a_frenzy_06",
				"pwe_gameplay_bright_wizard_on_a_frenzy_07",
				"pwe_gameplay_bright_wizard_on_a_frenzy_08"
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
				3.2581875324249,
				3.7519791126251,
				1.768770813942,
				4.1018958091736
			},
			localization_strings = {
				"pwe_gameplay_bright_wizard_on_a_frenzy_05",
				"pwe_gameplay_bright_wizard_on_a_frenzy_06",
				"pwe_gameplay_bright_wizard_on_a_frenzy_07",
				"pwe_gameplay_bright_wizard_on_a_frenzy_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dwarf_ranger_on_a_frenzy = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pwe_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pwe_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pwe_gameplay_dwarf_ranger_on_a_frenzy_08"
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
				4.5346875190735,
				2.2707500457764,
				2.7358748912811,
				4.5512914657593
			},
			localization_strings = {
				"pwe_gameplay_dwarf_ranger_on_a_frenzy_05",
				"pwe_gameplay_dwarf_ranger_on_a_frenzy_06",
				"pwe_gameplay_dwarf_ranger_on_a_frenzy_07",
				"pwe_gameplay_dwarf_ranger_on_a_frenzy_08"
			},
			randomize_indexes = {}
		},
		pwe_curse = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_curse_02",
				"pwe_curse_03",
				"pwe_curse_04",
				"pwe_curse_06",
				"pwe_curse_07",
				"pwe_curse_08",
				"pwe_curse_09",
				"pwe_curse_11",
				"pwe_curse_12"
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
				"face_angry"
			},
			sound_events_duration = {
				1.665895819664,
				1.6733541488648,
				1.2655208110809,
				2.0403957366943,
				1.4692916870117,
				2.978437423706,
				1.6686874628067,
				1.7149791717529,
				2.0074999332428
			},
			localization_strings = {
				"pwe_curse_02",
				"pwe_curse_03",
				"pwe_curse_04",
				"pwe_curse_06",
				"pwe_curse_07",
				"pwe_curse_08",
				"pwe_curse_09",
				"pwe_curse_11",
				"pwe_curse_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_witch_hunter_on_a_frenzy = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_witch_hunter_on_a_frenzy_05",
				"pwe_gameplay_witch_hunter_on_a_frenzy_06",
				"pwe_gameplay_witch_hunter_on_a_frenzy_07",
				"pwe_gameplay_witch_hunter_on_a_frenzy_08",
				"pwe_gameplay_witch_hunter_on_a_frenzy_09"
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
				2.6610000133514,
				3.5192084312439,
				4.3823957443237,
				3.8133542537689,
				4.7815833091736
			},
			localization_strings = {
				"pwe_gameplay_witch_hunter_on_a_frenzy_05",
				"pwe_gameplay_witch_hunter_on_a_frenzy_06",
				"pwe_gameplay_witch_hunter_on_a_frenzy_07",
				"pwe_gameplay_witch_hunter_on_a_frenzy_08",
				"pwe_gameplay_witch_hunter_on_a_frenzy_09"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_using_potion = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_using_potion_06",
				"pwe_gameplay_using_potion_07",
				"pwe_gameplay_using_potion_08",
				"pwe_gameplay_using_potion_09",
				"pwe_gameplay_using_potion_10",
				"pwe_gameplay_using_potion_11",
				"pwe_gameplay_using_potion_12",
				"pwe_gameplay_using_potion_13",
				"pwe_gameplay_using_potion_14"
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
				"face_disgust",
				"face_disgust",
				"face_disgust",
				"face_disgust",
				"face_disgust",
				"face_disgust",
				"face_disgust",
				"face_disgust",
				"face_disgust"
			},
			sound_events_duration = {
				2.7393124103546,
				2.4210000038147,
				2.0084166526794,
				2.2215416431427,
				2.9351665973663,
				2.4208958148956,
				2.1614582538605,
				2.8386459350586,
				2.5420000553131
			},
			localization_strings = {
				"pwe_gameplay_using_potion_06",
				"pwe_gameplay_using_potion_07",
				"pwe_gameplay_using_potion_08",
				"pwe_gameplay_using_potion_09",
				"pwe_gameplay_using_potion_10",
				"pwe_gameplay_using_potion_11",
				"pwe_gameplay_using_potion_12",
				"pwe_gameplay_using_potion_13",
				"pwe_gameplay_using_potion_14"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_special_enemy_kill_melee = {
			sound_events_n = 16,
			face_animations_n = 16,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 16,
			sound_events = {
				"pwe_gameplay_special_enemy_kill_melee_09",
				"pwe_gameplay_special_enemy_kill_melee_10",
				"pwe_gameplay_special_enemy_kill_melee_11",
				"pwe_gameplay_special_enemy_kill_melee_12",
				"pwe_gameplay_special_enemy_kill_melee_13",
				"pwe_gameplay_special_enemy_kill_melee_14",
				"pwe_gameplay_special_enemy_kill_melee_15",
				"pwe_gameplay_special_enemy_kill_melee_16",
				"pwe_gameplay_special_enemy_kill_melee_17",
				"pwe_gameplay_special_enemy_kill_melee_18",
				"pwe_gameplay_special_enemy_kill_melee_19",
				"pwe_gameplay_special_enemy_kill_melee_20",
				"pwe_gameplay_special_enemy_kill_melee_21",
				"pwe_gameplay_special_enemy_kill_melee_22",
				"pwe_gameplay_special_enemy_kill_melee_23",
				"pwe_gameplay_special_enemy_kill_melee_24"
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
			sound_events_duration = {
				3.9194791316986,
				2.0232604146004,
				3.4076042175293,
				3.6818542480469,
				2.8705415725708,
				4.0942916870117,
				4.9320001602173,
				2.9935834407806,
				2.8452708721161,
				2.3475415706634,
				3.6623542308807,
				3.3110415935516,
				4.6897916793823,
				1.6427708864212,
				2.7078750133514,
				4.0322709083557
			},
			localization_strings = {
				"pwe_gameplay_special_enemy_kill_melee_09",
				"pwe_gameplay_special_enemy_kill_melee_10",
				"pwe_gameplay_special_enemy_kill_melee_11",
				"pwe_gameplay_special_enemy_kill_melee_12",
				"pwe_gameplay_special_enemy_kill_melee_13",
				"pwe_gameplay_special_enemy_kill_melee_14",
				"pwe_gameplay_special_enemy_kill_melee_15",
				"pwe_gameplay_special_enemy_kill_melee_16",
				"pwe_gameplay_special_enemy_kill_melee_17",
				"pwe_gameplay_special_enemy_kill_melee_18",
				"pwe_gameplay_special_enemy_kill_melee_19",
				"pwe_gameplay_special_enemy_kill_melee_20",
				"pwe_gameplay_special_enemy_kill_melee_21",
				"pwe_gameplay_special_enemy_kill_melee_22",
				"pwe_gameplay_special_enemy_kill_melee_23",
				"pwe_gameplay_special_enemy_kill_melee_24"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_stormfiend = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_killing_a_stormfiend_01",
				"pwe_gameplay_killing_a_stormfiend_02",
				"pwe_gameplay_killing_a_stormfiend_03",
				"pwe_gameplay_killing_a_stormfiend_04",
				"pwe_gameplay_killing_a_stormfiend_05",
				"pwe_gameplay_killing_a_stormfiend_06",
				"pwe_gameplay_killing_a_stormfiend_07",
				"pwe_gameplay_killing_a_stormfiend_08"
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
				4.1008958816528,
				1.5923541784286,
				2.5795834064484,
				3.6076667308807,
				2.598354101181,
				5.6899166107178,
				3.1409375667572,
				4.1296458244324
			},
			localization_strings = {
				"pwe_gameplay_killing_a_stormfiend_01",
				"pwe_gameplay_killing_a_stormfiend_02",
				"pwe_gameplay_killing_a_stormfiend_03",
				"pwe_gameplay_killing_a_stormfiend_04",
				"pwe_gameplay_killing_a_stormfiend_05",
				"pwe_gameplay_killing_a_stormfiend_06",
				"pwe_gameplay_killing_a_stormfiend_07",
				"pwe_gameplay_killing_a_stormfiend_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_skaven_warpfire_thrower = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_08"
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
				3.3928332328796,
				2.59339594841,
				2.4877500534058,
				3.5300834178925,
				4.9708957672119,
				5.0748748779297,
				2.4586665630341,
				1.7281041145325
			},
			localization_strings = {
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_01",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_02",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_03",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_04",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_05",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_06",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_07",
				"pwe_gameplay_killing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_helped_by_witch_hunter = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_helped_by_witch_hunter_05",
				"pwe_gameplay_helped_by_witch_hunter_06",
				"pwe_gameplay_helped_by_witch_hunter_07",
				"pwe_gameplay_helped_by_witch_hunter_08"
			},
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
			sound_events_duration = {
				2.1633334159851,
				1.7592083215714,
				2.8882708549499,
				2.4933125972748
			},
			localization_strings = {
				"pwe_gameplay_helped_by_witch_hunter_05",
				"pwe_gameplay_helped_by_witch_hunter_06",
				"pwe_gameplay_helped_by_witch_hunter_07",
				"pwe_gameplay_helped_by_witch_hunter_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_friendly_fire_witch_hunter = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_friendly_fire_witch_hunter_05",
				"pwe_gameplay_friendly_fire_witch_hunter_06",
				"pwe_gameplay_friendly_fire_witch_hunter_07",
				"pwe_gameplay_friendly_fire_witch_hunter_08",
				"pwe_gameplay_friendly_fire_witch_hunter_09"
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
				4.7034792900085,
				3.395604133606,
				3.0001459121704,
				3.9874792098999,
				2.5013749599457
			},
			localization_strings = {
				"pwe_gameplay_friendly_fire_witch_hunter_05",
				"pwe_gameplay_friendly_fire_witch_hunter_06",
				"pwe_gameplay_friendly_fire_witch_hunter_07",
				"pwe_gameplay_friendly_fire_witch_hunter_08",
				"pwe_gameplay_friendly_fire_witch_hunter_09"
			},
			randomize_indexes = {}
		},
		pwe_curse_forced = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "mutator_special_occasion",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_curse_02",
				"pwe_curse_03",
				"pwe_curse_04",
				"pwe_curse_06",
				"pwe_curse_07",
				"pwe_curse_08",
				"pwe_curse_09",
				"pwe_curse_11",
				"pwe_curse_12"
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
				"face_angry"
			},
			sound_events_duration = {
				1.665895819664,
				1.6733541488648,
				1.2655208110809,
				2.0403957366943,
				1.4692916870117,
				2.978437423706,
				1.6686874628067,
				1.7149791717529,
				2.0074999332428
			},
			localization_strings = {
				"pwe_curse_02",
				"pwe_curse_03",
				"pwe_curse_04",
				"pwe_curse_06",
				"pwe_curse_07",
				"pwe_curse_08",
				"pwe_curse_09",
				"pwe_curse_11",
				"pwe_curse_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_helped_by_dwarf_ranger = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_helped_by_dwarf_ranger_05",
				"pwe_gameplay_helped_by_dwarf_ranger_06",
				"pwe_gameplay_helped_by_dwarf_ranger_07",
				"pwe_gameplay_helped_by_dwarf_ranger_08",
				"pwe_gameplay_helped_by_dwarf_ranger_09",
				"pwe_gameplay_helped_by_dwarf_ranger_10",
				"pwe_gameplay_helped_by_dwarf_ranger_12"
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				2.6545417308807,
				2.3853750228882,
				3.6738333702087,
				2.430520772934,
				1.6274791955948,
				2.1833333969116,
				2.4053542613983
			},
			localization_strings = {
				"pwe_gameplay_helped_by_dwarf_ranger_05",
				"pwe_gameplay_helped_by_dwarf_ranger_06",
				"pwe_gameplay_helped_by_dwarf_ranger_07",
				"pwe_gameplay_helped_by_dwarf_ranger_08",
				"pwe_gameplay_helped_by_dwarf_ranger_09",
				"pwe_gameplay_helped_by_dwarf_ranger_10",
				"pwe_gameplay_helped_by_dwarf_ranger_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_incoming_globadier = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_incoming_globadier_01",
				"pwe_gameplay_incoming_globadier_02",
				"pwe_gameplay_incoming_globadier_03",
				"pwe_gameplay_incoming_globadier_04",
				"pwe_gameplay_incoming_globadier_05",
				"pwe_gameplay_incoming_globadier_06"
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
				2.357958316803,
				3.5886042118073,
				2.2263751029968,
				1.8159999847412,
				2.0430624485016,
				2.8480417728424
			},
			localization_strings = {
				"pwe_gameplay_incoming_globadier_01",
				"pwe_gameplay_incoming_globadier_02",
				"pwe_gameplay_incoming_globadier_03",
				"pwe_gameplay_incoming_globadier_04",
				"pwe_gameplay_incoming_globadier_05",
				"pwe_gameplay_incoming_globadier_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_packmaster = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_killing_packmaster_01",
				"pwe_gameplay_killing_packmaster_04",
				"pwe_gameplay_killing_packmaster_05",
				"pwe_gameplay_killing_packmaster_06"
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
				2.2907917499542,
				1.6248333454132,
				3.2030000686645,
				4.2897706031799
			},
			localization_strings = {
				"pwe_gameplay_killing_packmaster_01",
				"pwe_gameplay_killing_packmaster_04",
				"pwe_gameplay_killing_packmaster_05",
				"pwe_gameplay_killing_packmaster_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_helped_by_bright_wizard = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_helped_by_bright_wizard_01",
				"pwe_gameplay_helped_by_bright_wizard_02",
				"pwe_gameplay_helped_by_bright_wizard_03",
				"pwe_gameplay_helped_by_bright_wizard_04"
			},
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
			sound_events_duration = {
				2.560250043869,
				2.4041457176209,
				3.8914165496826,
				2.3360834121704
			},
			localization_strings = {
				"pwe_gameplay_helped_by_bright_wizard_01",
				"pwe_gameplay_helped_by_bright_wizard_02",
				"pwe_gameplay_helped_by_bright_wizard_03",
				"pwe_gameplay_helped_by_bright_wizard_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_globadier_guck = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_globadier_guck_01",
				"pwe_gameplay_globadier_guck_02",
				"pwe_gameplay_globadier_guck_03",
				"pwe_gameplay_globadier_guck_07",
				"pwe_gameplay_globadier_guck_08",
				"pwe_gameplay_globadier_guck_11"
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				0.88064581155777,
				0.78193747997284,
				1.4660625457764,
				1.6417708396912,
				2.3264791965485,
				2.0114998817444
			},
			localization_strings = {
				"pwe_gameplay_globadier_guck_01",
				"pwe_gameplay_globadier_guck_02",
				"pwe_gameplay_globadier_guck_03",
				"pwe_gameplay_globadier_guck_07",
				"pwe_gameplay_globadier_guck_08",
				"pwe_gameplay_globadier_guck_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_armoured_enemy_bright_wizard = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_armoured_enemy_bright_wizard_04",
				"pwe_gameplay_armoured_enemy_bright_wizard_05",
				"pwe_gameplay_armoured_enemy_bright_wizard_06",
				"pwe_gameplay_armoured_enemy_bright_wizard_07",
				"pwe_gameplay_armoured_enemy_bright_wizard_08",
				"pwe_gameplay_armoured_enemy_bright_wizard_09",
				"pwe_gameplay_armoured_enemy_bright_wizard_10",
				"pwe_gameplay_armoured_enemy_bright_wizard_11"
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
				1.1137917041779,
				1.3412083387375,
				1.6164582967758,
				1.481604218483,
				2.0397083759308,
				2.106645822525,
				2.3132500648499,
				2.0407707691193
			},
			localization_strings = {
				"pwe_gameplay_armoured_enemy_bright_wizard_04",
				"pwe_gameplay_armoured_enemy_bright_wizard_05",
				"pwe_gameplay_armoured_enemy_bright_wizard_06",
				"pwe_gameplay_armoured_enemy_bright_wizard_07",
				"pwe_gameplay_armoured_enemy_bright_wizard_08",
				"pwe_gameplay_armoured_enemy_bright_wizard_09",
				"pwe_gameplay_armoured_enemy_bright_wizard_10",
				"pwe_gameplay_armoured_enemy_bright_wizard_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_empire_soldier_on_a_frenzy = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_empire_soldier_on_a_frenzy_02",
				"pwe_gameplay_empire_soldier_on_a_frenzy_05",
				"pwe_gameplay_empire_soldier_on_a_frenzy_06",
				"pwe_gameplay_empire_soldier_on_a_frenzy_07",
				"pwe_gameplay_empire_soldier_on_a_frenzy_08"
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
				3.7823123931885,
				6.2630414962769,
				3.1751248836517,
				4.7142915725708,
				4.5806460380554
			},
			localization_strings = {
				"pwe_gameplay_empire_soldier_on_a_frenzy_02",
				"pwe_gameplay_empire_soldier_on_a_frenzy_05",
				"pwe_gameplay_empire_soldier_on_a_frenzy_06",
				"pwe_gameplay_empire_soldier_on_a_frenzy_07",
				"pwe_gameplay_empire_soldier_on_a_frenzy_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_empire_soldier_grabbed = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_empire_soldier_grabbed_06",
				"pwe_gameplay_empire_soldier_grabbed_07",
				"pwe_gameplay_empire_soldier_grabbed_08",
				"pwe_gameplay_empire_soldier_grabbed_09",
				"pwe_gameplay_empire_soldier_grabbed_10",
				"pwe_gameplay_empire_soldier_grabbed_11",
				"pwe_gameplay_empire_soldier_grabbed_12"
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
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			sound_events_duration = {
				3.7172915935516,
				2.4523124694824,
				1.3842083215714,
				3.9321041107178,
				3.0019583702087,
				4.647937297821,
				3.8686873912811
			},
			localization_strings = {
				"pwe_gameplay_empire_soldier_grabbed_06",
				"pwe_gameplay_empire_soldier_grabbed_07",
				"pwe_gameplay_empire_soldier_grabbed_08",
				"pwe_gameplay_empire_soldier_grabbed_09",
				"pwe_gameplay_empire_soldier_grabbed_10",
				"pwe_gameplay_empire_soldier_grabbed_11",
				"pwe_gameplay_empire_soldier_grabbed_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_out_of_ammo = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_out_of_ammo_06",
				"pwe_gameplay_out_of_ammo_07",
				"pwe_gameplay_out_of_ammo_08",
				"pwe_gameplay_out_of_ammo_09",
				"pwe_gameplay_out_of_ammo_10",
				"pwe_gameplay_out_of_ammo_11",
				"pwe_gameplay_out_of_ammo_12",
				"pwe_gameplay_out_of_ammo_13",
				"pwe_gameplay_out_of_ammo_14"
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
			sound_events_duration = {
				1.4643750190735,
				1.2061874866486,
				1.3813749551773,
				1.9628332853317,
				2.7486040592194,
				2.2743332386017,
				1.3138333559036,
				1.4301458597183,
				1.5205416679382
			},
			localization_strings = {
				"pwe_gameplay_out_of_ammo_06",
				"pwe_gameplay_out_of_ammo_07",
				"pwe_gameplay_out_of_ammo_08",
				"pwe_gameplay_out_of_ammo_09",
				"pwe_gameplay_out_of_ammo_10",
				"pwe_gameplay_out_of_ammo_11",
				"pwe_gameplay_out_of_ammo_12",
				"pwe_gameplay_out_of_ammo_13",
				"pwe_gameplay_out_of_ammo_14"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_wizard_plague = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_wizard_plague_01",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_02",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_03",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_04",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_05",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_06",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_07",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.6963334083557,
				7.8407292366028,
				3.1303958892822,
				2.8760416507721,
				2.8100833296776,
				1.6794583797455,
				1.4857499599457,
				1.8359792232513
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_wizard_plague_01",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_02",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_03",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_04",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_05",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_06",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_07",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_health = {
			sound_events_n = 13,
			face_animations_n = 13,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 13,
			sound_events = {
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_06",
				"pwe_gameplay_spots_health_07",
				"pwe_gameplay_spots_health_08",
				"pwe_gameplay_spots_health_09",
				"pwe_gameplay_spots_health_10",
				"pwe_gameplay_spots_health_11",
				"pwe_gameplay_spots_health_12",
				"pwe_gameplay_spots_health_13",
				"pwe_gameplay_spots_health_14",
				"pwe_gameplay_spots_health_15",
				"pwe_gameplay_spots_health_16"
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
			sound_events_duration = {
				2.1787917613983,
				1.3825207948685,
				2.4761250019074,
				3.6331250667572,
				3.3442709445953,
				2.8820834159851,
				1.6988333463669,
				1.6743750572205,
				1.4741250276566,
				1.1117708683014,
				2.9518542289734,
				3.7914791107178,
				4.1413331031799
			},
			localization_strings = {
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_06",
				"pwe_gameplay_spots_health_07",
				"pwe_gameplay_spots_health_08",
				"pwe_gameplay_spots_health_09",
				"pwe_gameplay_spots_health_10",
				"pwe_gameplay_spots_health_11",
				"pwe_gameplay_spots_health_12",
				"pwe_gameplay_spots_health_13",
				"pwe_gameplay_spots_health_14",
				"pwe_gameplay_spots_health_15",
				"pwe_gameplay_spots_health_16"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_ammo = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_11",
				"pwe_gameplay_spots_ammo_12",
				"pwe_gameplay_spots_ammo_13",
				"pwe_gameplay_spots_ammo_14",
				"pwe_gameplay_spots_ammo_15"
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
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			sound_events_duration = {
				1.0168124735355,
				1.4996041655541,
				3.466500043869,
				1.5579792261124,
				4.212375164032,
				1.7668750286102,
				2.3687083721161
			},
			localization_strings = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_11",
				"pwe_gameplay_spots_ammo_12",
				"pwe_gameplay_spots_ammo_13",
				"pwe_gameplay_spots_ammo_14",
				"pwe_gameplay_spots_ammo_15"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_minotaur = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_killing_a_minotaur_01",
				"pwe_gameplay_killing_a_minotaur_02",
				"pwe_gameplay_killing_a_minotaur_03",
				"pwe_gameplay_killing_a_minotaur_04",
				"pwe_gameplay_killing_a_minotaur_05",
				"pwe_gameplay_killing_a_minotaur_06",
				"pwe_gameplay_killing_a_minotaur_07",
				"pwe_gameplay_killing_a_minotaur_08"
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
				1.901583313942,
				3.0347082614899,
				2.3998959064484,
				2.9672083854675,
				3.1629583835602,
				3.5860834121704,
				2.1278123855591,
				3.370374917984
			},
			localization_strings = {
				"pwe_gameplay_killing_a_minotaur_01",
				"pwe_gameplay_killing_a_minotaur_02",
				"pwe_gameplay_killing_a_minotaur_03",
				"pwe_gameplay_killing_a_minotaur_04",
				"pwe_gameplay_killing_a_minotaur_05",
				"pwe_gameplay_killing_a_minotaur_06",
				"pwe_gameplay_killing_a_minotaur_07",
				"pwe_gameplay_killing_a_minotaur_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_nearing_objective_deadline = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_objective_nearing_objective_deadline_01",
				"pwe_objective_nearing_objective_deadline_04",
				"pwe_objective_nearing_objective_deadline_05",
				"pwe_objective_nearing_objective_deadline_06",
				"pwe_objective_nearing_objective_deadline_07"
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
				0.89481252431869,
				1.6545728445053,
				1.5949583053589,
				1.8584582805634,
				1.9018958806992
			},
			localization_strings = {
				"pwe_objective_nearing_objective_deadline_01",
				"pwe_objective_nearing_objective_deadline_04",
				"pwe_objective_nearing_objective_deadline_05",
				"pwe_objective_nearing_objective_deadline_06",
				"pwe_objective_nearing_objective_deadline_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bright_wizard_low_on_health = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_bright_wizard_low_on_health_05",
				"pwe_gameplay_bright_wizard_low_on_health_06",
				"pwe_gameplay_bright_wizard_low_on_health_07",
				"pwe_gameplay_bright_wizard_low_on_health_08"
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
			sound_events_duration = {
				3.0447916984558,
				1.6613124608993,
				3.1087083816528,
				2.0069999694824
			},
			localization_strings = {
				"pwe_gameplay_bright_wizard_low_on_health_05",
				"pwe_gameplay_bright_wizard_low_on_health_06",
				"pwe_gameplay_bright_wizard_low_on_health_07",
				"pwe_gameplay_bright_wizard_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_down = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_down_01",
				"pwe_objective_correct_path_down_05",
				"pwe_objective_correct_path_down_06",
				"pwe_objective_correct_path_down_07"
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
			sound_events_duration = {
				0.81889581680298,
				2.6671979427338,
				1.8814375400543,
				2.2438750267029
			},
			localization_strings = {
				"pwe_objective_correct_path_down_01",
				"pwe_objective_correct_path_down_05",
				"pwe_objective_correct_path_down_06",
				"pwe_objective_correct_path_down_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_witch_hunter_low_on_health = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_witch_hunter_low_on_health_05",
				"pwe_gameplay_witch_hunter_low_on_health_06",
				"pwe_gameplay_witch_hunter_low_on_health_07",
				"pwe_gameplay_witch_hunter_low_on_health_08",
				"pwe_gameplay_witch_hunter_low_on_health_09"
			},
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
			sound_events_duration = {
				2.3897292613983,
				2.3087291717529,
				2.1642291545868,
				3.2564792633057,
				4.159083366394
			},
			localization_strings = {
				"pwe_gameplay_witch_hunter_low_on_health_05",
				"pwe_gameplay_witch_hunter_low_on_health_06",
				"pwe_gameplay_witch_hunter_low_on_health_07",
				"pwe_gameplay_witch_hunter_low_on_health_08",
				"pwe_gameplay_witch_hunter_low_on_health_09"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_witch_hunter_being_helped_up = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_witch_hunter_being_helped_up_01",
				"pwe_gameplay_witch_hunter_being_helped_up_05",
				"pwe_gameplay_witch_hunter_being_helped_up_06",
				"pwe_gameplay_witch_hunter_being_helped_up_07",
				"pwe_gameplay_witch_hunter_being_helped_up_08",
				"pwe_gameplay_witch_hunter_being_helped_up_09",
				"pwe_gameplay_witch_hunter_being_helped_up_10",
				"pwe_gameplay_witch_hunter_being_helped_up_11"
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
				1.4904375076294,
				3.0301249027252,
				3.6178333759308,
				2.9603750705719,
				2.625937461853,
				2.0248124599457,
				2.2315208911896,
				2.3442499637604
			},
			localization_strings = {
				"pwe_gameplay_witch_hunter_being_helped_up_01",
				"pwe_gameplay_witch_hunter_being_helped_up_05",
				"pwe_gameplay_witch_hunter_being_helped_up_06",
				"pwe_gameplay_witch_hunter_being_helped_up_07",
				"pwe_gameplay_witch_hunter_being_helped_up_08",
				"pwe_gameplay_witch_hunter_being_helped_up_09",
				"pwe_gameplay_witch_hunter_being_helped_up_10",
				"pwe_gameplay_witch_hunter_being_helped_up_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_low_on_health = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_low_on_health_05",
				"pwe_gameplay_low_on_health_06",
				"pwe_gameplay_low_on_health_08",
				"pwe_gameplay_low_on_health_09",
				"pwe_gameplay_low_on_health_10",
				"pwe_gameplay_low_on_health_11",
				"pwe_gameplay_low_on_health_12",
				"pwe_gameplay_low_on_health_13"
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
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			sound_events_duration = {
				2.6898748874664,
				2.2467083930969,
				1.883291721344,
				3.1298749446869,
				2.9511249065399,
				4.558000087738,
				3.9560000896454,
				2.9744582176209
			},
			localization_strings = {
				"pwe_gameplay_low_on_health_05",
				"pwe_gameplay_low_on_health_06",
				"pwe_gameplay_low_on_health_08",
				"pwe_gameplay_low_on_health_09",
				"pwe_gameplay_low_on_health_10",
				"pwe_gameplay_low_on_health_11",
				"pwe_gameplay_low_on_health_12",
				"pwe_gameplay_low_on_health_13"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_ratling = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_killing_ratling_03",
				"pwe_gameplay_killing_ratling_05",
				"pwe_gameplay_killing_ratling_06",
				"pwe_gameplay_killing_ratling_07"
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
				1.9344166517258,
				3.3429791927338,
				1.7836458683014,
				2.4277083873749
			},
			localization_strings = {
				"pwe_gameplay_killing_ratling_03",
				"pwe_gameplay_killing_ratling_05",
				"pwe_gameplay_killing_ratling_06",
				"pwe_gameplay_killing_ratling_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_weapon_flair_offensive = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_activating_magic_weapon_offensive_01",
				"pwe_gameplay_activating_magic_weapon_offensive_02",
				"pwe_gameplay_activating_magic_weapon_offensive_03",
				"pwe_gameplay_activating_magic_weapon_offensive_04",
				"pwe_gameplay_activating_magic_weapon_offensive_05"
			},
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
			sound_events_duration = {
				2.9757082462311,
				2.4642083644867,
				2.6654167175293,
				4.5684375762939,
				1.648854136467
			},
			localization_strings = {
				"pwe_gameplay_activating_magic_weapon_offensive_01",
				"pwe_gameplay_activating_magic_weapon_offensive_02",
				"pwe_gameplay_activating_magic_weapon_offensive_03",
				"pwe_gameplay_activating_magic_weapon_offensive_04",
				"pwe_gameplay_activating_magic_weapon_offensive_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_friendly_fire_bright_wizard = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_friendly_fire_bright_wizard_03",
				"pwe_gameplay_friendly_fire_bright_wizard_05",
				"pwe_gameplay_friendly_fire_bright_wizard_06",
				"pwe_gameplay_friendly_fire_bright_wizard_07",
				"pwe_gameplay_friendly_fire_bright_wizard_08",
				"pwe_gameplay_friendly_fire_bright_wizard_09",
				"pwe_gameplay_friendly_fire_bright_wizard_10",
				"pwe_gameplay_friendly_fire_bright_wizard_11"
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
				2.6523957252502,
				1.9193542003632,
				2.7949583530426,
				2.317583322525,
				2.6890208721161,
				3.0217499732971,
				2.741229057312,
				4.3550000190735
			},
			localization_strings = {
				"pwe_gameplay_friendly_fire_bright_wizard_03",
				"pwe_gameplay_friendly_fire_bright_wizard_05",
				"pwe_gameplay_friendly_fire_bright_wizard_06",
				"pwe_gameplay_friendly_fire_bright_wizard_07",
				"pwe_gameplay_friendly_fire_bright_wizard_08",
				"pwe_gameplay_friendly_fire_bright_wizard_09",
				"pwe_gameplay_friendly_fire_bright_wizard_10",
				"pwe_gameplay_friendly_fire_bright_wizard_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_helped_by_empire_soldier = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_helped_by_empire_soldier_05",
				"pwe_gameplay_helped_by_empire_soldier_06",
				"pwe_gameplay_helped_by_empire_soldier_07",
				"pwe_gameplay_helped_by_empire_soldier_08"
			},
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
			sound_events_duration = {
				2.9739792346954,
				2.8710832595825,
				1.9408124685288,
				1.6986875534058
			},
			localization_strings = {
				"pwe_gameplay_helped_by_empire_soldier_05",
				"pwe_gameplay_helped_by_empire_soldier_06",
				"pwe_gameplay_helped_by_empire_soldier_07",
				"pwe_gameplay_helped_by_empire_soldier_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_pm_in_combat = {
			sound_events_n = 12,
			face_animations_n = 12,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pwe_gameplay_hearing_a_pm_in_combat_01",
				"pwe_gameplay_hearing_a_pm_in_combat_02",
				"pwe_gameplay_hearing_a_pm_in_combat_03",
				"pwe_gameplay_hearing_a_pm_in_combat_04",
				"pwe_gameplay_hearing_a_plague_monk_combat_01",
				"pwe_gameplay_hearing_a_plague_monk_combat_02",
				"pwe_gameplay_hearing_a_plague_monk_combat_03",
				"pwe_gameplay_hearing_a_plague_monk_combat_04",
				"pwe_gameplay_hearing_a_plague_monk_combat_05",
				"pwe_gameplay_hearing_a_plague_monk_combat_06",
				"pwe_gameplay_hearing_a_plague_monk_combat_07",
				"pwe_gameplay_hearing_a_plague_monk_combat_08"
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
			sound_events_duration = {
				2.2550625801086,
				2.0953333377838,
				1.95077085495,
				1.410395860672,
				2.1407084465027,
				1.2596249580383,
				1.3642499446869,
				1.9353958368301,
				2.4984583854675,
				1.7577916383743,
				1.4465833902359,
				2.3748126029968
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_pm_in_combat_01",
				"pwe_gameplay_hearing_a_pm_in_combat_02",
				"pwe_gameplay_hearing_a_pm_in_combat_03",
				"pwe_gameplay_hearing_a_pm_in_combat_04",
				"pwe_gameplay_hearing_a_plague_monk_combat_01",
				"pwe_gameplay_hearing_a_plague_monk_combat_02",
				"pwe_gameplay_hearing_a_plague_monk_combat_03",
				"pwe_gameplay_hearing_a_plague_monk_combat_04",
				"pwe_gameplay_hearing_a_plague_monk_combat_05",
				"pwe_gameplay_hearing_a_plague_monk_combat_06",
				"pwe_gameplay_hearing_a_plague_monk_combat_07",
				"pwe_gameplay_hearing_a_plague_monk_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_goal_achieved_escape = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_objective_goal_achieved_escape_05",
				"pwe_objective_goal_achieved_escape_06",
				"pwe_objective_goal_achieved_escape_07",
				"pwe_objective_goal_achieved_escape_08",
				"pwe_objective_goal_achieved_escape_09",
				"pwe_objective_goal_achieved_escape_10",
				"pwe_objective_goal_achieved_escape_11",
				"pwe_objective_goal_achieved_escape_12"
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
				3.1920416355133,
				3.3954374790192,
				2.4963958263397,
				4.569854259491,
				2.1280417442322,
				2.6779999732971,
				2.4113125801086,
				2.5476458072662
			},
			localization_strings = {
				"pwe_objective_goal_achieved_escape_05",
				"pwe_objective_goal_achieved_escape_06",
				"pwe_objective_goal_achieved_escape_07",
				"pwe_objective_goal_achieved_escape_08",
				"pwe_objective_goal_achieved_escape_09",
				"pwe_objective_goal_achieved_escape_10",
				"pwe_objective_goal_achieved_escape_11",
				"pwe_objective_goal_achieved_escape_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dwarf_ranger_being_helped_up = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_dwarf_ranger_being_helped_up_05",
				"pwe_gameplay_dwarf_ranger_being_helped_up_06",
				"pwe_gameplay_dwarf_ranger_being_helped_up_07",
				"pwe_gameplay_dwarf_ranger_being_helped_up_08",
				"pwe_gameplay_dwarf_ranger_being_helped_up_09",
				"pwe_gameplay_dwarf_ranger_being_helped_up_10",
				"pwe_gameplay_dwarf_ranger_being_helped_up_11",
				"pwe_gameplay_dwarf_ranger_being_helped_up_12"
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
				2.3280625343323,
				2.1656458377838,
				2.5271248817444,
				3.1485209465027,
				2.7290208339691,
				1.5908124446869,
				1.845583319664,
				2.4897916316986
			},
			localization_strings = {
				"pwe_gameplay_dwarf_ranger_being_helped_up_05",
				"pwe_gameplay_dwarf_ranger_being_helped_up_06",
				"pwe_gameplay_dwarf_ranger_being_helped_up_07",
				"pwe_gameplay_dwarf_ranger_being_helped_up_08",
				"pwe_gameplay_dwarf_ranger_being_helped_up_09",
				"pwe_gameplay_dwarf_ranger_being_helped_up_10",
				"pwe_gameplay_dwarf_ranger_being_helped_up_11",
				"pwe_gameplay_dwarf_ranger_being_helped_up_12"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_bridge = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_bridge_17",
				"pwe_objective_correct_path_bridge_18",
				"pwe_objective_correct_path_bridge_19",
				"pwe_objective_correct_path_bridge_20"
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
			sound_events_duration = {
				1.6986666321755,
				1.6391458511352,
				1.9721875190735,
				1.8487083911896
			},
			localization_strings = {
				"pwe_objective_correct_path_bridge_17",
				"pwe_objective_correct_path_bridge_18",
				"pwe_objective_correct_path_bridge_19",
				"pwe_objective_correct_path_bridge_20"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_player_pounced = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
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
			sound_events_duration = {
				3.1520416736603,
				1.0867083072662,
				2.6682915687561,
				1.7609791755676,
				2.2080833911896,
				2.0916666984558,
				2.7163751125336,
				2.4906666278839
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
		pwe_gameplay_hearing_a_Skaven_warpfire_thrower = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_06"
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
				5.4463748931885,
				2.7288959026337,
				4.9221043586731,
				1.8636666536331,
				2.0715625286102,
				1.5134999752045
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_casual_quotes = {
			sound_events_n = 20,
			face_animations_n = 20,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 20,
			sound_events = {
				"pwe_gameplay_casual_quotes_16",
				"pwe_gameplay_casual_quotes_17",
				"pwe_gameplay_casual_quotes_18",
				"pwe_gameplay_casual_quotes_20",
				"pwe_gameplay_casual_quotes_21",
				"pwe_gameplay_casual_quotes_22",
				"pwe_gameplay_casual_quotes_24",
				"pwe_gameplay_casual_quotes_25",
				"pwe_gameplay_casual_quotes_26",
				"pwe_gameplay_casual_quotes_27",
				"pwe_gameplay_casual_quotes_28",
				"pwe_gameplay_casual_quotes_29",
				"pwe_gameplay_casual_quotes_30",
				"pwe_gameplay_casual_quotes_31",
				"pwe_gameplay_casual_quotes_32",
				"pwe_gameplay_casual_quotes_33",
				"pwe_gameplay_casual_quotes_34",
				"pwe_gameplay_casual_quotes_35",
				"pwe_gameplay_casual_quotes_36",
				"pwe_gameplay_casual_quotes_37"
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
				"face_neutral"
			},
			sound_events_duration = {
				7.3667917251587,
				8.7341251373291,
				6.4865417480469,
				6.0406455993652,
				4.4497499465942,
				7.1522498130798,
				7.7806248664856,
				5.2950415611267,
				7.1997709274292,
				2.4307084083557,
				5.4561877250671,
				6.7735414505005,
				6.2598333358765,
				3.182874917984,
				3.1941874027252,
				4.2944793701172,
				4.3036251068115,
				3.8672082424164,
				3.7534582614899,
				3.6137707233429
			},
			localization_strings = {
				"pwe_gameplay_casual_quotes_16",
				"pwe_gameplay_casual_quotes_17",
				"pwe_gameplay_casual_quotes_18",
				"pwe_gameplay_casual_quotes_20",
				"pwe_gameplay_casual_quotes_21",
				"pwe_gameplay_casual_quotes_22",
				"pwe_gameplay_casual_quotes_24",
				"pwe_gameplay_casual_quotes_25",
				"pwe_gameplay_casual_quotes_26",
				"pwe_gameplay_casual_quotes_27",
				"pwe_gameplay_casual_quotes_28",
				"pwe_gameplay_casual_quotes_29",
				"pwe_gameplay_casual_quotes_30",
				"pwe_gameplay_casual_quotes_31",
				"pwe_gameplay_casual_quotes_32",
				"pwe_gameplay_casual_quotes_33",
				"pwe_gameplay_casual_quotes_34",
				"pwe_gameplay_casual_quotes_35",
				"pwe_gameplay_casual_quotes_36",
				"pwe_gameplay_casual_quotes_37"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_ladder_up = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_ladder_up_01",
				"pwe_objective_correct_path_ladder_up_02",
				"pwe_objective_correct_path_ladder_up_03",
				"pwe_objective_correct_path_ladder_up_04"
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
			sound_events_duration = {
				1.0445417165756,
				1.1025832891464,
				1.8577500581741,
				2.7965415716171
			},
			localization_strings = {
				"pwe_objective_correct_path_ladder_up_01",
				"pwe_objective_correct_path_ladder_up_02",
				"pwe_objective_correct_path_ladder_up_03",
				"pwe_objective_correct_path_ladder_up_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dead_body = {
			sound_events_n = 5,
			face_animations_n = 5,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "casual_talk",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_dead_body_06",
				"pwe_gameplay_dead_body_07",
				"pwe_gameplay_dead_body_08",
				"pwe_gameplay_dead_body_09",
				"pwe_gameplay_dead_body_10"
			},
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
			sound_events_duration = {
				3.8276040554047,
				3.1703958511352,
				3.6008958816528,
				2.9337916374206,
				2.9147083759308
			},
			localization_strings = {
				"pwe_gameplay_dead_body_06",
				"pwe_gameplay_dead_body_07",
				"pwe_gameplay_dead_body_08",
				"pwe_gameplay_dead_body_09",
				"pwe_gameplay_dead_body_10"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_chaos_wizard_tentacle = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
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
			sound_events_duration = {
				3.5325000286102,
				4.3611249923706,
				3.5891666412353,
				1.847416639328,
				1.8670624494553,
				1.9826666116715
			},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_alley = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_alley_01",
				"pwe_objective_correct_path_alley_02",
				"pwe_objective_correct_path_alley_03",
				"pwe_objective_correct_path_alley_04"
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
			sound_events_duration = {
				1.17087495327,
				1.0468958616257,
				1.7533333301544,
				1.5516666173935
			},
			localization_strings = {
				"pwe_objective_correct_path_alley_01",
				"pwe_objective_correct_path_alley_02",
				"pwe_objective_correct_path_alley_03",
				"pwe_objective_correct_path_alley_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_witch_hunter_grabbed = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_witch_hunter_grabbed_03",
				"pwe_gameplay_witch_hunter_grabbed_05",
				"pwe_gameplay_witch_hunter_grabbed_07",
				"pwe_gameplay_witch_hunter_grabbed_08",
				"pwe_gameplay_witch_hunter_grabbed_09",
				"pwe_gameplay_witch_hunter_grabbed_10"
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
			sound_events_duration = {
				4.9106874465942,
				4.8246250152588,
				3.8152084350586,
				2.1625416278839,
				1.7491250038147,
				3.693416595459
			},
			localization_strings = {
				"pwe_gameplay_witch_hunter_grabbed_03",
				"pwe_gameplay_witch_hunter_grabbed_05",
				"pwe_gameplay_witch_hunter_grabbed_07",
				"pwe_gameplay_witch_hunter_grabbed_08",
				"pwe_gameplay_witch_hunter_grabbed_09",
				"pwe_gameplay_witch_hunter_grabbed_10"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dead_end = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_dead_end_01",
				"pwe_gameplay_dead_end_02",
				"pwe_gameplay_dead_end_07",
				"pwe_gameplay_dead_end_08",
				"pwe_gameplay_dead_end_09",
				"pwe_gameplay_dead_end_10"
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
			sound_events_duration = {
				2.4671874046326,
				1.9728749990463,
				1.5247708559036,
				2.1030833721161,
				1.7913957834244,
				1.7684375047684
			},
			localization_strings = {
				"pwe_gameplay_dead_end_01",
				"pwe_gameplay_dead_end_02",
				"pwe_gameplay_dead_end_07",
				"pwe_gameplay_dead_end_08",
				"pwe_gameplay_dead_end_09",
				"pwe_gameplay_dead_end_10"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_a_chaos_warrior = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_killing_a_chaos_warrior_01",
				"pwe_gameplay_killing_a_chaos_warrior_02",
				"pwe_gameplay_killing_a_chaos_warrior_03",
				"pwe_gameplay_killing_a_chaos_warrior_04",
				"pwe_gameplay_killing_a_chaos_warrior_05",
				"pwe_gameplay_killing_a_chaos_warrior_06",
				"pwe_gameplay_killing_a_chaos_warrior_07",
				"pwe_gameplay_killing_a_chaos_warrior_08"
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
				2.1076457500458,
				3.54722905159,
				1.9799582958221,
				3.040937423706,
				2.5885000228882,
				2.4980416297913,
				4.8057918548584,
				2.2747082710266
			},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_warrior_01",
				"pwe_gameplay_killing_a_chaos_warrior_02",
				"pwe_gameplay_killing_a_chaos_warrior_03",
				"pwe_gameplay_killing_a_chaos_warrior_04",
				"pwe_gameplay_killing_a_chaos_warrior_05",
				"pwe_gameplay_killing_a_chaos_warrior_06",
				"pwe_gameplay_killing_a_chaos_warrior_07",
				"pwe_gameplay_killing_a_chaos_warrior_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_spawn = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_spawn_01",
				"pwe_gameplay_hearing_a_chaos_spawn_02",
				"pwe_gameplay_hearing_a_chaos_spawn_03",
				"pwe_gameplay_hearing_a_chaos_spawn_04"
			},
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
			sound_events_duration = {
				3.7299165725708,
				3.9458124637604,
				3.6626250743866,
				3.9532706737518
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_spawn_01",
				"pwe_gameplay_hearing_a_chaos_spawn_02",
				"pwe_gameplay_hearing_a_chaos_spawn_03",
				"pwe_gameplay_hearing_a_chaos_spawn_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_troll = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hearing_a_troll_01",
				"pwe_gameplay_hearing_a_troll_02",
				"pwe_gameplay_hearing_a_troll_03",
				"pwe_gameplay_hearing_a_troll_04",
				"pwe_gameplay_hearing_a_troll_05",
				"pwe_gameplay_hearing_a_troll_06"
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
				4.7565832138061,
				4.6733331680298,
				2.0906875133514,
				5.0642604827881,
				2.2240417003632,
				3.6097917556763
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_troll_01",
				"pwe_gameplay_hearing_a_troll_02",
				"pwe_gameplay_hearing_a_troll_03",
				"pwe_gameplay_hearing_a_troll_04",
				"pwe_gameplay_hearing_a_troll_05",
				"pwe_gameplay_hearing_a_troll_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bright_wizard_dead = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_bright_wizard_dead_05",
				"pwe_gameplay_bright_wizard_dead_06",
				"pwe_gameplay_bright_wizard_dead_07",
				"pwe_gameplay_bright_wizard_dead_08"
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
				2.5423123836517,
				1.6884583234787,
				3.5200207233429,
				2.2106873989105
			},
			localization_strings = {
				"pwe_gameplay_bright_wizard_dead_05",
				"pwe_gameplay_bright_wizard_dead_06",
				"pwe_gameplay_bright_wizard_dead_07",
				"pwe_gameplay_bright_wizard_dead_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_marauder_berserker_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_marauder_berserker_combat_01",
				"pwe_gameplay_hearing_marauder_berserker_combat_02",
				"pwe_gameplay_hearing_marauder_berserker_combat_03",
				"pwe_gameplay_hearing_marauder_berserker_combat_04",
				"pwe_gameplay_hearing_marauder_berserker_combat_05",
				"pwe_gameplay_hearing_marauder_berserker_combat_06",
				"pwe_gameplay_hearing_marauder_berserker_combat_07",
				"pwe_gameplay_hearing_marauder_berserker_combat_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.0770208835602,
				1.0064166784286,
				1.4155625104904,
				1.4495832920075,
				1.2288333177566,
				1.6747708320618,
				1.6456041932106,
				1.5186458826065
			},
			localization_strings = {
				"pwe_gameplay_hearing_marauder_berserker_combat_01",
				"pwe_gameplay_hearing_marauder_berserker_combat_02",
				"pwe_gameplay_hearing_marauder_berserker_combat_03",
				"pwe_gameplay_hearing_marauder_berserker_combat_04",
				"pwe_gameplay_hearing_marauder_berserker_combat_05",
				"pwe_gameplay_hearing_marauder_berserker_combat_06",
				"pwe_gameplay_hearing_marauder_berserker_combat_07",
				"pwe_gameplay_hearing_marauder_berserker_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dwarf_ranger_low_on_health = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_dwarf_ranger_low_on_health_05",
				"pwe_gameplay_dwarf_ranger_low_on_health_06",
				"pwe_gameplay_dwarf_ranger_low_on_health_07",
				"pwe_gameplay_dwarf_ranger_low_on_health_08",
				"pwe_gameplay_dwarf_ranger_low_on_health_09",
				"pwe_gameplay_dwarf_ranger_low_on_health_10",
				"pwe_gameplay_dwarf_ranger_low_on_health_11",
				"pwe_gameplay_dwarf_ranger_low_on_health_12"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
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
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				1.6015833616257,
				2.4217500686645,
				2.1476666927338,
				1.9873958826065,
				2.6553542613983,
				3.037750005722,
				3.7945415973663,
				2.8770208358765
			},
			localization_strings = {
				"pwe_gameplay_dwarf_ranger_low_on_health_05",
				"pwe_gameplay_dwarf_ranger_low_on_health_06",
				"pwe_gameplay_dwarf_ranger_low_on_health_07",
				"pwe_gameplay_dwarf_ranger_low_on_health_08",
				"pwe_gameplay_dwarf_ranger_low_on_health_09",
				"pwe_gameplay_dwarf_ranger_low_on_health_10",
				"pwe_gameplay_dwarf_ranger_low_on_health_11",
				"pwe_gameplay_dwarf_ranger_low_on_health_12"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_up = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_objective_correct_path_up_01",
				"pwe_objective_correct_path_up_02",
				"pwe_objective_correct_path_up_03",
				"pwe_objective_correct_path_up_05"
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
			sound_events_duration = {
				0.89272916316986,
				1.0439374446869,
				1.4601458311081,
				1.0745416879654
			},
			localization_strings = {
				"pwe_objective_correct_path_up_01",
				"pwe_objective_correct_path_up_02",
				"pwe_objective_correct_path_up_03",
				"pwe_objective_correct_path_up_05"
			},
			randomize_indexes = {}
		},
		pwe_objective_correct_path_this_way = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "guidance",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_objective_correct_path_this_way_01",
				"pwe_objective_correct_path_this_way_04",
				"pwe_objective_correct_path_this_way_05",
				"pwe_objective_correct_path_this_way_06",
				"pwe_objective_correct_path_this_way_07",
				"pwe_objective_correct_path_this_way_08"
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
			sound_events_duration = {
				0.85245835781097,
				1.4920833110809,
				1.7027916908264,
				1.8492916822434,
				1.6483333110809,
				2.7834167480469
			},
			localization_strings = {
				"pwe_objective_correct_path_this_way_01",
				"pwe_objective_correct_path_this_way_04",
				"pwe_objective_correct_path_this_way_05",
				"pwe_objective_correct_path_this_way_06",
				"pwe_objective_correct_path_this_way_07",
				"pwe_objective_correct_path_this_way_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_skaven_patrol_stormvermin = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_07"
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
				"face_nervous",
				"face_concerned",
				"face_concerned",
				"face_nervous",
				"face_nervous",
				"face_concerned",
				"face_concerned"
			},
			sound_events_duration = {
				5.0315418243408,
				3.8264582157135,
				2.7984583377838,
				3.3561458587647,
				4.1999998092651,
				3.0220415592194,
				4.7155418395996
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_no_nearby_teammates = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_no_nearby_teammates_07",
				"pwe_gameplay_no_nearby_teammates_09",
				"pwe_gameplay_no_nearby_teammates_10",
				"pwe_gameplay_no_nearby_teammates_11",
				"pwe_gameplay_no_nearby_teammates_12",
				"pwe_gameplay_no_nearby_teammates_13",
				"pwe_gameplay_no_nearby_teammates_14",
				"pwe_gameplay_no_nearby_teammates_15"
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
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous",
				"face_nervous"
			},
			sound_events_duration = {
				2.0545415878296,
				3.2981040477753,
				2.3866250514984,
				1.9461458921433,
				1.7099583148956,
				3.875937461853,
				3.8122084140778,
				3.2080625295639
			},
			localization_strings = {
				"pwe_gameplay_no_nearby_teammates_07",
				"pwe_gameplay_no_nearby_teammates_09",
				"pwe_gameplay_no_nearby_teammates_10",
				"pwe_gameplay_no_nearby_teammates_11",
				"pwe_gameplay_no_nearby_teammates_12",
				"pwe_gameplay_no_nearby_teammates_13",
				"pwe_gameplay_no_nearby_teammates_14",
				"pwe_gameplay_no_nearby_teammates_15"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_witch_hunter_eaten = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_witch_hunter_eaten_01",
				"pwe_witch_hunter_eaten_02",
				"pwe_witch_hunter_eaten_03",
				"pwe_witch_hunter_eaten_04",
				"pwe_witch_hunter_eaten_05",
				"pwe_witch_hunter_eaten_06"
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
			sound_events_duration = {
				4.0441875457764,
				4.632833480835,
				5.9208331108093,
				6.2578539848328,
				6.0153956413269,
				4.0841875076294
			},
			localization_strings = {
				"pwe_witch_hunter_eaten_01",
				"pwe_witch_hunter_eaten_02",
				"pwe_witch_hunter_eaten_03",
				"pwe_witch_hunter_eaten_04",
				"pwe_witch_hunter_eaten_05",
				"pwe_witch_hunter_eaten_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_killing_lootrat = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_killing_lootrat_05",
				"pwe_gameplay_killing_lootrat_06",
				"pwe_gameplay_killing_lootrat_07",
				"pwe_gameplay_killing_lootrat_08"
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
				1.6067708730698,
				3.145124912262,
				2.9565207958221,
				2.0267083644867
			},
			localization_strings = {
				"pwe_gameplay_killing_lootrat_05",
				"pwe_gameplay_killing_lootrat_06",
				"pwe_gameplay_killing_lootrat_07",
				"pwe_gameplay_killing_lootrat_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_gutter_runner = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_gutter_runner_07",
				"pwe_gameplay_hearing_a_gutter_runner_08",
				"pwe_gameplay_hearing_a_gutter_runner_09",
				"pwe_gameplay_hearing_a_gutter_runner_10",
				"pwe_gameplay_hearing_a_gutter_runner_11",
				"pwe_gameplay_hearing_a_gutter_runner_12",
				"pwe_gameplay_hearing_a_gutter_runner_13",
				"pwe_gameplay_hearing_a_gutter_runner_14"
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				2.4496457576752,
				1.6463541984558,
				1.6638333797455,
				2.1347291469574,
				2.1338541507721,
				2.6583333015442,
				2.2741665840149,
				2.4155416488648
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_gutter_runner_07",
				"pwe_gameplay_hearing_a_gutter_runner_08",
				"pwe_gameplay_hearing_a_gutter_runner_09",
				"pwe_gameplay_hearing_a_gutter_runner_10",
				"pwe_gameplay_hearing_a_gutter_runner_11",
				"pwe_gameplay_hearing_a_gutter_runner_12",
				"pwe_gameplay_hearing_a_gutter_runner_13",
				"pwe_gameplay_hearing_a_gutter_runner_14"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_standard_bearer_buff_active = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_standard_bearer_buff_active_01",
				"pwe_gameplay_standard_bearer_buff_active_02",
				"pwe_gameplay_standard_bearer_buff_active_03",
				"pwe_gameplay_standard_bearer_buff_active_04",
				"pwe_gameplay_standard_bearer_buff_active_05",
				"pwe_gameplay_standard_bearer_buff_active_06",
				"pwe_gameplay_standard_bearer_buff_active_07",
				"pwe_gameplay_standard_bearer_buff_active_08"
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
				2.2875416278839,
				2.0231249332428,
				2.2162082195282,
				2.288125038147,
				3.1284999847412,
				2.9438750743866,
				2.3793957233429,
				2.2445623874664
			},
			localization_strings = {
				"pwe_gameplay_standard_bearer_buff_active_01",
				"pwe_gameplay_standard_bearer_buff_active_02",
				"pwe_gameplay_standard_bearer_buff_active_03",
				"pwe_gameplay_standard_bearer_buff_active_04",
				"pwe_gameplay_standard_bearer_buff_active_05",
				"pwe_gameplay_standard_bearer_buff_active_06",
				"pwe_gameplay_standard_bearer_buff_active_07",
				"pwe_gameplay_standard_bearer_buff_active_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_interacting_with_objective = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_objective_interacting_with_objective_02",
				"pwe_objective_interacting_with_objective_04",
				"pwe_objective_interacting_with_objective_05",
				"pwe_objective_interacting_with_objective_06",
				"pwe_objective_interacting_with_objective_07",
				"pwe_objective_interacting_with_objective_08"
			},
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
			sound_events_duration = {
				2.1442708969116,
				3.3199167251587,
				3.2783124446869,
				1.9957292079925,
				2.0224165916443,
				3.2526457309723
			},
			localization_strings = {
				"pwe_objective_interacting_with_objective_02",
				"pwe_objective_interacting_with_objective_04",
				"pwe_objective_interacting_with_objective_05",
				"pwe_objective_interacting_with_objective_06",
				"pwe_objective_interacting_with_objective_07",
				"pwe_objective_interacting_with_objective_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_skaven_rat_ogre = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_11"
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
				1.5526041984558,
				1.6662083864212,
				3.0842082500458,
				3.2406666278839,
				2.9079999923706,
				2.1578540802002
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_07",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_08",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_09",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_10",
				"pwe_gameplay_seeing_a_Skaven_rat_ogre_11"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_parry_witch_hunter = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_parry_witch_hunter_01",
				"pwe_gameplay_parry_witch_hunter_02",
				"pwe_gameplay_parry_witch_hunter_03",
				"pwe_gameplay_parry_witch_hunter_04"
			},
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
			sound_events_duration = {
				2.6314165592194,
				2.1241874694824,
				1.4510416984558,
				2.5968332290649
			},
			localization_strings = {
				"pwe_gameplay_parry_witch_hunter_01",
				"pwe_gameplay_parry_witch_hunter_02",
				"pwe_gameplay_parry_witch_hunter_03",
				"pwe_gameplay_parry_witch_hunter_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_globadier_combat = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_hearing_a_globadier_combat_04",
				"pwe_gameplay_hearing_a_globadier_combat_05",
				"pwe_gameplay_hearing_a_globadier_combat_06",
				"pwe_gameplay_hearing_a_globadier_combat_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt"
			},
			sound_events_duration = {
				1.6623958349228,
				2.3846666812897,
				2.3881459236145,
				2.2342708110809
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_globadier_combat_04",
				"pwe_gameplay_hearing_a_globadier_combat_05",
				"pwe_gameplay_hearing_a_globadier_combat_06",
				"pwe_gameplay_hearing_a_globadier_combat_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_wizard_leech = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_wizard_leech_01",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_02",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_03",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_04",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_05",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_06"
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
				2.603333234787,
				2.8778958320618,
				2.149749994278,
				1.8455624580383,
				1.7378749847412,
				1.1506667137146
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_wizard_leech_01",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_02",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_03",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_04",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_05",
				"pwe_gameplay_hearing_a_chaos_wizard_leech_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_wizard_wind_combat = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_07"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.475250005722,
				3.2638332843781,
				2.4585833549499,
				2.6813542842865,
				1.0774999856949,
				2.1653957366943,
				3.7228124141693
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_01",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_02",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_chaos_wizard_plague_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.8429269790649,
				2.2638125419617,
				1.5947083234787,
				1.5521458387375,
				2.048770904541,
				1.727979183197,
				1.9084166288376,
				1.5833749771118
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_01",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_02",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_03",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_04",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_05",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_06",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_07",
				"pwe_gameplay_hearing_a_chaos_wizard_plague_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_skaven_ratling_gun = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_11",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_12",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_13"
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
			sound_events_duration = {
				1.4262083768845,
				2.3414375782013,
				2.0555000305176,
				3.1422290802002,
				3.0346875190735,
				2.0396459102631,
				1.7066458463669
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_08",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_09",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_10",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_11",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_12",
				"pwe_gameplay_seeing_a_Skaven_ratling_gun_13"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_incoming_skaven_rat_ogre = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_incoming_skaven_rat_ogre_03",
				"pwe_gameplay_incoming_skaven_rat_ogre_05",
				"pwe_gameplay_incoming_Skaven_rat_ogre_09",
				"pwe_gameplay_incoming_Skaven_rat_ogre_10",
				"pwe_gameplay_incoming_Skaven_rat_ogre_11",
				"pwe_gameplay_incoming_Skaven_rat_ogre_12",
				"pwe_gameplay_incoming_Skaven_rat_ogre_13",
				"pwe_gameplay_incoming_Skaven_rat_ogre_14"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				0.96137499809265,
				0.63891667127609,
				2.3249790668488,
				1.9144375324249,
				1.9330832958221,
				1.6444375514984,
				1.9906041622162,
				1.5962500572205
			},
			localization_strings = {
				"pwe_gameplay_incoming_skaven_rat_ogre_03",
				"pwe_gameplay_incoming_skaven_rat_ogre_05",
				"pwe_gameplay_incoming_Skaven_rat_ogre_09",
				"pwe_gameplay_incoming_Skaven_rat_ogre_10",
				"pwe_gameplay_incoming_Skaven_rat_ogre_11",
				"pwe_gameplay_incoming_Skaven_rat_ogre_12",
				"pwe_gameplay_incoming_Skaven_rat_ogre_13",
				"pwe_gameplay_incoming_Skaven_rat_ogre_14"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_ungor_archer = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_ungor_archer_01",
				"pwe_gameplay_seeing_a_ungor_archer_02",
				"pwe_gameplay_seeing_a_ungor_archer_03",
				"pwe_gameplay_seeing_a_ungor_archer_04",
				"pwe_gameplay_seeing_a_ungor_archer_05",
				"pwe_gameplay_seeing_a_ungor_archer_06",
				"pwe_gameplay_seeing_a_ungor_archer_07",
				"pwe_gameplay_seeing_a_ungor_archer_08"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				1.0066041946411,
				2.4493124485016,
				3.3062083721161,
				2.9430000782013,
				1.7396978735924,
				2.6629166603088,
				1.7831457853317,
				2.317583322525
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_ungor_archer_01",
				"pwe_gameplay_seeing_a_ungor_archer_02",
				"pwe_gameplay_seeing_a_ungor_archer_03",
				"pwe_gameplay_seeing_a_ungor_archer_04",
				"pwe_gameplay_seeing_a_ungor_archer_05",
				"pwe_gameplay_seeing_a_ungor_archer_06",
				"pwe_gameplay_seeing_a_ungor_archer_07",
				"pwe_gameplay_seeing_a_ungor_archer_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_heard_bright_wizard_in_trouble = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_heard_bright_wizard_in_trouble_01",
				"pwe_gameplay_heard_bright_wizard_in_trouble_02",
				"pwe_gameplay_heard_bright_wizard_in_trouble_03",
				"pwe_gameplay_heard_bright_wizard_in_trouble_04",
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
				2.1667292118073,
				2.8870208263397,
				3.1275832653046,
				1.7281874418259,
				1.6292916536331,
				2.7755625247955,
				3.6468124389648,
				1.5331875085831,
				1.455958366394
			},
			localization_strings = {
				"pwe_gameplay_heard_bright_wizard_in_trouble_01",
				"pwe_gameplay_heard_bright_wizard_in_trouble_02",
				"pwe_gameplay_heard_bright_wizard_in_trouble_03",
				"pwe_gameplay_heard_bright_wizard_in_trouble_04",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_09",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_10",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_11",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_12",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_13"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_minotaur = {
			sound_events_n = 14,
			face_animations_n = 14,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 14,
			sound_events = {
				"pwe_gameplay_hearing_a_minotaur_01",
				"pwe_gameplay_hearing_a_minotaur_02",
				"pwe_gameplay_hearing_a_minotaur_03",
				"pwe_gameplay_hearing_a_minotaur_04",
				"pwe_gameplay_hearing_a_minotaur_05",
				"pwe_gameplay_hearing_a_minotaur_06",
				"pwe_gameplay_hearing_a_minotaur_combat_01",
				"pwe_gameplay_hearing_a_minotaur_combat_02",
				"pwe_gameplay_hearing_a_minotaur_combat_03",
				"pwe_gameplay_hearing_a_minotaur_combat_04",
				"pwe_gameplay_hearing_a_minotaur_combat_05",
				"pwe_gameplay_hearing_a_minotaur_combat_06",
				"pwe_gameplay_hearing_a_minotaur_combat_07",
				"pwe_gameplay_hearing_a_minotaur_combat_08"
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
			sound_events_duration = {
				4.748083114624,
				2.2007083892822,
				3.0753540992737,
				3.5546875,
				2.8450417518616,
				2.982958316803,
				2.1440000534058,
				2.1488332748413,
				1.1507291793823,
				3.4426457881927,
				1.8307083845139,
				3.545000076294,
				2.7172915935516,
				2.2310833930969
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_minotaur_01",
				"pwe_gameplay_hearing_a_minotaur_02",
				"pwe_gameplay_hearing_a_minotaur_03",
				"pwe_gameplay_hearing_a_minotaur_04",
				"pwe_gameplay_hearing_a_minotaur_05",
				"pwe_gameplay_hearing_a_minotaur_06",
				"pwe_gameplay_hearing_a_minotaur_combat_01",
				"pwe_gameplay_hearing_a_minotaur_combat_02",
				"pwe_gameplay_hearing_a_minotaur_combat_03",
				"pwe_gameplay_hearing_a_minotaur_combat_04",
				"pwe_gameplay_hearing_a_minotaur_combat_05",
				"pwe_gameplay_hearing_a_minotaur_combat_06",
				"pwe_gameplay_hearing_a_minotaur_combat_07",
				"pwe_gameplay_hearing_a_minotaur_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_last_hero_standing = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_last_hero_standing_01",
				"pwe_last_hero_standing_02",
				"pwe_last_hero_standing_03",
				"pwe_last_hero_standing_04",
				"pwe_last_hero_standing_05",
				"pwe_last_hero_standing_06",
				"pwe_last_hero_standing_07",
				"pwe_last_hero_standing_08"
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
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain",
				"face_pain"
			},
			sound_events_duration = {
				3.5400832891464,
				3.6507084369659,
				3.7934582233429,
				3.4144999980927,
				4.118604183197,
				1.4003750085831,
				3.6604375839233,
				4.2485208511353
			},
			localization_strings = {
				"pwe_last_hero_standing_01",
				"pwe_last_hero_standing_02",
				"pwe_last_hero_standing_03",
				"pwe_last_hero_standing_04",
				"pwe_last_hero_standing_05",
				"pwe_last_hero_standing_06",
				"pwe_last_hero_standing_07",
				"pwe_last_hero_standing_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_empire_soldier_being_helped_up = {
			sound_events_n = 9,
			face_animations_n = 9,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_empire_soldier_being_helped_up_05",
				"pwe_gameplay_empire_soldier_being_helped_up_06",
				"pwe_gameplay_empire_soldier_being_helped_up_07",
				"pwe_gameplay_empire_soldier_being_helped_up_08",
				"pwe_gameplay_empire_soldier_being_helped_up_09",
				"pwe_gameplay_empire_soldier_being_helped_up_10",
				"pwe_gameplay_empire_soldier_being_helped_up_11",
				"pwe_gameplay_empire_soldier_being_helped_up_12",
				"pwe_gameplay_empire_soldier_being_helped_up_13"
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
			sound_events_duration = {
				2.9997291564941,
				2.6720416545868,
				1.7043124437332,
				2.596583366394,
				3.1679999828339,
				2.3929584026337,
				3.2594375610352,
				2.2885415554047,
				1.7281458377838
			},
			localization_strings = {
				"pwe_gameplay_empire_soldier_being_helped_up_05",
				"pwe_gameplay_empire_soldier_being_helped_up_06",
				"pwe_gameplay_empire_soldier_being_helped_up_07",
				"pwe_gameplay_empire_soldier_being_helped_up_08",
				"pwe_gameplay_empire_soldier_being_helped_up_09",
				"pwe_gameplay_empire_soldier_being_helped_up_10",
				"pwe_gameplay_empire_soldier_being_helped_up_11",
				"pwe_gameplay_empire_soldier_being_helped_up_12",
				"pwe_gameplay_empire_soldier_being_helped_up_13"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_stormvermin = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_stormvermin_02",
				"pwe_gameplay_seeing_a_stormvermin_08",
				"pwe_gameplay_seeing_a_stormvermin_09",
				"pwe_gameplay_seeing_a_stormvermin_10",
				"pwe_gameplay_seeing_a_stormvermin_11",
				"pwe_gameplay_seeing_a_stormvermin_12",
				"pwe_gameplay_seeing_a_stormvermin_13",
				"pwe_gameplay_seeing_a_stormvermin_14"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			sound_events_duration = {
				2.6539375782013,
				3.1020624637604,
				1.488041639328,
				2.3120832443237,
				2.2794582843781,
				3.2977707386017,
				2.7984166145325,
				3.3620417118073
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_stormvermin_02",
				"pwe_gameplay_seeing_a_stormvermin_08",
				"pwe_gameplay_seeing_a_stormvermin_09",
				"pwe_gameplay_seeing_a_stormvermin_10",
				"pwe_gameplay_seeing_a_stormvermin_11",
				"pwe_gameplay_seeing_a_stormvermin_12",
				"pwe_gameplay_seeing_a_stormvermin_13",
				"pwe_gameplay_seeing_a_stormvermin_14"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_troll_combat = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_hearing_a_troll_combat_01",
				"pwe_gameplay_hearing_a_troll_combat_02",
				"pwe_gameplay_hearing_a_troll_combat_03",
				"pwe_gameplay_hearing_a_troll_combat_04",
				"pwe_gameplay_hearing_a_troll_combat_05",
				"pwe_gameplay_hearing_a_troll_combat_06",
				"pwe_gameplay_hearing_a_troll_combat_07",
				"pwe_gameplay_hearing_a_troll_combat_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				0.78489583730698,
				1.0316457748413,
				1.2601875066757,
				1.3416041135788,
				2.9248124361038,
				1.3216458559036,
				1.0622500181198,
				3.1418333053589
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_troll_combat_01",
				"pwe_gameplay_hearing_a_troll_combat_02",
				"pwe_gameplay_hearing_a_troll_combat_03",
				"pwe_gameplay_hearing_a_troll_combat_04",
				"pwe_gameplay_hearing_a_troll_combat_05",
				"pwe_gameplay_hearing_a_troll_combat_06",
				"pwe_gameplay_hearing_a_troll_combat_07",
				"pwe_gameplay_hearing_a_troll_combat_08"
			},
			randomize_indexes = {}
		},
		pwe_objective_achieved_all_but_one_goal = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_objective_achieved_all_but_one_goal_01",
				"pwe_objective_achieved_all_but_one_goal_03",
				"pwe_objective_achieved_all_but_one_goal_05",
				"pwe_objective_achieved_all_but_one_goal_06",
				"pwe_objective_achieved_all_but_one_goal_07",
				"pwe_objective_achieved_all_but_one_goal_08"
			},
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
			sound_events_duration = {
				0.98274999856949,
				1.4128957986832,
				2.9229166507721,
				2.4491145610809,
				1.9051978588104,
				2.5766665935516
			},
			localization_strings = {
				"pwe_objective_achieved_all_but_one_goal_01",
				"pwe_objective_achieved_all_but_one_goal_03",
				"pwe_objective_achieved_all_but_one_goal_05",
				"pwe_objective_achieved_all_but_one_goal_06",
				"pwe_objective_achieved_all_but_one_goal_07",
				"pwe_objective_achieved_all_but_one_goal_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hearing_a_skaven_rat_ogre = {
			sound_events_n = 6,
			face_animations_n = 6,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_12"
			},
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
			sound_events_duration = {
				3.9493334293366,
				3.130937576294,
				1.8271042108536,
				2.2148332595825,
				2.3739376068115,
				1.4488958120346
			},
			localization_strings = {
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_07",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_08",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_09",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_10",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_11",
				"pwe_gameplay_hearing_a_Skaven_rat_ogre_12"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hears_incoming_horde = {
			sound_events_n = 18,
			face_animations_n = 18,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 18,
			sound_events = {
				"pwe_gameplay_hears_incoming_horde_10",
				"pwe_gameplay_hears_incoming_horde_11",
				"pwe_gameplay_hears_incoming_horde_12",
				"pwe_gameplay_hears_incoming_horde_13",
				"pwe_gameplay_hears_incoming_horde_14",
				"pwe_gameplay_hears_incoming_horde_15",
				"pwe_gameplay_hears_incoming_horde_16",
				"pwe_gameplay_hears_incoming_horde_17",
				"pwe_gameplay_hears_incoming_horde_18",
				"pwe_gameplay_hears_incoming_horde_19",
				"pwe_gameplay_hears_incoming_horde_20",
				"pwe_gameplay_hears_incoming_horde_21",
				"pwe_gameplay_hears_incoming_horde_22",
				"pwe_gameplay_hears_incoming_horde_23",
				"pwe_gameplay_hears_incoming_horde_24",
				"pwe_gameplay_hears_incoming_horde_25",
				"pwe_gameplay_hears_incoming_horde_26",
				"pwe_gameplay_hears_incoming_horde_27"
			},
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
			sound_events_duration = {
				2.0383334159851,
				1.9964791536331,
				2.5064375400543,
				2.6141874790192,
				3.6379165649414,
				4.9776043891907,
				2.4286875724792,
				1.7820833921433,
				2.6100416183472,
				1.2838749885559,
				2.3276040554047,
				2.2718541026115,
				3.9835833311081,
				4.2445206642151,
				3.5901041030884,
				5.146062374115,
				4.0541043281555,
				3.6297082901001
			},
			localization_strings = {
				"pwe_gameplay_hears_incoming_horde_10",
				"pwe_gameplay_hears_incoming_horde_11",
				"pwe_gameplay_hears_incoming_horde_12",
				"pwe_gameplay_hears_incoming_horde_13",
				"pwe_gameplay_hears_incoming_horde_14",
				"pwe_gameplay_hears_incoming_horde_15",
				"pwe_gameplay_hears_incoming_horde_16",
				"pwe_gameplay_hears_incoming_horde_17",
				"pwe_gameplay_hears_incoming_horde_18",
				"pwe_gameplay_hears_incoming_horde_19",
				"pwe_gameplay_hears_incoming_horde_20",
				"pwe_gameplay_hears_incoming_horde_21",
				"pwe_gameplay_hears_incoming_horde_22",
				"pwe_gameplay_hears_incoming_horde_23",
				"pwe_gameplay_hears_incoming_horde_24",
				"pwe_gameplay_hears_incoming_horde_25",
				"pwe_gameplay_hears_incoming_horde_26",
				"pwe_gameplay_hears_incoming_horde_27"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_ambush_horde_spawned = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_ambush_horde_spawned_03",
				"pwe_gameplay_ambush_horde_spawned_07",
				"pwe_gameplay_ambush_horde_spawned_08",
				"pwe_gameplay_ambush_horde_spawned_09",
				"pwe_gameplay_ambush_horde_spawned_10",
				"pwe_gameplay_ambush_horde_spawned_11",
				"pwe_gameplay_ambush_horde_spawned_12",
				"pwe_gameplay_ambush_horde_spawned_13"
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
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			sound_events_duration = {
				3.0216250419617,
				2.362583398819,
				1.6252708435059,
				2.6306874752045,
				3.2350625991821,
				1.1015207767487,
				2.5266873836517,
				2.8729791641235
			},
			localization_strings = {
				"pwe_gameplay_ambush_horde_spawned_03",
				"pwe_gameplay_ambush_horde_spawned_07",
				"pwe_gameplay_ambush_horde_spawned_08",
				"pwe_gameplay_ambush_horde_spawned_09",
				"pwe_gameplay_ambush_horde_spawned_10",
				"pwe_gameplay_ambush_horde_spawned_11",
				"pwe_gameplay_ambush_horde_spawned_12",
				"pwe_gameplay_ambush_horde_spawned_13"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_armoured_enemy_dwarf_ranger = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_armoured_enemy_dwarf_04",
				"pwe_gameplay_armoured_enemy_dwarf_05",
				"pwe_gameplay_armoured_enemy_dwarf_06",
				"pwe_gameplay_armoured_enemy_dwarf_07",
				"pwe_gameplay_armoured_enemy_dwarf_08",
				"pwe_gameplay_armoured_enemy_dwarf_ranger_04",
				"pwe_gameplay_armoured_enemy_dwarf_ranger_05",
				"pwe_gameplay_armoured_enemy_dwarf_ranger_06"
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
				2.2664165496826,
				2.3176875114441,
				2.1363542079926,
				2.6457707881927,
				2.0434374809265,
				3.8108124732971,
				1.2440832853317,
				2.9036874771118
			},
			localization_strings = {
				"pwe_gameplay_armoured_enemy_dwarf_04",
				"pwe_gameplay_armoured_enemy_dwarf_05",
				"pwe_gameplay_armoured_enemy_dwarf_06",
				"pwe_gameplay_armoured_enemy_dwarf_07",
				"pwe_gameplay_armoured_enemy_dwarf_08",
				"pwe_gameplay_armoured_enemy_dwarf_ranger_04",
				"pwe_gameplay_armoured_enemy_dwarf_ranger_05",
				"pwe_gameplay_armoured_enemy_dwarf_ranger_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_stormfiend = {
			sound_events_n = 7,
			face_animations_n = 7,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_seeing_a_stormfiend_01",
				"pwe_gameplay_seeing_a_stormfiend_02",
				"pwe_gameplay_seeing_a_stormfiend_03",
				"pwe_gameplay_seeing_a_stormfiend_04",
				"pwe_gameplay_seeing_a_stormfiend_05",
				"pwe_gameplay_seeing_a_stormfiend_06",
				"pwe_gameplay_seeing_a_stormfiend_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				3.9651458263397,
				2.8138959407806,
				3.3447395563126,
				2.0855624675751,
				3.079541683197,
				3.2145833969116,
				6.8288331031799
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_stormfiend_01",
				"pwe_gameplay_seeing_a_stormfiend_02",
				"pwe_gameplay_seeing_a_stormfiend_03",
				"pwe_gameplay_seeing_a_stormfiend_04",
				"pwe_gameplay_seeing_a_stormfiend_05",
				"pwe_gameplay_seeing_a_stormfiend_06",
				"pwe_gameplay_seeing_a_stormfiend_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_Skaven_warpfire_thrower = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.3354165554047,
				2.8192708492279,
				2.7376666069031,
				2.7286250591278,
				3.7704167366028,
				3.7145729064941,
				3.2832915782928,
				2.8085832595825
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_01",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_02",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_03",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_04",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_05",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_06",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_07",
				"pwe_gameplay_seeing_a_Skaven_warpfire_thrower_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_chaos_wizard_plague = {
			sound_events_n = 4,
			face_animations_n = 4,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_04"
			},
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
			sound_events_duration = {
				5.1369791030884,
				3.423645734787,
				5.7460207939148,
				4.2703747749329
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_chaos_warrior = {
			sound_events_n = 8,
			face_animations_n = 8,
			database = "wood_elf_honduras",
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_warrior_01",
				"pwe_gameplay_seeing_a_chaos_warrior_02",
				"pwe_gameplay_seeing_a_chaos_warrior_03",
				"pwe_gameplay_seeing_a_chaos_warrior_04",
				"pwe_gameplay_seeing_a_chaos_warrior_05",
				"pwe_gameplay_seeing_a_chaos_warrior_06",
				"pwe_gameplay_seeing_a_chaos_warrior_07",
				"pwe_gameplay_seeing_a_chaos_warrior_08"
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
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			sound_events_duration = {
				2.7362916469574,
				2.3824062347412,
				3.6480000019074,
				3.6744999885559,
				2.8305416107178,
				2.8326666355133,
				3.4553542137146,
				3.5396249294281
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_warrior_01",
				"pwe_gameplay_seeing_a_chaos_warrior_02",
				"pwe_gameplay_seeing_a_chaos_warrior_03",
				"pwe_gameplay_seeing_a_chaos_warrior_04",
				"pwe_gameplay_seeing_a_chaos_warrior_05",
				"pwe_gameplay_seeing_a_chaos_warrior_06",
				"pwe_gameplay_seeing_a_chaos_warrior_07",
				"pwe_gameplay_seeing_a_chaos_warrior_08"
			},
			randomize_indexes = {}
		}
	})
end
