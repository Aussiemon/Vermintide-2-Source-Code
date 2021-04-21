return function ()
	define_rule({
		name = "pwe_gameplay_knocked_down_drunk",
		response = "pwe_gameplay_knocked_down_drunk",
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
		name = "pwe_gameplay_player_pounced_drunk",
		response = "pwe_gameplay_player_pounced_drunk",
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
		name = "pwe_gameplay_hearing_a_gutter_runner_drunk",
		response = "pwe_gameplay_hearing_a_gutter_runner_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_globadier_drunk",
		response = "pwe_gameplay_hearing_a_globadier_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_incoming_skaven_rat_ogre_drunk",
		response = "pwe_gameplay_incoming_skaven_rat_ogre_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_skaven_patrol_stormvermin_drunk",
		response = "pwe_gameplay_hearing_a_skaven_patrol_stormvermin_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_skaven_ratling_gun_drunk",
		response = "pwe_gameplay_hearing_a_skaven_ratling_gun_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
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
		name = "pwe_gameplay_hearing_a_gutter_runner_combat_drunk",
		response = "pwe_gameplay_hearing_a_gutter_runner_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_globadier_combat_drunk",
		response = "pwe_gameplay_hearing_a_globadier_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_skaven_rat_ogre_combat_drunk",
		response = "pwe_gameplay_hearing_a_skaven_rat_ogre_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_rate_ogre",
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_skaven_ratling_gun_combat_drunk",
		response = "pwe_gameplay_hearing_a_skaven_ratling_gun_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_chaos_spawn_combat_drunk",
		response = "pwe_gameplay_hearing_a_chaos_spawn_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_chaos_spawn_drunk",
		response = "pwe_gameplay_hearing_a_chaos_spawn_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_chaos_wizard_wind_drunk",
		response = "pwe_gameplay_hearing_a_chaos_wizard_wind_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_chaos_wizard_wind_combat_drunk",
		response = "pwe_gameplay_hearing_a_chaos_wizard_wind_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_drunk",
		response = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk",
		response = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_stormfiend_drunk",
		response = "pwe_gameplay_hearing_a_stormfiend_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_stormfiend_combat_drunk",
		response = "pwe_gameplay_hearing_a_stormfiend_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_troll_drunk",
		response = "pwe_gameplay_hearing_a_troll_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_troll_combat_drunk",
		response = "pwe_gameplay_hearing_a_troll_combat_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_skaven_rat_ogre_drunk",
		response = "pwe_gameplay_hearing_a_skaven_rat_ogre_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				75
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				1
			},
			{
				"faction_memory",
				"last_seen_rate_ogre",
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
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hears_incoming_horde_drunk",
		response = "pwe_gameplay_hears_incoming_horde_drunk",
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
		name = "pwe_gameplay_ambush_horde_spawned_drunk",
		response = "pwe_gameplay_ambush_horde_spawned_drunk",
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
		name = "pwe_gameplay_seeing_a_pm_no_drunk",
		response = "pwe_gameplay_seeing_a_pm_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_scr_no_drunk",
		response = "pwe_gameplay_seeing_a_scr_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_pm_no_drunk",
		response = "pwe_gameplay_hearing_a_pm_no_drunk",
		criterias = {
			{
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_pm_in_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_pm_in_combat_no_drunk",
		criterias = {
			{
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
				"wood_elf"
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
				"wood_elf"
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_spawn_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_spawn_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_chaos_spawn_no_drunk",
		response = "pwe_gameplay_seeing_a_chaos_spawn_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_spawn_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_spawn_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_killing_a_stormfiend_no_drunk",
		response = "pwe_gameplay_killing_a_stormfiend_no_drunk",
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
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_warrior_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_warrior_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_plague_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_wizard_plague_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_wind_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_wizard_wind_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk",
		response = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_stormfiend_no_drunk",
		response = "pwe_gameplay_hearing_a_stormfiend_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_stormfiend_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_stormfiend_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_troll_no_drunk",
		response = "pwe_gameplay_hearing_a_troll_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_troll_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_troll_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_marauder_berserker_combat_no_drunk",
		response = "pwe_gameplay_hearing_marauder_berserker_combat_no_drunk",
		criterias = {
			{
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_killing_a_chaos_warrior_no_drunk",
		response = "pwe_gameplay_killing_a_chaos_warrior_no_drunk",
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
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_killing_a_chaos_warrior_champion_no_drunk",
		response = "pwe_gameplay_killing_a_chaos_warrior_champion_no_drunk",
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
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_killing_a_chaos_wizard_plague_no_drunk",
		response = "pwe_gameplay_killing_a_chaos_wizard_plague_no_drunk",
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
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_killing_a_chaos_wizard_tentacle_no_drunk",
		response = "pwe_gameplay_killing_a_chaos_wizard_tentacle_no_drunk",
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
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_killing_a_chaos_wizard_wind_no_drunk",
		response = "pwe_gameplay_killing_a_chaos_wizard_wind_no_drunk",
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
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_killing_a_skaven_warpfire_thrower_no_drunk",
		response = "pwe_gameplay_killing_a_skaven_warpfire_thrower_no_drunk",
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
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_chaos_warrior_no_drunk",
		response = "pwe_gameplay_seeing_a_chaos_warrior_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk",
		response = "pwe_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_chaos_wizard_plague_no_drunk",
		response = "pwe_gameplay_seeing_a_chaos_wizard_plague_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk",
		response = "pwe_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_chaos_wizard_wind_no_drunk",
		response = "pwe_gameplay_seeing_a_chaos_wizard_wind_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_shield_stormvermin_no_drunk",
		response = "pwe_gameplay_seeing_a_shield_stormvermin_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk",
		response = "pwe_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_stormfiend_no_drunk",
		response = "pwe_gameplay_seeing_a_stormfiend_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_seeing_a_troll_no_drunk",
		response = "pwe_gameplay_seeing_a_troll_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_killing_a_chaos_wizard_leech_no_drunk",
		response = "pwe_gameplay_killing_a_chaos_wizard_leech_no_drunk",
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
			},
			{
				"faction_memory",
				"crawl_cheers",
				OP.EQ,
				0
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
		name = "pwe_gameplay_hearing_a_gutter_runner_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_gutter_runner_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk",
		response = "pwe_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk",
		response = "pwe_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_seeing_a_stormvermin_no_drunk",
		response = "pwe_gameplay_seeing_a_stormvermin_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_storm_vermin_commander",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_seeing_a_gutter_runner_no_drunk",
		response = "pwe_gameplay_seeing_a_gutter_runner_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_hearing_a_gutter_runner_no_drunk",
		response = "pwe_gameplay_hearing_a_gutter_runner_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_gutter_runner",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_seeing_a_globadier_no_drunk",
		response = "pwe_gameplay_seeing_a_globadier_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_hearing_a_globadier_no_drunk",
		response = "pwe_gameplay_hearing_a_globadier_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_globadier",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_globadier",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_seeing_a_skaven_rat_ogre_no_drunk",
		response = "pwe_gameplay_seeing_a_skaven_rat_ogre_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				30
			}
		},
		on_done = {
			{
				"faction_memory",
				"last_seen_rate_ogre",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_hearing_a_skaven_rat_ogre_no_drunk",
		response = "pwe_gameplay_hearing_a_skaven_rat_ogre_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_rate_ogre",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_rat_ogre",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_incoming_skaven_rat_ogre_no_drunk",
		response = "pwe_gameplay_incoming_skaven_rat_ogre_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
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
		name = "pwe_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk",
		response = "pwe_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk",
		response = "pwe_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_storm_vermin",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_seeing_a_skaven_slaver_no_drunk",
		response = "pwe_gameplay_seeing_a_skaven_slaver_no_drunk",
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
				"distance",
				OP.GT,
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"time_since_slaver",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_seeing_a_skaven_ratling_gun_no_drunk",
		response = "pwe_gameplay_seeing_a_skaven_ratling_gun_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_gameplay_hearing_a_skaven_ratling_gun_no_drunk",
		response = "pwe_gameplay_hearing_a_skaven_ratling_gun_no_drunk",
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
				"crawl_cheers",
				OP.EQ,
				0
			},
			{
				"faction_memory",
				"last_seen_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				10
			},
			{
				"faction_memory",
				"last_heard_skaven_ratling_gunner",
				OP.TIMEDIFF,
				OP.GT,
				30
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
		name = "pwe_crawl_drunk_buff_wears_off",
		response = "pwe_crawl_drunk_buff_wears_off",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"buff_wears_off"
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
				"buff_wears_off",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"buff_wears_off",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_crawl_drunk_buff_begins",
		response = "pwe_crawl_drunk_buff_begins",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"drunk_buff_begins"
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
				"drunk_buff_begins",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"drunk_buff_begins",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_crawl_drunk_buff_begins_from_sick",
		response = "pwe_crawl_drunk_buff_begins_from_sick",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"buff_begins_from_sick"
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
				"buff_begins_from_sick",
				OP.TIMEDIFF,
				OP.GT,
				1
			}
		},
		on_done = {
			{
				"user_memory",
				"buff_begins_from_sick",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pwe_gameplay_healing_draught_drunk",
		response = "pwe_gameplay_healing_draught_drunk",
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
				"wood_elf"
			},
			{
				"faction_memory",
				"last_saw_pickup",
				OP.TIMEDIFF,
				OP.GT,
				120
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
		name = "pwe_gameplay_spots_potion_drunk",
		response = "pwe_gameplay_spots_potion_drunk",
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
				120
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
		name = "pwe_gameplay_using_potion_drunk",
		response = "pwe_gameplay_using_potion_drunk",
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
		name = "pwe_gameplay_tips_wizard_wind_drunk",
		response = "pwe_gameplay_tips_wizard_wind_drunk",
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
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMEDIFF,
				OP.GT,
				55
			},
			{
				"faction_memory",
				"chaos_vortex_spawned",
				OP.TIMEDIFF,
				OP.GT,
				60
			}
		},
		on_done = {
			{
				"faction_memory",
				"chaos_vortex_spawned",
				OP.TIMESET
			},
			{
				"user_memory",
				"incoming_threat_kerillian",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwe_crawl_drank",
		name = "pwe_crawl_drank",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"player_drank_vce"
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
		name = "pwe_burp",
		response = "pwe_burp",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"story_trigger"
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
				"crawl_heard_us",
				OP.EQ,
				1
			},
			{
				"user_memory",
				"time_since_burp",
				OP.TIMEDIFF,
				OP.GT,
				150
			}
		},
		on_done = {
			{
				"user_memory",
				"time_since_burp",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_empire_soldier_being_helped_up_drunk",
		name = "pwe_gameplay_empire_soldier_being_helped_up_drunk",
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
		response = "pwe_gameplay_witch_hunter_being_helped_up_drunk",
		name = "pwe_gameplay_witch_hunter_being_helped_up_drunk",
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
		response = "pwe_gameplay_dwarf_ranger_being_helped_up_drunk",
		name = "pwe_gameplay_dwarf_ranger_being_helped_up_drunk",
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
		response = "pwe_gameplay_bright_wizard_being_helped_up_drunk",
		name = "pwe_gameplay_bright_wizard_being_helped_up_drunk",
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
		name = "pwe_gameplay_healing_empire_soldier_drunk",
		response = "pwe_gameplay_healing_empire_soldier_drunk",
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
		name = "pwe_gameplay_healing_witch_hunter_drunk",
		response = "pwe_gameplay_healing_witch_hunter_drunk",
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
		name = "pwe_gameplay_healing_dwarf_ranger_drunk",
		response = "pwe_gameplay_healing_dwarf_ranger_drunk",
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
		name = "pwe_gameplay_healing_bright_wizard_drunk",
		response = "pwe_gameplay_healing_bright_wizard_drunk",
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
		name = "pwe_gameplay_helped_by_empire_soldier_drunk",
		response = "pwe_gameplay_helped_by_empire_soldier_drunk",
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
		name = "pwe_gameplay_helped_by_witch_hunter_drunk",
		response = "pwe_gameplay_helped_by_witch_hunter_drunk",
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
		name = "pwe_gameplay_helped_by_dwarf_ranger_drunk",
		response = "pwe_gameplay_helped_by_dwarf_ranger_drunk",
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
		name = "pwe_gameplay_helped_by_bright_wizard_drunk",
		response = "pwe_gameplay_helped_by_bright_wizard_drunk",
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
		name = "pwe_gameplay_low_on_health_drunk",
		response = "pwe_gameplay_low_on_health_drunk",
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
		name = "pwe_gameplay_empire_soldier_low_on_health_drunk",
		response = "pwe_gameplay_empire_soldier_low_on_health_drunk",
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
		name = "pwe_gameplay_witch_hunter_low_on_health_drunk",
		response = "pwe_gameplay_witch_hunter_low_on_health_drunk",
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
		name = "pwe_gameplay_dwarf_ranger_low_on_health_drunk",
		response = "pwe_gameplay_dwarf_ranger_low_on_health_drunk",
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
		name = "pwe_gameplay_bright_wizard_low_on_health_drunk",
		response = "pwe_gameplay_bright_wizard_low_on_health_drunk",
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
		name = "pwe_gameplay_spots_ammo_drunk",
		response = "pwe_gameplay_spots_ammo_drunk",
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
		name = "pwe_gameplay_spots_health_drunk",
		response = "pwe_gameplay_spots_health_drunk",
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
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub"
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
		name = "pwe_gameplay_spots_bomb_drunk",
		response = "pwe_gameplay_spots_bomb_drunk",
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
				"crawl_spot_third_pub",
				OP.NOT,
				"crawl_spot_third_pub"
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
		name = "pwe_gameplay_out_of_ammo_drunk",
		response = "pwe_gameplay_out_of_ammo_drunk",
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
		name = "pwe_gameplay_self_heal_drunk",
		response = "pwe_gameplay_self_heal_drunk",
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
		name = "pwe_gameplay_throwing_bomb_drunk",
		response = "pwe_gameplay_throwing_bomb_drunk",
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
		name = "pwe_gameplay_friendly_fire_witch_hunter_drunk",
		response = "pwe_gameplay_friendly_fire_witch_hunter_drunk",
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
		name = "pwe_gameplay_friendly_fire_dwarf_ranger_drunk",
		response = "pwe_gameplay_friendly_fire_dwarf_ranger_drunk",
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
		name = "pwe_gameplay_friendly_fire_bright_wizard_drunk",
		response = "pwe_gameplay_friendly_fire_bright_wizard_drunk",
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
		name = "pwe_gameplay_friendly_fire_empire_soldier_drunk",
		response = "pwe_gameplay_friendly_fire_empire_soldier_drunk",
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
		response = "pwe_ability_activate_shade_non_drunk",
		name = "pwe_ability_activate_shade_non_drunk",
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
			},
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		response = "pwe_activate_ability_handmaiden_non_drunk",
		name = "pwe_activate_ability_handmaiden_non_drunk",
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
			},
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.EQ,
				0
			}
		}
	})
	define_rule({
		response = "pwe_activate_ability_waystalker_non_drunk",
		name = "pwe_activate_ability_waystalker_non_drunk",
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
			},
			{
				"faction_memory",
				"crawl_spot_second_pub",
				OP.EQ,
				0
			}
		}
	})
	add_dialogues({
		pwe_gameplay_witch_hunter_low_on_health_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_witch_hunter_low_on_health_05",
				"pwe_gameplay_witch_hunter_low_on_health_06",
				"pwe_gameplay_witch_hunter_low_on_health_07",
				"pwe_gameplay_witch_hunter_low_on_health_08",
				"pwe_gameplay_witch_hunter_low_on_health_09"
			},
			sound_events = {
				"pwe_gameplay_witch_hunter_low_on_health_05",
				"pwe_gameplay_witch_hunter_low_on_health_06",
				"pwe_gameplay_witch_hunter_low_on_health_07",
				"pwe_gameplay_witch_hunter_low_on_health_08",
				"pwe_gameplay_witch_hunter_low_on_health_09"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.3897292613983,
				2.3087291717529,
				2.1642291545868,
				3.2564792633057,
				4.159083366394
			}
		},
		pwe_gameplay_bright_wizard_low_on_health_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_bright_wizard_low_on_health_05",
				"pwe_gameplay_bright_wizard_low_on_health_06",
				"pwe_gameplay_bright_wizard_low_on_health_07",
				"pwe_gameplay_bright_wizard_low_on_health_08"
			},
			sound_events = {
				"pwe_gameplay_bright_wizard_low_on_health_05",
				"pwe_gameplay_bright_wizard_low_on_health_06",
				"pwe_gameplay_bright_wizard_low_on_health_07",
				"pwe_gameplay_bright_wizard_low_on_health_08"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.0447916984558,
				1.6613124608993,
				3.1087083816528,
				2.0069999694824
			}
		},
		pwe_gameplay_hearing_a_gutter_runner_combat_no_drunk = {
			face_animations_n = 2,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_gameplay_hearing_a_gutter_runner_combat_01",
				[2.0] = "pwe_gameplay_hearing_a_gutter_runner_03"
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hearing_a_gutter_runner_combat_01",
				[2.0] = "pwe_gameplay_hearing_a_gutter_runner_03"
			},
			face_animations = {
				[1.0] = "face_contempt",
				[2.0] = "face_contempt"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.420562505722,
				[2.0] = 2.4852707386017
			}
		},
		pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_01",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_02",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_03",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_04",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_05",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.2997291088104,
				1.1890208721161,
				1.1809791326523,
				1.8490417003632,
				1.533979177475,
				2.4010624885559
			}
		},
		pwe_gameplay_hearing_a_chaos_wizard_tentacle_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				3.5933332443237,
				5.4811873435974,
				4.2477707862854,
				2.2687082290649,
				1.6110208034515,
				2.8436458110809,
				1.9426666498184,
				1.8426458835602
			}
		},
		pwe_gameplay_hearing_a_chaos_wizard_wind_combat_no_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_03",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_04",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_05",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_06",
				"pwe_gameplay_hearing_a_chaos_wizard_wind_combat_07"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.4585833549499,
				2.6813542842865,
				1.0774999856949,
				2.1653957366943,
				3.7228124141693
			}
		},
		pwe_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.3354165554047,
				2.8192708492279,
				2.7376666069031,
				2.7286250591278,
				3.7704167366028,
				4.0628333091736,
				3.2832915782928,
				2.8085832595825
			}
		},
		pwe_gameplay_spots_ammo_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_11",
				"pwe_gameplay_spots_ammo_12",
				"pwe_gameplay_spots_ammo_13",
				"pwe_gameplay_spots_ammo_14",
				"pwe_gameplay_spots_ammo_15"
			},
			sound_events = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_11",
				"pwe_gameplay_spots_ammo_12",
				"pwe_gameplay_spots_ammo_13",
				"pwe_gameplay_spots_ammo_14",
				"pwe_gameplay_spots_ammo_15"
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
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.0168124735355,
				1.4996041655541,
				3.466500043869,
				1.5579792261124,
				4.212375164032,
				1.7668750286102,
				2.3687083721161
			}
		},
		pwe_gameplay_seeing_a_stormfiend_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_stormfiend_01",
				"pwe_gameplay_seeing_a_stormfiend_02",
				"pwe_gameplay_seeing_a_stormfiend_03",
				"pwe_gameplay_seeing_a_stormfiend_04",
				"pwe_gameplay_seeing_a_stormfiend_05",
				"pwe_gameplay_seeing_a_stormfiend_06",
				"pwe_gameplay_seeing_a_stormfiend_07",
				"pwe_gameplay_seeing_a_stormfiend_08"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_stormfiend_01",
				"pwe_gameplay_seeing_a_stormfiend_02",
				"pwe_gameplay_seeing_a_stormfiend_03",
				"pwe_gameplay_seeing_a_stormfiend_04",
				"pwe_gameplay_seeing_a_stormfiend_05",
				"pwe_gameplay_seeing_a_stormfiend_06",
				"pwe_gameplay_seeing_a_stormfiend_07",
				"pwe_gameplay_seeing_a_stormfiend_08"
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
			sound_events_duration = {
				3.9651458263397,
				2.8138959407806,
				3.3835208415985,
				2.0855624675751,
				3.079541683197,
				3.2145833969116,
				3.3573541641235,
				6.8288331031799
			}
		},
		pwe_gameplay_hearing_marauder_berserker_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.0770208835602,
				1.0064166784286,
				1.4155625104904,
				1.4495832920075,
				1.2288333177566,
				1.6747708320618,
				1.9762083292007,
				1.5186458826065
			}
		},
		pwe_gameplay_incoming_skaven_rat_ogre_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_empire_soldier_low_on_health_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_empire_soldier_low_on_health_05",
				"pwe_gameplay_empire_soldier_low_on_health_06",
				"pwe_gameplay_empire_soldier_low_on_health_07",
				"pwe_gameplay_empire_soldier_low_on_health_08"
			},
			sound_events = {
				"pwe_gameplay_empire_soldier_low_on_health_05",
				"pwe_gameplay_empire_soldier_low_on_health_06",
				"pwe_gameplay_empire_soldier_low_on_health_07",
				"pwe_gameplay_empire_soldier_low_on_health_08"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.4067499637604,
				1.8652083873749,
				2.1245625019074,
				1.8896458148956
			}
		},
		pwe_gameplay_hearing_a_skaven_rat_ogre_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_seeing_a_skaven_slaver_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_slaver_01",
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_skaven_slaver_07",
				"pwe_gameplay_seeing_a_skaven_slaver_03",
				"pwe_gameplay_seeing_a_skaven_slaver_04",
				"pwe_gameplay_seeing_a_skaven_slaver_05",
				"pwe_gameplay_seeing_a_skaven_slaver_06",
				"pwe_gameplay_seeing_a_skaven_slaver_08"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_slaver_01",
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_skaven_slaver_07",
				"pwe_gameplay_seeing_a_skaven_slaver_03",
				"pwe_gameplay_seeing_a_skaven_slaver_04",
				"pwe_gameplay_seeing_a_skaven_slaver_05",
				"pwe_gameplay_seeing_a_skaven_slaver_06",
				"pwe_gameplay_seeing_a_skaven_slaver_08"
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
			sound_events_duration = {
				1.1537916660309,
				1.2984166145325,
				3.5764167308807,
				1.4687082767487,
				1.6713124513626,
				4.1267085075378,
				2.5171248912811,
				3.4214792251587
			}
		},
		pwe_crawl_drunk_buff_begins_from_sick = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_buff_begins_from_sick_01",
				"pwe_crawl_drunk_buff_begins_from_sick_02",
				"pwe_crawl_drunk_buff_begins_from_sick_03",
				"pwe_crawl_drunk_buff_begins_from_sick_04",
				"pwe_crawl_drunk_buff_begins_from_sick_05",
				"pwe_crawl_drunk_buff_begins_from_sick_06"
			},
			sound_events = {
				"pwe_crawl_drunk_buff_begins_from_sick_01",
				"pwe_crawl_drunk_buff_begins_from_sick_02",
				"pwe_crawl_drunk_buff_begins_from_sick_03",
				"pwe_crawl_drunk_buff_begins_from_sick_04",
				"pwe_crawl_drunk_buff_begins_from_sick_05",
				"pwe_crawl_drunk_buff_begins_from_sick_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				7.9000000953674,
				3.2383959293366,
				4.6681251525879,
				5.1275835037231,
				2.6976459026337,
				4.6730833053589
			}
		},
		pwe_gameplay_tips_wizard_wind_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_spots_health_drunk = {
			face_animations_n = 13,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 13,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 13,
			randomize_indexes = {},
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
			}
		},
		pwe_activate_ability_handmaiden_non_drunk = {
			face_animations_n = 10,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
				"pwe_activate_ability_handmaiden_12"
			},
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
				"pwe_activate_ability_handmaiden_12"
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
				1.2719999551773
			}
		},
		pwe_gameplay_helped_by_bright_wizard_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_helped_by_bright_wizard_01",
				"pwe_gameplay_helped_by_bright_wizard_02",
				"pwe_gameplay_helped_by_bright_wizard_03",
				"pwe_gameplay_helped_by_bright_wizard_04"
			},
			sound_events = {
				"pwe_gameplay_helped_by_bright_wizard_01",
				"pwe_gameplay_helped_by_bright_wizard_02",
				"pwe_gameplay_helped_by_bright_wizard_03",
				"pwe_gameplay_helped_by_bright_wizard_04"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.560250043869,
				2.4041457176209,
				3.8914165496826,
				2.3360834121704
			}
		},
		pwe_gameplay_spots_potion_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_spotted_liquid_01",
				"pwe_crawl_drunk_spotted_liquid_02",
				"pwe_crawl_drunk_spotted_liquid_03",
				"pwe_crawl_drunk_spotted_liquid_04"
			},
			sound_events = {
				"pwe_crawl_drunk_spotted_liquid_01",
				"pwe_crawl_drunk_spotted_liquid_02",
				"pwe_crawl_drunk_spotted_liquid_03",
				"pwe_crawl_drunk_spotted_liquid_04"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				7.1277084350586,
				3.7648334503174,
				1.431937456131,
				4.3132500648499
			}
		},
		pwe_gameplay_friendly_fire_bright_wizard_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.6523957252502,
				1.9193542003632,
				2.7949583530426,
				2.317583322525,
				2.6890208721161,
				3.0217499732971,
				2.741229057312,
				4.3550000190735
			}
		},
		pwe_gameplay_friendly_fire_dwarf_ranger_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_friendly_fire_dwarf_ranger_05",
				"pwe_gameplay_friendly_fire_dwarf_ranger_06",
				"pwe_gameplay_friendly_fire_dwarf_ranger_07",
				"pwe_gameplay_friendly_fire_dwarf_ranger_08",
				"pwe_gameplay_friendly_fire_dwarf_ranger_09"
			},
			sound_events = {
				"pwe_gameplay_friendly_fire_dwarf_ranger_05",
				"pwe_gameplay_friendly_fire_dwarf_ranger_06",
				"pwe_gameplay_friendly_fire_dwarf_ranger_07",
				"pwe_gameplay_friendly_fire_dwarf_ranger_08",
				"pwe_gameplay_friendly_fire_dwarf_ranger_09"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.6254167556763,
				2.7580208778381,
				3.2763750553131,
				3.3986666202545,
				4.6755623817444
			}
		},
		pwe_gameplay_hearing_a_troll_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.78489583730698,
				1.0316457748413,
				1.2601875066757,
				1.3416041135788,
				2.6548540592194,
				1.3216458559036,
				1.0622500181198,
				3.1418333053589
			}
		},
		pwe_gameplay_friendly_fire_witch_hunter_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_friendly_fire_witch_hunter_05",
				"pwe_gameplay_friendly_fire_witch_hunter_06",
				"pwe_gameplay_friendly_fire_witch_hunter_07",
				"pwe_gameplay_friendly_fire_witch_hunter_08",
				"pwe_gameplay_friendly_fire_witch_hunter_09"
			},
			sound_events = {
				"pwe_gameplay_friendly_fire_witch_hunter_05",
				"pwe_gameplay_friendly_fire_witch_hunter_06",
				"pwe_gameplay_friendly_fire_witch_hunter_07",
				"pwe_gameplay_friendly_fire_witch_hunter_08",
				"pwe_gameplay_friendly_fire_witch_hunter_09"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.7034792900085,
				3.395604133606,
				3.0001459121704,
				3.9874792098999,
				2.5013749599457
			}
		},
		pwe_gameplay_out_of_ammo_drunk = {
			face_animations_n = 9,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 9,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			randomize_indexes = {},
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
			}
		},
		pwe_gameplay_throwing_bomb_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_throwing_bomb_01",
				"pwe_gameplay_throwing_bomb_05",
				"pwe_gameplay_throwing_bomb_06",
				"pwe_gameplay_throwing_bomb_07",
				"pwe_gameplay_throwing_bomb_08"
			},
			sound_events = {
				"pwe_gameplay_throwing_bomb_01",
				"pwe_gameplay_throwing_bomb_05",
				"pwe_gameplay_throwing_bomb_06",
				"pwe_gameplay_throwing_bomb_07",
				"pwe_gameplay_throwing_bomb_08"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.0842083692551,
				2.0805416107178,
				2.67222905159,
				1.8732291460037,
				2.4514791965485
			}
		},
		pwe_gameplay_player_pounced_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_knocked_down_01",
				"pwe_crawl_drunk_knocked_down_02",
				"pwe_crawl_drunk_knocked_down_03",
				"pwe_crawl_drunk_knocked_down_04"
			},
			sound_events = {
				"pwe_crawl_drunk_knocked_down_01",
				"pwe_crawl_drunk_knocked_down_02",
				"pwe_crawl_drunk_knocked_down_03",
				"pwe_crawl_drunk_knocked_down_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				6.5061874389648,
				4.1374793052673,
				4.6555833816528,
				2.9488749504089
			}
		},
		pwe_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_chaos_spawn_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_Skaven_warpfire_thrower_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_01",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_02",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_03",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_04",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_05",
				"pwe_gameplay_hearing_a_Skaven_warpfire_thrower_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.4463748931885,
				2.7288959026337,
				4.9221043586731,
				1.8636666536331,
				2.0715625286102,
				1.5134999752045
			}
		},
		pwe_gameplay_hearing_a_skaven_ratling_gun_no_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_skaven_ratling_gun_04",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_05",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_06",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_01",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_02",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_03",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_07"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_skaven_ratling_gun_04",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_05",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_06",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_01",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_02",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_03",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_07"
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
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				0.97989583015442,
				1.2999999523163,
				2.5271875858307,
				2.6357917785645,
				3.3913125991821,
				1.9910416603088,
				2.2921042442322
			}
		},
		pwe_gameplay_hearing_a_troll_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_troll_01",
				"pwe_gameplay_hearing_a_troll_02",
				"pwe_gameplay_hearing_a_troll_03",
				"pwe_gameplay_hearing_a_troll_04",
				"pwe_gameplay_hearing_a_troll_05",
				"pwe_gameplay_hearing_a_troll_06"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_troll_01",
				"pwe_gameplay_hearing_a_troll_02",
				"pwe_gameplay_hearing_a_troll_03",
				"pwe_gameplay_hearing_a_troll_04",
				"pwe_gameplay_hearing_a_troll_05",
				"pwe_gameplay_hearing_a_troll_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.7565832138061,
				4.6733331680298,
				2.0906875133514,
				5.562020778656,
				2.2240417003632,
				3.6097917556763
			}
		},
		pwe_activate_ability_waystalker_non_drunk = {
			face_animations_n = 10,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 10,
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 10,
			randomize_indexes = {},
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
			}
		},
		pwe_gameplay_low_on_health_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.6898748874664,
				2.2467083930969,
				1.883291721344,
				3.1298749446869,
				2.9511249065399,
				4.558000087738,
				3.9560000896454,
				2.9744582176209
			}
		},
		pwe_gameplay_dwarf_ranger_low_on_health_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.6015833616257,
				2.4217500686645,
				2.1476666927338,
				1.9873958826065,
				2.6553542613983,
				3.037750005722,
				3.7945415973663,
				2.8770208358765
			}
		},
		pwe_gameplay_seeing_a_chaos_spawn_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				4.1153750419617,
				1.5580832958221,
				4.1264791488647,
				4.2691249847412,
				2.7594792842865,
				1.3854583501816,
				3.4306666851044,
				3.3204584121704
			}
		},
		pwe_gameplay_healing_witch_hunter_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_healing_witch_hunter_05",
				"pwe_gameplay_healing_witch_hunter_06",
				"pwe_gameplay_healing_witch_hunter_07",
				"pwe_gameplay_healing_witch_hunter_08",
				"pwe_gameplay_healing_witch_hunter_09"
			},
			sound_events = {
				"pwe_gameplay_healing_witch_hunter_05",
				"pwe_gameplay_healing_witch_hunter_06",
				"pwe_gameplay_healing_witch_hunter_07",
				"pwe_gameplay_healing_witch_hunter_08",
				"pwe_gameplay_healing_witch_hunter_09"
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
				2.3687915802002,
				1.6280624866486,
				2.4640624523163,
				1.8775625228882,
				2.4450833797455
			}
		},
		pwe_gameplay_hearing_a_chaos_warrior_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.1505208015442,
				2.769770860672,
				1.3487499952316,
				1.7166874408722,
				2.2854166030884,
				2.1423332691193,
				2.5221457481384,
				2.0191042423248
			}
		},
		pwe_ability_activate_shade_non_drunk = {
			face_animations_n = 11,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 11,
			randomize_indexes_n = 0,
			category = "activate_ability",
			dialogue_animations_n = 11,
			randomize_indexes = {},
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
			}
		},
		pwe_gameplay_hearing_a_skaven_ratling_gun_combat_no_drunk = {
			face_animations_n = 3,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 3,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 3,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_04"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_01",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_02",
				"pwe_gameplay_hearing_a_skaven_ratling_gun_combat_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1356666088104,
				1.3391457796097,
				3.4567
			}
		},
		pwe_gameplay_hearing_a_skaven_patrol_stormvermin_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_nervous",
				"face_concerned",
				"face_concerned",
				"face_nervous"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_incoming_skaven_rat_ogre_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_incoming_skaven_rat_ogre_01",
				"pwe_gameplay_incoming_skaven_rat_ogre_05",
				"pwe_gameplay_incoming_skaven_rat_ogre_06",
				"pwe_gameplay_incoming_skaven_rat_ogre_02",
				"pwe_gameplay_incoming_skaven_rat_ogre_03",
				"pwe_gameplay_incoming_skaven_rat_ogre_04",
				"pwe_gameplay_incoming_skaven_rat_ogre_07",
				"pwe_gameplay_incoming_skaven_rat_ogre_08"
			},
			sound_events = {
				"pwe_gameplay_incoming_skaven_rat_ogre_01",
				"pwe_gameplay_incoming_skaven_rat_ogre_05",
				"pwe_gameplay_incoming_skaven_rat_ogre_06",
				"pwe_gameplay_incoming_skaven_rat_ogre_02",
				"pwe_gameplay_incoming_skaven_rat_ogre_03",
				"pwe_gameplay_incoming_skaven_rat_ogre_04",
				"pwe_gameplay_incoming_skaven_rat_ogre_07",
				"pwe_gameplay_incoming_skaven_rat_ogre_08"
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
			sound_events_duration = {
				2.4157707691193,
				0.63891667127609,
				5.8826041221619,
				1.8342083692551,
				0.96137499809265,
				3.0022292137146,
				1.8515833616257,
				3.7620625495911
			}
		},
		pwe_gameplay_hearing_a_pm_in_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_plague_monk_combat_01",
				"pwe_gameplay_hearing_a_plague_monk_combat_02",
				"pwe_gameplay_hearing_a_plague_monk_combat_03",
				"pwe_gameplay_hearing_a_plague_monk_combat_04",
				"pwe_gameplay_hearing_a_plague_monk_combat_05",
				"pwe_gameplay_hearing_a_plague_monk_combat_06",
				"pwe_gameplay_hearing_a_plague_monk_combat_07",
				"pwe_gameplay_hearing_a_plague_monk_combat_08"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_plague_monk_combat_01",
				"pwe_gameplay_hearing_a_plague_monk_combat_02",
				"pwe_gameplay_hearing_a_plague_monk_combat_03",
				"pwe_gameplay_hearing_a_plague_monk_combat_04",
				"pwe_gameplay_hearing_a_plague_monk_combat_05",
				"pwe_gameplay_hearing_a_plague_monk_combat_06",
				"pwe_gameplay_hearing_a_plague_monk_combat_07",
				"pwe_gameplay_hearing_a_plague_monk_combat_08"
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
			sound_events_duration = {
				2.1407084465027,
				1.2596249580383,
				1.3642499446869,
				1.9353958368301,
				2.4984583854675,
				1.7577916383743,
				1.4465833902359,
				2.3748126029968
			}
		},
		pwe_gameplay_helped_by_dwarf_ranger_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_helped_by_dwarf_ranger_05",
				"pwe_gameplay_helped_by_dwarf_ranger_06",
				"pwe_gameplay_helped_by_dwarf_ranger_07",
				"pwe_gameplay_helped_by_dwarf_ranger_08",
				"pwe_gameplay_helped_by_dwarf_ranger_09",
				"pwe_gameplay_helped_by_dwarf_ranger_10",
				"pwe_gameplay_helped_by_dwarf_ranger_12"
			},
			sound_events = {
				"pwe_gameplay_helped_by_dwarf_ranger_05",
				"pwe_gameplay_helped_by_dwarf_ranger_06",
				"pwe_gameplay_helped_by_dwarf_ranger_07",
				"pwe_gameplay_helped_by_dwarf_ranger_08",
				"pwe_gameplay_helped_by_dwarf_ranger_09",
				"pwe_gameplay_helped_by_dwarf_ranger_10",
				"pwe_gameplay_helped_by_dwarf_ranger_12"
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
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.6545417308807,
				2.3853750228882,
				3.6738333702087,
				2.430520772934,
				1.6274791955948,
				2.1833333969116,
				2.4053542613983
			}
		},
		pwe_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.4155416488648,
				3.2421667575836,
				2.4845209121704,
				4.1653542518616
			}
		},
		pwe_gameplay_helped_by_witch_hunter_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_helped_by_witch_hunter_05",
				"pwe_gameplay_helped_by_witch_hunter_06",
				"pwe_gameplay_helped_by_witch_hunter_07",
				"pwe_gameplay_helped_by_witch_hunter_08"
			},
			sound_events = {
				"pwe_gameplay_helped_by_witch_hunter_05",
				"pwe_gameplay_helped_by_witch_hunter_06",
				"pwe_gameplay_helped_by_witch_hunter_07",
				"pwe_gameplay_helped_by_witch_hunter_08"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.1633334159851,
				1.7592083215714,
				2.8882708549499,
				2.4933125972748
			}
		},
		pwe_gameplay_helped_by_empire_soldier_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_helped_by_empire_soldier_05",
				"pwe_gameplay_helped_by_empire_soldier_06",
				"pwe_gameplay_helped_by_empire_soldier_07",
				"pwe_gameplay_helped_by_empire_soldier_08"
			},
			sound_events = {
				"pwe_gameplay_helped_by_empire_soldier_05",
				"pwe_gameplay_helped_by_empire_soldier_06",
				"pwe_gameplay_helped_by_empire_soldier_07",
				"pwe_gameplay_helped_by_empire_soldier_08"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.9739792346954,
				2.8710832595825,
				1.9408124685288,
				1.6986875534058
			}
		},
		pwe_gameplay_killing_a_skaven_warpfire_thrower_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				3.3928332328796,
				2.59339594841,
				2.4877500534058,
				3.5300834178925,
				4.9708957672119,
				5.0748748779297,
				2.4586665630341,
				1.7281041145325
			}
		},
		pwe_gameplay_healing_dwarf_ranger_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_healing_dwarf_ranger_05",
				"pwe_gameplay_healing_dwarf_ranger_06",
				"pwe_gameplay_healing_dwarf_ranger_07",
				"pwe_gameplay_healing_dwarf_ranger_08",
				"pwe_gameplay_healing_dwarf_ranger_09"
			},
			sound_events = {
				"pwe_gameplay_healing_dwarf_ranger_05",
				"pwe_gameplay_healing_dwarf_ranger_06",
				"pwe_gameplay_healing_dwarf_ranger_07",
				"pwe_gameplay_healing_dwarf_ranger_08",
				"pwe_gameplay_healing_dwarf_ranger_09"
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
				4.0243539810181,
				2.0467083454132,
				3.1160209178925,
				2.3887083530426,
				3.2338750362396
			}
		},
		pwe_gameplay_hearing_a_chaos_spawn_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_chaos_spawn_01",
				"pwe_gameplay_hearing_a_chaos_spawn_02",
				"pwe_gameplay_hearing_a_chaos_spawn_03",
				"pwe_gameplay_hearing_a_chaos_spawn_04",
				"pwe_gameplay_hearing_a_chaos_spawn_05",
				"pwe_gameplay_hearing_a_chaos_spawn_06",
				"pwe_gameplay_hearing_a_chaos_spawn_07",
				"pwe_gameplay_hearing_a_chaos_spawn_08"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_chaos_spawn_01",
				"pwe_gameplay_hearing_a_chaos_spawn_02",
				"pwe_gameplay_hearing_a_chaos_spawn_03",
				"pwe_gameplay_hearing_a_chaos_spawn_04",
				"pwe_gameplay_hearing_a_chaos_spawn_05",
				"pwe_gameplay_hearing_a_chaos_spawn_06",
				"pwe_gameplay_hearing_a_chaos_spawn_07",
				"pwe_gameplay_hearing_a_chaos_spawn_08"
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
			sound_events_duration = {
				3.7299165725708,
				3.9458124637604,
				3.6626250743866,
				5.2362289428711,
				1.3359792232513,
				1.7139999866486,
				2.6445832252502,
				1.5668958425522
			}
		},
		pwe_gameplay_healing_empire_soldier_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_healing_empire_soldier_05",
				"pwe_gameplay_healing_empire_soldier_06",
				"pwe_gameplay_healing_empire_soldier_07",
				"pwe_gameplay_healing_empire_soldier_08",
				"pwe_gameplay_healing_empire_soldier_09"
			},
			sound_events = {
				"pwe_gameplay_healing_empire_soldier_05",
				"pwe_gameplay_healing_empire_soldier_06",
				"pwe_gameplay_healing_empire_soldier_07",
				"pwe_gameplay_healing_empire_soldier_08",
				"pwe_gameplay_healing_empire_soldier_09"
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
				2.141583442688,
				2.064291715622,
				2.0250833034515,
				2.0695416927338,
				4.9380831718445
			}
		},
		pwe_gameplay_seeing_a_scr_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_shield_clanrat_01",
				"pwe_gameplay_seeing_a_shield_clanrat_02",
				"pwe_gameplay_seeing_a_shield_clanrat_03",
				"pwe_gameplay_seeing_a_shield_clanrat_04",
				"pwe_gameplay_seeing_a_shield_clanrat_05",
				"pwe_gameplay_seeing_a_shield_clanrat_06",
				"pwe_gameplay_seeing_a_shield_clanrat_07",
				"pwe_gameplay_seeing_a_shield_clanrat_08"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_shield_clanrat_01",
				"pwe_gameplay_seeing_a_shield_clanrat_02",
				"pwe_gameplay_seeing_a_shield_clanrat_03",
				"pwe_gameplay_seeing_a_shield_clanrat_04",
				"pwe_gameplay_seeing_a_shield_clanrat_05",
				"pwe_gameplay_seeing_a_shield_clanrat_06",
				"pwe_gameplay_seeing_a_shield_clanrat_07",
				"pwe_gameplay_seeing_a_shield_clanrat_08"
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
			sound_events_duration = {
				2.3217709064484,
				1.7137291431427,
				2.2819583415985,
				1.077645778656,
				2.3552916049957,
				1.5157083272934,
				2.8628542423248,
				1.963666677475
			}
		},
		pwe_gameplay_bright_wizard_being_helped_up_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.4556457996368,
				2.1155207157135,
				1.8338124752045,
				2.7396874427795,
				1.984375,
				2.8809790611267,
				2.951812505722,
				2.5362915992737
			}
		},
		pwe_gameplay_killing_a_stormfiend_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				4.1008958816528,
				1.5923541784286,
				2.5795834064484,
				3.6076667308807,
				2.598354101181,
				5.6899166107178,
				3.1409375667572,
				4.1296458244324
			}
		},
		pwe_gameplay_seeing_a_troll_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.4280207157135,
				3.0064375400543,
				3.4557082653046,
				3.419625043869,
				5.0482292175293,
				4.7795000076294,
				4.9144582748413,
				3.2971875667572
			}
		},
		pwe_gameplay_killing_a_chaos_warrior_champion_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.4873957633972,
				3.0129792690277,
				2.2350208759308,
				2.7226250171661,
				3.9506459236145,
				1.8351666927338,
				5.1636247634888,
				3.9527292251587
			}
		},
		pwe_gameplay_seeing_a_chaos_warrior_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.7362916469574,
				2.595624923706,
				3.6480000019074,
				3.6744999885559,
				2.8305416107178,
				2.8326666355133,
				3.4553542137146,
				3.5396249294281
			}
		},
		pwe_gameplay_hearing_a_globadier_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_dwarf_ranger_being_helped_up_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.3280625343323,
				2.1656458377838,
				2.5271248817444,
				3.1485209465027,
				2.7290208339691,
				1.5908124446869,
				1.845583319664,
				2.4897916316986
			}
		},
		pwe_gameplay_seeing_a_chaos_wizard_plague_no_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_wizard_plague_01",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_02",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_03",
				"pwe_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				5.1369791030884,
				3.423645734787,
				5.7460207939148,
				4.2703747749329
			}
		},
		pwe_gameplay_killing_a_chaos_wizard_tentacle_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			sound_events = {
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pwe_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			face_animations = {
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
				"dialogue_talk"
			},
			sound_events_duration = {
				3.5325000286102,
				4.3611249923706,
				3.5891666412353,
				1.847416639328,
				1.8670624494553,
				1.9826666116715
			}
		},
		pwe_gameplay_killing_a_chaos_wizard_wind_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_wizard_wind_01",
				"pwe_gameplay_killing_a_chaos_wizard_wind_02",
				"pwe_gameplay_killing_a_chaos_wizard_wind_03",
				"pwe_gameplay_killing_a_chaos_wizard_wind_04",
				"pwe_gameplay_killing_a_chaos_wizard_wind_05",
				"pwe_gameplay_killing_a_chaos_wizard_wind_06"
			},
			sound_events = {
				"pwe_gameplay_killing_a_chaos_wizard_wind_01",
				"pwe_gameplay_killing_a_chaos_wizard_wind_02",
				"pwe_gameplay_killing_a_chaos_wizard_wind_03",
				"pwe_gameplay_killing_a_chaos_wizard_wind_04",
				"pwe_gameplay_killing_a_chaos_wizard_wind_05",
				"pwe_gameplay_killing_a_chaos_wizard_wind_06"
			},
			face_animations = {
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
				"dialogue_talk"
			},
			sound_events_duration = {
				3.1137292385101,
				2.8432500362396,
				2.8394167423248,
				1.7517499923706,
				1.6777499914169,
				2.2009167671204
			}
		},
		pwe_gameplay_hearing_a_stormfiend_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_stormfiend_01",
				"pwe_gameplay_hearing_a_stormfiend_02",
				"pwe_gameplay_hearing_a_stormfiend_03",
				"pwe_gameplay_hearing_a_stormfiend_04",
				"pwe_gameplay_hearing_a_stormfiend_05",
				"pwe_gameplay_hearing_a_stormfiend_06"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_stormfiend_01",
				"pwe_gameplay_hearing_a_stormfiend_02",
				"pwe_gameplay_hearing_a_stormfiend_03",
				"pwe_gameplay_hearing_a_stormfiend_04",
				"pwe_gameplay_hearing_a_stormfiend_05",
				"pwe_gameplay_hearing_a_stormfiend_06"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.1097917556763,
				2.1117916107178,
				3.7603750228882,
				2.9161875247955,
				2.5939373970032,
				3.128312587738
			}
		},
		pwe_gameplay_empire_soldier_being_helped_up_drunk = {
			face_animations_n = 9,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 9,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 9,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.9997291564941,
				2.6720416545868,
				1.7043124437332,
				2.596583366394,
				3.1679999828339,
				2.5295417308807,
				3.2594375610352,
				2.2885415554047,
				1.7281458377838
			}
		},
		pwe_burp = {
			face_animations_n = 1,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 1,
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_burp"
			},
			sound_events = {
				[1.0] = "pwe_burp"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 0.49342796206474
			}
		},
		pwe_gameplay_hearing_a_chaos_wizard_wind_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_skaven_rat_ogre_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_skaven_rat_ogre_01",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_04",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_05",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_02",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_03",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_06"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_skaven_rat_ogre_01",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_04",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_05",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_02",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_03",
				"pwe_gameplay_hearing_a_skaven_rat_ogre_06"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_contempt",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout"
			},
			sound_events_duration = {
				3.8119375705719,
				3.3998749256134,
				2.6778540611267,
				1.5307083129883,
				2.5351250171661,
				2.7657499313355
			}
		},
		pwe_gameplay_using_potion_drunk = {
			face_animations_n = 1,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 1,
			category = "player_feedback",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_drank"
			},
			sound_events = {
				[1.0] = "pwe_drank"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			sound_events_duration = {
				[1.0] = 3.0447292327881
			}
		},
		pwe_gameplay_friendly_fire_empire_soldier_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_friendly_fire_empire_soldier_05",
				"pwe_gameplay_friendly_fire_empire_soldier_06",
				"pwe_gameplay_friendly_fire_empire_soldier_07",
				"pwe_gameplay_friendly_fire_empire_soldier_08",
				"pwe_gameplay_friendly_fire_empire_soldier_09"
			},
			sound_events = {
				"pwe_gameplay_friendly_fire_empire_soldier_05",
				"pwe_gameplay_friendly_fire_empire_soldier_06",
				"pwe_gameplay_friendly_fire_empire_soldier_07",
				"pwe_gameplay_friendly_fire_empire_soldier_08",
				"pwe_gameplay_friendly_fire_empire_soldier_09"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry",
				"face_angry"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.9592708349228,
				4.18204164505,
				2.2787499427795,
				2.7457082271576,
				4.7072291374206
			}
		},
		pwe_gameplay_hearing_a_Skaven_warpfire_thrower_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_skaven_rat_ogre_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_healing_draught_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_spotted_liquid_01",
				"pwe_crawl_drunk_spotted_liquid_02",
				"pwe_crawl_drunk_spotted_liquid_03",
				"pwe_crawl_drunk_spotted_liquid_04"
			},
			sound_events = {
				"pwe_crawl_drunk_spotted_liquid_01",
				"pwe_crawl_drunk_spotted_liquid_02",
				"pwe_crawl_drunk_spotted_liquid_03",
				"pwe_crawl_drunk_spotted_liquid_04"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				7.1277084350586,
				3.7648334503174,
				1.431937456131,
				4.3132500648499
			}
		},
		pwe_gameplay_hearing_a_skaven_patrol_stormvermin_no_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_07"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_03",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_04",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_05",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_06",
				"pwe_gameplay_hearing_a_skaven_patrol_stormvermin_07"
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
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.7805209159851,
				3.8264582157135,
				2.7984583377838,
				3.3561458587647,
				4.1999998092651,
				3.0220415592194,
				4.7155418395996
			}
		},
		pwe_gameplay_killing_a_chaos_wizard_plague_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_wizard_plague_01",
				"pwe_gameplay_killing_a_chaos_wizard_plague_02",
				"pwe_gameplay_killing_a_chaos_wizard_plague_03",
				"pwe_gameplay_killing_a_chaos_wizard_plague_04",
				"pwe_gameplay_killing_a_chaos_wizard_plague_05",
				"pwe_gameplay_killing_a_chaos_wizard_plague_06"
			},
			sound_events = {
				"pwe_gameplay_killing_a_chaos_wizard_plague_01",
				"pwe_gameplay_killing_a_chaos_wizard_plague_02",
				"pwe_gameplay_killing_a_chaos_wizard_plague_03",
				"pwe_gameplay_killing_a_chaos_wizard_plague_04",
				"pwe_gameplay_killing_a_chaos_wizard_plague_05",
				"pwe_gameplay_killing_a_chaos_wizard_plague_06"
			},
			face_animations = {
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
				"dialogue_talk"
			},
			sound_events_duration = {
				3.4801249504089,
				2.5972082614899,
				2.7465000152588,
				3.8047082424164,
				1.7960416078568,
				1.8494999408722
			}
		},
		pwe_gameplay_spots_bomb_drunk = {
			face_animations_n = 19,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 19,
			randomize_indexes_n = 0,
			category = "seen_items",
			dialogue_animations_n = 19,
			randomize_indexes = {},
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
			}
		},
		pwe_gameplay_hears_incoming_horde_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hears_incoming_horde_11",
				"pwe_gameplay_hears_incoming_horde_12",
				"pwe_gameplay_hears_incoming_horde_13",
				"pwe_gameplay_hears_incoming_horde_14",
				"pwe_gameplay_hears_incoming_horde_15",
				"pwe_gameplay_hears_incoming_horde_16",
				"pwe_gameplay_hears_incoming_horde_17"
			},
			sound_events = {
				"pwe_gameplay_hears_incoming_horde_11",
				"pwe_gameplay_hears_incoming_horde_12",
				"pwe_gameplay_hears_incoming_horde_13",
				"pwe_gameplay_hears_incoming_horde_14",
				"pwe_gameplay_hears_incoming_horde_15",
				"pwe_gameplay_hears_incoming_horde_16",
				"pwe_gameplay_hears_incoming_horde_17"
			},
			face_animations = {
				"face_contempt",
				"face_smug",
				"face_smug",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.9964791536331,
				2.5064375400543,
				2.6141874790192,
				3.6379165649414,
				4.9776043891907,
				2.4286875724792,
				1.7820833921433
			}
		},
		pwe_gameplay_hearing_a_skaven_rat_ogre_combat_no_drunk_no_drunk = {
			face_animations_n = 2,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 2,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 2,
			randomize_indexes = {},
			localization_strings = {
				[1.0] = "pwe_gameplay_hearing_a_skaven_rat_ogre_combat_03",
				[2.0] = "pwe_gameplay_hearing_a_skaven_rat_ogre_01"
			},
			sound_events = {
				[1.0] = "pwe_gameplay_hearing_a_skaven_rat_ogre_combat_03",
				[2.0] = "pwe_gameplay_hearing_a_skaven_rat_ogre_01"
			},
			face_animations = {
				[1.0] = "face_fear",
				[2.0] = "face_fear"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 4.6031665802002,
				[2.0] = 3.8119375705719
			}
		},
		pwe_gameplay_witch_hunter_being_helped_up_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.4904375076294,
				3.0301249027252,
				3.6178333759308,
				2.9603750705719,
				2.625937461853,
				2.0248124599457,
				2.2315208911896,
				2.3442499637604
			}
		},
		pwe_crawl_drunk_buff_begins = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_buff_begins_01",
				"pwe_crawl_drunk_buff_begins_02",
				"pwe_crawl_drunk_buff_begins_03",
				"pwe_crawl_drunk_buff_begins_04",
				"pwe_crawl_drunk_buff_begins_05",
				"pwe_crawl_drunk_buff_begins_06"
			},
			sound_events = {
				"pwe_crawl_drunk_buff_begins_01",
				"pwe_crawl_drunk_buff_begins_02",
				"pwe_crawl_drunk_buff_begins_03",
				"pwe_crawl_drunk_buff_begins_04",
				"pwe_crawl_drunk_buff_begins_05",
				"pwe_crawl_drunk_buff_begins_06"
			},
			face_animations = {
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral",
				"face_neutral"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.0810625553131,
				3.3225834369659,
				3.952291727066,
				3.3001248836517,
				3.8634791374206,
				4.7238960266113
			}
		},
		pwe_gameplay_ambush_horde_spawned_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_ambush_horde_spawned_02",
				"pwe_gameplay_ambush_horde_spawned_03",
				"pwe_gameplay_ambush_horde_spawned_05",
				"pwe_gameplay_ambush_horde_spawned_07",
				"pwe_gameplay_ambush_horde_spawned_08",
				"pwe_gameplay_ambush_horde_spawned_09",
				"pwe_gameplay_ambush_horde_spawned_10"
			},
			sound_events = {
				"pwe_gameplay_ambush_horde_spawned_02",
				"pwe_gameplay_ambush_horde_spawned_03",
				"pwe_gameplay_ambush_horde_spawned_05",
				"pwe_gameplay_ambush_horde_spawned_07",
				"pwe_gameplay_ambush_horde_spawned_08",
				"pwe_gameplay_ambush_horde_spawned_09",
				"pwe_gameplay_ambush_horde_spawned_10"
			},
			face_animations = {
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise",
				"face_surprise"
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
			sound_events_duration = {
				2.1705000400543,
				3.0216250419617,
				2.5715000629425,
				2.362583398819,
				1.6252708435059,
				2.6306874752045,
				3.2350625991821
			}
		},
		pwe_gameplay_knocked_down_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "player_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_knocked_down_01",
				"pwe_crawl_drunk_knocked_down_02",
				"pwe_crawl_drunk_knocked_down_03",
				"pwe_crawl_drunk_knocked_down_04"
			},
			sound_events = {
				"pwe_crawl_drunk_knocked_down_01",
				"pwe_crawl_drunk_knocked_down_02",
				"pwe_crawl_drunk_knocked_down_03",
				"pwe_crawl_drunk_knocked_down_04"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				6.5061874389648,
				4.1374793052673,
				4.6555833816528,
				2.9488749504089
			}
		},
		pwe_crawl_drank = {
			face_animations_n = 1,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 1,
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			localization_strings = {
				[1.0] = "pwe_drank_drunk"
			},
			sound_events = {
				[1.0] = "pwe_drank_drunk"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			sound_events_duration = {
				[1.0] = 1.4780625104904
			}
		},
		pwe_gameplay_hearing_a_chaos_wizard_plague_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.9628748893738,
				2.2638125419617,
				1.5947083234787,
				1.5521458387375,
				2.048770904541,
				1.727979183197,
				1.9084166288376,
				1.5833749771118
			}
		},
		pwe_gameplay_hearing_a_globadier_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_chaos_spawn_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				0.93166667222977,
				1.6336041688919,
				1.4325000047684,
				2.5922708511352,
				2.1415207386017,
				1.3909583091736,
				2.0276250839233,
				2.0118958950043
			}
		},
		pwe_gameplay_seeing_a_shield_stormvermin_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.1078541278839,
				2.0900626182556,
				2.6933541297913,
				3.4985208511352,
				4.4747500419617,
				3.1501874923706,
				3.7799582481384,
				1.7827708721161
			}
		},
		pwe_gameplay_hearing_a_chaos_wizard_tentacle_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.0336666107178,
				2.3504166603088,
				1.9103749990463,
				1.4423958063126,
				1.7308125495911,
				3.0026667118073,
				1.345166683197,
				1.7238750457764
			}
		},
		pwe_gameplay_seeing_a_skaven_rat_ogre_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.7894999980927,
				2.8174583911896,
				1.5526041984558,
				2.6048123836517,
				2.2405834197998,
				4.3446664810181
			}
		},
		pwe_gameplay_hearing_a_troll_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_gutter_runner_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_skaven_ratling_gun_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_seeing_a_pm_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_plague_monk_01",
				"pwe_gameplay_seeing_a_plague_monk_02",
				"pwe_gameplay_seeing_a_plague_monk_03",
				"pwe_gameplay_seeing_a_plague_monk_04",
				"pwe_gameplay_seeing_a_plague_monk_05",
				"pwe_gameplay_seeing_a_plague_monk_06",
				"pwe_gameplay_seeing_a_plague_monk_07",
				"pwe_gameplay_seeing_a_plague_monk_08"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_plague_monk_01",
				"pwe_gameplay_seeing_a_plague_monk_02",
				"pwe_gameplay_seeing_a_plague_monk_03",
				"pwe_gameplay_seeing_a_plague_monk_04",
				"pwe_gameplay_seeing_a_plague_monk_05",
				"pwe_gameplay_seeing_a_plague_monk_06",
				"pwe_gameplay_seeing_a_plague_monk_07",
				"pwe_gameplay_seeing_a_plague_monk_08"
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
			sound_events_duration = {
				2.6742291450501,
				2.6205208301544,
				3.8547291755676,
				4.0491042137146,
				3.2652916908264,
				2.6762917041779,
				3.1536042690277,
				2.6422083377838
			}
		},
		pwe_gameplay_seeing_a_globadier_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_03",
				"pwe_gameplay_seeing_a_globadier_04",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_05",
				"pwe_gameplay_seeing_a_globadier_06"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_03",
				"pwe_gameplay_seeing_a_globadier_04",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_05",
				"pwe_gameplay_seeing_a_globadier_06"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				0.99164581298828,
				3.1963334083557,
				2.0327498912811,
				1.3089582920075,
				3.290374994278,
				2.0898957252502
			}
		},
		pwe_gameplay_hearing_a_skaven_ratling_gun_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_killing_a_chaos_wizard_leech_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_killing_a_chaos_wizard_leech_01",
				"pwe_gameplay_killing_a_chaos_wizard_leech_02",
				"pwe_gameplay_killing_a_chaos_wizard_leech_03",
				"pwe_gameplay_killing_a_chaos_wizard_leech_04",
				"pwe_gameplay_killing_a_chaos_wizard_leech_05",
				"pwe_gameplay_killing_a_chaos_wizard_leech_06"
			},
			sound_events = {
				"pwe_gameplay_killing_a_chaos_wizard_leech_01",
				"pwe_gameplay_killing_a_chaos_wizard_leech_02",
				"pwe_gameplay_killing_a_chaos_wizard_leech_03",
				"pwe_gameplay_killing_a_chaos_wizard_leech_04",
				"pwe_gameplay_killing_a_chaos_wizard_leech_05",
				"pwe_gameplay_killing_a_chaos_wizard_leech_06"
			},
			face_animations = {
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
				"dialogue_talk"
			},
			sound_events_duration = {
				2.1928541660309,
				1.4164791107178,
				2.1445207595825,
				2.1141042709351,
				1.7132707834244,
				2.2379791736603
			}
		},
		pwe_gameplay_seeing_a_gutter_runner_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_02",
				"pwe_gameplay_seeing_a_gutter_runner_03",
				"pwe_gameplay_seeing_a_gutter_runner_04",
				"pwe_gameplay_seeing_a_gutter_runner_05",
				"pwe_gameplay_seeing_a_gutter_runner_06"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_02",
				"pwe_gameplay_seeing_a_gutter_runner_03",
				"pwe_gameplay_seeing_a_gutter_runner_04",
				"pwe_gameplay_seeing_a_gutter_runner_05",
				"pwe_gameplay_seeing_a_gutter_runner_06"
			},
			face_animations = {
				"face_neutral",
				"face_surprise",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.0780832767487,
				1.5039374828339,
				1.9376250505447,
				2.4213333129883,
				2.6882083415985,
				1.5567708015442
			}
		},
		pwe_gameplay_hearing_a_globadier_no_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_globadier_02",
				"pwe_gameplay_hearing_a_globadier_05",
				"pwe_gameplay_hearing_a_globadier_06",
				"pwe_gameplay_hearing_a_globadier_01",
				"pwe_gameplay_hearing_a_globadier_04"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_globadier_02",
				"pwe_gameplay_hearing_a_globadier_05",
				"pwe_gameplay_hearing_a_globadier_06",
				"pwe_gameplay_hearing_a_globadier_01",
				"pwe_gameplay_hearing_a_globadier_04"
			},
			face_animations = {
				"face_contempt",
				"face_fear",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				2.7321667671204,
				2.7966248989105,
				1.7175208330154,
				1.5011249780655,
				1.6347291469574
			}
		},
		pwe_gameplay_hearing_a_troll_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_gutter_runner_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.671395778656,
				2.7449584007263,
				2.8133125305176,
				6.2264790534973,
				3.4942917823791,
				3.434312582016,
				2.6612501144409,
				2.8425624370575
			}
		},
		pwe_gameplay_seeing_a_stormvermin_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_stormvermin_01",
				"pwe_gameplay_seeing_a_stormvermin_02",
				"pwe_gameplay_seeing_a_stormvermin_03",
				"pwe_gameplay_seeing_a_stormvermin_04",
				"pwe_gameplay_seeing_a_stormvermin_05",
				"pwe_gameplay_seeing_a_stormvermin_06",
				"pwe_gameplay_seeing_a_stormvermin_07",
				"pwe_gameplay_seeing_a_stormvermin_08"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_stormvermin_01",
				"pwe_gameplay_seeing_a_stormvermin_02",
				"pwe_gameplay_seeing_a_stormvermin_03",
				"pwe_gameplay_seeing_a_stormvermin_04",
				"pwe_gameplay_seeing_a_stormvermin_05",
				"pwe_gameplay_seeing_a_stormvermin_06",
				"pwe_gameplay_seeing_a_stormvermin_07",
				"pwe_gameplay_seeing_a_stormvermin_08"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
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
			sound_events_duration = {
				1.6789375543594,
				2.6539375782013,
				1.488041639328,
				2.9750416278839,
				3.1721665859222,
				2.8721249103546,
				2.6800000667572,
				3.1020624637604
			}
		},
		pwe_gameplay_hearing_a_chaos_wizard_wind_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				3.7218542098999,
				4.7617707252502,
				5.2777290344238,
				5.2157502174377,
				2.0554583072662,
				1.9348750114441,
				2.0091457366943,
				1.935666680336
			}
		},
		pwe_gameplay_hearing_a_chaos_wizard_plague_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				3.6963334083557,
				7.8407292366028,
				3.1303958892822,
				2.8760416507721,
				3.720999956131,
				1.6794583797455,
				1.4857499599457,
				1.8359792232513
			}
		},
		pwe_gameplay_hearing_a_gutter_runner_no_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_gutter_runner_01",
				"pwe_gameplay_hearing_a_gutter_runner_02",
				"pwe_gameplay_hearing_a_gutter_runner_03",
				"pwe_gameplay_hearing_a_gutter_runner_04",
				"pwe_gameplay_hearing_a_gutter_runner_05",
				"pwe_gameplay_hearing_a_gutter_runner_06"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_gutter_runner_01",
				"pwe_gameplay_hearing_a_gutter_runner_02",
				"pwe_gameplay_hearing_a_gutter_runner_03",
				"pwe_gameplay_hearing_a_gutter_runner_04",
				"pwe_gameplay_hearing_a_gutter_runner_05",
				"pwe_gameplay_hearing_a_gutter_runner_06"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.1654374599457,
				1.608895778656,
				2.4852707386017,
				1.573458313942,
				1.8292083740234,
				3.4422082901001
			}
		},
		pwe_crawl_drunk_buff_wears_off = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 8,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_buff_wears_off_01",
				"pwe_crawl_drunk_buff_wears_off_02",
				"pwe_crawl_drunk_buff_wears_off_03",
				"pwe_crawl_drunk_buff_wears_off_04",
				"pwe_crawl_drunk_buff_wears_off_05",
				"pwe_crawl_drunk_buff_wears_off_06",
				"pwe_crawl_drunk_buff_wears_off_07",
				"pwe_crawl_drunk_buff_wears_off_08"
			},
			sound_events = {
				"pwe_crawl_drunk_buff_wears_off_01",
				"pwe_crawl_drunk_buff_wears_off_02",
				"pwe_crawl_drunk_buff_wears_off_03",
				"pwe_crawl_drunk_buff_wears_off_04",
				"pwe_crawl_drunk_buff_wears_off_05",
				"pwe_crawl_drunk_buff_wears_off_06",
				"pwe_crawl_drunk_buff_wears_off_07",
				"pwe_crawl_drunk_buff_wears_off_08"
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
			sound_events_duration = {
				3.8550417423248,
				5.1667499542236,
				2.1493124961853,
				2.1075832843781,
				3.5255208015442,
				4.0461874008179,
				3.3473124504089,
				5.2690625190735
			}
		},
		pwe_gameplay_seeing_a_chaos_wizard_wind_no_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_chaos_wizard_wind_01",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_02",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_03",
				"pwe_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				2.8364791870117,
				2.8889582157135,
				2.5443542003632,
				4.6750001907349
			}
		},
		pwe_gameplay_healing_bright_wizard_drunk = {
			face_animations_n = 5,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 5,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 5,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_healing_bright_wizard_05",
				"pwe_gameplay_healing_bright_wizard_06",
				"pwe_gameplay_healing_bright_wizard_07",
				"pwe_gameplay_healing_bright_wizard_08",
				"pwe_gameplay_healing_bright_wizard_09"
			},
			sound_events = {
				"pwe_gameplay_healing_bright_wizard_05",
				"pwe_gameplay_healing_bright_wizard_06",
				"pwe_gameplay_healing_bright_wizard_07",
				"pwe_gameplay_healing_bright_wizard_08",
				"pwe_gameplay_healing_bright_wizard_09"
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
				1.8456041812897,
				2.5021250247955,
				1.827604174614,
				2.2164583206177,
				3.5390207767487
			}
		},
		pwe_gameplay_seeing_a_skaven_ratling_gun_no_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_07"
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
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				1.4262083768845,
				1.2635624408722,
				1.4607291221619,
				1.3288958072662,
				2.6527707576752,
				1.6027083396912,
				2.951708316803
			}
		},
		pwe_gameplay_hearing_a_chaos_spawn_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_pm_no_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_hearing_a_plague_monk_01",
				"pwe_gameplay_hearing_a_plague_monk_02",
				"pwe_gameplay_hearing_a_plague_monk_03",
				"pwe_gameplay_hearing_a_plague_monk_04",
				"pwe_gameplay_hearing_a_plague_monk_05",
				"pwe_gameplay_hearing_a_plague_monk_06",
				"pwe_gameplay_hearing_a_plague_monk_07"
			},
			sound_events = {
				"pwe_gameplay_hearing_a_plague_monk_01",
				"pwe_gameplay_hearing_a_plague_monk_02",
				"pwe_gameplay_hearing_a_plague_monk_03",
				"pwe_gameplay_hearing_a_plague_monk_04",
				"pwe_gameplay_hearing_a_plague_monk_05",
				"pwe_gameplay_hearing_a_plague_monk_06",
				"pwe_gameplay_hearing_a_plague_monk_07"
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
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				4.597291469574,
				3.0632290840149,
				4.4501042366028,
				1.9128541946411,
				1.1345208883286,
				1.4875625371933,
				2.3826665878296
			}
		},
		pwe_gameplay_self_heal_drunk = {
			face_animations_n = 6,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 6,
			randomize_indexes_n = 0,
			category = "player_feedback",
			dialogue_animations_n = 6,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_self_heal_01",
				"pwe_gameplay_self_heal_06",
				"pwe_gameplay_self_heal_07",
				"pwe_gameplay_self_heal_08",
				"pwe_gameplay_self_heal_09",
				"pwe_gameplay_self_heal_10"
			},
			sound_events = {
				"pwe_gameplay_self_heal_01",
				"pwe_gameplay_self_heal_06",
				"pwe_gameplay_self_heal_07",
				"pwe_gameplay_self_heal_08",
				"pwe_gameplay_self_heal_09",
				"pwe_gameplay_self_heal_10"
			},
			face_animations = {
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			sound_events_duration = {
				1.5633333921433,
				1.4367291927338,
				3.0475833415985,
				1.8029166460037,
				2.23472905159,
				3.733416557312
			}
		},
		pwe_gameplay_hearing_a_stormfiend_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_killing_a_chaos_warrior_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				2.1076457500458,
				3.54722905159,
				1.9799582958221,
				3.040937423706,
				2.5885000228882,
				2.4980416297913,
				4.8057918548584,
				2.2747082710266
			}
		},
		pwe_gameplay_hearing_a_chaos_wizard_wind_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_hearing_a_stormfiend_combat_no_drunk = {
			face_animations_n = 8,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 8,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
			randomize_indexes = {},
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
			sound_events_duration = {
				1.8753333091736,
				1.2236458063126,
				1.2701041698456,
				2.3158750534058,
				2.0139374732971,
				1.6896458864212,
				3.1184165477753,
				2.5741875171661
			}
		},
		pwe_gameplay_hearing_a_stormfiend_combat_drunk = {
			face_animations_n = 4,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 4,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			randomize_indexes = {},
			localization_strings = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			sound_events = {
				"pwe_crawl_drunk_incoming_threat_01",
				"pwe_crawl_drunk_incoming_threat_02",
				"pwe_crawl_drunk_incoming_threat_03",
				"pwe_crawl_drunk_incoming_threat_04"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			sound_events_duration = {
				4.2156043052673,
				4.1812500953674,
				3.9645416736603,
				4.9623126983643
			}
		},
		pwe_gameplay_seeing_a_skaven_patrol_stormvermin_no_drunk = {
			face_animations_n = 7,
			database = "wood_elf_game_play_crawl",
			sound_events_n = 7,
			randomize_indexes_n = 0,
			category = "enemy_alerts_high",
			dialogue_animations_n = 7,
			randomize_indexes = {},
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_01",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_02",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_03",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_04",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_05",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_06",
				"pwe_gameplay_seeing_a_skaven_patrol_stormvermin_07"
			},
			face_animations = {
				"face_calm",
				"face_concerned",
				"face_concerned",
				"face_contempt",
				"face_nervous",
				"face_concerned",
				"face_concerned"
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
			sound_events_duration = {
				1.9352707862854,
				2.0756666660309,
				2.872270822525,
				2.6757917404175,
				2.1157915592194,
				2.2517292499542,
				4.5071249008179
			}
		}
	})
end
