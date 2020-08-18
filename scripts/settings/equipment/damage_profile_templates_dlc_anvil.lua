local damage_templates = {
	light_slashing_smiter_pull = {
		stagger_duration_modifier = 1.5,
		critical_strike = "critical_strike_pull_smiter_L",
		charge_value = "light_attack",
		cleave_distribution = "cleave_distribution_linesman_M",
		default_target = "default_target_pull_smiter_L",
		targets = "targets_pull_smiter_L",
		armor_modifier = "armor_modifier_pull_smiter_L",
		is_pull = true
	},
	billhook_medium_push = {
		default_target = "target_push_M",
		stagger_duration_modifier = 2,
		charge_value = "action_push",
		damage_type = "push",
		armor_modifier = "armor_modifier_push_M",
		is_push = true,
		cleave_distribution = "cleave_distribution_push_default",
		stagger_distance_modifier = 1,
		no_damage = true
	},
	billhook_light_push = {
		default_target = "target_push_L",
		stagger_duration_modifier = 2,
		charge_value = "action_push",
		damage_type = "push",
		armor_modifier = "armor_modifier_push_L",
		is_push = true,
		cleave_distribution = "cleave_distribution_push_default",
		stagger_distance_modifier = 1,
		no_damage = true
	},
	flaming_flail_explosion = {
		no_stagger_damage_reduction = true,
		charge_value = "aoe",
		armor_modifier = {
			attack = {
				1,
				0.25,
				1.5,
				1,
				0.75,
				0
			},
			impact = {
				1,
				0.75,
				1,
				1,
				0.75,
				0
			}
		},
		default_target = {
			attack_template = "drakegun",
			damage_type = "drakegun",
			power_distribution = {
				attack = 0.1,
				impact = 0.5
			}
		}
	},
	flaming_flail_explosion_glance = table.clone(damage_templates.flaming_flail_explosion)
}
damage_templates.flaming_flail_explosion_glance.default_target.dot_template_name = nil

return damage_templates
