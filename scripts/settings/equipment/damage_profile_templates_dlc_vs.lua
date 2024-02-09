-- chunkname: @scripts/settings/equipment/damage_profile_templates_dlc_vs.lua

local shotgun_dropoff_ranges = {
	dropoff_end = 15,
	dropoff_start = 8,
}
local machinegun_dropoff_ranges = {
	dropoff_end = 30,
	dropoff_start = 10,
}
local machinegun_shotgun_dropoff_ranges = {
	dropoff_end = 50,
	dropoff_start = 30,
}
local carbine_dropoff_ranges = {
	dropoff_end = 30,
	dropoff_start = 15,
}
local sniper_dropoff_ranges = {
	dropoff_end = 50,
	dropoff_start = 30,
}
local flamethrower_dropoff_ranges = {
	dropoff_end = 8,
	dropoff_start = 4,
}
local rapier_dropoff_ranges = {
	dropoff_end = 10,
	dropoff_start = 5,
}
local damage_templates = {
	ratling_gunner_vs = {
		charge_value = "projectile",
		dot_template_name = "vs_ratling_gunner_slow",
		fatigue_damage_override = "blocked_attack_2",
		no_stagger_damage_reduction_ranged = true,
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25,
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1,
				0.8,
				0.5,
				0,
			},
			impact = {
				1,
				0.5,
				1,
				0.8,
				0.5,
				0,
			},
		},
		default_target = {
			attack_template = "shot_machinegun",
			boost_curve_coefficient = 0.2,
			boost_curve_type = "default",
			power_distribution = {
				attack = 0.1,
				impact = 0.1,
			},
			range_modifier_settings = {
				distance_scaling_steps = {
					{
						distance = 0.1,
						multiplier = 0.06,
					},
					{
						distance = 10,
						multiplier = 0.06,
					},
					{
						distance = 20,
						multiplier = 0.05,
					},
					{
						distance = 30,
						multiplier = 0.04,
					},
				},
			},
		},
	},
	shot_shotgun_vs = {
		charge_value = "instant_projectile",
		no_stagger_damage_reduction_ranged = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.3,
				0.5,
				1,
				1,
				0,
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1,
				0.5,
			},
		},
		armor_modifier_near = {
			attack = {
				1,
				0.4,
				0.4,
				0.75,
				1,
				0,
			},
			impact = {
				1,
				1,
				3,
				0,
				1,
				0.75,
			},
		},
		armor_modifier_far = {
			attack = {
				1,
				0.2,
				0.25,
				0.75,
				1,
				0,
			},
			impact = {
				1,
				0.7,
				0.5,
				0,
				1,
				0.5,
			},
		},
		cleave_distribution = {
			attack = 0.1,
			impact = 0.1,
		},
		default_target = {
			attack_template = "shot_shotgun_vs",
			boost_curve_coefficient = 0.75,
			boost_curve_coefficient_headshot = 0.75,
			boost_curve_type = "linesman_curve",
			power_distribution_near = {
				attack = 0.25,
				impact = 0.3,
			},
			power_distribution_far = {
				attack = 0.15,
				impact = 0.15,
			},
			range_modifier_settings = machinegun_dropoff_ranges,
		},
	},
	staff_fireball_vs = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		require_damage_for_dot = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.65,
				1.5,
				1,
				1,
				0.25,
			},
			impact_armor_power_modifer = {
				1,
				0.6,
				0,
				0,
				1,
				0.25,
			},
		},
		armor_modifier = {
			attack = {
				1,
				0.65,
				1.5,
				1,
				1,
				0,
			},
			impact = {
				1,
				0.6,
				0,
				0,
				0.5,
				0,
			},
		},
		cleave_distribution = {
			attack = 0.15,
			impact = 0.15,
		},
		default_target = {
			attack_template = "fireball",
			boost_curve_coefficient = 0.75,
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "linesman_curve",
			power_distribution_near = {
				attack = 0.45,
				impact = 0.45,
			},
			power_distribution_far = {
				attack = 0.25,
				impact = 0.25,
			},
			range_modifier_settings = carbine_dropoff_ranges,
		},
	},
	crossbow_bolt_vs = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.8,
				1.5,
				1,
				0.5,
				0.25,
			},
			impact_armor_power_modifer = {
				1,
				0.8,
				1,
				1,
				1,
				0.5,
			},
		},
		armor_modifier_near = {
			attack = {
				1,
				0.8,
				1.5,
				1,
				0.75,
				0,
			},
			impact = {
				1,
				0.8,
				1,
				1,
				1,
				0.25,
			},
		},
		armor_modifier_far = {
			attack = {
				1,
				0.6,
				1.5,
				1,
				0.75,
				0,
			},
			impact = {
				1,
				0.6,
				1,
				1,
				1,
				0.25,
			},
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.3,
		},
		default_target = {
			attack_template = "bolt_sniper",
			boost_curve_coefficient = 1,
			boost_curve_coefficient_headshot = 2.5,
			boost_curve_type = "smiter_curve",
			power_distribution_near = {
				attack = 1,
				impact = 0.4,
			},
			power_distribution_far = {
				attack = 0.8,
				impact = 0.3,
			},
			range_modifier_settings = sniper_dropoff_ranges,
		},
	},
	crossbow_bolt_repeating_vs = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1.5,
				1,
				0.5,
				0.25,
			},
			impact_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1,
				0.5,
			},
		},
		armor_modifier_near = {
			attack = {
				1,
				0.5,
				1.5,
				1,
				0.5,
				0,
			},
			impact = {
				1,
				0.5,
				1,
				1,
				1,
				0.25,
			},
		},
		armor_modifier_far = {
			attack = {
				1,
				0.4,
				1.5,
				1,
				0.5,
				0,
			},
			impact = {
				1,
				0.4,
				1,
				1,
				1,
				0.25,
			},
		},
		cleave_distribution = {
			attack = 0.2,
			impact = 0.2,
		},
		default_target = {
			attack_template = "bolt_carbine",
			boost_curve_coefficient = 0.75,
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "smiter_curve",
			power_distribution_near = {
				attack = 0.475,
				impact = 0.35,
			},
			power_distribution_far = {
				attack = 0.35,
				impact = 0.25,
			},
			range_modifier_settings = carbine_dropoff_ranges,
		},
	},
	shot_machinegun_vs = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.75,
				1,
				1,
				1,
				0.25,
			},
			impact_armor_power_modifer = {
				1,
				0.75,
				1,
				1,
				1,
				0.25,
			},
		},
		armor_modifier_near = {
			attack = {
				1,
				0.5,
				1,
				1,
				1,
				0,
			},
			impact = {
				1,
				0.5,
				1,
				1,
				1,
				0,
			},
		},
		armor_modifier_far = {
			attack = {
				1,
				0,
				1,
				1,
				1,
				0,
			},
			impact = {
				1,
				0,
				1,
				1,
				1,
				0,
			},
		},
		cleave_distribution = {
			attack = 0.2,
			impact = 0.2,
		},
		default_target = {
			attack_template = "shot_machinegun",
			boost_curve_coefficient = 0.75,
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "ninja_curve",
			power_distribution_near = {
				attack = 0.425,
				impact = 0.175,
			},
			power_distribution_far = {
				attack = 0.3,
				impact = 0.075,
			},
			range_modifier_settings = machinegun_dropoff_ranges,
		},
	},
	shot_machinegun_shotgun_vs = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.25,
				1,
				1,
				1,
				0.175,
			},
			impact_armor_power_modifer = {
				1,
				0.25,
				1,
				1,
				1,
				0.125,
			},
		},
		armor_modifier_near = {
			attack = {
				1,
				0.25,
				1,
				1,
				1,
				0,
			},
			impact = {
				1,
				1,
				3,
				1,
				1,
				0.75,
			},
		},
		armor_modifier_far = {
			attack = {
				1,
				0.25,
				1,
				1,
				1,
				0,
			},
			impact = {
				1,
				0.7,
				1,
				1,
				1,
				0.5,
			},
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.3,
		},
		default_target = {
			attack_template = "shot_machinegun",
			boost_curve_coefficient = 0.4,
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "ninja_curve",
			power_distribution_near = {
				attack = 0.275,
				impact = 0.3,
			},
			power_distribution_far = {
				attack = 0.25,
				impact = 0.15,
			},
			range_modifier_settings = machinegun_shotgun_dropoff_ranges,
		},
	},
}

return damage_templates
