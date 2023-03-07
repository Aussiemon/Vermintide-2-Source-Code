require("scripts/settings/dlcs/bless/passive_ability_warrior_priest")

ActivatedAbilitySettings.wh_priest = {
	{
		description = "career_active_desc_wh_priest",
		weapon_name = "wh_priest_career_skill_weapon",
		display_name = "career_active_name_wh_priest",
		cooldown = 70,
		icon = "victor_priest_activated_ability",
		action_name = "action_career_wh_priest"
	}
}
PassiveAbilitySettings.wh_priest = {
	description = "career_passive_desc_wh_priest",
	display_name = "career_passive_name_wh_priest",
	icon = "victor_priest_passive",
	buffs = {
		"victor_priest_passive_damage_stagger",
		"victor_priest_super_armour_damage",
		"victor_priest_curse_resistance",
		"victor_priest_ability_cooldown_on_hit",
		"victor_priest_ability_cooldown_on_damage_taken"
	},
	husk_buffs = {
		"victor_priest_curse_resistance"
	},
	perks = {
		{
			display_name = "career_passive_name_wh_priest_a",
			description = "career_passive_desc_wh_priest_a"
		},
		{
			display_name = "career_passive_name_wh_priest_b",
			description = "career_passive_desc_wh_priest_b"
		},
		{
			display_name = "career_passive_name_wh_priest_c",
			description = "career_passive_desc_wh_priest_c"
		}
	},
	passive_ability_classes = {
		{
			ability_class = PassiveAbilityWarriorPriest,
			init_data = {
				resource_per_breed = {
					on_boss = 200,
					on_normal = 2,
					on_special = 8,
					on_elite = 6
				}
			}
		}
	}
}
