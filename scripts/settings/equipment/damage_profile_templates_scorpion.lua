local damage_templates = {
	ungor_archer_arrow = {
		no_stagger_damage_reduction = true,
		charge_value = "projectile",
		cleave_distribution = {
			attack = 0,
			impact = 0
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1,
				1,
				0.5,
				0
			},
			impact = {
				1,
				1,
				1,
				1,
				0.5,
				0
			}
		},
		default_target = {
			boost_curve_type = "default",
			boost_curve_coefficient = 0.2,
			attack_template = "arrow_ungor",
			power_distribution = {
				attack = 0.5,
				impact = 5
			}
		}
	},
	standard_bearer_explosion = {
		stagger_duration_modifier = 0.1,
		charge_value = "grenade",
		is_explosion = true,
		no_damage = true,
		armor_modifier = {
			attack = {
				1,
				0.5,
				1,
				1,
				1
			},
			impact = {
				1,
				0.5,
				100,
				1,
				1
			}
		},
		default_target = {
			damage_type = "push",
			attack_template = "basic_sweep_push",
			power_distribution = {
				attack = 0,
				impact = 0.4
			}
		}
	},
	standard_death_explosion = {
		stagger_duration_modifier = 0.1,
		charge_value = "grenade",
		is_explosion = true,
		no_damage = true,
		armor_modifier = {
			attack = {
				0,
				0,
				0,
				1,
				0
			},
			impact = {
				1,
				0.5,
				100,
				1,
				1
			}
		},
		default_target = {
			damage_type = "push",
			attack_template = "basic_sweep_push",
			power_distribution = {
				attack = 0,
				impact = 0.2
			}
		}
	}
}

return damage_templates
