local damage_templates = {
	medium_blunt_tank_stab = {
		charge_value = "light_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				2,
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
			attack = 0.2,
			impact = 0.2
		},
		armor_modifier = {
			attack = {
				1,
				0.25,
				1.5,
				1,
				0.75
			},
			impact = {
				1,
				0.25,
				1,
				1,
				0.75
			}
		},
		default_target = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "tank_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "stab_tank",
			power_distribution = {
				attack = 0.1,
				impact = 0.1
			}
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 2.2,
				boost_curve_type = "tank_curve",
				boost_curve_coefficient = 0.75,
				attack_template = "heavy_stab_tank",
				armor_modifier = {
					attack = {
						1,
						0.6,
						1.5,
						1,
						0.75
					},
					impact = {
						1,
						0.6,
						1,
						1,
						0.75
					}
				},
				power_distribution = {
					attack = 0.2,
					impact = 0.2
				}
			}
		}
	},
	heavy_slashing_linesman_scythe = {
		charge_value = "heavy_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1.2,
				0.9,
				3.5,
				1.2,
				1.2
			},
			impact_armor_power_modifer = {
				1.2,
				1.2,
				1,
				1.2,
				1.2
			}
		},
		cleave_distribution = {
			attack = 0.75,
			impact = 0.55
		},
		armor_modifier = {
			attack = {
				1,
				0.3,
				2,
				1,
				0.1
			},
			impact = {
				1,
				0.5,
				0.5,
				1,
				1
			}
		},
		default_target = {
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 0.25,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.075,
				impact = 0.075
			}
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 1,
				boost_curve_type = "linesman_curve",
				boost_curve_coefficient = 2,
				attack_template = "heavy_slashing_linesman",
				power_distribution = {
					attack = 0.45,
					impact = 0.4
				},
				armor_modifier = {
					attack = {
						1,
						0.5,
						2,
						1,
						0.5
					},
					impact = {
						1,
						0.5,
						0.5,
						1,
						1
					}
				}
			},
			{
				boost_curve_type = "linesman_curve",
				boost_curve_coefficient_headshot = 1,
				attack_template = "heavy_slashing_linesman",
				power_distribution = {
					attack = 0.32,
					impact = 0.25
				}
			},
			{
				boost_curve_type = "linesman_curve",
				attack_template = "slashing_linesman",
				power_distribution = {
					attack = 0.22,
					impact = 0.2
				}
			},
			{
				boost_curve_type = "linesman_curve",
				attack_template = "slashing_linesman",
				power_distribution = {
					attack = 0.1,
					impact = 0.1
				}
			}
		}
	},
	heavy_slashing_linesman_scythe_diagonal = {
		charge_value = "heavy_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.8,
				2,
				1,
				1,
				0.75
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
		cleave_distribution = {
			attack = 0.55,
			impact = 0.45
		},
		armor_modifier = {
			attack = {
				0.9,
				0,
				2,
				1,
				0.75,
				0
			},
			impact = {
				0.9,
				0.5,
				1,
				1,
				0.75,
				0.25
			}
		},
		default_target = {
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 0.75,
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.1,
				impact = 0.125
			}
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 1.5,
				boost_curve_type = "linesman_curve",
				attack_template = "heavy_slashing_linesman",
				power_distribution = {
					attack = 0.5,
					impact = 0.5
				},
				armor_modifier = {
					attack = {
						0.9,
						0.78,
						2,
						1,
						0.75
					},
					impact = {
						0.9,
						0.78,
						1,
						1,
						0.75
					}
				}
			},
			{
				boost_curve_type = "linesman_curve",
				boost_curve_coefficient_headshot = 1.5,
				attack_template = "slashing_linesman",
				power_distribution = {
					attack = 0.25,
					impact = 0.15
				}
			},
			{
				boost_curve_type = "linesman_curve",
				boost_curve_coefficient_headshot = 0.2,
				attack_template = "slashing_linesman",
				power_distribution = {
					attack = 0.125,
					impact = 0.125
				}
			}
		}
	},
	medium_slashing_scythe_linesman = {
		charge_value = "light_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1.5,
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
			attack = 0.275,
			impact = 0.5
		},
		armor_modifier = {
			attack = {
				0.9,
				0,
				1.5,
				1,
				0.75
			},
			impact = {
				0.9,
				0.5,
				1,
				1,
				0.75
			}
		},
		default_target = {
			boost_curve_type = "linesman_curve",
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.075,
				impact = 0.075
			}
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 1.5,
				boost_curve_type = "linesman_curve",
				attack_template = "heavy_slashing_linesman",
				power_distribution = {
					attack = 0.25,
					impact = 0.2
				},
				armor_modifier = {
					attack = {
						1,
						0.3,
						1.5,
						1,
						0.75
					},
					impact = {
						0.9,
						0.75,
						1,
						1,
						0.75
					}
				}
			},
			{
				boost_curve_type = "linesman_curve",
				attack_template = "slashing_linesman",
				power_distribution = {
					attack = 0.15,
					impact = 0.125
				}
			},
			{
				boost_curve_type = "linesman_curve",
				attack_template = "light_slashing_linesman",
				power_distribution = {
					attack = 0.1,
					impact = 0.1
				}
			}
		}
	},
	medium_slashing_axe_linesman_burning = {
		charge_value = "light_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1.5,
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
			attack = 0.275,
			impact = 0.25
		},
		armor_modifier = {
			attack = {
				0.9,
				0,
				1.8,
				1,
				0.75
			},
			impact = {
				0.9,
				0.5,
				1,
				1,
				0.75
			}
		},
		default_target = {
			boost_curve_type = "linesman_curve",
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.075,
				impact = 0.075
			}
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 1.5,
				dot_template_name = "burning_dot_3tick",
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				attack_template = "heavy_slashing_linesman",
				power_distribution = {
					attack = 0.25,
					impact = 0.2
				},
				armor_modifier = {
					attack = {
						1,
						0.5,
						1.8,
						1,
						0.75
					},
					impact = {
						0.9,
						0.75,
						1,
						1,
						0.75
					}
				}
			},
			{
				dot_template_name = "burning_dot_3tick",
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				attack_template = "slashing_linesman",
				power_distribution = {
					attack = 0.15,
					impact = 0.125
				}
			},
			{
				boost_curve_type = "linesman_curve",
				attack_template = "light_slashing_linesman",
				power_distribution = {
					attack = 0.1,
					impact = 0.1
				}
			}
		}
	},
	medium_smiter_depowered = {
		charge_value = "light_attack",
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.7,
				2.5,
				1,
				1
			},
			impact_armor_power_modifer = {
				1,
				0.8,
				1,
				1,
				1,
				0.5
			}
		},
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075
		},
		armor_modifier = {
			attack = {
				1,
				0.8,
				1.75,
				1,
				0.75
			},
			impact = {
				1,
				0.6,
				1,
				1,
				0.75
			}
		},
		default_target = {
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 2,
			attack_template = "blunt_smiter",
			power_distribution = {
				attack = 0.3,
				impact = 0.3
			}
		},
		targets = {
			[2] = {
				boost_curve_type = "tank_curve",
				attack_template = "light_blunt_tank",
				power_distribution = {
					attack = 0.1,
					impact = 0.1
				}
			}
		}
	},
	medium_blunt_tank_upper_impact = {
		stagger_duration_modifier = 1.25,
		charge_value = "light_attack",
		stagger_distance_modifier = 1.5,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1
			},
			impact_armor_power_modifer = {
				1,
				1,
				0.5,
				1,
				1
			}
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.8
		},
		armor_modifier = {
			attack = {
				1,
				0.4,
				1,
				1,
				0.75
			},
			impact = {
				1,
				1,
				0.5,
				1,
				0.75
			}
		},
		default_target = {
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank_uppercut",
			power_distribution = {
				attack = 0.05,
				impact = 0.05
			}
		},
		targets = {
			{
				boost_curve_type = "tank_curve",
				boost_curve_coefficient_headshot = 1,
				attack_template = "blunt_tank_uppercut",
				power_distribution = {
					attack = 0.24,
					impact = 0.24
				}
			},
			{
				boost_curve_type = "tank_curve",
				attack_template = "blunt_tank_uppercut",
				power_distribution = {
					attack = 0.1,
					impact = 0.12
				}
			}
		}
	},
	medium_blunt_tank_upper_impact_empowered = {
		stagger_duration_modifier = 1.25,
		charge_value = "light_attack",
		stagger_distance_modifier = 1.5,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1
			},
			impact_armor_power_modifer = {
				1,
				1,
				0.5,
				1,
				1
			}
		},
		cleave_distribution = {
			attack = 0.4,
			impact = 0.8
		},
		armor_modifier = {
			attack = {
				1,
				0.4,
				1,
				1,
				0.75
			},
			impact = {
				1,
				1,
				0.5,
				1,
				0.75
			}
		},
		default_target = {
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.05,
				impact = 0.05
			}
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 1,
				dot_template_name = "burning_dot_3tick",
				dot_balefire_variant = true,
				boost_curve_type = "tank_curve",
				attack_template = "blunt_tank",
				power_distribution = {
					attack = 0.5,
					impact = 0.5
				}
			},
			{
				boost_curve_type = "tank_curve",
				attack_template = "blunt_tank",
				power_distribution = {
					attack = 0.1,
					impact = 0.1
				}
			}
		}
	},
	medium_blunt_tank_empowered = {
		charge_value = "light_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				2,
				1,
				1
			},
			impact_armor_power_modifer = {
				1,
				0.5,
				0.5,
				1,
				1
			}
		},
		cleave_distribution = {
			attack = 0.35,
			impact = 0.35
		},
		armor_modifier = {
			attack = {
				1,
				0.2,
				1.5,
				1,
				1,
				0.1
			},
			impact = {
				1,
				0.5,
				0.5,
				1,
				1,
				0.1
			}
		},
		default_target = {
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1.5,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.075,
				impact = 0.05
			}
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 1.5,
				dot_template_name = "burning_dot_1tick",
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				boost_curve_coefficient = 2,
				attack_template = "slashing_linesman",
				power_distribution = {
					attack = 0.225,
					impact = 0.15
				}
			},
			{
				dot_template_name = "burning_dot_1tick",
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				attack_template = "slashing_linesman",
				power_distribution = {
					attack = 0.125,
					impact = 0.125
				}
			},
			{
				dot_template_name = "burning_dot_1tick",
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				attack_template = "light_slashing_linesman",
				power_distribution = {
					attack = 0.1,
					impact = 0.1
				}
			}
		}
	},
	heavy_blunt_tank_empowered = {
		stagger_duration_modifier = 1.8,
		charge_value = "heavy_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.6,
				2.5,
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
			attack = 0.75,
			impact = 0.8
		},
		armor_modifier = {
			attack = {
				1,
				0.3,
				1.5,
				1,
				0.75
			},
			impact = {
				1,
				1,
				1,
				1,
				0.75
			}
		},
		default_target = {
			dot_template_name = "burning_dot_1tick",
			dot_balefire_variant = true,
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.1
			}
		},
		targets = {
			{
				dot_template_name = "burning_dot_1tick",
				dot_balefire_variant = true,
				boost_curve_type = "tank_curve",
				attack_template = "heavy_blunt_tank",
				power_distribution = {
					attack = 0.45,
					impact = 0.3
				}
			},
			{
				dot_template_name = "burning_dot_1tick",
				dot_balefire_variant = true,
				boost_curve_type = "tank_curve",
				attack_template = "heavy_blunt_tank",
				power_distribution = {
					attack = 0.25,
					impact = 0.225
				}
			},
			{
				dot_template_name = "burning_dot_1tick",
				dot_balefire_variant = true,
				boost_curve_type = "tank_curve",
				attack_template = "blunt_tank",
				power_distribution = {
					attack = 0.15,
					impact = 0.2
				}
			}
		}
	},
	sienna_necromancer_blood_explosion = {
		charge_value = "action_push",
		ignore_stagger_reduction = true,
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				0.16,
				0.2,
				0.2,
				0.15,
				0.15,
				0.1
			},
			impact = {
				1.2,
				1.2,
				0.7,
				0.7,
				0.7,
				0.4
			}
		},
		default_target = {
			attack_template = "cursed_blood_spread",
			damage_type = "push",
			power_distribution = {
				attack = 0.65,
				impact = 0.08
			}
		}
	},
	sienna_necromancer_ability_stagger = {
		charge_value = "action_push",
		ignore_stagger_reduction = true,
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				0,
				0,
				0,
				0,
				0,
				0
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
		default_target = {
			attack_template = "cursed_blood_spread",
			damage_type = "push",
			power_distribution = {
				attack = 0,
				impact = 1
			}
		}
	},
	sienna_necromancer_ability_6_3_stagger = {
		charge_value = "action_push",
		ignore_stagger_reduction = true,
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				0,
				0,
				0,
				0,
				0,
				0
			},
			impact = {
				1,
				0.75,
				0.85,
				0.75,
				0.75,
				0.5
			}
		},
		default_target = {
			attack_template = "cursed_blood_spread",
			damage_type = "push"
		}
	},
	skull_impact = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				0.5,
				0.5,
				2,
				0.5,
				0.5,
				0.2
			},
			impact_armor_power_modifer = {
				0.5,
				0.4,
				0.5,
				0.5,
				0.5,
				0.2
			}
		},
		armor_modifier = {
			attack = {
				0.5,
				0.5,
				2,
				0.5,
				0.1,
				0
			},
			impact = {
				0.5,
				0.5,
				0.5,
				0.5,
				0.5,
				0.1
			}
		},
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		default_target = {
			dot_template_name = "burning_dot_1tick",
			dot_balefire_variant = true,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "fireball",
			power_distribution_near = {
				attack = 0.1,
				impact = 0.1
			},
			power_distribution_far = {
				attack = 0.1,
				impact = 0.1
			},
			range_modifier_settings = shotgun_dropoff_ranges
		}
	},
	curse_on_hit = {
		charge_value = "ability",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1.5,
				1.5,
				1.5,
				1.5,
				1.5,
				0.8
			},
			impact = {
				0,
				0,
				0,
				0,
				0,
				0
			}
		},
		default_target = {
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "fireball",
			power_distribution_near = {
				attack = 0.1,
				impact = 0.1
			},
			power_distribution_far = {
				attack = 0.1,
				impact = 0.1
			},
			range_modifier_settings = shotgun_dropoff_ranges
		}
	},
	trapped_soul = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				0.5,
				0.6,
				2.5,
				0.5,
				0.5,
				0.2
			},
			impact_armor_power_modifer = {
				0.7,
				0.7,
				0.7,
				0.7,
				0.7,
				0.2
			}
		},
		armor_modifier = {
			attack = {
				0.5,
				0.6,
				2.5,
				0.5,
				0.1,
				0
			},
			impact = {
				0.7,
				0.7,
				0.7,
				0.7,
				0.5,
				0.1
			}
		},
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		default_target = {
			dot_template_name = "burning_dot_1tick",
			dot_balefire_variant = true,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "fireball",
			power_distribution_near = {
				attack = 0.17,
				impact = 0.25
			},
			power_distribution_far = {
				attack = 0.17,
				impact = 0.25
			},
			range_modifier_settings = shotgun_dropoff_ranges
		}
	},
	scythe_discharge = {
		no_stagger_damage_reduction = true,
		charge_value = "heavy_attack",
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
				attack = 0.07,
				impact = 0.5
			}
		}
	},
	scythe_blunt_smiter = {
		charge_value = "heavy_attack",
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1.1,
				1.75,
				1.2,
				1,
				1.1
			},
			impact_armor_power_modifer = {
				1,
				1.1,
				1,
				1,
				1,
				1.1
			}
		},
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075
		},
		armor_modifier = {
			attack = {
				1,
				1,
				1.75,
				1,
				0.75,
				1
			},
			impact = {
				1,
				1,
				1,
				1,
				0.75,
				1
			}
		},
		default_target = {
			boost_curve_coefficient_headshot = 0.5,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "heavy_blunt_smiter",
			power_distribution = {
				attack = 0.6,
				impact = 0.3
			}
		},
		targets = {
			[2] = {
				boost_curve_type = "smiter_curve",
				attack_template = "heavy_blunt_smiter",
				power_distribution = {
					attack = 0.2,
					impact = 0.1
				}
			}
		}
	},
	necro_staff_drain = {
		charge_value = "projectile",
		ignore_stagger_reduction = true,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1,
				0.5
			},
			impact_armor_power_modifer = {
				1,
				0.8,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1.5,
				1,
				1,
				0.3
			},
			impact = {
				1,
				0.8,
				1,
				1,
				1,
				0.2
			}
		},
		cleave_distribution = {
			attack = 0.01,
			impact = 0.01
		},
		default_target = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "wizard_staff_beam",
			power_distribution_near = {
				attack = 0.075,
				impact = 0.065
			},
			power_distribution_far = {
				attack = 0.025,
				impact = 0.05
			},
			range_modifier_settings = sniper_dropoff_ranges
		}
	},
	necro_staff_beam_0 = {
		charge_value = "projectile",
		ignore_stagger_reduction = true,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1,
				0.5
			},
			impact_armor_power_modifer = {
				1,
				0.8,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1.5,
				1,
				1,
				0.3
			},
			impact = {
				1,
				0.8,
				1,
				1,
				1,
				0.2
			}
		},
		cleave_distribution = {
			attack = 0.01,
			impact = 0.01
		},
		default_target = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "wizard_staff_beam",
			power_distribution_near = {
				attack = 0.075,
				impact = 0.065
			},
			power_distribution_far = {
				attack = 0.025,
				impact = 0.05
			},
			range_modifier_settings = sniper_dropoff_ranges
		}
	},
	necro_staff_beam_1 = {
		charge_value = "projectile",
		ignore_stagger_reduction = true,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1,
				0.5
			},
			impact_armor_power_modifer = {
				1,
				0.8,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1.5,
				1,
				1,
				0.3
			},
			impact = {
				1,
				0.8,
				1,
				1,
				1,
				0.2
			}
		},
		cleave_distribution = {
			attack = 0.2,
			impact = 0.2
		},
		default_target = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "wizard_staff_beam",
			power_distribution_near = {
				attack = 0.075,
				impact = 0.065
			},
			power_distribution_far = {
				attack = 0.025,
				impact = 0.05
			},
			range_modifier_settings = sniper_dropoff_ranges
		}
	},
	necro_staff_beam_2 = {
		charge_value = "projectile",
		ignore_stagger_reduction = true,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1,
				0.5
			},
			impact_armor_power_modifer = {
				1,
				0.8,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1.5,
				1,
				1,
				0.3
			},
			impact = {
				1,
				0.8,
				1,
				1,
				1,
				0.2
			}
		},
		cleave_distribution = {
			attack = 0.5,
			impact = 0.2
		},
		default_target = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "wizard_staff_beam",
			power_distribution_near = {
				attack = 0.075,
				impact = 0.065
			},
			power_distribution_far = {
				attack = 0.025,
				impact = 0.05
			},
			range_modifier_settings = sniper_dropoff_ranges
		}
	},
	necro_staff_beam_3 = {
		charge_value = "projectile",
		ignore_stagger_reduction = true,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1,
				0.5
			},
			impact_armor_power_modifer = {
				1,
				0.8,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1.5,
				1,
				1,
				0.3
			},
			impact = {
				1,
				0.8,
				1,
				1,
				1,
				0.2
			}
		},
		cleave_distribution = {
			attack = 1,
			impact = 0.2
		},
		default_target = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "wizard_staff_beam",
			power_distribution_near = {
				attack = 0.075,
				impact = 0.065
			},
			power_distribution_far = {
				attack = 0.025,
				impact = 0.05
			},
			range_modifier_settings = sniper_dropoff_ranges
		}
	},
	skull_detonation = {
		charge_value = "aoe",
		no_stagger_damage_reduction_ranged = true,
		attack_template = "grenade",
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
				1.5,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier = {
			attack = {
				1,
				1,
				1,
				1,
				1,
				0.25
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
			attack = 0.2,
			impact = 0.2
		},
		target_radius = {
			0.3,
			0.8
		},
		default_target = {
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "grenade",
			power_distribution = {
				attack = 0.3,
				impact = 0.3
			}
		},
		targets = {
			{
				boost_curve_type = "ninja_curve",
				boost_curve_coefficient = 1,
				attack_template = "grenade",
				power_distributon = {
					attack = 0.6,
					impact = 0.6
				}
			}
		}
	},
	skull_detonation_charged = {
		charge_value = "aoe",
		no_stagger_damage_reduction_ranged = true,
		attack_template = "grenade",
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
				1.5,
				1,
				1,
				1,
				0.5
			}
		},
		armor_modifier = {
			attack = {
				1,
				1,
				1,
				1,
				1,
				0.5
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
			attack = 0.2,
			impact = 0.2
		},
		target_radius = {
			0.3,
			0.8
		},
		default_target = {
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "grenade",
			power_distribution = {
				attack = 0.3,
				impact = 0.3
			}
		},
		targets = {
			{
				boost_curve_type = "ninja_curve",
				boost_curve_coefficient = 1,
				attack_template = "grenade",
				power_distributon = {
					attack = 0.6,
					impact = 0.8
				}
			},
			{
				boost_curve_type = "ninja_curve",
				boost_curve_coefficient = 1,
				attack_template = "grenade",
				power_distributon = {
					attack = 0.6,
					impact = 0.8
				}
			},
			{
				boost_curve_type = "ninja_curve",
				boost_curve_coefficient = 1,
				attack_template = "grenade",
				power_distributon = {
					attack = 0.6,
					impact = 0.8
				}
			}
		}
	},
	death_staff_curse = {
		charge_value = "projectile",
		no_stagger_damage_reduction_ranged = true,
		require_damage_for_dot = false,
		no_friendly_fire = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.35,
				1.2,
				1,
				1,
				0.25
			},
			impact_armor_power_modifer = {
				1,
				0.6,
				0,
				0,
				1,
				0.25
			}
		},
		armor_modifier = {
			attack = {
				0.8,
				0.32,
				1,
				1,
				0.8,
				0.05
			},
			impact = {
				1,
				0.6,
				0,
				0,
				0.5,
				0
			}
		},
		cleave_distribution = {
			attack = 0,
			impact = 0
		},
		default_target = {
			boost_curve_coefficient_headshot = 1,
			dot_balefire_variant = true,
			boost_curve_type = "linesman_curve",
			dot_template_name = "death_staff_dot",
			boost_curve_coefficient = 0.75,
			attack_template = "fireball",
			power_distribution = {
				attack = 0.24,
				impact = 0.25
			},
			range_modifier_settings = carbine_dropoff_ranges
		},
		targets = {
			{
				boost_curve_coefficient_headshot = 1,
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				dot_template_name = "death_staff_dot",
				boost_curve_coefficient = 0.75,
				attack_template = "fireball",
				power_distribution = {
					attack = 0.16,
					impact = 0.25
				},
				range_modifier_settings = carbine_dropoff_ranges
			},
			{
				boost_curve_coefficient_headshot = 1,
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				dot_template_name = "death_staff_dot",
				boost_curve_coefficient = 0.75,
				attack_template = "fireball",
				power_distribution = {
					attack = 0.08,
					impact = 0.25
				},
				range_modifier_settings = carbine_dropoff_ranges
			},
			{
				boost_curve_coefficient_headshot = 1,
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				dot_template_name = "death_staff_dot",
				boost_curve_coefficient = 0.75,
				attack_template = "fireball",
				power_distribution = {
					attack = 0.06,
					impact = 0.22
				},
				range_modifier_settings = carbine_dropoff_ranges
			},
			{
				boost_curve_coefficient_headshot = 1,
				dot_balefire_variant = true,
				boost_curve_type = "linesman_curve",
				dot_template_name = "death_staff_dot",
				boost_curve_coefficient = 0.75,
				attack_template = "fireball",
				power_distribution = {
					attack = 0.08,
					impact = 0.18
				},
				range_modifier_settings = carbine_dropoff_ranges
			}
		}
	},
	death_staff_dot = {
		is_dot = true,
		charge_value = "n/a",
		damage_type = "burninating",
		no_stagger_damage_reduction_ranged = true,
		no_stagger = true,
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		armor_modifier = {
			attack = {
				1,
				0.75,
				3,
				1,
				1,
				0.5
			},
			impact = {
				1,
				0,
				0,
				1,
				1,
				0
			}
		},
		default_target = {
			boost_curve_type = "tank_curve",
			boost_curve_coefficient = 0.2,
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.03,
				impact = 0.05
			}
		}
	},
	staff_suck_damage = {
		charge_value = "projectile",
		no_procs = true,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.1,
				1,
				1,
				1,
				0.25
			},
			impact_armor_power_modifer = {
				1,
				0.2,
				1,
				1,
				1,
				0.25
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				0.1,
				1.5,
				1,
				1,
				0
			},
			impact = {
				1,
				0.2,
				1,
				1,
				1,
				0
			}
		},
		armor_modifier_near = {
			attack = {
				1,
				0.5,
				1.5,
				1,
				1,
				0
			},
			impact = {
				1,
				0.8,
				1,
				1,
				1,
				0
			}
		},
		cleave_distribution = {
			attack = 0.01,
			impact = 0.01
		},
		default_target = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "wizard_staff_beam",
			power_distribution_near = {
				attack = 0.01,
				impact = 0.065
			},
			power_distribution_far = {
				attack = 0.01,
				impact = 0.05
			},
			range_modifier_settings = carbine_dropoff_ranges
		}
	},
	sienna_necromancer_4_3_dot_damage = {
		is_dot = true,
		charge_value = "n/a",
		no_stagger_damage_reduction_ranged = true,
		no_stagger = true,
		default_target = {
			damage_type = "burninating",
			armor_modifier = {
				attack = {
					0.8,
					0.75,
					3,
					1,
					1,
					0.5
				},
				impact = {
					1,
					0,
					0,
					1,
					1,
					0
				}
			},
			power_distribution = {
				attack = 0.025,
				impact = 0.025
			}
		}
	},
	soul_rip = {
		charge_value = "heavy_instant_projectile",
		no_stagger_damage_reduction_ranged = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1.4,
				3,
				1,
				1,
				1
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
				2.5,
				1,
				0.75,
				0.7
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				1
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				1,
				2.5,
				1,
				0.75,
				0.7
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
		cleave_distribution = {
			attack = 0.35,
			impact = 0.3
		},
		default_target = {
			boost_curve_coefficient_headshot = 1,
			headshot_boost_boss = 0.5,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 1,
			attack_template = "shot_sniper",
			power_distribution_near = {
				attack = 1.1,
				impact = 0.5
			},
			power_distribution_far = {
				attack = 0.9,
				impact = 0.5
			},
			range_modifier_settings = sniper_dropoff_ranges
		}
	},
	necromancer_ability_spawn_stagger = {
		charge_value = "grenade",
		is_explosion = true,
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				0,
				0,
				0,
				0,
				0
			},
			impact = {
				1,
				1,
				1,
				1,
				1
			}
		},
		default_target = {
			damage_type = "grenade",
			attack_template = "drakegun",
			power_distribution = {
				attack = 0,
				impact = 1
			}
		}
	},
	necromancer_crit_burst_stagger = {
		charge_value = "grenade",
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				0,
				0,
				0,
				0,
				0
			},
			impact = {
				0.7,
				0.7,
				0.7,
				0.7,
				0.7
			}
		},
		default_target = {
			damage_type = "grenade",
			attack_template = "drakegun",
			power_distribution = {
				attack = 0,
				impact = 0.7
			}
		}
	}
}

return damage_templates
