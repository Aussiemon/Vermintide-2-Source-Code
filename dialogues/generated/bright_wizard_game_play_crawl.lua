return function ()
	define_rule({
		name = "pbw_gameplay_knocked_down_drunk",
		response = "pbw_gameplay_knocked_down_drunk",
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
		name = "pbw_gameplay_player_pounced_drunk",
		response = "pbw_gameplay_player_pounced_drunk",
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
		name = "pbw_crawl_drunk_buff_wears_off",
		response = "pbw_crawl_drunk_buff_wears_off",
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
		name = "pbw_crawl_drunk_buff_begins",
		response = "pbw_crawl_drunk_buff_begins",
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
		name = "pbw_crawl_drunk_buff_begins_from_sick",
		response = "pbw_crawl_drunk_buff_begins_from_sick",
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
		name = "pbw_gameplay_healing_draught_drunk",
		response = "pbw_gameplay_healing_draught_drunk",
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
				"bright_wizard"
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
		name = "pbw_gameplay_spots_potion_drunk",
		response = "pbw_gameplay_spots_potion_drunk",
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
		name = "pbw_gameplay_using_potion_drunk",
		response = "pbw_gameplay_using_potion_drunk",
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
		name = "pbw_gameplay_tips_wizard_wind_drunk",
		response = "pbw_gameplay_tips_wizard_wind_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		response = "pbw_crawl_drank",
		name = "pbw_crawl_drank",
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
		name = "pbw_burp",
		response = "pbw_burp",
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
		response = "pbw_gameplay_empire_soldier_being_helped_up_drunk",
		name = "pbw_gameplay_empire_soldier_being_helped_up_drunk",
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
		response = "pbw_gameplay_witch_hunter_being_helped_up_drunk",
		name = "pbw_gameplay_witch_hunter_being_helped_up_drunk",
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
		response = "pbw_gameplay_wood_elf_being_helped_up_drunk",
		name = "pbw_gameplay_wood_elf_being_helped_up_drunk",
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
		response = "pbw_gameplay_dwarf_ranger_being_helped_drunk",
		name = "pbw_gameplay_dwarf_ranger_being_helped_drunk",
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
		name = "pbw_gameplay_healing_dwarf_ranger_drunk",
		response = "pbw_gameplay_healing_dwarf_ranger_drunk",
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
		name = "pbw_gameplay_helped_by_empire_soldier_drunk",
		response = "pbw_gameplay_helped_by_empire_soldier_drunk",
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
		name = "pbw_gameplay_helped_by_witch_hunter_drunk",
		response = "pbw_gameplay_helped_by_witch_hunter_drunk",
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
		name = "pbw_gameplay_helped_by_wood_elf_drunk",
		response = "pbw_gameplay_helped_by_wood_elf_drunk",
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
		name = "pbw_gameplay_helped_by_dwarf_ranger_drunk",
		response = "pbw_gameplay_helped_by_dwarf_ranger_drunk",
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
		name = "pbw_gameplay_empire_soldier_low_on_health_drunk",
		response = "pbw_gameplay_empire_soldier_low_on_health_drunk",
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
		name = "pbw_gameplay_witch_hunter_low_on_health_drunk",
		response = "pbw_gameplay_witch_hunter_low_on_health_drunk",
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
		name = "pbw_gameplay_wood_elf_low_on_health_drunk",
		response = "pbw_gameplay_wood_elf_low_on_health_drunk",
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
		name = "pbw_gameplay_dwarf_ranger_low_on_health_drunk",
		response = "pbw_gameplay_dwarf_ranger_low_on_health_drunk",
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
		name = "pbw_gameplay_spots_ammo_drunk",
		response = "pbw_gameplay_spots_ammo_drunk",
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
		name = "pbw_gameplay_spots_health_drunk",
		response = "pbw_gameplay_spots_health_drunk",
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
		name = "pbw_gameplay_spots_bomb_drunk",
		response = "pbw_gameplay_spots_bomb_drunk",
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
		name = "pbw_gameplay_self_heal_drunk",
		response = "pbw_gameplay_self_heal_drunk",
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
		name = "pbw_gameplay_throwing_bomb_drunk",
		response = "pbw_gameplay_throwing_bomb_drunk",
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
		name = "pbw_gameplay_friendly_fire_witch_hunter_drunk",
		response = "pbw_gameplay_friendly_fire_witch_hunter_drunk",
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
		name = "pbw_gameplay_friendly_fire_dwarf_ranger_drunk",
		response = "pbw_gameplay_friendly_fire_dwarf_ranger_drunk",
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
		name = "pbw_gameplay_friendly_fire_wood_elf_drunk",
		response = "pbw_gameplay_friendly_fire_wood_elf_drunk",
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
		name = "pbw_gameplay_friendly_fire_empire_soldier_drunk",
		response = "pbw_gameplay_friendly_fire_empire_soldier_drunk",
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
		response = "pbw_activate_ability_battle_wizard_non_drunk",
		name = "pbw_activate_ability_battle_wizard_non_drunk",
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
		response = "pbw_activate_ability_unchained_non_drunk",
		name = "pbw_activate_ability_unchained_non_drunk",
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
		response = "pbw_activate_ability_pyromancer_non_drunk",
		name = "pbw_activate_ability_pyromancer_non_drunk",
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
		name = "pbw_gameplay_hearing_a_gutter_runner_drunk",
		response = "pbw_gameplay_hearing_a_gutter_runner_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_globadier_drunk",
		response = "pbw_gameplay_hearing_a_globadier_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_incoming_skaven_rat_ogre_drunk",
		response = "pbw_gameplay_incoming_skaven_rat_ogre_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_skaven_patrol_stormvermin_drunk",
		response = "pbw_gameplay_hearing_a_skaven_patrol_stormvermin_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_skaven_ratling_gun_drunk",
		response = "pbw_gameplay_hearing_a_skaven_ratling_gun_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
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
		name = "pbw_gameplay_hearing_a_gutter_runner_combat_drunk",
		response = "pbw_gameplay_hearing_a_gutter_runner_combat_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_globadier_combat_drunk",
		response = "pbw_gameplay_hearing_a_globadier_combat_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_skaven_rat_ogre_combat_drunk",
		response = "pbw_gameplay_hearing_a_skaven_rat_ogre_combat_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_skaven_ratling_gun_combat_drunk",
		response = "pbw_gameplay_hearing_a_skaven_ratling_gun_combat_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_chaos_spawn_combat_drunk",
		response = "pbw_gameplay_hearing_a_chaos_spawn_combat_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_chaos_spawn_drunk",
		response = "pbw_gameplay_hearing_a_chaos_spawn_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_chaos_wizard_wind_drunk",
		response = "pbw_gameplay_hearing_a_chaos_wizard_wind_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_chaos_wizard_wind_combat_drunk",
		response = "pbw_gameplay_hearing_a_chaos_wizard_wind_combat_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_Skaven_warpfire_thrower_drunk",
		response = "pbw_gameplay_hearing_a_Skaven_warpfire_thrower_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk",
		response = "pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_stormfiend_drunk",
		response = "pbw_gameplay_hearing_a_stormfiend_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_stormfiend_combat_drunk",
		response = "pbw_gameplay_hearing_a_stormfiend_combat_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_troll_drunk",
		response = "pbw_gameplay_hearing_a_troll_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_troll_combat_drunk",
		response = "pbw_gameplay_hearing_a_troll_combat_drunk",
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
				"user_memory",
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hearing_a_skaven_rat_ogre_drunk",
		response = "pbw_gameplay_hearing_a_skaven_rat_ogre_drunk",
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
				"incoming_threat_sienna",
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
				"incoming_threat_sienna",
				OP.TIMESET
			}
		}
	})
	define_rule({
		name = "pbw_gameplay_hears_incoming_horde_drunk",
		response = "pbw_gameplay_hears_incoming_horde_drunk",
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
		name = "pbw_gameplay_seeing_a_pm_no_drunk",
		response = "pbw_gameplay_seeing_a_pm_no_drunk",
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
		name = "pbw_gameplay_seeing_a_scr_no_drunk",
		response = "pbw_gameplay_seeing_a_scr_no_drunk",
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
		name = "pbw_gameplay_seeing_a_chaos_spawn_no_drunk",
		response = "pbw_gameplay_seeing_a_chaos_spawn_no_drunk",
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
		name = "pbw_gameplay_killing_a_stormfiend_no_drunk",
		response = "pbw_gameplay_killing_a_stormfiend_no_drunk",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_warrior_no_drunk",
		response = "pbw_gameplay_killing_a_chaos_warrior_no_drunk",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_warrior_champion_no_drunk",
		response = "pbw_gameplay_killing_a_chaos_warrior_champion_no_drunk",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_wizard_plague_no_drunk",
		response = "pbw_gameplay_killing_a_chaos_wizard_plague_no_drunk",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_wizard_tentacle_no_drunk",
		response = "pbw_gameplay_killing_a_chaos_wizard_tentacle_no_drunk",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_chaos_wizard_wind_no_drunk",
		response = "pbw_gameplay_killing_a_chaos_wizard_wind_no_drunk",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
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
		name = "pbw_gameplay_killing_a_skaven_warpfire_thrower_no_drunk",
		response = "pbw_gameplay_killing_a_skaven_warpfire_thrower_no_drunk",
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
				"bright_wizard_special_kills_in_row",
				OP.ADD,
				1
			},
			{
				"faction_memory",
				"bright_wizard_special_kills_in_row",
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
		name = "pbw_gameplay_seeing_a_chaos_warrior_no_drunk",
		response = "pbw_gameplay_seeing_a_chaos_warrior_no_drunk",
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
		name = "pbw_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk",
		response = "pbw_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk",
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
		name = "pbw_gameplay_seeing_a_chaos_wizard_plague_no_drunk",
		response = "pbw_gameplay_seeing_a_chaos_wizard_plague_no_drunk",
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
		name = "pbw_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk",
		response = "pbw_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk",
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
		name = "pbw_gameplay_seeing_a_chaos_wizard_wind_no_drunk",
		response = "pbw_gameplay_seeing_a_chaos_wizard_wind_no_drunk",
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
		name = "pbw_gameplay_seeing_a_shield_stormvermin_no_drunk",
		response = "pbw_gameplay_seeing_a_shield_stormvermin_no_drunk",
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
		name = "pbw_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk",
		response = "pbw_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk",
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
		name = "pbw_gameplay_seeing_a_stormfiend_no_drunk",
		response = "pbw_gameplay_seeing_a_stormfiend_no_drunk",
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
		name = "pbw_gameplay_seeing_a_troll_no_drunk",
		response = "pbw_gameplay_seeing_a_troll_no_drunk",
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
	add_dialogues({
		pbw_gameplay_spots_health_drunk = {
			sound_events_n = 11,
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "bright_wizard_game_play_crawl",
			category = "seen_items",
			dialogue_animations_n = 11,
			sound_events = {
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
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_shield_stormvermin_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_witch_hunter_low_on_health_drunk = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_witch_hunter_low_on_health_05",
				"pbw_gameplay_witch_hunter_low_on_health_06",
				"pbw_gameplay_witch_hunter_low_on_health_07",
				"pbw_gameplay_witch_hunter_low_on_health_08",
				"pbw_gameplay_witch_hunter_low_on_health_09"
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
			localization_strings = {
				"pbw_gameplay_witch_hunter_low_on_health_05",
				"pbw_gameplay_witch_hunter_low_on_health_06",
				"pbw_gameplay_witch_hunter_low_on_health_07",
				"pbw_gameplay_witch_hunter_low_on_health_08",
				"pbw_gameplay_witch_hunter_low_on_health_09"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_scr_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_seeing_a_shield_clanrat_01",
				"pbw_gameplay_seeing_a_shield_clanrat_02",
				"pbw_gameplay_seeing_a_shield_clanrat_03",
				"pbw_gameplay_seeing_a_shield_clanrat_04",
				"pbw_gameplay_seeing_a_shield_clanrat_05",
				"pbw_gameplay_seeing_a_shield_clanrat_06",
				"pbw_gameplay_seeing_a_shield_clanrat_07",
				"pbw_gameplay_seeing_a_shield_clanrat_08"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_shield_clanrat_01",
				"pbw_gameplay_seeing_a_shield_clanrat_02",
				"pbw_gameplay_seeing_a_shield_clanrat_03",
				"pbw_gameplay_seeing_a_shield_clanrat_04",
				"pbw_gameplay_seeing_a_shield_clanrat_05",
				"pbw_gameplay_seeing_a_shield_clanrat_06",
				"pbw_gameplay_seeing_a_shield_clanrat_07",
				"pbw_gameplay_seeing_a_shield_clanrat_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_skaven_ratling_gun_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_crawl_drunk_buff_begins_from_sick = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_crawl_drunk_buff_begins_from_sick_01",
				"pbw_crawl_drunk_buff_begins_from_sick_02",
				"pbw_crawl_drunk_buff_begins_from_sick_03",
				"pbw_crawl_drunk_buff_begins_from_sick_04",
				"pbw_crawl_drunk_buff_begins_from_sick_05",
				"pbw_crawl_drunk_buff_begins_from_sick_06"
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
			localization_strings = {
				"pbw_crawl_drunk_buff_begins_from_sick_01",
				"pbw_crawl_drunk_buff_begins_from_sick_02",
				"pbw_crawl_drunk_buff_begins_from_sick_03",
				"pbw_crawl_drunk_buff_begins_from_sick_04",
				"pbw_crawl_drunk_buff_begins_from_sick_05",
				"pbw_crawl_drunk_buff_begins_from_sick_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_chaos_wizard_wind_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_skaven_patrol_stormvermin_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_nervous",
				"face_concerned",
				"face_concerned",
				"face_nervous"
			},
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_using_potion_drunk = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_drank"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_drank"
			}
		},
		pbw_crawl_drunk_buff_wears_off = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_crawl_drunk_buff_wears_off_01",
				"pbw_crawl_drunk_buff_wears_off_02",
				"pbw_crawl_drunk_buff_wears_off_03",
				"pbw_crawl_drunk_buff_wears_off_04",
				"pbw_crawl_drunk_buff_wears_off_05",
				"pbw_crawl_drunk_buff_wears_off_06",
				"pbw_crawl_drunk_buff_wears_off_07",
				"pbw_crawl_drunk_buff_wears_off_08"
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
			localization_strings = {
				"pbw_crawl_drunk_buff_wears_off_01",
				"pbw_crawl_drunk_buff_wears_off_02",
				"pbw_crawl_drunk_buff_wears_off_03",
				"pbw_crawl_drunk_buff_wears_off_04",
				"pbw_crawl_drunk_buff_wears_off_05",
				"pbw_crawl_drunk_buff_wears_off_06",
				"pbw_crawl_drunk_buff_wears_off_07",
				"pbw_crawl_drunk_buff_wears_off_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_troll_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_friendly_fire_dwarf_ranger_drunk = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_friendly_fire_dwarf_ranger_05",
				"pbw_gameplay_friendly_fire_dwarf_ranger_06",
				"pbw_gameplay_friendly_fire_dwarf_ranger_07",
				"pbw_gameplay_friendly_fire_dwarf_ranger_08",
				"pbw_gameplay_friendly_fire_dwarf_ranger_09"
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
				"pbw_gameplay_friendly_fire_dwarf_ranger_05",
				"pbw_gameplay_friendly_fire_dwarf_ranger_06",
				"pbw_gameplay_friendly_fire_dwarf_ranger_07",
				"pbw_gameplay_friendly_fire_dwarf_ranger_08",
				"pbw_gameplay_friendly_fire_dwarf_ranger_09"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_friendly_fire_wood_elf_drunk = {
			sound_events_n = 2,
			randomize_indexes_n = 0,
			face_animations_n = 2,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 2,
			sound_events = {
				[1.0] = "pbw_gameplay_friendly_fire_wood_elf_05",
				[2.0] = "pbw_gameplay_friendly_fire_wood_elf_06"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout",
				[2.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_angry",
				[2.0] = "face_angry"
			},
			localization_strings = {
				[1.0] = "pbw_gameplay_friendly_fire_wood_elf_05",
				[2.0] = "pbw_gameplay_friendly_fire_wood_elf_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_Skaven_warpfire_thrower_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_killing_a_stormfiend_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_empire_soldier_low_on_health_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_empire_soldier_low_on_health_05",
				"pbw_gameplay_empire_soldier_low_on_health_06",
				"pbw_gameplay_empire_soldier_low_on_health_07",
				"pbw_gameplay_empire_soldier_low_on_health_08"
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
			localization_strings = {
				"pbw_gameplay_empire_soldier_low_on_health_05",
				"pbw_gameplay_empire_soldier_low_on_health_06",
				"pbw_gameplay_empire_soldier_low_on_health_07",
				"pbw_gameplay_empire_soldier_low_on_health_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_tips_wizard_wind_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_knocked_down_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_knocked_down_01",
				"pbw_crawl_drunk_knocked_down_02",
				"pbw_crawl_drunk_knocked_down_03",
				"pbw_crawl_drunk_knocked_down_04"
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
				"face_fear"
			},
			localization_strings = {
				"pbw_crawl_drunk_knocked_down_01",
				"pbw_crawl_drunk_knocked_down_02",
				"pbw_crawl_drunk_knocked_down_03",
				"pbw_crawl_drunk_knocked_down_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_spots_potion_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "seen_items",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_spotted_liquid_01",
				"pbw_crawl_drunk_spotted_liquid_02",
				"pbw_crawl_drunk_spotted_liquid_03",
				"pbw_crawl_drunk_spotted_liquid_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_crawl_drunk_spotted_liquid_01",
				"pbw_crawl_drunk_spotted_liquid_02",
				"pbw_crawl_drunk_spotted_liquid_03",
				"pbw_crawl_drunk_spotted_liquid_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_chaos_spawn_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_troll_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_Skaven_warpfire_thrower_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_chaos_spawn_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_wood_elf_low_on_health_drunk = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_gameplay_wood_elf_low_on_health_05",
				"pbw_gameplay_wood_elf_low_on_health_06",
				"pbw_gameplay_wood_elf_low_on_health_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_wood_elf_low_on_health_05",
				"pbw_gameplay_wood_elf_low_on_health_06",
				"pbw_gameplay_wood_elf_low_on_health_07"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_friendly_fire_witch_hunter_drunk = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_gameplay_friendly_fire_witch_hunter_05",
				"pbw_gameplay_friendly_fire_witch_hunter_06",
				"pbw_gameplay_friendly_fire_witch_hunter_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_angry",
				"face_angry"
			},
			localization_strings = {
				"pbw_gameplay_friendly_fire_witch_hunter_05",
				"pbw_gameplay_friendly_fire_witch_hunter_06",
				"pbw_gameplay_friendly_fire_witch_hunter_07"
			},
			randomize_indexes = {}
		},
		pbw_activate_ability_unchained_non_drunk = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_game_play_crawl",
			category = "activate_ability",
			dialogue_animations_n = 10,
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
			randomize_indexes = {}
		},
		pbw_gameplay_spots_bomb_drunk = {
			sound_events_n = 13,
			randomize_indexes_n = 0,
			face_animations_n = 13,
			database = "bright_wizard_game_play_crawl",
			category = "seen_items",
			dialogue_animations_n = 13,
			sound_events = {
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
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_chaos_wizard_wind_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_gutter_runner_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_healing_dwarf_ranger_drunk = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_healing_dwarf_ranger_05",
				"pbw_gameplay_healing_dwarf_ranger_06",
				"pbw_gameplay_healing_dwarf_ranger_07",
				"pbw_gameplay_healing_dwarf_ranger_08",
				"pbw_gameplay_healing_dwarf_ranger_09",
				"pbw_gameplay_healing_dwarf_ranger_14"
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
			localization_strings = {
				"pbw_gameplay_healing_dwarf_ranger_05",
				"pbw_gameplay_healing_dwarf_ranger_06",
				"pbw_gameplay_healing_dwarf_ranger_07",
				"pbw_gameplay_healing_dwarf_ranger_08",
				"pbw_gameplay_healing_dwarf_ranger_09",
				"pbw_gameplay_healing_dwarf_ranger_14"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_chaos_warrior_champion_combat_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_dwarf_ranger_being_helped_drunk = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_dwarf_ranger_being_helped_up_05",
				"pbw_gameplay_dwarf_ranger_being_helped_up_06",
				"pbw_gameplay_dwarf_ranger_being_helped_up_07",
				"pbw_gameplay_dwarf_ranger_being_helped_up_08",
				"pbw_gameplay_dwarf_ranger_being_helped_up_09",
				"pbw_gameplay_dwarf_ranger_being_helped_up_10"
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
			localization_strings = {
				"pbw_gameplay_dwarf_ranger_being_helped_up_05",
				"pbw_gameplay_dwarf_ranger_being_helped_up_06",
				"pbw_gameplay_dwarf_ranger_being_helped_up_07",
				"pbw_gameplay_dwarf_ranger_being_helped_up_08",
				"pbw_gameplay_dwarf_ranger_being_helped_up_09",
				"pbw_gameplay_dwarf_ranger_being_helped_up_10"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_skaven_ratling_gun_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_incoming_skaven_rat_ogre_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_Skaven_warpfire_thrower_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_healing_draught_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "seen_items",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_spotted_liquid_01",
				"pbw_crawl_drunk_spotted_liquid_02",
				"pbw_crawl_drunk_spotted_liquid_03",
				"pbw_crawl_drunk_spotted_liquid_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_crawl_drunk_spotted_liquid_01",
				"pbw_crawl_drunk_spotted_liquid_02",
				"pbw_crawl_drunk_spotted_liquid_03",
				"pbw_crawl_drunk_spotted_liquid_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_killing_a_chaos_warrior_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_troll_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_globadier_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_pm_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_seeing_a_plague_monk_01",
				"pbw_gameplay_seeing_a_plague_monk_02",
				"pbw_gameplay_seeing_a_plague_monk_03",
				"pbw_gameplay_seeing_a_plague_monk_04",
				"pbw_gameplay_seeing_a_plague_monk_05",
				"pbw_gameplay_seeing_a_plague_monk_06",
				"pbw_gameplay_seeing_a_plague_monk_07",
				"pbw_gameplay_seeing_a_plague_monk_08"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_plague_monk_01",
				"pbw_gameplay_seeing_a_plague_monk_02",
				"pbw_gameplay_seeing_a_plague_monk_03",
				"pbw_gameplay_seeing_a_plague_monk_04",
				"pbw_gameplay_seeing_a_plague_monk_05",
				"pbw_gameplay_seeing_a_plague_monk_06",
				"pbw_gameplay_seeing_a_plague_monk_07",
				"pbw_gameplay_seeing_a_plague_monk_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_chaos_wizard_wind_no_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_wizard_wind_01",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_02",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_03",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_04"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_chaos_wizard_wind_01",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_02",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_03",
				"pbw_gameplay_seeing_a_chaos_wizard_wind_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wood_elf_being_helped_up_drunk = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_wood_elf_being_helped_up_05",
				"pbw_gameplay_wood_elf_being_helped_up_06",
				"pbw_gameplay_wood_elf_being_helped_up_07",
				"pbw_gameplay_wood_elf_being_helped_up_08",
				"pbw_gameplay_wood_elf_being_helped_up_09",
				"pbw_gameplay_wood_elf_being_helped_up_10"
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
			localization_strings = {
				"pbw_gameplay_wood_elf_being_helped_up_05",
				"pbw_gameplay_wood_elf_being_helped_up_06",
				"pbw_gameplay_wood_elf_being_helped_up_07",
				"pbw_gameplay_wood_elf_being_helped_up_08",
				"pbw_gameplay_wood_elf_being_helped_up_09",
				"pbw_gameplay_wood_elf_being_helped_up_10"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_skaven_rat_ogre_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_gutter_runner_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_chaos_wizard_tentacle_no_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_04"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_01",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_02",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_03",
				"pbw_gameplay_seeing_a_chaos_wizard_tentacle_04"
			},
			randomize_indexes = {}
		},
		pbw_burp = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_game_play_crawl",
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_burp"
			},
			dialogue_animations = {
				[1.0] = "dialogue_talk"
			},
			face_animations = {
				[1.0] = "face_neutral"
			},
			localization_strings = {
				[1.0] = "pbw_burp"
			}
		},
		pbw_gameplay_player_pounced_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_knocked_down_01",
				"pbw_crawl_drunk_knocked_down_02",
				"pbw_crawl_drunk_knocked_down_03",
				"pbw_crawl_drunk_knocked_down_04"
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
				"face_fear"
			},
			localization_strings = {
				"pbw_crawl_drunk_knocked_down_01",
				"pbw_crawl_drunk_knocked_down_02",
				"pbw_crawl_drunk_knocked_down_03",
				"pbw_crawl_drunk_knocked_down_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_chaos_wizard_plague_no_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_seeing_a_chaos_wizard_plague_01",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_02",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_03",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_04"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_chaos_wizard_plague_01",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_02",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_03",
				"pbw_gameplay_seeing_a_chaos_wizard_plague_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_chaos_warrior_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_killing_a_skaven_warpfire_thrower_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_killing_a_chaos_wizard_tentacle_no_drunk = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_06"
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
			localization_strings = {
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_01",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_02",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_03",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_04",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_05",
				"pbw_gameplay_killing_a_chaos_wizard_tentacle_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_killing_a_chaos_wizard_wind_no_drunk = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_killing_a_chaos_wizard_wind_01",
				"pbw_gameplay_killing_a_chaos_wizard_wind_02",
				"pbw_gameplay_killing_a_chaos_wizard_wind_03",
				"pbw_gameplay_killing_a_chaos_wizard_wind_04",
				"pbw_gameplay_killing_a_chaos_wizard_wind_05",
				"pbw_gameplay_killing_a_chaos_wizard_wind_06"
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
			localization_strings = {
				"pbw_gameplay_killing_a_chaos_wizard_wind_01",
				"pbw_gameplay_killing_a_chaos_wizard_wind_02",
				"pbw_gameplay_killing_a_chaos_wizard_wind_03",
				"pbw_gameplay_killing_a_chaos_wizard_wind_04",
				"pbw_gameplay_killing_a_chaos_wizard_wind_05",
				"pbw_gameplay_killing_a_chaos_wizard_wind_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_killing_a_chaos_wizard_plague_no_drunk = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_killing_a_chaos_wizard_plague_01",
				"pbw_gameplay_killing_a_chaos_wizard_plague_02",
				"pbw_gameplay_killing_a_chaos_wizard_plague_03",
				"pbw_gameplay_killing_a_chaos_wizard_plague_04",
				"pbw_gameplay_killing_a_chaos_wizard_plague_05",
				"pbw_gameplay_killing_a_chaos_wizard_plague_06"
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
			localization_strings = {
				"pbw_gameplay_killing_a_chaos_wizard_plague_01",
				"pbw_gameplay_killing_a_chaos_wizard_plague_02",
				"pbw_gameplay_killing_a_chaos_wizard_plague_03",
				"pbw_gameplay_killing_a_chaos_wizard_plague_04",
				"pbw_gameplay_killing_a_chaos_wizard_plague_05",
				"pbw_gameplay_killing_a_chaos_wizard_plague_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_helped_by_dwarf_ranger_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_helped_by_dwarf_ranger_03",
				"pbw_gameplay_helped_by_dwarf_ranger_05",
				"pbw_gameplay_helped_by_dwarf_ranger_06",
				"pbw_gameplay_helped_by_dwarf_ranger_07"
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
			localization_strings = {
				"pbw_gameplay_helped_by_dwarf_ranger_03",
				"pbw_gameplay_helped_by_dwarf_ranger_05",
				"pbw_gameplay_helped_by_dwarf_ranger_06",
				"pbw_gameplay_helped_by_dwarf_ranger_07"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_helped_by_witch_hunter_drunk = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_gameplay_helped_by_witch_hunter_05",
				"pbw_gameplay_helped_by_witch_hunter_06",
				"pbw_gameplay_helped_by_witch_hunter_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_helped_by_witch_hunter_05",
				"pbw_gameplay_helped_by_witch_hunter_06",
				"pbw_gameplay_helped_by_witch_hunter_07"
			},
			randomize_indexes = {}
		},
		pbw_activate_ability_pyromancer_non_drunk = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "bright_wizard_game_play_crawl",
			category = "activate_ability",
			dialogue_animations_n = 12,
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
			randomize_indexes = {}
		},
		pbw_gameplay_killing_a_chaos_warrior_champion_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_witch_hunter_being_helped_up_drunk = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_witch_hunter_being_helped_up_05",
				"pbw_gameplay_witch_hunter_being_helped_up_06",
				"pbw_gameplay_witch_hunter_being_helped_up_07",
				"pbw_gameplay_witch_hunter_being_helped_up_08",
				"pbw_gameplay_witch_hunter_being_helped_up_09",
				"pbw_gameplay_witch_hunter_being_helped_up_11"
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
			localization_strings = {
				"pbw_gameplay_witch_hunter_being_helped_up_05",
				"pbw_gameplay_witch_hunter_being_helped_up_06",
				"pbw_gameplay_witch_hunter_being_helped_up_07",
				"pbw_gameplay_witch_hunter_being_helped_up_08",
				"pbw_gameplay_witch_hunter_being_helped_up_09",
				"pbw_gameplay_witch_hunter_being_helped_up_11"
			},
			randomize_indexes = {}
		},
		pbw_crawl_drunk_buff_begins = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_crawl_drunk_buff_begins_01",
				"pbw_crawl_drunk_buff_begins_02",
				"pbw_crawl_drunk_buff_begins_03",
				"pbw_crawl_drunk_buff_begins_04",
				"pbw_crawl_drunk_buff_begins_05",
				"pbw_crawl_drunk_buff_begins_06"
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
			localization_strings = {
				"pbw_crawl_drunk_buff_begins_01",
				"pbw_crawl_drunk_buff_begins_02",
				"pbw_crawl_drunk_buff_begins_03",
				"pbw_crawl_drunk_buff_begins_04",
				"pbw_crawl_drunk_buff_begins_05",
				"pbw_crawl_drunk_buff_begins_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_stormfiend_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_stormfiend_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_skaven_rat_ogre_combat_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_stormfiend_no_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 8,
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
			randomize_indexes = {}
		},
		pbw_gameplay_hears_incoming_horde_drunk = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_hears_incoming_horde_11",
				"pbw_gameplay_hears_incoming_horde_12",
				"pbw_gameplay_hears_incoming_horde_13",
				"pbw_gameplay_hears_incoming_horde_14",
				"pbw_gameplay_hears_incoming_horde_15",
				"pbw_gameplay_hears_incoming_horde_16"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_shout",
				"dialogue_talk",
				"dialogue_shout"
			},
			face_animations = {
				"face_contempt",
				"face_smug",
				"face_smug",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pbw_gameplay_hears_incoming_horde_11",
				"pbw_gameplay_hears_incoming_horde_12",
				"pbw_gameplay_hears_incoming_horde_13",
				"pbw_gameplay_hears_incoming_horde_14",
				"pbw_gameplay_hears_incoming_horde_15",
				"pbw_gameplay_hears_incoming_horde_16"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_globadier_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
			},
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_activate_ability_battle_wizard_non_drunk = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "bright_wizard_game_play_crawl",
			category = "activate_ability",
			dialogue_animations_n = 12,
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
			randomize_indexes = {}
		},
		pbw_gameplay_helped_by_wood_elf_drunk = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_gameplay_helped_by_wood_elf_05",
				"pbw_gameplay_helped_by_wood_elf_06",
				"pbw_gameplay_helped_by_wood_elf_07"
			},
			dialogue_animations = {
				"dialogue_talk",
				"dialogue_talk",
				"dialogue_talk"
			},
			face_animations = {
				"face_happy",
				"face_happy",
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_helped_by_wood_elf_05",
				"pbw_gameplay_helped_by_wood_elf_06",
				"pbw_gameplay_helped_by_wood_elf_07"
			},
			randomize_indexes = {}
		},
		pbw_crawl_drank = {
			sound_events_n = 1,
			face_animations_n = 1,
			database = "bright_wizard_game_play_crawl",
			category = "story_talk_vce",
			dialogue_animations_n = 1,
			sound_events = {
				[1.0] = "pbw_drank_drunk"
			},
			dialogue_animations = {
				[1.0] = "dialogue_shout"
			},
			face_animations = {
				[1.0] = "face_calm"
			},
			localization_strings = {
				[1.0] = "pbw_drank_drunk"
			}
		},
		pbw_gameplay_spots_ammo_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_spots_ammo_06",
				"pbw_gameplay_spots_ammo_07",
				"pbw_gameplay_spots_ammo_08",
				"pbw_gameplay_spots_ammo_09",
				"pbw_gameplay_spots_ammo_10",
				"pbw_gameplay_spots_ammo_11",
				"pbw_gameplay_spots_ammo_12",
				"pbw_gameplay_spots_ammo_13"
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
				"pbw_gameplay_spots_ammo_06",
				"pbw_gameplay_spots_ammo_07",
				"pbw_gameplay_spots_ammo_08",
				"pbw_gameplay_spots_ammo_09",
				"pbw_gameplay_spots_ammo_10",
				"pbw_gameplay_spots_ammo_11",
				"pbw_gameplay_spots_ammo_12",
				"pbw_gameplay_spots_ammo_13"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_self_heal_drunk = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 10,
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
			randomize_indexes = {}
		},
		pbw_gameplay_empire_soldier_being_helped_up_drunk = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_empire_soldier_being_helped_up_05",
				"pbw_gameplay_empire_soldier_being_helped_up_06",
				"pbw_gameplay_empire_soldier_being_helped_up_07",
				"pbw_gameplay_empire_soldier_being_helped_up_08",
				"pbw_gameplay_empire_soldier_being_helped_up_09",
				"pbw_gameplay_empire_soldier_being_helped_up_10",
				"pbw_gameplay_empire_soldier_being_helped_up_11",
				"pbw_gameplay_empire_soldier_being_helped_up_12"
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
				"pbw_gameplay_empire_soldier_being_helped_up_05",
				"pbw_gameplay_empire_soldier_being_helped_up_06",
				"pbw_gameplay_empire_soldier_being_helped_up_07",
				"pbw_gameplay_empire_soldier_being_helped_up_08",
				"pbw_gameplay_empire_soldier_being_helped_up_09",
				"pbw_gameplay_empire_soldier_being_helped_up_10",
				"pbw_gameplay_empire_soldier_being_helped_up_11",
				"pbw_gameplay_empire_soldier_being_helped_up_12"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_friendly_fire_empire_soldier_drunk = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_friendly_fire_empire_soldier_05",
				"pbw_gameplay_friendly_fire_empire_soldier_06",
				"pbw_gameplay_friendly_fire_empire_soldier_07",
				"pbw_gameplay_friendly_fire_empire_soldier_08",
				"pbw_gameplay_friendly_fire_empire_soldier_09"
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
				"pbw_gameplay_friendly_fire_empire_soldier_05",
				"pbw_gameplay_friendly_fire_empire_soldier_06",
				"pbw_gameplay_friendly_fire_empire_soldier_07",
				"pbw_gameplay_friendly_fire_empire_soldier_08",
				"pbw_gameplay_friendly_fire_empire_soldier_09"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hearing_a_chaos_spawn_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "enemy_alerts_high",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
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
			localization_strings = {
				"pbw_crawl_drunk_incoming_threat_01",
				"pbw_crawl_drunk_incoming_threat_02",
				"pbw_crawl_drunk_incoming_threat_03",
				"pbw_crawl_drunk_incoming_threat_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_helped_by_empire_soldier_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_helped_by_empire_soldier_05",
				"pbw_gameplay_helped_by_empire_soldier_06",
				"pbw_gameplay_helped_by_empire_soldier_07",
				"pbw_gameplay_healing_empire_soldier_09"
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
			localization_strings = {
				"pbw_gameplay_helped_by_empire_soldier_05",
				"pbw_gameplay_helped_by_empire_soldier_06",
				"pbw_gameplay_helped_by_empire_soldier_07",
				"pbw_gameplay_healing_empire_soldier_09"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_throwing_bomb_drunk = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_throwing_bomb_06",
				"pbw_gameplay_throwing_bomb_07",
				"pbw_gameplay_throwing_bomb_08",
				"pbw_gameplay_throwing_bomb_09"
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
			localization_strings = {
				"pbw_gameplay_throwing_bomb_06",
				"pbw_gameplay_throwing_bomb_07",
				"pbw_gameplay_throwing_bomb_08",
				"pbw_gameplay_throwing_bomb_09"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_dwarf_ranger_low_on_health_drunk = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "bright_wizard_game_play_crawl",
			category = "player_feedback",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_gameplay_dwarf_ranger_low_on_health_05",
				"pbw_gameplay_dwarf_ranger_low_on_health_06",
				"pbw_gameplay_dwarf_ranger_low_on_health_07"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_concerned",
				"face_concerned",
				"face_concerned"
			},
			localization_strings = {
				"pbw_gameplay_dwarf_ranger_low_on_health_05",
				"pbw_gameplay_dwarf_ranger_low_on_health_06",
				"pbw_gameplay_dwarf_ranger_low_on_health_07"
			},
			randomize_indexes = {}
		}
	})
end
