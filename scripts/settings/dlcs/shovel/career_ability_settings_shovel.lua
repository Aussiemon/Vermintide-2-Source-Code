require("scripts/unit_extensions/default_player_unit/careers/career_ability_bw_necromancer_wave")
require("scripts/settings/dlcs/shovel/passive_ability_necromancer_charges")
require("scripts/settings/dlcs/shovel/passive_ability_necromancer")
require("scripts/unit_extensions/default_player_unit/careers/career_ability_bw_necromancer_command")
require("scripts/settings/profiles/career_constants")

ActivatedAbilitySettings.bw_necromancer = {
	{
		description = "career_active_desc_bw_necromancer_2",
		name = "bw_necromancer",
		display_name = "career_active_name_bw_necromancer_2",
		cooldown = 110,
		icon = "sienna_necromancer_passive",
		action_name = "action_career_bw_necromancer",
		weapon_name = "bw_necromancer_career_skill_weapon",
		description_values = {}
	}
}
PassiveAbilitySettings.bw_necromancer = {
	description = "career_passive_desc_bw_necromancer",
	display_name = "career_passive_name_bw_necromancer",
	icon = "sienna_necromancer_activated_ability",
	description_values = {
		{
			value = 20
		}
	},
	buffs = {
		"sienna_necromancer_passive_balefire",
		"sienna_necromancer_perk_dot_duration",
		"sienna_necromancer_perk_3",
		"sienna_necromancer_career_skill_damage_proc_aura",
		"sienna_necromancer_ability_cooldown_on_hit",
		"sienna_necromancer_ability_cooldown_on_damage_taken"
	},
	perks = {
		{
			description = "career_passive_desc_bw_necromancer_a",
			display_name = "career_passive_name_bw_necromancer_a",
			description_values = {}
		},
		{
			description = "career_passive_desc_bw_necromancer_b",
			display_name = "career_passive_name_bw_necromancer_b",
			description_values = {
				{
					value_type = "percent",
					value = CareerConstants.bw_necromancer.passive_dot_duration
				}
			}
		},
		{
			description = "career_passive_desc_bw_necromancer_c",
			display_name = "career_passive_name_bw_necromancer_c",
			description_values = {
				{
					value_type = "percent",
					value = CareerConstants.bw_necromancer.lifetaker_bonus
				},
				{
					value = CareerConstants.bw_necromancer.lifetaker_duration
				},
				{
					value = CareerConstants.bw_necromancer.lifetaker_max_stacks
				}
			}
		}
	},
	passive_ability_classes = {
		{
			name = "bw_necromancer",
			ability_class = PassiveAbilityNecromancerCharges
		},
		{
			name = "bw_necromancer_command",
			ability_class = CareerAbilityBWNecromancerCommand
		}
	}
}
