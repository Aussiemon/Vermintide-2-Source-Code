-- chunkname: @scripts/settings/equipment/damage_profile_templates_scorpion.lua

local damage_templates = {
	ungor_archer_arrow = {
		charge_value = "projectile",
		no_stagger_damage_reduction = true,
		cleave_distribution = {
			attack = 0,
			impact = 0,
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1,
				1,
				0.5,
				0,
			},
			impact = {
				1,
				1,
				1,
				1,
				0.5,
				0,
			},
		},
		default_target = {
			attack_template = "arrow_ungor",
			boost_curve_coefficient = 0.2,
			boost_curve_type = "default",
			power_distribution = {
				attack = 0.5,
				impact = 5,
			},
		},
	},
	standard_bearer_explosion = {
		charge_value = "grenade",
		is_explosion = true,
		no_damage = true,
		stagger_duration_modifier = 0.1,
		armor_modifier = {
			attack = {
				1,
				0.5,
				1,
				1,
				1,
			},
			impact = {
				1,
				0.5,
				100,
				1,
				1,
			},
		},
		default_target = {
			attack_template = "basic_sweep_push",
			damage_type = "push",
			power_distribution = {
				attack = 0,
				impact = 0.4,
			},
		},
	},
	standard_death_explosion = {
		charge_value = "grenade",
		is_explosion = true,
		no_damage = true,
		stagger_duration_modifier = 0.1,
		armor_modifier = {
			attack = {
				0,
				0,
				0,
				1,
				0,
			},
			impact = {
				1,
				0.5,
				100,
				1,
				1,
			},
		},
		default_target = {
			attack_template = "basic_sweep_push",
			damage_type = "push",
			power_distribution = {
				attack = 0,
				impact = 0.2,
			},
		},
	},
}

return damage_templates
