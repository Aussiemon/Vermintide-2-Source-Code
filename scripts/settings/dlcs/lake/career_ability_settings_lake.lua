require("scripts/settings/dlcs/lake/passive_ability_questing_knight")

ActivatedAbilitySettings.es_4 = {
	{
		description = "career_active_desc_markus_questingknight",
		action_name = "action_career_es_4",
		display_name = "career_active_name_markus_questingknight",
		cooldown = 60,
		icon = "markus_questing_knight_activated_ability",
		weapon_name = "markus_questingknight_career_skill_weapon"
	}
}
PassiveAbilitySettings.es_4 = {
	description = "career_passive_desc_es_4a",
	display_name = "career_passive_name_es_4a",
	icon = "markus_questing_knight_passive",
	buffs = {
		"markus_questing_knight_ability_cooldown_on_hit",
		"markus_questing_knight_ability_cooldown_on_damage_taken",
		"markus_questing_knight_perk_movement_speed",
		"markus_questing_knight_perk_first_target_damage",
		"markus_questing_knight_perk_power_block"
	},
	perks = {
		{
			display_name = "career_passive_name_es_4b",
			description = "career_passive_desc_es_4b"
		},
		{
			display_name = "career_passive_name_es_4c",
			description = "career_passive_desc_es_4c"
		},
		{
			display_name = "career_passive_name_es_4d",
			description = "career_passive_desc_es_4d"
		}
	},
	passive_ability_classes = {
		{
			name = "es_4",
			ability_class = PassiveAbilityQuestingKnight,
			init_data = {}
		}
	}
}
