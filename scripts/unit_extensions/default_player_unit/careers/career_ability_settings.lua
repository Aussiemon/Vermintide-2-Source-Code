-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_settings.lua

require("scripts/settings/profiles/career_constants")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_bw_adept")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_bw_unchained")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_bw_necromancer_wave")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_dr_ironbreaker")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_dr_slayer")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_es_huntsman")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_es_knight")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_es_mercenary")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_we_maiden_guard")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_we_shade")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_we_shade_dash")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_wh_captain")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_wh_zealot")

ActivatedAbilitySettings = {
	dr_1 = {
		{
			cooldown = 120,
			description = "career_active_desc_dr_1",
			display_name = "career_active_name_dr_1",
			icon = "bardin_ironbreaker_activated_ability",
			ability_class = CareerAbilityDRIronbreaker,
		},
	},
	dr_2 = {
		{
			cooldown = 40,
			description = "career_active_desc_dr_2_2",
			display_name = "career_active_name_dr_2",
			icon = "bardin_slayer_activated_ability",
			ability_class = CareerAbilityDRSlayer,
		},
	},
	dr_3 = {
		{
			action_name = "action_career_dr_3",
			cooldown = 120,
			description = "career_active_desc_dr_3_2",
			display_name = "career_active_name_dr_3",
			icon = "bardin_ranger_activated_ability",
			weapon_name = "bardin_ranger_career_skill_weapon",
		},
	},
	es_1 = {
		{
			cooldown = 90,
			description = "career_active_desc_es_1_2",
			display_name = "career_active_name_es_1",
			icon = "markus_huntsman_activated_ability",
			ability_class = CareerAbilityESHuntsman,
		},
	},
	es_2 = {
		{
			cooldown = 30,
			description = "career_active_desc_es_2",
			display_name = "career_active_name_es_2",
			icon = "markus_knight_activated_ability",
			ability_class = CareerAbilityESKnight,
		},
	},
	es_3 = {
		{
			cooldown = 90,
			description = "career_active_desc_markus_mercenary_2",
			display_name = "career_active_name_markus_mercenary",
			icon = "markus_mercenary_activated_ability",
			ability_class = CareerAbilityESMercenary,
		},
	},
	we_1 = {
		{
			cooldown = 70,
			description = "career_active_desc_we_1_2",
			display_name = "career_active_name_we_1",
			icon = "kerillian_shade_activated_ability",
			ability_class = CareerAbilityWEShade,
		},
		{
			cooldown = 70,
			description = "career_active_desc_we_1_2",
			display_name = "career_active_name_we_1",
			icon = "kerillian_shade_activated_ability",
			ability_class = CareerAbilityWEShadeDash,
		},
	},
	we_2 = {
		{
			cooldown = 20,
			description = "career_active_desc_we_2_2",
			display_name = "career_active_name_we_2",
			icon = "kerillian_maidenguard_activated_ability",
			ability_class = CareerAbilityWEMaidenGuard,
		},
	},
	we_3 = {
		{
			action_name = "action_career_we_3",
			cooldown = 80,
			description = "career_active_desc_we_3",
			display_name = "career_active_name_we_3",
			icon = "kerillian_waywatcher_activated_ability",
			weapon_name = "kerillian_waywatcher_career_skill_weapon",
		},
		{
			action_name = "action_career_we_3_piercing",
			cooldown = 80,
			description = "career_active_desc_we_3",
			display_name = "career_active_name_we_3",
			icon = "kerillian_waywatcher_activated_ability",
			weapon_name = "kerillian_waywatcher_career_skill_weapon_piercing_shot",
		},
	},
	wh_1 = {
		{
			cooldown = 60,
			description = "career_active_desc_wh_1",
			display_name = "career_active_name_wh_1",
			icon = "victor_zealot_activated_ability",
			ability_class = CareerAbilityWHZealot,
		},
	},
	wh_2 = {
		{
			action_name = "action_career_wh_2",
			cooldown = 70,
			description = "career_active_desc_wh_2",
			display_name = "career_active_name_wh_2",
			icon = "victor_bountyhunter_activated_ability",
			weapon_name = "victor_bountyhunter_career_skill_weapon",
		},
	},
	wh_3 = {
		{
			cooldown = 90,
			description = "career_active_desc_victor_witchhunter_2",
			display_name = "career_active_name_victor_witchhunter",
			icon = "victor_witchhunter_activated_ability",
			ability_class = CareerAbilityWHCaptain,
		},
	},
	bw_1 = {
		{
			action_name = "action_career_bw_1",
			cooldown = 50,
			description = "career_active_desc_bw_1",
			display_name = "career_active_name_bw_1",
			icon = "sienna_scholar_activated_ability",
			weapon_name = "sienna_scholar_career_skill_weapon",
		},
	},
	bw_2 = {
		{
			cooldown = 50,
			description = "career_active_desc_bw_2_2",
			display_name = "career_active_name_bw_2",
			icon = "sienna_adept_activated_ability",
			ability_class = CareerAbilityBWAdept,
		},
	},
	bw_3 = {
		{
			cooldown = 120,
			description = "career_active_desc_bw_3",
			display_name = "career_active_name_bw_3",
			icon = "sienna_unchained_activated_ability",
			ability_class = CareerAbilityBWUnchained,
		},
	},
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
			"bardin_ironbreaker_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_dr_1b_2",
				display_name = "career_passive_name_dr_1b",
			},
			{
				description = "career_passive_desc_dr_1c_2",
				display_name = "career_passive_name_dr_1c",
			},
			{
				description = "career_passive_desc_dr_1d_2",
				display_name = "career_passive_name_dr_1d",
			},
		},
	},
	dr_2 = {
		description = "career_passive_desc_dr_2a_2",
		display_name = "career_passive_name_dr_2",
		icon = "bardin_slayer_passive",
		buffs = {
			"bardin_slayer_passive_attack_speed",
			"bardin_slayer_passive_stacking_damage_buff_on_hit",
			"bardin_slayer_ability_cooldown_on_damage_taken",
			"bardin_slayer_ability_cooldown_on_hit",
			"bardin_slayer_passive_uninterruptible_heavy",
		},
		perks = {
			{
				description = "career_passive_desc_dr_2b_2",
				display_name = "career_passive_name_dr_2b",
			},
			{
				description = "career_passive_desc_dr_2c",
				display_name = "career_passive_name_dr_2c",
			},
		},
	},
	dr_3 = {
		description = "career_passive_desc_dr_3a_2",
		display_name = "career_passive_name_dr_3",
		icon = "bardin_ranger_passive",
		buffs = {
			"bardin_ranger_passive",
			"bardin_ranger_passive_increased_ammunition",
			"bardin_ranger_passive_reload_speed",
			"bardin_ranger_passive_consumeable_dupe_healing",
			"bardin_ranger_passive_consumeable_dupe_potion",
			"bardin_ranger_passive_consumeable_dupe_grenade",
			"bardin_ranger_ability_cooldown_on_hit",
			"bardin_ranger_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_dr_3b_2",
				display_name = "career_passive_name_dr_3b",
			},
			{
				description = "career_passive_desc_dr_3c_2",
				display_name = "career_passive_name_dr_3c",
			},
			{
				description = "career_passive_desc_dr_3d",
				display_name = "career_passive_name_dr_3d",
			},
		},
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
			"markus_huntsman_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_es_1b",
				display_name = "career_passive_name_es_1b",
			},
			{
				description = "career_passive_desc_es_1c_2",
				display_name = "career_passive_name_es_1c",
			},
			{
				description = "career_passive_desc_es_1d",
				display_name = "career_passive_name_es_1d",
			},
		},
	},
	es_2 = {
		description = "career_passive_desc_es_2a_2",
		display_name = "career_passive_name_es_2",
		icon = "markus_knight_passive",
		buffs = {
			"markus_knight_passive",
			"markus_knight_passive_damage_reduction",
			"markus_knight_passive_increased_stamina",
			"markus_knight_ability_cooldown_on_hit",
			"markus_knight_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_es_2b_2",
				display_name = "career_passive_name_es_2b",
			},
			{
				description = "career_passive_desc_es_2c_2",
				display_name = "career_passive_name_es_2c",
			},
		},
	},
	es_3 = {
		description = "career_passive_desc_es_3a",
		display_name = "career_passive_name_es_3",
		icon = "markus_mercenary_passive",
		buffs = {
			"markus_mercenary_passive",
			"markus_mercenary_ability_cooldown_on_hit",
			"markus_mercenary_ability_cooldown_on_damage_taken",
			"markus_mercenary_passive_hit_mass_reduction",
			"markus_mercenary_passive_crit_chance",
		},
		perks = {
			{
				description = "career_passive_desc_es_3b",
				display_name = "career_passive_name_es_3b",
			},
			{
				description = "career_passive_desc_es_3c_2",
				display_name = "career_passive_name_es_3c",
			},
		},
	},
	we_1 = {
		description = "career_passive_desc_we_1b_2",
		display_name = "career_passive_name_we_1b",
		icon = "kerillian_shade_passive",
		buffs = {
			"kerillian_shade_passive",
			"kerillian_shade_passive_sfx",
			"kerillian_shade_passive_backstab_killing_blow",
			"kerillian_shade_passive_stealth_parry",
			"kerillian_shade_stealth_crits",
			"kerillian_shade_stealth_crits_remover",
			"kerillian_shade_ability_cooldown_on_hit",
			"kerillian_shade_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_we_1a_2",
				display_name = "career_passive_name_we_1_2",
			},
			{
				description = "career_passive_desc_we_1d",
				display_name = "career_passive_name_we_1d",
			},
			{
				description = "career_passive_desc_we_1a_3",
				display_name = "career_passive_name_we_1",
			},
		},
	},
	we_2 = {
		description = "career_passive_desc_we_2a_2",
		display_name = "career_passive_name_we_2",
		icon = "kerillian_maidenguard_passive",
		buffs = {
			"kerillian_maidenguard_passive_dodge",
			"kerillian_maidenguard_passive_dodge_speed",
			"kerillian_maidenguard_passive_stamina_regen_aura",
			"kerillian_maidenguard_passive_increased_stamina",
			"kerillian_maidenguard_ress_time",
			"kerillian_maidenguard_ability_cooldown_on_hit",
			"kerillian_maidenguard_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_we_2b_2",
				display_name = "career_passive_name_we_2b",
			},
			{
				description = "career_passive_desc_we_2c_2",
				display_name = "career_passive_name_we_2c",
			},
		},
	},
	we_3 = {
		description = "career_passive_desc_we_3a_2",
		display_name = "career_passive_name_we_3",
		icon = "kerillian_waywatcher_passive",
		buffs = {
			"kerillian_waywatcher_passive",
			"kerillian_waywatcher_passive_no_damage_dropoff",
			"kerillian_waywatcher_passive_increased_ammunition",
			"kerillian_waywatcher_passive_increased_zoom",
			"kerillian_waywatcher_ability_cooldown_on_hit",
			"kerillian_waywatcher_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_we_3b_3",
				display_name = "career_passive_name_we_3b",
			},
			{
				description = "career_passive_desc_we_3c",
				display_name = "career_passive_name_we_3c",
			},
			{
				description = "career_passive_desc_we_3d_2",
				display_name = "career_passive_name_we_3d",
			},
		},
	},
	wh_1 = {
		description = "career_passive_desc_wh_1a",
		display_name = "career_passive_name_wh_1",
		icon = "victor_zealot_passive",
		buffs = {
			"victor_zealot_passive_increased_damage",
			"victor_zealot_passive_uninterruptible_heavy",
			"victor_zealot_gain_invulnerability_on_lethal_damage_taken",
			"victor_zealot_ability_cooldown_on_hit",
			"victor_zealot_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_dr_2c",
				display_name = "career_passive_name_wh_1b",
			},
			{
				description = "career_passive_desc_wh_1c",
				display_name = "career_passive_name_wh_1c",
			},
		},
	},
	wh_2 = {
		description = "career_passive_desc_wh_2a_2",
		display_name = "career_passive_name_wh_2",
		icon = "victor_bountyhunter_passive",
		buffs = {
			"victor_bountyhunter_passive_crit_buff",
			"victor_bountyhunter_passive_crit_buff_removal",
			"victor_bountyhunter_passive_reload_speed",
			"victor_bountyhunter_passive_increased_ammunition",
			"victor_bountyhunter_ability_cooldown_on_hit",
			"victor_bountyhunter_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_wh_2b_2",
				display_name = "career_passive_name_wh_2b",
			},
			{
				description = "career_passive_desc_wh_2c_2",
				display_name = "career_passive_name_wh_2c",
			},
		},
	},
	wh_3 = {
		description = "career_passive_desc_wh_3a_2",
		display_name = "career_passive_name_wh_3",
		icon = "victor_witchhunter_passive",
		buffs = {
			"victor_witchhunter_passive",
			"victor_witchhunter_passive_block_cost_reduction",
			"victor_witchhunter_headshot_crit_killing_blow",
			"victor_witchhunter_headshot_multiplier_increase",
			"victor_witchhunter_ability_cooldown_on_hit",
			"victor_witchhunter_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_wh_3b",
				display_name = "career_passive_name_wh_3b",
			},
			{
				description = "career_passive_desc_wh_3c",
				display_name = "career_passive_name_wh_3c",
			},
		},
	},
	bw_1 = {
		description = "career_passive_desc_bw_1a_2",
		display_name = "career_passive_name_bw_1",
		icon = "sienna_scholar_passive",
		buffs = {
			"sienna_scholar_passive",
			"sienna_scholar_passive_ranged_damage",
			"sienna_scholar_passive_max_overcharge",
			"sienna_scholar_ability_cooldown_on_hit",
			"sienna_scholar_ability_cooldown_on_damage_taken",
			"sienna_scholar_overcharge_no_slow",
		},
		perks = {
			{
				description = "career_passive_desc_bw_1b_2",
				display_name = "career_passive_name_bw_1b",
			},
			{
				description = "sienna_scholar_overcharge_no_slow_desc",
				display_name = "sienna_scholar_overcharge_no_slow",
			},
			{
				description = "sienna_scholar_increased_max_desc",
				display_name = "sienna_scholar_increased_max",
				description_values = {
					{
						value_type = "percent",
						value = CareerConstants.bw_scholar.perk_3_max_overcharge,
					},
				},
			},
		},
	},
	bw_2 = {
		description = "career_passive_desc_bw_2a_2",
		display_name = "career_passive_name_bw_2",
		icon = "sienna_adept_passive",
		buffs = {
			"sienna_adept_passive",
			"sienna_adept_passive_reset_on_spell_used",
			"sienna_adept_passive_overcharge_charge_speed_increased",
			"sienna_adept_passive_ranged_damage",
			"sienna_adept_ability_cooldown_on_hit",
			"sienna_adept_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_bw_2b_2",
				display_name = "career_passive_name_bw_2b",
			},
			{
				description = "career_passive_desc_bw_2c_2",
				display_name = "career_passive_name_bw_2c",
			},
		},
	},
	bw_3 = {
		description = "career_passive_desc_bw_3a",
		display_name = "career_passive_name_bw_3",
		icon = "sienna_unchained_passive",
		buffs = {
			"sienna_unchained_passive",
			"sienna_unchained_passive_increased_melee_power_on_overcharge",
			"sienna_unchained_ability_cooldown_on_hit",
			"sienna_unchained_ability_cooldown_on_damage_taken",
		},
		perks = {
			{
				description = "career_passive_desc_bw_3b",
				display_name = "career_passive_name_bw_3b",
			},
			{
				description = "career_passive_desc_bw_3c_2",
				display_name = "career_passive_name_bw_3c",
			},
		},
	},
}

DLCUtils.require_list("career_ability_settings")

for career, ability_list in pairs(ActivatedAbilitySettings) do
	for i = 1, #ability_list do
		local data = ability_list[i]

		if data.action_name then
			fassert(not data.ability_class, "Activated ability for \"%s\" cannot have an ability class if it is a weapon action", career)
		end

		if data.ability_class then
			fassert(not data.action_name, "Activated ability for \"%s\" cannot have a weapon action if it uses an ability class", career)
		end

		fassert(data.action_name or data.ability_class, "Activated ability for \"%s\" must have either a weapon action or an ability class", career)
	end
end
