require("scripts/unit_extensions/default_player_unit/careers/career_ability_bw_adept")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_bw_unchained")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_dr_ironbreaker")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_dr_slayer")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_es_huntsman")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_es_knight")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_es_mercenary")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_we_maiden_guard")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_we_shade")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_wh_captain")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_wh_zealot")

ActivatedAbilitySettings = {
	dr_1 = {
		description = "career_active_desc_dr_1",
		display_name = "career_active_name_dr_1",
		cooldown = 180,
		icon = "bardin_ironbreaker_activated_ability",
		ability_class = CareerAbilityDRIronbreaker
	},
	dr_2 = {
		description = "career_active_desc_dr_2",
		display_name = "career_active_name_dr_2",
		cooldown = 40,
		icon = "bardin_slayer_activated_ability",
		ability_class = CareerAbilityDRSlayer
	},
	dr_3 = {
		description = "career_active_desc_dr_3",
		weapon_name = "bardin_ranger_career_skill_weapon",
		display_name = "career_active_name_dr_3",
		cooldown = 120,
		icon = "bardin_ranger_activated_ability",
		action_name = "action_career_dr_3"
	},
	es_1 = {
		description = "career_active_desc_es_1",
		display_name = "career_active_name_es_1",
		cooldown = 90,
		icon = "markus_huntsman_activated_ability",
		ability_class = CareerAbilityESHuntsman
	},
	es_2 = {
		description = "career_active_desc_es_2",
		display_name = "career_active_name_es_2",
		cooldown = 30,
		icon = "markus_knight_activated_ability",
		ability_class = CareerAbilityESKnight
	},
	es_3 = {
		description = "career_active_desc_markus_mercencary",
		display_name = "career_active_name_markus_mercencary",
		cooldown = 180,
		icon = "markus_mercenary_activated_ability",
		ability_class = CareerAbilityESMercenary
	},
	we_1 = {
		description = "career_active_desc_we_1",
		display_name = "career_active_name_we_1",
		cooldown = 60,
		icon = "kerillian_shade_activated_ability",
		ability_class = CareerAbilityWEShade
	},
	we_2 = {
		description = "career_active_desc_we_2",
		display_name = "career_active_name_we_2",
		cooldown = 20,
		icon = "kerillian_maidenguard_activated_ability",
		ability_class = CareerAbilityWEMaidenGuard
	},
	we_3 = {
		description = "career_active_desc_we_3",
		weapon_name = "kerillian_waywatcher_career_skill_weapon",
		display_name = "career_active_name_we_3",
		cooldown = 70,
		icon = "kerillian_waywatcher_activated_ability",
		action_name = "action_career_we_3"
	},
	wh_1 = {
		description = "career_active_desc_wh_1",
		display_name = "career_active_name_wh_1",
		cooldown = 60,
		icon = "victor_zealot_activated_ability",
		ability_class = CareerAbilityWHZealot
	},
	wh_2 = {
		description = "career_active_desc_wh_2",
		weapon_name = "victor_bountyhunter_career_skill_weapon",
		display_name = "career_active_name_wh_2",
		cooldown = 90,
		icon = "victor_bountyhunter_activated_ability",
		action_name = "action_career_wh_2"
	},
	wh_3 = {
		description = "career_active_desc_victor_witchhunter",
		display_name = "career_active_name_victor_witchhunter",
		cooldown = 180,
		icon = "victor_witchhunter_activated_ability",
		ability_class = CareerAbilityWHCaptain
	},
	bw_1 = {
		description = "career_active_desc_bw_1",
		weapon_name = "sienna_scholar_career_skill_weapon",
		display_name = "career_active_name_bw_1",
		cooldown = 40,
		icon = "sienna_scholar_activated_ability",
		action_name = "action_career_bw_1"
	},
	bw_2 = {
		description = "career_active_desc_bw_2",
		display_name = "career_active_name_bw_2",
		cooldown = 40,
		icon = "sienna_adept_activated_ability",
		ability_class = CareerAbilityBWAdept
	},
	bw_3 = {
		description = "career_active_desc_bw_3",
		display_name = "career_active_name_bw_3",
		cooldown = 120,
		icon = "sienna_unchained_activated_ability",
		ability_class = CareerAbilityBWUnchained
	}
}
PassiveAbilitySettings = {
	dr_1 = {
		description = "career_passive_desc_dr_1a",
		display_name = "career_passive_name_dr_1",
		icon = "bardin_ironbreaker_gromril_armour",
		buffs = {
			"bardin_ironbreaker_gromril_armour",
			"bardin_ironbreaker_gromril_antistun",
			"bardin_ironbreaker_passive_increased_defence",
			"bardin_ironbreaker_passive_increased_stamina",
			"bardin_ironbreaker_passive_reduced_stun_duration",
			"bardin_ironbreaker_refresh_gromril_armour",
			"bardin_ironbreaker_ability_cooldown_on_hit",
			"bardin_ironbreaker_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_dr_1b",
				description = "career_passive_desc_dr_1b"
			},
			{
				display_name = "career_passive_name_dr_1c",
				description = "career_passive_desc_dr_1c"
			},
			{
				display_name = "career_passive_name_dr_1d",
				description = "career_passive_desc_dr_1d"
			}
		}
	},
	dr_2 = {
		description = "career_passive_desc_dr_2a",
		display_name = "career_passive_name_dr_2",
		icon = "bardin_slayer_passive",
		buffs = {
			"bardin_slayer_passive_attack_speed",
			"bardin_slayer_passive_stacking_damage_buff_on_hit",
			"bardin_slayer_ability_cooldown_on_damage_taken",
			"bardin_slayer_ability_cooldown_on_hit"
		},
		perks = {
			{
				display_name = "career_passive_name_dr_2b",
				description = "career_passive_desc_dr_2b"
			}
		}
	},
	dr_3 = {
		description = "career_passive_desc_dr_3a",
		display_name = "career_passive_name_dr_3",
		icon = "bardin_ranger_passive",
		buffs = {
			"bardin_ranger_passive",
			"bardin_ranger_passive_increased_ammunition",
			"bardin_ranger_passive_reload_speed",
			"bardin_ranger_ability_cooldown_on_hit",
			"bardin_ranger_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_dr_3b",
				description = "career_passive_desc_dr_3b"
			},
			{
				display_name = "career_passive_name_dr_3c",
				description = "career_passive_desc_dr_3c"
			}
		}
	},
	es_1 = {
		description = "career_passive_desc_es_1a",
		display_name = "career_passive_name_es_1",
		icon = "markus_huntsman_passive",
		buffs = {
			"markus_huntsman_passive",
			"markus_huntsman_passive_increased_ammunition",
			"markus_huntsman_passive_no_damage_dropoff",
			"markus_huntsman_passive_crit_aura",
			"markus_huntsman_ability_cooldown_on_hit",
			"markus_huntsman_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_es_1b",
				description = "career_passive_desc_es_1b"
			},
			{
				display_name = "career_passive_name_es_1c",
				description = "career_passive_desc_es_1c"
			}
		}
	},
	es_2 = {
		description = "career_passive_desc_es_2a",
		display_name = "career_passive_name_es_2",
		icon = "markus_knight_passive",
		buffs = {
			"markus_knight_passive",
			"markus_knight_passive_damage_reduction",
			"markus_knight_passive_increased_stamina",
			"markus_knight_ability_cooldown_on_hit",
			"markus_knight_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_es_2b",
				description = "career_passive_desc_es_2b"
			},
			{
				display_name = "career_passive_name_es_2c",
				description = "career_passive_desc_es_2c"
			}
		}
	},
	es_3 = {
		description = "career_passive_desc_es_3a",
		display_name = "career_passive_name_es_3",
		icon = "markus_mercenary_passive",
		buffs = {
			"markus_mercenary_passive",
			"markus_mercenary_ability_cooldown_on_hit",
			"markus_mercenary_ability_cooldown_on_damage_taken",
			"markus_mercenary_passive_hit_mass_override",
			"markus_mercenary_passive_crit_chance"
		},
		perks = {
			{
				display_name = "career_passive_name_es_3b",
				description = "career_passive_desc_es_3b"
			},
			{
				display_name = "career_passive_name_es_3c",
				description = "career_passive_desc_es_3c"
			}
		}
	},
	we_1 = {
		description = "career_passive_desc_we_1a",
		display_name = "career_passive_name_we_1",
		icon = "kerillian_shade_passive",
		buffs = {
			"kerillian_shade_passive",
			"kerillian_shade_passive_backstab_killing_blow",
			"kerillian_shade_end_activated_ability",
			"kerillian_shade_ability_cooldown_on_hit",
			"kerillian_shade_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_we_1b",
				description = "career_passive_desc_we_1b"
			}
		}
	},
	we_2 = {
		description = "career_passive_desc_we_2a",
		display_name = "career_passive_name_we_2",
		icon = "kerillian_maidenguard_passive",
		buffs = {
			"kerillian_maidenguard_passive_dodge",
			"kerillian_maidenguard_passive_dodge_speed",
			"kerillian_maidenguard_passive_stamina_regen_aura",
			"kerillian_maidenguard_passive_increased_stamina",
			"kerillian_maidenguard_passive_uninterruptible_revive",
			"kerillian_maidenguard_ability_cooldown_on_hit",
			"kerillian_maidenguard_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_we_2b",
				description = "career_passive_desc_we_2b"
			},
			{
				display_name = "career_passive_name_we_2c",
				description = "career_passive_desc_we_2c"
			}
		}
	},
	we_3 = {
		description = "career_passive_desc_we_3a",
		display_name = "career_passive_name_we_3",
		icon = "kerillian_waywatcher_passive",
		buffs = {
			"kerillian_waywatcher_passive",
			"kerillian_waywatcher_passive_no_damage_dropoff",
			"kerillian_waywatcher_passive_increased_ammunition",
			"kerillian_waywatcher_passive_increased_zoom",
			"kerillian_waywatcher_ability_cooldown_on_hit",
			"kerillian_waywatcher_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_we_3b",
				description = "career_passive_desc_we_3b"
			},
			{
				display_name = "career_passive_name_we_3c",
				description = "career_passive_desc_we_3c"
			}
		}
	},
	wh_1 = {
		description = "career_passive_desc_wh_1a",
		display_name = "career_passive_name_wh_1",
		icon = "victor_zealot_passive",
		buffs = {
			"victor_zealot_passive_increased_damage",
			"victor_zealot_passive_uninterruptible_heavy",
			"victor_zealot_invulnerability_cooldown",
			"victor_zealot_ability_cooldown_on_hit",
			"victor_zealot_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_wh_1b",
				description = "career_passive_desc_wh_1b"
			},
			{
				display_name = "career_passive_name_wh_1c",
				description = "career_passive_desc_wh_1c"
			}
		}
	},
	wh_2 = {
		description = "career_passive_desc_wh_2a",
		display_name = "career_passive_name_wh_2",
		icon = "victor_bountyhunter_passive",
		buffs = {
			"victor_bountyhunter_passive_crit_buff",
			"victor_bountyhunter_passive_crit_buff_removal",
			"victor_bountyhunter_passive_reload_speed",
			"victor_bountyhunter_passive_increased_ammunition",
			"victor_bountyhunter_activate_passive_on_melee_kill",
			"victor_bountyhunter_ability_cooldown_on_hit",
			"victor_bountyhunter_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_wh_2b",
				description = "career_passive_desc_wh_2b"
			},
			{
				display_name = "career_passive_name_wh_2c",
				description = "career_passive_desc_wh_2c"
			}
		}
	},
	wh_3 = {
		description = "career_passive_desc_wh_3a",
		display_name = "career_passive_name_wh_3",
		icon = "victor_witchhunter_passive",
		buffs = {
			"victor_witchhunter_passive",
			"victor_witchhunter_passive_block_cost_reduction",
			"victor_witchhunter_headshot_crit_killing_blow",
			"victor_witchhunter_headshot_multiplier_increase",
			"victor_witchhunter_ability_cooldown_on_hit",
			"victor_witchhunter_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_wh_3b",
				description = "career_passive_desc_wh_3b"
			},
			{
				display_name = "career_passive_name_wh_3c",
				description = "career_passive_desc_wh_3c"
			}
		}
	},
	bw_1 = {
		description = "career_passive_desc_bw_1a",
		display_name = "career_passive_name_bw_1",
		icon = "sienna_scholar_passive",
		buffs = {
			"sienna_scholar_passive",
			"sienna_scholar_passive_ranged_damage",
			"sienna_scholar_ability_cooldown_on_hit",
			"sienna_scholar_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_bw_1b",
				description = "career_passive_desc_bw_1b"
			}
		}
	},
	bw_2 = {
		description = "career_passive_desc_bw_2a",
		display_name = "career_passive_name_bw_2",
		icon = "sienna_adept_passive",
		buffs = {
			"sienna_adept_passive",
			"sienna_adept_passive_reset_on_damage_taken",
			"sienna_adept_passive_reset_on_spell_used",
			"sienna_adept_passive_overcharge_charge_speed_increased",
			"sienna_adept_passive_ranged_damage",
			"sienna_adept_ability_cooldown_on_hit",
			"sienna_adept_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_bw_2b",
				description = "career_passive_desc_bw_2b"
			},
			{
				display_name = "career_passive_name_bw_2c",
				description = "career_passive_desc_bw_2c"
			}
		}
	},
	bw_3 = {
		description = "career_passive_desc_bw_3a",
		display_name = "career_passive_name_bw_3",
		icon = "sienna_unchained_passive",
		buffs = {
			"sienna_unchained_passive",
			"sienna_unchained_passive_overcharged_blocks",
			"sienna_unchained_passive_increased_melee_power_on_overcharge",
			"sienna_unchained_ability_cooldown_on_hit",
			"sienna_unchained_ability_cooldown_on_damage_taken"
		},
		perks = {
			{
				display_name = "career_passive_name_bw_3b",
				description = "career_passive_desc_bw_3b"
			},
			{
				display_name = "career_passive_name_bw_3c",
				description = "career_passive_desc_bw_3c"
			},
			{
				display_name = "career_passive_name_bw_3d",
				description = "career_passive_desc_bw_3d"
			}
		}
	}
}

for career, data in pairs(ActivatedAbilitySettings) do
	if data.action_name then
		fassert(not data.ability_class, "Activated ability for \"%s\" cannot have an ability class if it is a weapon action", career)
	end

	if data.ability_class then
		fassert(not data.action_name, "Activated ability for \"%s\" cannot have a weapon action if it uses an ability class", career)
	end

	fassert(data.action_name or data.ability_class, "Activated ability for \"%s\" must have either a weapon action or an ability class", career)
end

return
