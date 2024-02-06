-- chunkname: @scripts/settings/equipment/damage_profile_templates_dlc_anvil.lua

local damage_templates = {
	light_slashing_smiter_pull = {
		armor_modifier = "armor_modifier_pull_smiter_L",
		charge_value = "light_attack",
		cleave_distribution = "cleave_distribution_linesman_M",
		critical_strike = "critical_strike_pull_smiter_L",
		default_target = "default_target_pull_smiter_L",
		is_pull = true,
		stagger_duration_modifier = 1.5,
		targets = "targets_pull_smiter_L",
	},
	billhook_medium_push = {
		armor_modifier = "armor_modifier_push_M",
		charge_value = "action_push",
		cleave_distribution = "cleave_distribution_push_default",
		damage_type = "push",
		default_target = "target_push_M",
		is_push = true,
		no_damage = true,
		stagger_distance_modifier = 1,
		stagger_duration_modifier = 2,
	},
	billhook_light_push = {
		armor_modifier = "armor_modifier_push_L",
		charge_value = "action_push",
		cleave_distribution = "cleave_distribution_push_default",
		damage_type = "push",
		default_target = "target_push_L",
		is_push = true,
		no_damage = true,
		stagger_distance_modifier = 1,
		stagger_duration_modifier = 2,
	},
	flaming_flail_explosion = {
		charge_value = "aoe",
		no_stagger_damage_reduction = true,
		armor_modifier = {
			attack = {
				1,
				0.25,
				1.5,
				1,
				0.75,
				0,
			},
			impact = {
				1,
				0.75,
				1,
				1,
				0.75,
				0,
			},
		},
		default_target = {
			attack_template = "drakegun",
			damage_type = "drakegun",
			power_distribution = {
				attack = 0.1,
				impact = 0.5,
			},
		},
	},
}

damage_templates.flaming_flail_explosion_glance = table.clone(damage_templates.flaming_flail_explosion)
damage_templates.flaming_flail_explosion_glance.default_target.dot_template_name = nil

return damage_templates
