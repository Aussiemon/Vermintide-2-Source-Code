local damage_templates = {
	burst_thorn = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1.5,
				1,
				0.5,
				0.25
			},
			impact_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier_near = {
			attack = {
				1,
				0.3,
				1,
				0.5,
				1.2,
				0
			},
			impact = {
				1,
				0.4,
				1,
				1,
				1,
				1
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				0,
				1.5,
				0.5,
				1,
				0
			},
			impact = {
				1,
				0.25,
				1,
				1,
				1,
				0.25
			}
		},
		cleave_distribution = {
			attack = 0.1,
			impact = 0.1
		},
		default_target = {
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 0.25,
			attack_template = "bolt_carbine",
			power_distribution_near = {
				attack = 0.12,
				impact = 0.12
			},
			power_distribution_far = {
				attack = 0.1,
				impact = 0.1
			},
			range_modifier_settings = carbine_dropoff_ranges
		}
	},
	spirit_storm = {
		charge_value = "instant_projectile",
		default_target = {}
	},
	medium_javelin_smiter_stab = {
		charge_value = "light_attack",
		melee_boost_override = 2.8,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.4,
				2.2,
				1,
				1
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1
			}
		},
		armor_modifier = {
			attack = {
				1,
				0.25,
				2,
				1,
				0.75
			},
			impact = {
				1,
				0.75,
				1,
				1,
				0.75
			}
		},
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075
		},
		default_target = {
			boost_curve_coefficient_headshot = 2.2,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "stab_smiter",
			power_distribution = {
				attack = 0.25,
				impact = 0.125
			}
		}
	},
	medium_javelin_smiter_stab_bleed = {
		charge_value = "light_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.4,
				2.2,
				1,
				1
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1
			}
		},
		armor_modifier = {
			attack = {
				1,
				0.25,
				2.1,
				1,
				0.75
			},
			impact = {
				1,
				0.75,
				1,
				1,
				0.75
			}
		},
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075
		},
		default_target = {
			boost_curve_coefficient_headshot = 2.2,
			dot_template_name = "weapon_bleed_dot_javelin",
			melee_boost_override = 2.8,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "stab_smiter",
			power_distribution = {
				attack = 0.25,
				impact = 0.125
			}
		}
	},
	heavy_javelin_smiter_stab_bleed = {
		charge_value = "heavy_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				2.2,
				1,
				1
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1
			}
		},
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075
		},
		armor_modifier = {
			attack = {
				1,
				0.3,
				2,
				1,
				0.75
			},
			impact = {
				1,
				0.5,
				1,
				1,
				0.75
			}
		},
		default_target = {
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "heavy_stab_smiter",
			power_distribution = {
				attack = 0.2,
				impact = 0.15
			}
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 2,
				boost_curve_type = "ninja_curve",
				boost_curve_coefficient = 0.75,
				attack_template = "heavy_stab_smiter",
				armor_modifier = {
					attack = {
						1,
						0.45,
						2,
						1,
						0.75
					},
					impact = {
						1,
						0.65,
						1,
						1,
						0.75
					}
				},
				power_distribution = {
					attack = 0.45,
					impact = 0.25
				}
			}
		}
	},
	thrown_javelin = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1,
				1.3,
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
				0.75
			}
		},
		armor_modifier_near = {
			attack = {
				1,
				0.63,
				1.1,
				1,
				0.75,
				0.2
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				0.75
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				0.63,
				1.1,
				1,
				0.75,
				0.2
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				0.5
			}
		},
		cleave_distribution = {
			attack = 0.15,
			impact = 0.15
		},
		default_target = {
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 1,
			attack_template = "projectile_javelin",
			power_distribution_near = {
				attack = 0.76,
				impact = 0.85
			},
			power_distribution_far = {
				attack = 0.55,
				impact = 0.4
			},
			range_modifier_settings = {
				dropoff_start = 15,
				dropoff_end = 30
			}
		}
	},
	thorn_wall_explosion = {
		is_explosion = true,
		charge_value = "ability",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1,
				0.5,
				1,
				1,
				0.25
			},
			impact = {
				1,
				0.5,
				1,
				1,
				0.25
			}
		},
		cleave_distribution = {
			attack = 0.2,
			impact = 1
		},
		default_target = {
			damage_type = "grenade",
			attack_template = "blade_storm",
			power_distribution = {
				attack = 0.2,
				impact = 1
			}
		}
	},
	thorn_sister_talent_explosion = {
		is_push = true,
		charge_value = "action_push",
		damage_type = "push",
		armor_modifier = {
			attack = {
				0.1,
				0.1,
				0.1,
				0.1,
				0.1
			},
			impact = {
				0.1,
				0.1,
				0.1,
				0.1,
				0.1
			}
		},
		cleave_distribution = {
			attack = 0,
			impact = 0
		},
		default_target = {
			boost_curve_type = "default",
			damage_type = "push",
			attack_template = "basic_sweep_push",
			power_distribution = {
				attack = 0.01,
				impact = 0.01
			}
		}
	},
	thorn_sister_poison = {
		deal_min_damage = true,
		is_dot = true,
		charge_value = "n/a",
		no_stagger_damage_reduction_ranged = true,
		no_stagger = true,
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		armor_modifier = {
			attack = {
				0.8,
				0.8,
				0.8,
				0.8,
				0.5,
				0.2
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
			attack_template = "arrow_poison_aoe",
			damage_type = "arrow_poison_dot",
			power_distribution = {
				attack = 0.005,
				impact = 0
			}
		}
	},
	thorn_wall_explosion_improved_damage = {
		is_explosion = true,
		charge_value = "ability",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				0.1,
				0.1,
				0.1,
				0.1,
				0.1,
				1
			},
			impact = {
				0.35,
				0.5,
				100,
				0.5,
				1.5,
				1
			}
		},
		cleave_distribution = {
			attack = 1,
			impact = 1
		},
		default_target = {
			damage_type = "grenade",
			attack_template = "blade_storm",
			power_distribution = {
				attack = 0.01,
				impact = 2
			}
		}
	}
}

return damage_templates
