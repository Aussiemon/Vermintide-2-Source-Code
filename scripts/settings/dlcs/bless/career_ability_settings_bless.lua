-- chunkname: @scripts/settings/dlcs/bless/career_ability_settings_bless.lua

require("scripts/settings/dlcs/bless/passive_ability_warrior_priest")

ActivatedAbilitySettings.wh_priest = {
	{
		action_name = "action_career_wh_priest",
		cooldown = 70,
		description = "career_active_desc_wh_priest",
		display_name = "career_active_name_wh_priest",
		icon = "victor_priest_activated_ability",
		weapon_name = "wh_priest_career_skill_weapon",
		mechanism_overrides = {
			versus = {
				cooldown = 100,
			},
		},
	},
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
		"victor_priest_ability_cooldown_on_damage_taken",
	},
	husk_buffs = {
		"victor_priest_curse_resistance",
	},
	perks = {
		{
			description = "career_passive_desc_wh_priest_a",
			display_name = "career_passive_name_wh_priest_a",
		},
		{
			description = "career_passive_desc_wh_priest_b",
			display_name = "career_passive_name_wh_priest_b",
		},
		{
			description = "career_passive_desc_wh_priest_c",
			display_name = "career_passive_name_wh_priest_c",
		},
	},
	passive_ability_classes = {
		{
			name = "wh_priest",
			ability_class = PassiveAbilityWarriorPriest,
			init_data = {
				resource_per_breed = {
					on_boss = 200,
					on_elite = 6,
					on_normal = 2,
					on_special = 8,
					mechanism_overrides = {
						versus = {
							on_boss = 200,
							on_elite = 12,
							on_normal = 2,
							on_special = 16,
						},
					},
				},
			},
		},
	},
}
