return function ()
	define_rule({
		response = "pes_gameplay_hanging_help_ping",
		name = "pes_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			}
		}
	})
	define_rule({
		response = "pes_gameplay_knocked_down_ping",
		name = "pes_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
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
				"user_context",
				"friends_distant",
				OP.GT,
				0
			}
		}
	})
	define_rule({
		response = "pes_gameplay_player_pounced_ping",
		name = "pes_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_witch_hunter_grabbed_ping",
		name = "pes_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pes_gameplay_bright_wizard_grabbed_ping",
		name = "pes_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pes_gameplay_dwarf_ranger_grabbed_ping",
		name = "pes_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pes_gameplay_wood_elf_grabbed_ping",
		name = "pes_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pes_gameplay_grabbed_ping",
		name = "pes_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_heard_witch_hunter_in_trouble_ping",
		name = "pes_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_heard_bright_wizard_in_trouble_ping",
		name = "pes_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_heard_wood_elf_in_trouble_ping",
		name = "pes_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_heard_dwarf_ranger_in_trouble_ping",
		name = "pes_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_spots_ammo_ping",
		name = "pes_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
		response = "pes_gameplay_spots_health_ping",
		name = "pes_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_healing_draught_ping",
		name = "pes_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_spots_potion_ping",
		name = "pes_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_spots_bomb_ping",
		name = "pes_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"empire_soldier"
			}
		}
	})
	define_rule({
		response = "pes_gameplay_seeing_a_stormvermin_ping",
		name = "pes_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_seeing_a_gutter_runner_ping",
		name = "pes_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_seeing_a_globadier_ping",
		name = "pes_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pes_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pes_gameplay_seeing_a_skaven_slaver_ping",
		name = "pes_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pes_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pes_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_hanging_help_ping",
		name = "pwh_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
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
				"witch_hunter"
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
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_knocked_down_ping",
		name = "pwh_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
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
				"witch_hunter"
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
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_player_pounced_ping",
		name = "pwh_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
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
				"witch_hunter"
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
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_empire_soldier_grabbed_ping",
		name = "pwh_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"witch_hunter"
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
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_bright_wizard_grabbed_ping",
		name = "pwh_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"witch_hunter"
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
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_dwarf_ranger_grabbed_ping",
		name = "pwh_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"witch_hunter"
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
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_wood_elf_grabbed_ping",
		name = "pwh_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"witch_hunter"
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
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_grabbed_ping",
		name = "pwh_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
				"witch_hunter"
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
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_heard_empire_soldier_in_trouble_ping",
		name = "pwh_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_heard_bright_wizard_in_trouble_ping",
		name = "pwh_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_heard_wood_elf_in_trouble_ping",
		name = "pwh_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_heard_dwarf_ranger_in_trouble_ping",
		name = "pwh_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_spots_ammo_ping",
		name = "pwh_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_spots_health_ping",
		name = "pwh_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_healing_draught_ping",
		name = "pwh_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_spots_potion_ping",
		name = "pwh_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_spots_bomb_ping",
		name = "pwh_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_seeing_a_stormvermin_ping",
		name = "pwh_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_seeing_a_gutter_runner_ping",
		name = "pwh_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_gutter_runner"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_seeing_a_globadier_ping",
		name = "pwh_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_poison_wind_globadier"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pwh_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_seeing_a_skaven_slaver_ping",
		name = "pwh_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pwh_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pwh_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_ratling_gunner"
			},
			{
				"query_context",
				"source_name",
				OP.EQ,
				"witch_hunter"
			},
			{
				"user_context",
				"player_profile",
				OP.EQ,
				"witch_hunter"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_hanging_help_ping",
		name = "pbw_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_knocked_down_ping",
		name = "pbw_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_player_pounced_ping",
		name = "pbw_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_empire_soldier_grabbed_ping",
		name = "pbw_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pbw_gameplay_witch_hunter_grabbed_ping",
		name = "pbw_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pbw_gameplay_dwarf_ranger_grabbed_ping",
		name = "pbw_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pbw_gameplay_wood_elf_grabbed_ping",
		name = "pbw_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pbw_gameplay_grabbed_ping",
		name = "pbw_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_heard_empire_soldier_in_trouble_ping",
		name = "pbw_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_heard_witch_hunter_in_trouble_ping",
		name = "pbw_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_heard_wood_elf_in_trouble_ping",
		name = "pbw_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_heard_dwarf_ranger_in_trouble_ping",
		name = "pbw_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_spots_ammo_ping",
		name = "pbw_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
		response = "pbw_gameplay_spots_health_ping",
		name = "pbw_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_healing_draught_ping",
		name = "pbw_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_spots_potion_ping",
		name = "pbw_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_spots_bomb_ping",
		name = "pbw_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"bright_wizard"
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_seeing_a_stormvermin_ping",
		name = "pbw_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_seeing_a_gutter_runner_ping",
		name = "pbw_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_seeing_a_globadier_ping",
		name = "pbw_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pbw_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pbw_gameplay_seeing_a_skaven_slaver_ping",
		name = "pbw_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pbw_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pbw_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_hanging_help_ping",
		name = "pdr_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_knocked_down_ping",
		name = "pdr_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_player_pounced_ping",
		name = "pdr_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_empire_soldier_grabbed_ping",
		name = "pdr_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pdr_gameplay_witch_hunter_grabbed_ping",
		name = "pdr_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pdr_gameplay_bright_wizard_grabbed_ping",
		name = "pdr_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pdr_gameplay_wood_elf_grabbed_ping",
		name = "pdr_gameplay_wood_elf_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pdr_gameplay_grabbed_ping",
		name = "pdr_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_heard_empire_soldier_in_trouble_ping",
		name = "pdr_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_heard_witch_hunter_in_trouble_ping",
		name = "pdr_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_heard_wood_elf_in_trouble_ping",
		name = "pdr_gameplay_heard_wood_elf_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_heard_bright_wizard_in_trouble_ping",
		name = "pdr_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_spots_ammo_ping",
		name = "pdr_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_spots_health_ping",
		name = "pdr_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_healing_draught_ping",
		name = "pdr_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_spots_potion_ping",
		name = "pdr_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_spots_bomb_ping",
		name = "pdr_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"dwarf_ranger"
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_seeing_a_stormvermin_ping",
		name = "pdr_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_seeing_a_gutter_runner_ping",
		name = "pdr_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_seeing_a_globadier_ping",
		name = "pdr_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pdr_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pdr_gameplay_seeing_a_skaven_slaver_ping",
		name = "pdr_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pdr_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pdr_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_hanging_help_ping",
		name = "pwe_gameplay_hanging_help_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"ledge_hanging"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_knocked_down_ping",
		name = "pwe_gameplay_knocked_down_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_player_pounced_ping",
		name = "pwe_gameplay_player_pounced_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"pounced_down"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_empire_soldier_grabbed_ping",
		name = "pwe_gameplay_empire_soldier_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pwe_gameplay_witch_hunter_grabbed_ping",
		name = "pwe_gameplay_witch_hunter_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pwe_gameplay_bright_wizard_grabbed_ping",
		name = "pwe_gameplay_bright_wizard_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pwe_gameplay_dwarf_ranger_grabbed_ping",
		name = "pwe_gameplay_dwarf_ranger_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
		response = "pwe_gameplay_grabbed_ping",
		name = "pwe_gameplay_grabbed_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"grabbed"
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_heard_empire_soldier_in_trouble_ping",
		name = "pwe_gameplay_heard_empire_soldier_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_heard_witch_hunter_in_trouble_ping",
		name = "pwe_gameplay_heard_witch_hunter_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_heard_dwarf_ranger_in_trouble_ping",
		name = "pwe_gameplay_heard_dwarf_ranger_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_heard_bright_wizard_in_trouble_ping",
		name = "pwe_gameplay_heard_bright_wizard_in_trouble_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"knocked_down"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_spots_ammo_ping",
		name = "pwe_gameplay_spots_ammo_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"item_tag",
				OP.EQ,
				"ammo"
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
		response = "pwe_gameplay_spots_health_ping",
		name = "pwe_gameplay_spots_health_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_healing_draught_ping",
		name = "pwe_gameplay_healing_draught_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_spots_potion_ping",
		name = "pwe_gameplay_spots_potion_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_spots_bomb_ping",
		name = "pwe_gameplay_spots_bomb_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_item"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
				"user_context",
				"player_profile",
				OP.EQ,
				"wood_elf"
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_seeing_a_stormvermin_ping",
		name = "pwe_gameplay_seeing_a_stormvermin_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_seeing_a_gutter_runner_ping",
		name = "pwe_gameplay_seeing_a_gutter_runner_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_seeing_a_globadier_ping",
		name = "pwe_gameplay_seeing_a_globadier_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_seeing_a_skaven_rat_ogre_ping",
		name = "pwe_gameplay_seeing_a_skaven_rat_ogre_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
				OP.EQ,
				"skaven_rat_ogre"
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
		response = "pwe_gameplay_seeing_a_skaven_slaver_ping",
		name = "pwe_gameplay_seeing_a_skaven_slaver_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
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
			}
		}
	})
	define_rule({
		response = "pwe_gameplay_seeing_a_skaven_ratling_gun_ping",
		name = "pwe_gameplay_seeing_a_skaven_ratling_gun_ping",
		criterias = {
			{
				"query_context",
				"concept",
				OP.EQ,
				"seen_enemy"
			},
			{
				"query_context",
				"is_ping",
				OP.EQ,
				1
			},
			{
				"query_context",
				"enemy_tag",
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
			}
		}
	})
	add_dialogues({
		pbw_gameplay_spots_health_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_spots_health_01",
				"pbw_gameplay_spots_health_02",
				"pbw_gameplay_spots_health_03",
				"pbw_gameplay_spots_health_04",
				"pbw_gameplay_spots_health_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_health_01",
				"pbw_gameplay_spots_health_02",
				"pbw_gameplay_spots_health_03",
				"pbw_gameplay_spots_health_04",
				"pbw_gameplay_spots_health_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_dwarf_ranger_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_dwarf_ranger_grabbed_01",
				"pbw_gameplay_dwarf_ranger_grabbed_02",
				"pbw_gameplay_dwarf_ranger_grabbed_03",
				"pbw_gameplay_dwarf_ranger_grabbed_04",
				"pbw_gameplay_dwarf_ranger_grabbed_05",
				"pbw_gameplay_dwarf_ranger_grabbed_06"
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
				"pbw_gameplay_dwarf_ranger_grabbed_01",
				"pbw_gameplay_dwarf_ranger_grabbed_02",
				"pbw_gameplay_dwarf_ranger_grabbed_03",
				"pbw_gameplay_dwarf_ranger_grabbed_04",
				"pbw_gameplay_dwarf_ranger_grabbed_05",
				"pbw_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_empire_soldier_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_empire_soldier_grabbed_01",
				"pwh_gameplay_empire_soldier_grabbed_02",
				"pwh_gameplay_empire_soldier_grabbed_03",
				"pwh_gameplay_empire_soldier_grabbed_04",
				"pwh_gameplay_empire_soldier_grabbed_05",
				"pwh_gameplay_empire_soldier_grabbed_06"
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
				"pwh_gameplay_empire_soldier_grabbed_01",
				"pwh_gameplay_empire_soldier_grabbed_02",
				"pwh_gameplay_empire_soldier_grabbed_03",
				"pwh_gameplay_empire_soldier_grabbed_04",
				"pwh_gameplay_empire_soldier_grabbed_05",
				"pwh_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_hanging_help_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
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
			localization_strings = {
				"pbw_gameplay_hanging_help_01",
				"pbw_gameplay_hanging_help_02",
				"pbw_gameplay_hanging_help_03",
				"pbw_gameplay_hanging_help_04",
				"pbw_gameplay_hanging_help_05",
				"pbw_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_witch_hunter_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_02",
				"pes_gameplay_heard_witch_hunter_in_trouble_03",
				"pes_gameplay_heard_witch_hunter_in_trouble_04"
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
				"pes_gameplay_heard_witch_hunter_in_trouble_01",
				"pes_gameplay_heard_witch_hunter_in_trouble_02",
				"pes_gameplay_heard_witch_hunter_in_trouble_03",
				"pes_gameplay_heard_witch_hunter_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_heard_witch_hunter_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_heard_witch_hunter_in_trouble_01",
				"pdr_gameplay_heard_witch_hunter_in_trouble_02",
				"pdr_gameplay_heard_witch_hunter_in_trouble_03",
				"pdr_gameplay_heard_witch_hunter_in_trouble_04",
				"pdr_gameplay_heard_witch_hunter_in_trouble_05",
				"pdr_gameplay_heard_witch_hunter_in_trouble_06",
				"pdr_gameplay_heard_witch_hunter_in_trouble_07",
				"pdr_gameplay_heard_witch_hunter_in_trouble_08"
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
				"pdr_gameplay_heard_witch_hunter_in_trouble_01",
				"pdr_gameplay_heard_witch_hunter_in_trouble_02",
				"pdr_gameplay_heard_witch_hunter_in_trouble_03",
				"pdr_gameplay_heard_witch_hunter_in_trouble_04",
				"pdr_gameplay_heard_witch_hunter_in_trouble_05",
				"pdr_gameplay_heard_witch_hunter_in_trouble_06",
				"pdr_gameplay_heard_witch_hunter_in_trouble_07",
				"pdr_gameplay_heard_witch_hunter_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_player_pounced_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_player_pounced_05",
				"pbw_gameplay_player_pounced_07",
				"pbw_gameplay_player_pounced_08",
				"pbw_gameplay_player_pounced_09",
				"pbw_gameplay_player_pounced_10",
				"pbw_gameplay_player_pounced_11",
				"pbw_gameplay_player_pounced_12",
				"pbw_gameplay_player_pounced_13"
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
			localization_strings = {
				"pbw_gameplay_player_pounced_05",
				"pbw_gameplay_player_pounced_07",
				"pbw_gameplay_player_pounced_08",
				"pbw_gameplay_player_pounced_09",
				"pbw_gameplay_player_pounced_10",
				"pbw_gameplay_player_pounced_11",
				"pbw_gameplay_player_pounced_12",
				"pbw_gameplay_player_pounced_13"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_stormvermin_01",
				"pwh_gameplay_seeing_a_stormvermin_02",
				"pwh_gameplay_seeing_a_stormvermin_03",
				"pwh_gameplay_seeing_a_stormvermin_04",
				"pwh_gameplay_seeing_a_stormvermin_05",
				"pwh_gameplay_seeing_a_stormvermin_06",
				"pwh_gameplay_seeing_a_stormvermin_07",
				"pwh_gameplay_seeing_a_stormvermin_08"
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
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pwh_gameplay_seeing_a_stormvermin_01",
				"pwh_gameplay_seeing_a_stormvermin_02",
				"pwh_gameplay_seeing_a_stormvermin_03",
				"pwh_gameplay_seeing_a_stormvermin_04",
				"pwh_gameplay_seeing_a_stormvermin_05",
				"pwh_gameplay_seeing_a_stormvermin_06",
				"pwh_gameplay_seeing_a_stormvermin_07",
				"pwh_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_heard_witch_hunter_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_heard_witch_hunter_in_trouble_04",
				"pbw_gameplay_heard_witch_hunter_in_trouble_05",
				"pbw_gameplay_heard_witch_hunter_in_trouble_06",
				"pbw_gameplay_heard_witch_hunter_in_trouble_07"
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
				"pbw_gameplay_heard_witch_hunter_in_trouble_04",
				"pbw_gameplay_heard_witch_hunter_in_trouble_05",
				"pbw_gameplay_heard_witch_hunter_in_trouble_06",
				"pbw_gameplay_heard_witch_hunter_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_bomb_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_spots_bomb_01",
				"pwh_gameplay_spots_bomb_02",
				"pwh_gameplay_spots_bomb_03",
				"pwh_gameplay_spots_bomb_04",
				"pwh_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_bomb_01",
				"pwh_gameplay_spots_bomb_02",
				"pwh_gameplay_spots_bomb_03",
				"pwh_gameplay_spots_bomb_04",
				"pwh_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_empire_soldier_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_empire_soldier_grabbed_01",
				"pdr_gameplay_empire_soldier_grabbed_02",
				"pdr_gameplay_empire_soldier_grabbed_03",
				"pdr_gameplay_empire_soldier_grabbed_04",
				"pdr_gameplay_empire_soldier_grabbed_05",
				"pdr_gameplay_empire_soldier_grabbed_06"
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
				"pdr_gameplay_empire_soldier_grabbed_01",
				"pdr_gameplay_empire_soldier_grabbed_02",
				"pdr_gameplay_empire_soldier_grabbed_03",
				"pdr_gameplay_empire_soldier_grabbed_04",
				"pdr_gameplay_empire_soldier_grabbed_05",
				"pdr_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_empire_soldier_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_empire_soldier_grabbed_01",
				"pbw_gameplay_empire_soldier_grabbed_02",
				"pbw_gameplay_empire_soldier_grabbed_03",
				"pbw_gameplay_empire_soldier_grabbed_04",
				"pbw_gameplay_empire_soldier_grabbed_05",
				"pbw_gameplay_empire_soldier_grabbed_06"
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
				"pbw_gameplay_empire_soldier_grabbed_01",
				"pbw_gameplay_empire_soldier_grabbed_02",
				"pbw_gameplay_empire_soldier_grabbed_03",
				"pbw_gameplay_empire_soldier_grabbed_04",
				"pbw_gameplay_empire_soldier_grabbed_05",
				"pbw_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_witch_hunter_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_witch_hunter_grabbed_01",
				"pbw_gameplay_witch_hunter_grabbed_02",
				"pbw_gameplay_witch_hunter_grabbed_03",
				"pbw_gameplay_witch_hunter_grabbed_04",
				"pbw_gameplay_witch_hunter_grabbed_05",
				"pbw_gameplay_witch_hunter_grabbed_06"
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
				"pbw_gameplay_witch_hunter_grabbed_01",
				"pbw_gameplay_witch_hunter_grabbed_02",
				"pbw_gameplay_witch_hunter_grabbed_03",
				"pbw_gameplay_witch_hunter_grabbed_04",
				"pbw_gameplay_witch_hunter_grabbed_05",
				"pbw_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_witch_hunter_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_witch_hunter_grabbed_01",
				"pes_gameplay_witch_hunter_grabbed_02",
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_04",
				"pes_gameplay_witch_hunter_grabbed_05",
				"pes_gameplay_witch_hunter_grabbed_06"
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
				"pes_gameplay_witch_hunter_grabbed_01",
				"pes_gameplay_witch_hunter_grabbed_02",
				"pes_gameplay_witch_hunter_grabbed_03",
				"pes_gameplay_witch_hunter_grabbed_04",
				"pes_gameplay_witch_hunter_grabbed_05",
				"pes_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_witch_hunter_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_witch_hunter_grabbed_01",
				"pdr_gameplay_witch_hunter_grabbed_02",
				"pdr_gameplay_witch_hunter_grabbed_03",
				"pdr_gameplay_witch_hunter_grabbed_04",
				"pdr_gameplay_witch_hunter_grabbed_05",
				"pdr_gameplay_witch_hunter_grabbed_06"
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
				"pdr_gameplay_witch_hunter_grabbed_01",
				"pdr_gameplay_witch_hunter_grabbed_02",
				"pdr_gameplay_witch_hunter_grabbed_03",
				"pdr_gameplay_witch_hunter_grabbed_04",
				"pdr_gameplay_witch_hunter_grabbed_05",
				"pdr_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_02",
				"pwh_gameplay_seeing_a_gutter_runner_03",
				"pwh_gameplay_seeing_a_gutter_runner_04",
				"pwh_gameplay_seeing_a_gutter_runner_05",
				"pwh_gameplay_seeing_a_gutter_runner_06"
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
			localization_strings = {
				"pwh_gameplay_seeing_a_gutter_runner_01",
				"pwh_gameplay_seeing_a_gutter_runner_02",
				"pwh_gameplay_seeing_a_gutter_runner_03",
				"pwh_gameplay_seeing_a_gutter_runner_04",
				"pwh_gameplay_seeing_a_gutter_runner_05",
				"pwh_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_stormvermin_01",
				"pes_gameplay_seeing_a_stormvermin_02",
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_04",
				"pes_gameplay_seeing_a_stormvermin_05",
				"pes_gameplay_seeing_a_stormvermin_06",
				"pes_gameplay_seeing_a_stormvermin_07",
				"pes_gameplay_seeing_a_stormvermin_08"
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
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pes_gameplay_seeing_a_stormvermin_01",
				"pes_gameplay_seeing_a_stormvermin_02",
				"pes_gameplay_seeing_a_stormvermin_03",
				"pes_gameplay_seeing_a_stormvermin_04",
				"pes_gameplay_seeing_a_stormvermin_05",
				"pes_gameplay_seeing_a_stormvermin_06",
				"pes_gameplay_seeing_a_stormvermin_07",
				"pes_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_heard_witch_hunter_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_witch_hunter_in_trouble_01",
				"pwe_gameplay_heard_witch_hunter_in_trouble_02",
				"pwe_gameplay_heard_witch_hunter_in_trouble_03",
				"pwe_gameplay_heard_witch_hunter_in_trouble_04"
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
				"pwe_gameplay_heard_witch_hunter_in_trouble_01",
				"pwe_gameplay_heard_witch_hunter_in_trouble_02",
				"pwe_gameplay_heard_witch_hunter_in_trouble_03",
				"pwe_gameplay_heard_witch_hunter_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_spots_potion_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_spots_potion_01",
				"pbw_gameplay_spots_potion_02",
				"pbw_gameplay_spots_potion_03",
				"pbw_gameplay_spots_potion_04",
				"pbw_gameplay_spots_potion_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_potion_01",
				"pbw_gameplay_spots_potion_02",
				"pbw_gameplay_spots_potion_03",
				"pbw_gameplay_spots_potion_04",
				"pbw_gameplay_spots_potion_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_hanging_help_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
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
			localization_strings = {
				"pwe_gameplay_hanging_help_01",
				"pwe_gameplay_hanging_help_02",
				"pwe_gameplay_hanging_help_03",
				"pwe_gameplay_hanging_help_04",
				"pwe_gameplay_hanging_help_05",
				"pwe_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_wood_elf_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_03",
				"pes_gameplay_wood_elf_grabbed_05",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_06"
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
				"pes_gameplay_wood_elf_grabbed_01",
				"pes_gameplay_wood_elf_grabbed_03",
				"pes_gameplay_wood_elf_grabbed_05",
				"pes_gameplay_wood_elf_grabbed_02",
				"pes_gameplay_wood_elf_grabbed_04",
				"pes_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_seeing_a_globadier_01",
				"pbw_gameplay_seeing_a_globadier_02",
				"pbw_gameplay_seeing_a_globadier_03",
				"pbw_gameplay_seeing_a_globadier_06",
				"pbw_gameplay_seeing_a_globadier_07",
				"pbw_gameplay_seeing_a_globadier_08"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_globadier_01",
				"pbw_gameplay_seeing_a_globadier_02",
				"pbw_gameplay_seeing_a_globadier_03",
				"pbw_gameplay_seeing_a_globadier_06",
				"pbw_gameplay_seeing_a_globadier_07",
				"pbw_gameplay_seeing_a_globadier_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_seeing_a_globadier_01",
				"pes_gameplay_seeing_a_globadier_04",
				"pes_gameplay_seeing_a_globadier_07",
				"pes_gameplay_seeing_a_globadier_08",
				"pes_gameplay_seeing_a_globadier_09",
				"pes_gameplay_seeing_a_globadier_10",
				"pes_gameplay_seeing_a_globadier_11"
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
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt",
				"face_contempt"
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
			randomize_indexes = {}
		},
		pdr_gameplay_wood_elf_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_wood_elf_grabbed_01",
				"pdr_gameplay_wood_elf_grabbed_03",
				"pdr_gameplay_wood_elf_grabbed_05",
				"pdr_gameplay_wood_elf_grabbed_02",
				"pdr_gameplay_wood_elf_grabbed_04",
				"pdr_gameplay_wood_elf_grabbed_06"
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
				"pdr_gameplay_wood_elf_grabbed_01",
				"pdr_gameplay_wood_elf_grabbed_03",
				"pdr_gameplay_wood_elf_grabbed_05",
				"pdr_gameplay_wood_elf_grabbed_02",
				"pdr_gameplay_wood_elf_grabbed_04",
				"pdr_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_ammo_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_03",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_04",
				"pwe_gameplay_spots_ammo_05"
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
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_01",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_03",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_02",
				"pwe_gameplay_spots_ammo_04",
				"pwe_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_wood_elf_grabbed_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_wood_elf_grabbed_03",
				"pbw_gameplay_wood_elf_grabbed_06",
				"pbw_gameplay_wood_elf_grabbed_07",
				"pbw_gameplay_wood_elf_grabbed_08",
				"pbw_gameplay_wood_elf_grabbed_09",
				"pbw_gameplay_wood_elf_grabbed_10",
				"pbw_gameplay_wood_elf_grabbed_11",
				"pbw_gameplay_wood_elf_grabbed_12"
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
				"pbw_gameplay_wood_elf_grabbed_03",
				"pbw_gameplay_wood_elf_grabbed_06",
				"pbw_gameplay_wood_elf_grabbed_07",
				"pbw_gameplay_wood_elf_grabbed_08",
				"pbw_gameplay_wood_elf_grabbed_09",
				"pbw_gameplay_wood_elf_grabbed_10",
				"pbw_gameplay_wood_elf_grabbed_11",
				"pbw_gameplay_wood_elf_grabbed_12"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_bright_wizard_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_bright_wizard_in_trouble_01",
				"pwh_gameplay_heard_bright_wizard_in_trouble_02",
				"pwh_gameplay_heard_bright_wizard_in_trouble_03",
				"pwh_gameplay_heard_bright_wizard_in_trouble_04"
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
				"pwh_gameplay_heard_bright_wizard_in_trouble_01",
				"pwh_gameplay_heard_bright_wizard_in_trouble_02",
				"pwh_gameplay_heard_bright_wizard_in_trouble_03",
				"pwh_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_grabbed_ping = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 3,
			sound_events = {
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_player_pounced_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_player_pounced_01",
				"pdr_gameplay_player_pounced_02",
				"pdr_gameplay_player_pounced_03",
				"pdr_gameplay_player_pounced_04",
				"pdr_gameplay_player_pounced_05",
				"pdr_gameplay_player_pounced_06"
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
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pdr_gameplay_player_pounced_01",
				"pdr_gameplay_player_pounced_02",
				"pdr_gameplay_player_pounced_03",
				"pdr_gameplay_player_pounced_04",
				"pdr_gameplay_player_pounced_05",
				"pdr_gameplay_player_pounced_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"pwe_gameplay_seeing_a_skaven_slaver_01",
				"pwe_gameplay_seeing_a_skaven_slaver_02",
				"pwe_gameplay_seeing_a_skaven_slaver_07",
				"pwe_gameplay_seeing_a_skaven_slaver_03",
				"pwe_gameplay_seeing_a_skaven_slaver_04",
				"pwe_gameplay_seeing_a_skaven_slaver_05",
				"pwe_gameplay_seeing_a_skaven_slaver_06",
				"pwe_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_knocked_down_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_knocked_down_02",
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
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
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_knocked_down_02",
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_04",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_05"
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
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwe_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 5,
			sound_events = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_03",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_05",
				"pwe_gameplay_seeing_a_globadier_06"
			},
			dialogue_animations = {
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
				"face_contempt"
			},
			localization_strings = {
				"pwe_gameplay_seeing_a_globadier_01",
				"pwe_gameplay_seeing_a_globadier_03",
				"pwe_gameplay_seeing_a_globadier_02",
				"pwe_gameplay_seeing_a_globadier_05",
				"pwe_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_spots_potion_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_spots_potion_01",
				"pdr_gameplay_spots_potion_02",
				"pdr_gameplay_spots_potion_03",
				"pdr_gameplay_spots_potion_04",
				"pdr_gameplay_spots_potion_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_potion_01",
				"pdr_gameplay_spots_potion_02",
				"pdr_gameplay_spots_potion_03",
				"pdr_gameplay_spots_potion_04",
				"pdr_gameplay_spots_potion_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_02",
				"pwe_gameplay_seeing_a_gutter_runner_03",
				"pwe_gameplay_seeing_a_gutter_runner_04",
				"pwe_gameplay_seeing_a_gutter_runner_05",
				"pwe_gameplay_seeing_a_gutter_runner_06"
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
			localization_strings = {
				"pwe_gameplay_seeing_a_gutter_runner_01",
				"pwe_gameplay_seeing_a_gutter_runner_02",
				"pwe_gameplay_seeing_a_gutter_runner_03",
				"pwe_gameplay_seeing_a_gutter_runner_04",
				"pwe_gameplay_seeing_a_gutter_runner_05",
				"pwe_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
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
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
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
			randomize_indexes = {}
		},
		pwh_gameplay_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
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
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_potion_ping = {
			sound_events_n = 11,
			randomize_indexes_n = 0,
			face_animations_n = 11,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 11,
			sound_events = {
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_02",
				"pwe_gameplay_spots_potion_03",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_05"
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
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_01",
				"pwe_gameplay_spots_potion_02",
				"pwe_gameplay_spots_potion_03",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_04",
				"pwe_gameplay_spots_potion_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_bright_wizard_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_bright_wizard_grabbed_01",
				"pes_gameplay_bright_wizard_grabbed_02",
				"pes_gameplay_bright_wizard_grabbed_03",
				"pes_gameplay_bright_wizard_grabbed_04",
				"pes_gameplay_bright_wizard_grabbed_05",
				"pes_gameplay_bright_wizard_grabbed_06"
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
				"pes_gameplay_bright_wizard_grabbed_01",
				"pes_gameplay_bright_wizard_grabbed_02",
				"pes_gameplay_bright_wizard_grabbed_03",
				"pes_gameplay_bright_wizard_grabbed_04",
				"pes_gameplay_bright_wizard_grabbed_05",
				"pes_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_health_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_02",
				"pwe_gameplay_spots_health_03",
				"pwe_gameplay_spots_health_04",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_01"
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
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_02",
				"pwe_gameplay_spots_health_03",
				"pwe_gameplay_spots_health_04",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_05",
				"pwe_gameplay_spots_health_01",
				"pwe_gameplay_spots_health_01"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_bright_wizard_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_bright_wizard_grabbed_01",
				"pwe_gameplay_bright_wizard_grabbed_02",
				"pwe_gameplay_bright_wizard_grabbed_03",
				"pwe_gameplay_bright_wizard_grabbed_04",
				"pwe_gameplay_bright_wizard_grabbed_05",
				"pwe_gameplay_bright_wizard_grabbed_06"
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
				"pwe_gameplay_bright_wizard_grabbed_01",
				"pwe_gameplay_bright_wizard_grabbed_02",
				"pwe_gameplay_bright_wizard_grabbed_03",
				"pwe_gameplay_bright_wizard_grabbed_04",
				"pwe_gameplay_bright_wizard_grabbed_05",
				"pwe_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_wood_elf_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_wood_elf_in_trouble_01",
				"pwh_gameplay_heard_wood_elf_in_trouble_02",
				"pwh_gameplay_heard_wood_elf_in_trouble_03",
				"pwh_gameplay_heard_wood_elf_in_trouble_04"
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
			localization_strings = {
				"pwh_gameplay_heard_wood_elf_in_trouble_01",
				"pwh_gameplay_heard_wood_elf_in_trouble_02",
				"pwh_gameplay_heard_wood_elf_in_trouble_03",
				"pwh_gameplay_heard_wood_elf_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_heard_bright_wizard_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_bright_wizard_in_trouble_01",
				"pwe_gameplay_heard_bright_wizard_in_trouble_02",
				"pwe_gameplay_heard_bright_wizard_in_trouble_03",
				"pwe_gameplay_heard_bright_wizard_in_trouble_04"
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
				"pwe_gameplay_heard_bright_wizard_in_trouble_01",
				"pwe_gameplay_heard_bright_wizard_in_trouble_02",
				"pwe_gameplay_heard_bright_wizard_in_trouble_03",
				"pwe_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_bright_wizard_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_bright_wizard_grabbed_01",
				"pwh_gameplay_bright_wizard_grabbed_02",
				"pwh_gameplay_bright_wizard_grabbed_03",
				"pwh_gameplay_bright_wizard_grabbed_04",
				"pwh_gameplay_bright_wizard_grabbed_05",
				"pwh_gameplay_bright_wizard_grabbed_06"
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
				"pwh_gameplay_bright_wizard_grabbed_01",
				"pwh_gameplay_bright_wizard_grabbed_02",
				"pwh_gameplay_bright_wizard_grabbed_03",
				"pwh_gameplay_bright_wizard_grabbed_04",
				"pwh_gameplay_bright_wizard_grabbed_05",
				"pwh_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_08",
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
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_07",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_08",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_10",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_11",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_12",
				"pwe_gameplay_heard_dwarf_ranger_in_trouble_13"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_dwarf_ranger_grabbed_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_dwarf_ranger_grabbed_07",
				"pwh_gameplay_dwarf_ranger_grabbed_08",
				"pwh_gameplay_dwarf_ranger_grabbed_09",
				"pwh_gameplay_dwarf_ranger_grabbed_10",
				"pwh_gameplay_dwarf_ranger_grabbed_11",
				"pwh_gameplay_dwarf_ranger_grabbed_12",
				"pwh_gameplay_dwarf_ranger_grabbed_13",
				"pwh_gameplay_dwarf_ranger_grabbed_14"
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
				"pwh_gameplay_dwarf_ranger_grabbed_07",
				"pwh_gameplay_dwarf_ranger_grabbed_08",
				"pwh_gameplay_dwarf_ranger_grabbed_09",
				"pwh_gameplay_dwarf_ranger_grabbed_10",
				"pwh_gameplay_dwarf_ranger_grabbed_11",
				"pwh_gameplay_dwarf_ranger_grabbed_12",
				"pwh_gameplay_dwarf_ranger_grabbed_13",
				"pwh_gameplay_dwarf_ranger_grabbed_14"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_wood_elf_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_wood_elf_in_trouble_01",
				"pes_gameplay_heard_wood_elf_in_trouble_02",
				"pes_gameplay_heard_wood_elf_in_trouble_03",
				"pes_gameplay_heard_wood_elf_in_trouble_04"
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
			localization_strings = {
				"pes_gameplay_heard_wood_elf_in_trouble_01",
				"pes_gameplay_heard_wood_elf_in_trouble_02",
				"pes_gameplay_heard_wood_elf_in_trouble_03",
				"pes_gameplay_heard_wood_elf_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_heard_wood_elf_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_heard_wood_elf_in_trouble_01",
				"pdr_gameplay_heard_wood_elf_in_trouble_02",
				"pdr_gameplay_heard_wood_elf_in_trouble_03",
				"pdr_gameplay_heard_wood_elf_in_trouble_04",
				"pdr_gameplay_heard_wood_elf_in_trouble_05",
				"pdr_gameplay_heard_wood_elf_in_trouble_06",
				"pdr_gameplay_heard_wood_elf_in_trouble_07",
				"pdr_gameplay_heard_wood_elf_in_trouble_08"
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
			localization_strings = {
				"pdr_gameplay_heard_wood_elf_in_trouble_01",
				"pdr_gameplay_heard_wood_elf_in_trouble_02",
				"pdr_gameplay_heard_wood_elf_in_trouble_03",
				"pdr_gameplay_heard_wood_elf_in_trouble_04",
				"pdr_gameplay_heard_wood_elf_in_trouble_05",
				"pdr_gameplay_heard_wood_elf_in_trouble_06",
				"pdr_gameplay_heard_wood_elf_in_trouble_07",
				"pdr_gameplay_heard_wood_elf_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_seeing_a_globadier_01",
				"pdr_gameplay_seeing_a_globadier_03",
				"pdr_gameplay_seeing_a_globadier_04",
				"pdr_gameplay_seeing_a_globadier_02",
				"pdr_gameplay_seeing_a_globadier_05",
				"pdr_gameplay_seeing_a_globadier_06"
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
			localization_strings = {
				"pdr_gameplay_seeing_a_globadier_01",
				"pdr_gameplay_seeing_a_globadier_03",
				"pdr_gameplay_seeing_a_globadier_04",
				"pdr_gameplay_seeing_a_globadier_02",
				"pdr_gameplay_seeing_a_globadier_05",
				"pdr_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_wood_elf_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_wood_elf_grabbed_01",
				"pwh_gameplay_wood_elf_grabbed_03",
				"pwh_gameplay_wood_elf_grabbed_05",
				"pwh_gameplay_wood_elf_grabbed_02",
				"pwh_gameplay_wood_elf_grabbed_04",
				"pwh_gameplay_wood_elf_grabbed_06"
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
				"pwh_gameplay_wood_elf_grabbed_01",
				"pwh_gameplay_wood_elf_grabbed_03",
				"pwh_gameplay_wood_elf_grabbed_05",
				"pwh_gameplay_wood_elf_grabbed_02",
				"pwh_gameplay_wood_elf_grabbed_04",
				"pwh_gameplay_wood_elf_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_dwarf_ranger_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_dwarf_ranger_grabbed_01",
				"pwe_gameplay_dwarf_ranger_grabbed_02",
				"pwe_gameplay_dwarf_ranger_grabbed_03",
				"pwe_gameplay_dwarf_ranger_grabbed_04",
				"pwe_gameplay_dwarf_ranger_grabbed_05",
				"pwe_gameplay_dwarf_ranger_grabbed_06"
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
				"pwe_gameplay_dwarf_ranger_grabbed_01",
				"pwe_gameplay_dwarf_ranger_grabbed_02",
				"pwe_gameplay_dwarf_ranger_grabbed_03",
				"pwe_gameplay_dwarf_ranger_grabbed_04",
				"pwe_gameplay_dwarf_ranger_grabbed_05",
				"pwe_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_spots_bomb_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 9,
			sound_events = {
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_02",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_04",
				"pwe_gameplay_spots_bomb_05"
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
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_01",
				"pwe_gameplay_spots_bomb_02",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_03",
				"pwe_gameplay_spots_bomb_04",
				"pwe_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_knocked_down_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_02",
				"pbw_gameplay_knocked_down_03",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_05",
				"pbw_gameplay_knocked_down_06"
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
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_02",
				"pbw_gameplay_knocked_down_03",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_05",
				"pbw_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_07"
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
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_05",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_06",
				"pbw_gameplay_heard_dwarf_ranger_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_heard_empire_soldier_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_heard_empire_soldier_in_trouble_03",
				"pbw_gameplay_heard_empire_soldier_in_trouble_05",
				"pbw_gameplay_heard_empire_soldier_in_trouble_06",
				"pbw_gameplay_heard_empire_soldier_in_trouble_07"
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
				"pbw_gameplay_heard_empire_soldier_in_trouble_03",
				"pbw_gameplay_heard_empire_soldier_in_trouble_05",
				"pbw_gameplay_heard_empire_soldier_in_trouble_06",
				"pbw_gameplay_heard_empire_soldier_in_trouble_07"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_heard_empire_soldier_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_heard_empire_soldier_in_trouble_01",
				"pdr_gameplay_heard_empire_soldier_in_trouble_02",
				"pdr_gameplay_heard_empire_soldier_in_trouble_03",
				"pdr_gameplay_heard_empire_soldier_in_trouble_04",
				"pdr_gameplay_heard_empire_soldier_in_trouble_05",
				"pdr_gameplay_heard_empire_soldier_in_trouble_06",
				"pdr_gameplay_heard_empire_soldier_in_trouble_07",
				"pdr_gameplay_heard_empire_soldier_in_trouble_08"
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
				"pdr_gameplay_heard_empire_soldier_in_trouble_01",
				"pdr_gameplay_heard_empire_soldier_in_trouble_02",
				"pdr_gameplay_heard_empire_soldier_in_trouble_03",
				"pdr_gameplay_heard_empire_soldier_in_trouble_04",
				"pdr_gameplay_heard_empire_soldier_in_trouble_05",
				"pdr_gameplay_heard_empire_soldier_in_trouble_06",
				"pdr_gameplay_heard_empire_soldier_in_trouble_07",
				"pdr_gameplay_heard_empire_soldier_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_hanging_help_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
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
			localization_strings = {
				"pwh_gameplay_hanging_help_01",
				"pwh_gameplay_hanging_help_02",
				"pwh_gameplay_hanging_help_03",
				"pwh_gameplay_hanging_help_04",
				"pwh_gameplay_hanging_help_05",
				"pwh_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04"
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
				"pes_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pes_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_empire_soldier_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_empire_soldier_grabbed_01",
				"pwe_gameplay_empire_soldier_grabbed_02",
				"pwe_gameplay_empire_soldier_grabbed_03",
				"pwe_gameplay_empire_soldier_grabbed_04",
				"pwe_gameplay_empire_soldier_grabbed_05",
				"pwe_gameplay_empire_soldier_grabbed_06"
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
				"pwe_gameplay_empire_soldier_grabbed_01",
				"pwe_gameplay_empire_soldier_grabbed_02",
				"pwe_gameplay_empire_soldier_grabbed_03",
				"pwe_gameplay_empire_soldier_grabbed_04",
				"pwe_gameplay_empire_soldier_grabbed_05",
				"pwe_gameplay_empire_soldier_grabbed_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_heard_bright_wizard_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_03",
				"pes_gameplay_heard_bright_wizard_in_trouble_04"
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
				"pes_gameplay_heard_bright_wizard_in_trouble_01",
				"pes_gameplay_heard_bright_wizard_in_trouble_02",
				"pes_gameplay_heard_bright_wizard_in_trouble_03",
				"pes_gameplay_heard_bright_wizard_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_slaver_01",
				"pbw_gameplay_seeing_a_skaven_slaver_02",
				"pbw_gameplay_seeing_a_skaven_slaver_07",
				"pbw_gameplay_seeing_a_skaven_slaver_03",
				"pbw_gameplay_seeing_a_skaven_slaver_04",
				"pbw_gameplay_seeing_a_skaven_slaver_05",
				"pbw_gameplay_seeing_a_skaven_slaver_06",
				"pbw_gameplay_seeing_a_skaven_slaver_08"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_slaver_01",
				"pbw_gameplay_seeing_a_skaven_slaver_02",
				"pbw_gameplay_seeing_a_skaven_slaver_07",
				"pbw_gameplay_seeing_a_skaven_slaver_03",
				"pbw_gameplay_seeing_a_skaven_slaver_04",
				"pbw_gameplay_seeing_a_skaven_slaver_05",
				"pbw_gameplay_seeing_a_skaven_slaver_06",
				"pbw_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_player_pounced_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
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
		pwh_gameplay_knocked_down_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
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
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwh_gameplay_knocked_down_01",
				"pwh_gameplay_knocked_down_02",
				"pwh_gameplay_knocked_down_03",
				"pwh_gameplay_knocked_down_04",
				"pwh_gameplay_knocked_down_05",
				"pwh_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_knocked_down_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_knocked_down_01",
				"pwe_gameplay_knocked_down_02",
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05",
				"pwe_gameplay_knocked_down_06"
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
				"face_fear",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pwe_gameplay_knocked_down_01",
				"pwe_gameplay_knocked_down_02",
				"pwe_gameplay_knocked_down_03",
				"pwe_gameplay_knocked_down_04",
				"pwe_gameplay_knocked_down_05",
				"pwe_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_heard_wood_elf_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pbw_gameplay_heard_wood_elf_in_trouble_01",
				"pbw_gameplay_heard_wood_elf_in_trouble_03",
				"pbw_gameplay_heard_wood_elf_in_trouble_05",
				"pbw_gameplay_heard_wood_elf_in_trouble_06"
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
			localization_strings = {
				"pbw_gameplay_heard_wood_elf_in_trouble_01",
				"pbw_gameplay_heard_wood_elf_in_trouble_03",
				"pbw_gameplay_heard_wood_elf_in_trouble_05",
				"pbw_gameplay_heard_wood_elf_in_trouble_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_07",
				"pes_gameplay_seeing_a_skaven_slaver_03",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_05",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_skaven_slaver_08"
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
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_slaver_01",
				"pes_gameplay_seeing_a_skaven_slaver_02",
				"pes_gameplay_seeing_a_skaven_slaver_07",
				"pes_gameplay_seeing_a_skaven_slaver_03",
				"pes_gameplay_seeing_a_skaven_slaver_04",
				"pes_gameplay_seeing_a_skaven_slaver_05",
				"pes_gameplay_seeing_a_skaven_slaver_06",
				"pes_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_slaver_01",
				"pdr_gameplay_seeing_a_skaven_slaver_02",
				"pdr_gameplay_seeing_a_skaven_slaver_07",
				"pdr_gameplay_seeing_a_skaven_slaver_03",
				"pdr_gameplay_seeing_a_skaven_slaver_04",
				"pdr_gameplay_seeing_a_skaven_slaver_05",
				"pdr_gameplay_seeing_a_skaven_slaver_06",
				"pdr_gameplay_seeing_a_skaven_slaver_08"
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
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_slaver_01",
				"pdr_gameplay_seeing_a_skaven_slaver_02",
				"pdr_gameplay_seeing_a_skaven_slaver_07",
				"pdr_gameplay_seeing_a_skaven_slaver_03",
				"pdr_gameplay_seeing_a_skaven_slaver_04",
				"pdr_gameplay_seeing_a_skaven_slaver_05",
				"pdr_gameplay_seeing_a_skaven_slaver_06",
				"pdr_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_rat_ogre_01",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_04",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_06",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_02",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_03",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_05"
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
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_rat_ogre_01",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_04",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_06",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_02",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_03",
				"pdr_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_heard_empire_soldier_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwe_gameplay_heard_empire_soldier_in_trouble_01",
				"pwe_gameplay_heard_empire_soldier_in_trouble_02",
				"pwe_gameplay_heard_empire_soldier_in_trouble_03",
				"pwe_gameplay_heard_empire_soldier_in_trouble_04"
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
				"pwe_gameplay_heard_empire_soldier_in_trouble_01",
				"pwe_gameplay_heard_empire_soldier_in_trouble_02",
				"pwe_gameplay_heard_empire_soldier_in_trouble_03",
				"pwe_gameplay_heard_empire_soldier_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_empire_soldier_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_02",
				"pwh_gameplay_heard_empire_soldier_in_trouble_03",
				"pwh_gameplay_heard_empire_soldier_in_trouble_04"
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
				"pwh_gameplay_heard_empire_soldier_in_trouble_01",
				"pwh_gameplay_heard_empire_soldier_in_trouble_02",
				"pwh_gameplay_heard_empire_soldier_in_trouble_03",
				"pwh_gameplay_heard_empire_soldier_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_heard_dwarf_ranger_in_trouble_ping = {
			sound_events_n = 4,
			randomize_indexes_n = 0,
			face_animations_n = 4,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 4,
			sound_events = {
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_04"
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
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_01",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_02",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_03",
				"pwh_gameplay_heard_dwarf_ranger_in_trouble_04"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_globadier_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_03",
				"pwh_gameplay_seeing_a_globadier_04",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_05",
				"pwh_gameplay_seeing_a_globadier_06"
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
			localization_strings = {
				"pwh_gameplay_seeing_a_globadier_01",
				"pwh_gameplay_seeing_a_globadier_03",
				"pwh_gameplay_seeing_a_globadier_04",
				"pwh_gameplay_seeing_a_globadier_02",
				"pwh_gameplay_seeing_a_globadier_05",
				"pwh_gameplay_seeing_a_globadier_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_seeing_a_gutter_runner_01",
				"pdr_gameplay_seeing_a_gutter_runner_02",
				"pdr_gameplay_seeing_a_gutter_runner_03",
				"pdr_gameplay_seeing_a_gutter_runner_04",
				"pdr_gameplay_seeing_a_gutter_runner_05",
				"pdr_gameplay_seeing_a_gutter_runner_06"
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
			localization_strings = {
				"pdr_gameplay_seeing_a_gutter_runner_01",
				"pdr_gameplay_seeing_a_gutter_runner_02",
				"pdr_gameplay_seeing_a_gutter_runner_03",
				"pdr_gameplay_seeing_a_gutter_runner_04",
				"pdr_gameplay_seeing_a_gutter_runner_05",
				"pdr_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_seeing_a_stormvermin_01",
				"pdr_gameplay_seeing_a_stormvermin_02",
				"pdr_gameplay_seeing_a_stormvermin_03",
				"pdr_gameplay_seeing_a_stormvermin_04",
				"pdr_gameplay_seeing_a_stormvermin_05",
				"pdr_gameplay_seeing_a_stormvermin_06",
				"pdr_gameplay_seeing_a_stormvermin_07",
				"pdr_gameplay_seeing_a_stormvermin_08"
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
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pdr_gameplay_seeing_a_stormvermin_01",
				"pdr_gameplay_seeing_a_stormvermin_02",
				"pdr_gameplay_seeing_a_stormvermin_03",
				"pdr_gameplay_seeing_a_stormvermin_04",
				"pdr_gameplay_seeing_a_stormvermin_05",
				"pdr_gameplay_seeing_a_stormvermin_06",
				"pdr_gameplay_seeing_a_stormvermin_07",
				"pdr_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_spots_bomb_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_spots_bomb_01",
				"pdr_gameplay_spots_bomb_02",
				"pdr_gameplay_spots_bomb_03",
				"pdr_gameplay_spots_bomb_04",
				"pdr_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_bomb_01",
				"pdr_gameplay_spots_bomb_02",
				"pdr_gameplay_spots_bomb_03",
				"pdr_gameplay_spots_bomb_04",
				"pdr_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_healing_draught_01",
				"pbw_gameplay_healing_draught_02",
				"pbw_gameplay_healing_draught_03",
				"pbw_gameplay_healing_draught_04",
				"pbw_gameplay_healing_draught_05",
				"pbw_gameplay_healing_draught_06",
				"pbw_gameplay_healing_draught_07",
				"pbw_gameplay_healing_draught_08"
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
				"pbw_gameplay_healing_draught_01",
				"pbw_gameplay_healing_draught_02",
				"pbw_gameplay_healing_draught_03",
				"pbw_gameplay_healing_draught_04",
				"pbw_gameplay_healing_draught_05",
				"pbw_gameplay_healing_draught_06",
				"pbw_gameplay_healing_draught_07",
				"pbw_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_healing_draught_01",
				"pdr_gameplay_healing_draught_02",
				"pdr_gameplay_healing_draught_03",
				"pdr_gameplay_healing_draught_04",
				"pdr_gameplay_healing_draught_05",
				"pdr_gameplay_healing_draught_06",
				"pdr_gameplay_healing_draught_07",
				"pdr_gameplay_healing_draught_08"
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
				"pdr_gameplay_healing_draught_01",
				"pdr_gameplay_healing_draught_02",
				"pdr_gameplay_healing_draught_03",
				"pdr_gameplay_healing_draught_04",
				"pdr_gameplay_healing_draught_05",
				"pdr_gameplay_healing_draught_06",
				"pdr_gameplay_healing_draught_07",
				"pdr_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_spots_health_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_spots_health_01",
				"pdr_gameplay_spots_health_02",
				"pdr_gameplay_spots_health_03",
				"pdr_gameplay_spots_health_04",
				"pdr_gameplay_spots_health_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_health_01",
				"pdr_gameplay_spots_health_02",
				"pdr_gameplay_spots_health_03",
				"pdr_gameplay_spots_health_04",
				"pdr_gameplay_spots_health_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_spots_ammo_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pdr_gameplay_spots_ammo_01",
				"pdr_gameplay_spots_ammo_02",
				"pdr_gameplay_spots_ammo_03",
				"pdr_gameplay_spots_ammo_04",
				"pdr_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pdr_gameplay_spots_ammo_01",
				"pdr_gameplay_spots_ammo_02",
				"pdr_gameplay_spots_ammo_03",
				"pdr_gameplay_spots_ammo_04",
				"pdr_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_spots_ammo_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_03",
				"pes_gameplay_spots_ammo_04",
				"pes_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_ammo_01",
				"pes_gameplay_spots_ammo_02",
				"pes_gameplay_spots_ammo_03",
				"pes_gameplay_spots_ammo_04",
				"pes_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_heard_bright_wizard_in_trouble_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pdr_gameplay_heard_bright_wizard_in_trouble_01",
				"pdr_gameplay_heard_bright_wizard_in_trouble_02",
				"pdr_gameplay_heard_bright_wizard_in_trouble_03",
				"pdr_gameplay_heard_bright_wizard_in_trouble_04",
				"pdr_gameplay_heard_bright_wizard_in_trouble_05",
				"pdr_gameplay_heard_bright_wizard_in_trouble_06",
				"pdr_gameplay_heard_bright_wizard_in_trouble_07",
				"pdr_gameplay_heard_bright_wizard_in_trouble_08"
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
				"pdr_gameplay_heard_bright_wizard_in_trouble_01",
				"pdr_gameplay_heard_bright_wizard_in_trouble_02",
				"pdr_gameplay_heard_bright_wizard_in_trouble_03",
				"pdr_gameplay_heard_bright_wizard_in_trouble_04",
				"pdr_gameplay_heard_bright_wizard_in_trouble_05",
				"pdr_gameplay_heard_bright_wizard_in_trouble_06",
				"pdr_gameplay_heard_bright_wizard_in_trouble_07",
				"pdr_gameplay_heard_bright_wizard_in_trouble_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_grabbed_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
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
				"face_angry",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_spots_bomb_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_spots_bomb_01",
				"pbw_gameplay_spots_bomb_02",
				"pbw_gameplay_spots_bomb_03",
				"pbw_gameplay_spots_bomb_04",
				"pbw_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_bomb_01",
				"pbw_gameplay_spots_bomb_02",
				"pbw_gameplay_spots_bomb_03",
				"pbw_gameplay_spots_bomb_04",
				"pbw_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_spots_potion_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_03",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_potion_01",
				"pes_gameplay_spots_potion_02",
				"pes_gameplay_spots_potion_03",
				"pes_gameplay_spots_potion_04",
				"pes_gameplay_spots_potion_05"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_bright_wizard_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pdr_gameplay_bright_wizard_grabbed_01",
				"pdr_gameplay_bright_wizard_grabbed_02",
				"pdr_gameplay_bright_wizard_grabbed_03",
				"pdr_gameplay_bright_wizard_grabbed_04",
				"pdr_gameplay_bright_wizard_grabbed_05",
				"pdr_gameplay_bright_wizard_grabbed_06"
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
				"pdr_gameplay_bright_wizard_grabbed_01",
				"pdr_gameplay_bright_wizard_grabbed_02",
				"pdr_gameplay_bright_wizard_grabbed_03",
				"pdr_gameplay_bright_wizard_grabbed_04",
				"pdr_gameplay_bright_wizard_grabbed_05",
				"pdr_gameplay_bright_wizard_grabbed_06"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_07"
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
			localization_strings = {
				"pwe_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwe_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_seeing_a_gutter_runner_01",
				"pbw_gameplay_seeing_a_gutter_runner_02",
				"pbw_gameplay_seeing_a_gutter_runner_03",
				"pbw_gameplay_seeing_a_gutter_runner_04",
				"pbw_gameplay_seeing_a_gutter_runner_05",
				"pbw_gameplay_seeing_a_gutter_runner_06"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_gutter_runner_01",
				"pbw_gameplay_seeing_a_gutter_runner_02",
				"pbw_gameplay_seeing_a_gutter_runner_03",
				"pbw_gameplay_seeing_a_gutter_runner_04",
				"pbw_gameplay_seeing_a_gutter_runner_05",
				"pbw_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_skaven_slaver_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_slaver_01",
				"pwh_gameplay_seeing_a_skaven_slaver_02",
				"pwh_gameplay_seeing_a_skaven_slaver_07",
				"pwh_gameplay_seeing_a_skaven_slaver_03",
				"pwh_gameplay_seeing_a_skaven_slaver_04",
				"pwh_gameplay_seeing_a_skaven_slaver_05",
				"pwh_gameplay_seeing_a_skaven_slaver_06",
				"pwh_gameplay_seeing_a_skaven_slaver_08"
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
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_slaver_01",
				"pwh_gameplay_seeing_a_skaven_slaver_02",
				"pwh_gameplay_seeing_a_skaven_slaver_07",
				"pwh_gameplay_seeing_a_skaven_slaver_03",
				"pwh_gameplay_seeing_a_skaven_slaver_04",
				"pwh_gameplay_seeing_a_skaven_slaver_05",
				"pwh_gameplay_seeing_a_skaven_slaver_06",
				"pwh_gameplay_seeing_a_skaven_slaver_08"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_hanging_help_ping = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
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
				"pdr_gameplay_hanging_help_01",
				"pdr_gameplay_hanging_help_02",
				"pdr_gameplay_hanging_help_03",
				"pdr_gameplay_hanging_help_04",
				"pdr_gameplay_hanging_help_06",
				"pdr_gameplay_hanging_help_05",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_knocked_down_ping = {
			sound_events_n = 12,
			randomize_indexes_n = 0,
			face_animations_n = 12,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 12,
			sound_events = {
				"pdr_gameplay_knocked_down_01",
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_03",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_05",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
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
				"face_fear",
				"face_fear",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted",
				"face_exhausted"
			},
			localization_strings = {
				"pdr_gameplay_knocked_down_01",
				"pdr_gameplay_knocked_down_02",
				"pdr_gameplay_knocked_down_03",
				"pdr_gameplay_knocked_down_04",
				"pdr_gameplay_knocked_down_05",
				"pdr_gameplay_knocked_down_06",
				"pdr_gameplay_self_tag_01",
				"pdr_gameplay_self_tag_02",
				"pdr_gameplay_self_tag_03",
				"pdr_gameplay_self_tag_04",
				"pdr_gameplay_self_tag_05",
				"pdr_gameplay_self_tag_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_hanging_help_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
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
			localization_strings = {
				"pes_gameplay_hanging_help_01",
				"pes_gameplay_hanging_help_02",
				"pes_gameplay_hanging_help_03",
				"pes_gameplay_hanging_help_04",
				"pes_gameplay_hanging_help_05",
				"pes_gameplay_hanging_help_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_rat_ogre_01",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_04",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_06",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_02",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_03",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_05"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_rat_ogre_01",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_04",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_06",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_02",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_03",
				"pbw_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pwh_gameplay_healing_draught_01",
				"pwh_gameplay_healing_draught_02",
				"pwh_gameplay_healing_draught_03",
				"pwh_gameplay_healing_draught_04",
				"pwh_gameplay_healing_draught_05",
				"pwh_gameplay_healing_draught_06",
				"pwh_gameplay_healing_draught_07",
				"pwh_gameplay_healing_draught_08"
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
				"pwh_gameplay_healing_draught_01",
				"pwh_gameplay_healing_draught_02",
				"pwh_gameplay_healing_draught_03",
				"pwh_gameplay_healing_draught_04",
				"pwh_gameplay_healing_draught_05",
				"pwh_gameplay_healing_draught_06",
				"pwh_gameplay_healing_draught_07",
				"pwh_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pwe_gameplay_healing_draught_01",
				"pwe_gameplay_healing_draught_02",
				"pwe_gameplay_healing_draught_03",
				"pwe_gameplay_healing_draught_04",
				"pwe_gameplay_healing_draught_05",
				"pwe_gameplay_healing_draught_06",
				"pwe_gameplay_healing_draught_07",
				"pwe_gameplay_healing_draught_08"
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
				"pwe_gameplay_healing_draught_01",
				"pwe_gameplay_healing_draught_02",
				"pwe_gameplay_healing_draught_03",
				"pwe_gameplay_healing_draught_04",
				"pwe_gameplay_healing_draught_05",
				"pwe_gameplay_healing_draught_06",
				"pwe_gameplay_healing_draught_07",
				"pwe_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_stormvermin_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 8,
			sound_events = {
				"pbw_gameplay_seeing_a_stormvermin_01",
				"pbw_gameplay_seeing_a_stormvermin_02",
				"pbw_gameplay_seeing_a_stormvermin_03",
				"pbw_gameplay_seeing_a_stormvermin_04",
				"pbw_gameplay_seeing_a_stormvermin_05",
				"pbw_gameplay_seeing_a_stormvermin_06",
				"pbw_gameplay_seeing_a_stormvermin_07",
				"pbw_gameplay_seeing_a_stormvermin_08"
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
				"face_neutral",
				"face_neutral",
				"face_contempt",
				"face_neutral",
				"face_angry"
			},
			localization_strings = {
				"pbw_gameplay_seeing_a_stormvermin_01",
				"pbw_gameplay_seeing_a_stormvermin_02",
				"pbw_gameplay_seeing_a_stormvermin_03",
				"pbw_gameplay_seeing_a_stormvermin_04",
				"pbw_gameplay_seeing_a_stormvermin_05",
				"pbw_gameplay_seeing_a_stormvermin_06",
				"pbw_gameplay_seeing_a_stormvermin_07",
				"pbw_gameplay_seeing_a_stormvermin_08"
			},
			randomize_indexes = {}
		},
		pes_gameplay_player_pounced_ping = {
			sound_events_n = 10,
			randomize_indexes_n = 0,
			face_animations_n = 10,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 10,
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
			randomize_indexes = {}
		},
		pes_gameplay_spots_health_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_02",
				"pes_gameplay_spots_health_03",
				"pes_gameplay_spots_health_04",
				"pes_gameplay_spots_health_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_health_01",
				"pes_gameplay_spots_health_02",
				"pes_gameplay_spots_health_03",
				"pes_gameplay_spots_health_04",
				"pes_gameplay_spots_health_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_gutter_runner_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_seeing_a_gutter_runner_01",
				"pes_gameplay_seeing_a_gutter_runner_02",
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_04",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06"
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
			localization_strings = {
				"pes_gameplay_seeing_a_gutter_runner_01",
				"pes_gameplay_seeing_a_gutter_runner_02",
				"pes_gameplay_seeing_a_gutter_runner_03",
				"pes_gameplay_seeing_a_gutter_runner_04",
				"pes_gameplay_seeing_a_gutter_runner_05",
				"pes_gameplay_seeing_a_gutter_runner_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_skaven_rat_ogre_04",
				"pes_gameplay_seeing_a_skaven_rat_ogre_06",
				"pes_gameplay_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_seeing_a_skaven_rat_ogre_03",
				"pes_gameplay_seeing_a_skaven_rat_ogre_05"
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
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_rat_ogre_01",
				"pes_gameplay_seeing_a_skaven_rat_ogre_04",
				"pes_gameplay_seeing_a_skaven_rat_ogre_06",
				"pes_gameplay_seeing_a_skaven_rat_ogre_02",
				"pes_gameplay_seeing_a_skaven_rat_ogre_03",
				"pes_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_skaven_ratling_gun_04",
				"pes_gameplay_seeing_a_skaven_ratling_gun_05",
				"pes_gameplay_seeing_a_skaven_ratling_gun_06",
				"pes_gameplay_seeing_a_skaven_ratling_gun_07"
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
			localization_strings = {
				"pes_gameplay_seeing_a_skaven_ratling_gun_01",
				"pes_gameplay_seeing_a_skaven_ratling_gun_02",
				"pes_gameplay_seeing_a_skaven_ratling_gun_03",
				"pes_gameplay_seeing_a_skaven_ratling_gun_04",
				"pes_gameplay_seeing_a_skaven_ratling_gun_05",
				"pes_gameplay_seeing_a_skaven_ratling_gun_06",
				"pes_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_health_ping = {
			sound_events_n = 18,
			randomize_indexes_n = 0,
			face_animations_n = 18,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 18,
			sound_events = {
				"pwh_gameplay_spots_health_01",
				"pwh_gameplay_spots_health_02",
				"pwh_gameplay_spots_health_03",
				"pwh_gameplay_spots_health_04",
				"pwh_gameplay_spots_health_05",
				"pwh_gameplay_spots_health_06",
				"pwh_gameplay_spots_health_07",
				"pwh_gameplay_spots_health_08",
				"pwh_gameplay_spots_health_09",
				"pwh_gameplay_spots_health_10",
				"pwh_gameplay_spots_health_11",
				"pwh_gameplay_spots_health_12",
				"pwh_gameplay_spots_health_13",
				"pwh_gameplay_spots_health_18",
				"pwh_gameplay_spots_health_19",
				"pwh_gameplay_spots_health_20",
				"pwh_gameplay_spots_health_21",
				"pwh_gameplay_spots_health_22"
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
				"pwh_gameplay_spots_health_01",
				"pwh_gameplay_spots_health_02",
				"pwh_gameplay_spots_health_03",
				"pwh_gameplay_spots_health_04",
				"pwh_gameplay_spots_health_05",
				"pwh_gameplay_spots_health_06",
				"pwh_gameplay_spots_health_07",
				"pwh_gameplay_spots_health_08",
				"pwh_gameplay_spots_health_09",
				"pwh_gameplay_spots_health_10",
				"pwh_gameplay_spots_health_11",
				"pwh_gameplay_spots_health_12",
				"pwh_gameplay_spots_health_13",
				"pwh_gameplay_spots_health_18",
				"pwh_gameplay_spots_health_19",
				"pwh_gameplay_spots_health_20",
				"pwh_gameplay_spots_health_21",
				"pwh_gameplay_spots_health_22"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_ammo_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_02",
				"pwh_gameplay_spots_ammo_03",
				"pwh_gameplay_spots_ammo_04",
				"pwh_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pwh_gameplay_spots_ammo_01",
				"pwh_gameplay_spots_ammo_02",
				"pwh_gameplay_spots_ammo_03",
				"pwh_gameplay_spots_ammo_04",
				"pwh_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_dwarf_ranger_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pes_gameplay_dwarf_ranger_grabbed_01",
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_04",
				"pes_gameplay_dwarf_ranger_grabbed_05",
				"pes_gameplay_dwarf_ranger_grabbed_06"
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
				"pes_gameplay_dwarf_ranger_grabbed_01",
				"pes_gameplay_dwarf_ranger_grabbed_02",
				"pes_gameplay_dwarf_ranger_grabbed_03",
				"pes_gameplay_dwarf_ranger_grabbed_04",
				"pes_gameplay_dwarf_ranger_grabbed_05",
				"pes_gameplay_dwarf_ranger_grabbed_06"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_spots_ammo_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pbw_gameplay_spots_ammo_01",
				"pbw_gameplay_spots_ammo_02",
				"pbw_gameplay_spots_ammo_03",
				"pbw_gameplay_spots_ammo_04",
				"pbw_gameplay_spots_ammo_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pbw_gameplay_spots_ammo_01",
				"pbw_gameplay_spots_ammo_02",
				"pbw_gameplay_spots_ammo_03",
				"pbw_gameplay_spots_ammo_04",
				"pbw_gameplay_spots_ammo_05"
			},
			randomize_indexes = {}
		},
		pes_gameplay_grabbed_ping = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 3,
			sound_events = {
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pes_gameplay_knocked_down_03",
				"pes_gameplay_knocked_down_05",
				"pes_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_player_pounced_ping = {
			sound_events_n = 9,
			randomize_indexes_n = 0,
			face_animations_n = 9,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 9,
			sound_events = {
				"pwh_gameplay_player_pounced_06",
				"pwh_gameplay_player_pounced_07",
				"pwh_gameplay_player_pounced_08",
				"pwh_gameplay_player_pounced_09",
				"pwh_gameplay_player_pounced_10",
				"pwh_gameplay_player_pounced_11",
				"pwh_gameplay_player_pounced_12",
				"pwh_gameplay_player_pounced_13",
				"pwh_gameplay_player_pounced_14"
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
				"face_angry",
				"face_angry",
				"face_angry",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear",
				"face_fear"
			},
			localization_strings = {
				"pwh_gameplay_player_pounced_06",
				"pwh_gameplay_player_pounced_07",
				"pwh_gameplay_player_pounced_08",
				"pwh_gameplay_player_pounced_09",
				"pwh_gameplay_player_pounced_10",
				"pwh_gameplay_player_pounced_11",
				"pwh_gameplay_player_pounced_12",
				"pwh_gameplay_player_pounced_13",
				"pwh_gameplay_player_pounced_14"
			},
			randomize_indexes = {}
		},
		pdr_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pdr_gameplay_seeing_a_skaven_ratling_gun_01",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_02",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_03",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_04",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_05",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_06",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_07"
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
			localization_strings = {
				"pdr_gameplay_seeing_a_skaven_ratling_gun_01",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_02",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_03",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_04",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_05",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_06",
				"pdr_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pwe_gameplay_witch_hunter_grabbed_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwe_gameplay_witch_hunter_grabbed_01",
				"pwe_gameplay_witch_hunter_grabbed_02",
				"pwe_gameplay_witch_hunter_grabbed_03",
				"pwe_gameplay_witch_hunter_grabbed_04",
				"pwe_gameplay_witch_hunter_grabbed_05",
				"pwe_gameplay_witch_hunter_grabbed_06"
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
				"pwe_gameplay_witch_hunter_grabbed_01",
				"pwe_gameplay_witch_hunter_grabbed_02",
				"pwe_gameplay_witch_hunter_grabbed_03",
				"pwe_gameplay_witch_hunter_grabbed_04",
				"pwe_gameplay_witch_hunter_grabbed_05",
				"pwe_gameplay_witch_hunter_grabbed_06"
			},
			randomize_indexes = {}
		},
		pes_gameplay_healing_draught_ping = {
			sound_events_n = 8,
			randomize_indexes_n = 0,
			face_animations_n = 8,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 8,
			sound_events = {
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_03",
				"pes_gameplay_healing_draught_04",
				"pes_gameplay_healing_draught_05",
				"pes_gameplay_healing_draught_06",
				"pes_gameplay_healing_draught_07",
				"pes_gameplay_healing_draught_08"
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
				"pes_gameplay_healing_draught_01",
				"pes_gameplay_healing_draught_02",
				"pes_gameplay_healing_draught_03",
				"pes_gameplay_healing_draught_04",
				"pes_gameplay_healing_draught_05",
				"pes_gameplay_healing_draught_06",
				"pes_gameplay_healing_draught_07",
				"pes_gameplay_healing_draught_08"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_grabbed_ping = {
			sound_events_n = 3,
			randomize_indexes_n = 0,
			face_animations_n = 3,
			database = "ping_dialogues_honduras",
			category = "player_alerts",
			dialogue_animations_n = 3,
			sound_events = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_06"
			},
			dialogue_animations = {
				"dialogue_shout",
				"dialogue_shout",
				"dialogue_shout"
			},
			face_animations = {
				"face_angry",
				"face_fear",
				"face_exhausted"
			},
			localization_strings = {
				"pbw_gameplay_knocked_down_01",
				"pbw_gameplay_knocked_down_04",
				"pbw_gameplay_knocked_down_06"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_07"
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
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_ratling_gun_01",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_02",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_03",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_04",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_05",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_06",
				"pwh_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pbw_gameplay_seeing_a_skaven_ratling_gun_ping = {
			sound_events_n = 7,
			randomize_indexes_n = 0,
			face_animations_n = 7,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 7,
			sound_events = {
				"pbw_gameplay_seeing_a_skaven_ratling_gun_01",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_02",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_03",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_04",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_05",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_06",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_07"
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
			localization_strings = {
				"pbw_gameplay_seeing_a_skaven_ratling_gun_01",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_02",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_03",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_04",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_05",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_06",
				"pbw_gameplay_seeing_a_skaven_ratling_gun_07"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_seeing_a_skaven_rat_ogre_ping = {
			sound_events_n = 6,
			randomize_indexes_n = 0,
			face_animations_n = 6,
			database = "ping_dialogues_honduras",
			category = "enemy_alerts",
			dialogue_animations_n = 6,
			sound_events = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_05"
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
			localization_strings = {
				"pwh_gameplay_seeing_a_skaven_rat_ogre_01",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_04",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_06",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_02",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_03",
				"pwh_gameplay_seeing_a_skaven_rat_ogre_05"
			},
			randomize_indexes = {}
		},
		pwh_gameplay_spots_potion_ping = {
			sound_events_n = 15,
			randomize_indexes_n = 0,
			face_animations_n = 15,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 15,
			sound_events = {
				"pwh_gameplay_spots_potion_01",
				"pwh_gameplay_spots_potion_07",
				"pwh_gameplay_spots_potion_08",
				"pwh_gameplay_spots_potion_09",
				"pwh_gameplay_spots_potion_10",
				"pwh_gameplay_spots_potion_11",
				"pwh_gameplay_spots_potion_12",
				"pwh_gameplay_spots_potion_13",
				"pwh_gameplay_spots_potion_14",
				"pwh_gameplay_spots_potion_15",
				"pwh_gameplay_spots_potion_16",
				"pwh_gameplay_spots_potion_17",
				"pwh_gameplay_spots_potion_18",
				"pwh_gameplay_spots_potion_19",
				"pwh_gameplay_spots_potion_20"
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
			localization_strings = {
				"pwh_gameplay_spots_potion_01",
				"pwh_gameplay_spots_potion_07",
				"pwh_gameplay_spots_potion_08",
				"pwh_gameplay_spots_potion_09",
				"pwh_gameplay_spots_potion_10",
				"pwh_gameplay_spots_potion_11",
				"pwh_gameplay_spots_potion_12",
				"pwh_gameplay_spots_potion_13",
				"pwh_gameplay_spots_potion_14",
				"pwh_gameplay_spots_potion_15",
				"pwh_gameplay_spots_potion_16",
				"pwh_gameplay_spots_potion_17",
				"pwh_gameplay_spots_potion_18",
				"pwh_gameplay_spots_potion_19",
				"pwh_gameplay_spots_potion_20"
			},
			randomize_indexes = {}
		},
		pes_gameplay_spots_bomb_ping = {
			sound_events_n = 5,
			randomize_indexes_n = 0,
			face_animations_n = 5,
			database = "ping_dialogues_honduras",
			category = "seen_items",
			dialogue_animations_n = 5,
			sound_events = {
				"pes_gameplay_spots_bomb_01",
				"pes_gameplay_spots_bomb_02",
				"pes_gameplay_spots_bomb_03",
				"pes_gameplay_spots_bomb_04",
				"pes_gameplay_spots_bomb_05"
			},
			dialogue_animations = {
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
				"face_happy"
			},
			localization_strings = {
				"pes_gameplay_spots_bomb_01",
				"pes_gameplay_spots_bomb_02",
				"pes_gameplay_spots_bomb_03",
				"pes_gameplay_spots_bomb_04",
				"pes_gameplay_spots_bomb_05"
			},
			randomize_indexes = {}
		}
	})
end
