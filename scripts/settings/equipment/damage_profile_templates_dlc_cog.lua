local engineer_ability_shot_dropoff_ranges = {
	dropoff_start = 10,
	dropoff_end = 20
}
local shotgun_dropoff_ranges = {
	dropoff_start = 8,
	dropoff_end = 15
}
local damage_templates = {
	engineer_ability_shot = {
		charge_value = "instant_projectile",
		shield_break = false,
		friendly_fire_multiplier = 0.15,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.25,
				1,
				1,
				1,
				0.25
			},
			impact_armor_power_modifer = {
				1,
				0.25,
				1,
				1,
				1,
				0.25
			}
		},
		armor_modifier_near = {
			attack = {
				1,
				0.1,
				1,
				1,
				1,
				0
			},
			impact = {
				1,
				0.1,
				1,
				1,
				1,
				0
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				0.1,
				1,
				1,
				1,
				0
			},
			impact = {
				1,
				0.1,
				1,
				1,
				1,
				0
			}
		},
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		default_target = {
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.6,
			attack_template = "shot_machinegun",
			power_distribution_near = {
				attack = 0.25,
				impact = 0.075
			},
			power_distribution_far = {
				attack = 0.125,
				impact = 0.05
			},
			range_modifier_settings = engineer_ability_shot_dropoff_ranges
		}
	},
	engineer_ability_shot_armor_pierce = {
		charge_value = "instant_projectile",
		shield_break = true,
		friendly_fire_multiplier = 0.2,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1,
				0.5
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier_near = {
			attack = {
				1,
				1,
				1,
				1,
				0.5,
				0.4
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				0.4
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				1,
				1,
				1,
				0.5,
				0.4
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				0.4
			}
		},
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		default_target = {
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.6,
			attack_template = "shot_repeating_handgun",
			power_distribution_near = {
				attack = 0.48,
				impact = 0.3
			},
			power_distribution_far = {
				attack = 0.36,
				impact = 0.25
			},
			range_modifier_settings = engineer_ability_shot_dropoff_ranges
		}
	},
	shot_sniper_pistol = {
		charge_value = "instant_projectile",
		no_stagger_damage_reduction_ranged = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1.4,
				1.5,
				1,
				0.75,
				0.5
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1,
				1
			}
		},
		armor_modifier_near = {
			attack = {
				1,
				1.2,
				1.5,
				1,
				0.75,
				0
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				0
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				1,
				1,
				1,
				0.75,
				0
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				0
			}
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.3
		},
		default_target = {
			boost_curve_coefficient_headshot = 1,
			headshot_boost_boss = 0.5,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 1,
			attack_template = "shot_sniper",
			power_distribution_near = {
				attack = 1,
				impact = 0.5
			},
			power_distribution_far = {
				attack = 0.5,
				impact = 0.5
			},
			range_modifier_settings = shotgun_dropoff_ranges
		}
	}
}

return damage_templates
