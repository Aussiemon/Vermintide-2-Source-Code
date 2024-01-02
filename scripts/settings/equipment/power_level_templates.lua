PowerLevelTemplates = {
	critical_strike_default = {
		attack_armor_power_modifer = {
			1,
			0.75,
			1,
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
	cleave_distribution_push_default = {
		attack = 0,
		impact = 1
	},
	armor_modifier_push_L = {
		attack = {
			0,
			0,
			0,
			0,
			0
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			0.5
		}
	},
	target_push_L = {
		boost_curve_type = "default",
		damage_type = "push",
		attack_template = "basic_sweep_push",
		power_distribution = {
			attack = 0,
			impact = 0.125
		}
	},
	armor_modifier_push_M = {
		attack = {
			0,
			0,
			0,
			0,
			0
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			0.5
		}
	},
	armor_modifier_shield_push_M = {
		attack = {
			0,
			0,
			0,
			0,
			0
		},
		impact = {
			1,
			0.75,
			0.5,
			1,
			1
		}
	},
	target_push_M = {
		boost_curve_type = "default",
		damage_type = "push",
		attack_template = "basic_sweep_push",
		power_distribution = {
			attack = 0,
			impact = 0.2
		}
	},
	armor_modifier_push_H = {
		attack = {
			0,
			0,
			0,
			0,
			0
		},
		impact = {
			1,
			0.666,
			0.5,
			1,
			0.5
		}
	},
	target_push_H = {
		boost_curve_type = "default",
		damage_type = "push",
		attack_template = "basic_sweep_push",
		power_distribution = {
			attack = 0,
			impact = 0.375
		}
	},
	armor_modifier_push_slayer_leap = {
		attack = {
			0,
			0,
			0,
			0,
			0
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			0.5
		}
	},
	target_push_slayer_leap = {
		boost_curve_type = "default",
		damage_type = "push",
		attack_template = "basic_sweep_push",
		power_distribution = {
			attack = 0,
			impact = 0.4
		}
	},
	armor_modifier_push_slayer_leap_impact = {
		attack = {
			0,
			0,
			0,
			0,
			0
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			0.5
		}
	},
	target_push_slayer_leap_impact = {
		boost_curve_type = "default",
		damage_type = "push",
		attack_template = "basic_sweep_push",
		power_distribution = {
			attack = 0,
			impact = 0.8
		}
	},
	armor_modifier_push_Ability = {
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
	target_push_Ability = {
		stagger_duration_modifier = 1,
		damage_type = "push",
		boost_curve_type = "default",
		attack_template = "ability_push",
		power_distribution = {
			attack = 0,
			impact = 1
		}
	},
	critical_strike_slam_tank_L = {
		attack_armor_power_modifer = {
			1,
			0.25,
			1,
			1,
			1
		},
		impact_armor_power_modifer = {
			1,
			0.6,
			0.5,
			1,
			1
		}
	},
	armor_modifier_slam_tank_L = {
		attack = {
			1,
			0,
			1,
			1,
			0.75
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			0.75
		}
	},
	target_settings_slam_tank_L = {
		boost_curve_type = "tank_curve",
		attack_template = "blunt_fencer",
		power_distribution = {
			attack = 0.1,
			impact = 0.1
		}
	},
	aoe_target_settings_slam_tank_L = {
		boost_curve_type = "tank_curve",
		attack_template = "blunt_fencer",
		dead_attack_template = "blunt_fencer",
		power_distribution = {
			attack = 0,
			impact = 0.075
		}
	},
	critical_strike_slam_tank_M = {
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
			0.5,
			1,
			1
		}
	},
	armor_modifier_slam_target_tank_M = {
		attack = {
			1,
			0.3,
			2,
			1,
			0.75
		},
		impact = {
			1,
			0.8,
			1,
			1,
			2,
			1.25
		}
	},
	armor_modifier_slam_tank_M = {
		attack = {
			1,
			0,
			1,
			1,
			0.75
		},
		impact = {
			1,
			0.8,
			1,
			1,
			1.5,
			0.8
		}
	},
	armor_modifier_slam_aoe_tank_M = {
		attack = {
			1,
			0,
			0,
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
	default_target_slam_target_tank_M = {
		boost_curve_type = "tank_curve",
		attack_template = "heavy_blunt_fencer",
		power_distribution = {
			attack = 0.2,
			impact = 0.375
		}
	},
	default_target_slam_tank_M = {
		boost_curve_type = "tank_curve",
		attack_template = "heavy_blunt_fencer",
		power_distribution = {
			attack = 0.1,
			impact = 0.3
		}
	},
	default_target_slam_aoe_tank_M = {
		boost_curve_type = "tank_curve",
		attack_template = "blunt_fencer",
		dead_attack_template = "blunt_fencer",
		power_distribution = {
			attack = 0,
			impact = 0.125
		}
	},
	armor_modifier_slam_burn_target_tank_M = {
		attack = {
			1,
			0.5,
			1,
			1,
			0.5
		},
		impact = {
			1,
			0.8,
			1,
			1,
			1
		}
	},
	armor_modifier_slam_burn_tank_M = {
		attack = {
			1,
			0.25,
			1,
			1,
			0.5
		},
		impact = {
			1,
			0.8,
			1,
			1,
			1
		}
	},
	armor_modifier_slam_burn_aoe_tank_M = {
		attack = {
			1,
			0,
			1,
			1,
			0.5
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1
		}
	},
	default_target_slam_burn_target_tank_M = {
		dot_template_name = "burning_dot_3tick",
		dot_balefire_variant = true,
		boost_curve_type = "tank_curve",
		attack_template = "flame_blast",
		power_distribution = {
			attack = 0.15,
			impact = 0.25
		}
	},
	default_target_slam_burn_target_fencer_M = {
		dot_template_name = "burning_dot_3tick",
		dot_balefire_variant = true,
		boost_curve_type = "tank_curve",
		attack_template = "flame_blast",
		power_distribution = {
			attack = 0.25,
			impact = 0.125
		}
	},
	default_target_slam_burn_tank_M = {
		dot_template_name = "burning_dot_3tick",
		dot_balefire_variant = true,
		boost_curve_type = "tank_curve",
		attack_template = "flame_blast",
		power_distribution = {
			attack = 0.075,
			impact = 0.15
		}
	},
	default_target_slam_burn_fencer_M = {
		dot_template_name = "burning_dot_1tick",
		dot_balefire_variant = true,
		boost_curve_type = "tank_curve",
		attack_template = "flame_blast",
		power_distribution = {
			attack = 0.075,
			impact = 0.1
		}
	},
	default_target_slam_burn_aoe_tank_M = {
		dot_template_name = "burning_dot_1tick",
		dot_balefire_variant = true,
		dead_attack_template = "flame_blast",
		boost_curve_type = "tank_curve",
		attack_template = "blunt_fencer",
		power_distribution = {
			attack = 0,
			impact = 0.15
		}
	},
	default_target_slam_burn_aoe_fencer_M = {
		boost_curve_type = "tank_curve",
		attack_template = "blunt_fencer",
		dead_attack_template = "flame_blast",
		power_distribution = {
			attack = 0,
			impact = 0.075
		}
	},
	critical_strike_linesman_L = {
		attack_armor_power_modifer = {
			1,
			0.5,
			2.5,
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
	cleave_distribution_linesman_L = {
		attack = 0.35,
		impact = 0.2
	},
	armor_modifier_linesman_L = {
		attack = {
			1,
			0,
			2,
			1,
			1
		},
		impact = {
			1,
			0.3,
			0.5,
			1,
			1
		}
	},
	default_target_linesman_L = {
		boost_curve_type = "linesman_curve",
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_L = {
		{
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "light_slashing_linesman_hs",
			power_distribution = {
				attack = 0.175,
				impact = 0.1
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1.5,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.125,
				impact = 0.075
			}
		}
	},
	targets_linesman_L_finesse = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "light_slashing_linesman_hs",
			power_distribution = {
				attack = 0.21,
				impact = 0.1
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 2,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.185,
				impact = 0.075
			}
		}
	},
	targets_linesman_burn_L = {
		{
			boost_curve_coefficient_headshot = 1,
			dot_template_name = "burning_dot_3tick",
			dot_balefire_variant = true,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "light_slashing_linesman_hs",
			power_distribution = {
				attack = 0.175,
				impact = 0.1
			}
		},
		{
			boost_curve_coefficient_headshot = 1,
			dot_template_name = "burning_dot_1tick",
			dot_balefire_variant = true,
			boost_curve_type = "linesman_curve",
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.125,
				impact = 0.075
			}
		}
	},
	critical_strike_linesman_uppercut_L = {
		attack_armor_power_modifer = {
			1,
			0.5,
			2.5,
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
	cleave_distribution_linesman_uppercut_L = {
		attack = 0.4,
		impact = 0.25
	},
	armor_modifier_linesman_uppercut_L = {
		attack = {
			1,
			0,
			2,
			1,
			1
		},
		impact = {
			1,
			0.3,
			0.5,
			1,
			1
		}
	},
	default_target_linesman_uppercut_L = {
		boost_curve_type = "linesman_curve",
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_uppercut_L = {
		{
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "light_slashing_linesman_hs",
			power_distribution = {
				attack = 0.2,
				impact = 0.1
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.15,
				impact = 0.075
			}
		}
	},
	critical_strike_linesman_dual_L = {
		attack_armor_power_modifer = {
			1,
			0.3,
			2.5,
			1,
			1
		},
		impact_armor_power_modifer = {
			1,
			0.25,
			0.5,
			1,
			1
		}
	},
	critical_strike_linesman_dual_L_swords = {
		attack_armor_power_modifer = {
			1.25,
			0.3,
			2.5,
			1,
			1
		},
		impact_armor_power_modifer = {
			1,
			0.25,
			0.5,
			1,
			1
		}
	},
	critical_strike_linesman_dual_M = {
		attack_armor_power_modifer = {
			1,
			0.5,
			2.5,
			1,
			1
		},
		impact_armor_power_modifer = {
			1,
			0.75,
			0.5,
			1,
			1
		}
	},
	cleave_distribution_linesman_dual_L = {
		attack = 0.25,
		impact = 0.2
	},
	armor_modifier_linesman_dual_L = {
		attack = {
			1,
			0,
			2,
			1,
			1
		},
		impact = {
			1,
			0.2,
			0.5,
			1,
			1
		}
	},
	armor_modifier_linesman_elf_L = {
		attack = {
			0.8,
			0,
			2,
			1,
			1
		},
		impact = {
			0.75,
			0.3,
			0.5,
			1,
			1
		}
	},
	armor_modifier_linesman_dual_L_swords = {
		attack = {
			1.25,
			0,
			2,
			1,
			1
		},
		impact = {
			1,
			0.2,
			0.5,
			1,
			1
		}
	},
	armor_modifier_linesman_dual_M = {
		attack = {
			1,
			0.25,
			2,
			1,
			1
		},
		impact = {
			1,
			0.25,
			0.5,
			1,
			1
		}
	},
	default_target_linesman_dual_L = {
		boost_curve_type = "linesman_curve",
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_dual_L = {
		{
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient_headshot = 1.5,
			attack_template = "light_slashing_linesman_hs",
			power_distribution = {
				attack = 0.135,
				impact = 0.075
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.09,
				impact = 0.05
			}
		}
	},
	targets_linesman_dual_L_swords = {
		{
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient_headshot = 1.5,
			attack_template = "light_slashing_linesman_hs",
			power_distribution = {
				attack = 0.135,
				impact = 0.075
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.09,
				impact = 0.05
			}
		}
	},
	targets_linesman_dual_M = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "ninja_curve",
			attack_template = "light_slashing_linesman_hs",
			power_distribution = {
				attack = 0.15,
				impact = 0.125
			},
			armor_modifier = {
				attack = {
					1,
					0.4,
					2,
					1,
					1
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
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.125,
				impact = 0.075
			}
		}
	},
	critical_strike_linesman_fencer_L = {
		attack_armor_power_modifer = {
			1,
			0.5,
			2,
			1,
			1
		},
		impact_armor_power_modifer = {
			1,
			0.1,
			0.5,
			1,
			1
		}
	},
	cleave_distribution_linesman_fencer_L = {
		attack = 0.25,
		impact = 0.2
	},
	armor_modifier_linesman_fencer_L = {
		attack = {
			1,
			0,
			1.5,
			1,
			1
		},
		impact = {
			1,
			0.1,
			0.5,
			1,
			1
		}
	},
	default_target_linesman_fencer_L = {
		boost_curve_type = "ninja_curve",
		attack_template = "light_slashing_linesman_hs",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_fencer_L = {
		{
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient_headshot = 2.5,
			attack_template = "light_slashing_linesman_hs",
			power_distribution = {
				attack = 0.125,
				impact = 0.05
			}
		}
	},
	critical_strike_linesman_M = {
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
	cleave_distribution_linesman_M = {
		attack = 0.35,
		impact = 0.3
	},
	armor_modifier_linesman_M = {
		attack = {
			1,
			0,
			1.5,
			1,
			1
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			1
		}
	},
	default_target_linesman_M = {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 1.5,
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_M = {
		{
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.225,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.125,
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
	},
	targets_linesman_M_finesse = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.225,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.125,
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
	},
	targets_linesman_M_2h = {
		{
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.25,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.22,
				impact = 0.125
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.18,
				impact = 0.1
			}
		}
	},
	critical_strike_linesman_uppercut_M = {
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
	cleave_distribution_linesman_uppercut_M = {
		attack = 0.45,
		impact = 0.4
	},
	armor_modifier_linesman_uppercut_M = {
		attack = {
			1,
			0,
			1,
			1,
			1
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			1
		}
	},
	default_target_linesman_uppercut_M = {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 1.5,
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_uppercut_M = {
		{
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.25,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.2,
				impact = 0.125
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.15,
				impact = 0.1
			}
		}
	},
	cleave_distribution_linesman_executioner_M = {
		attack = 0.25,
		impact = 0.25
	},
	default_target_linesman_executioner_M = {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 0.25,
		attack_template = "light_slashing_linesman_executioner",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_executioner_M = {
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 4,
			attack_template = "slashing_linesman_executioner",
			power_distribution = {
				attack = 0.2,
				impact = 0.25
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 3,
			attack_template = "slashing_linesman_executioner",
			power_distribution = {
				attack = 0.15,
				impact = 0.175
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 2.5,
			attack_template = "light_slashing_linesman_executioner",
			power_distribution = {
				attack = 0.1,
				impact = 0.1
			}
		}
	},
	targets_linesman_spear_M = {
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 4,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.175,
				impact = 0.2
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 3,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.125,
				impact = 0.175
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 2.5,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.1,
				impact = 0.1
			}
		}
	},
	cleave_distribution_linesman_executioner_H = {
		attack = 0.4,
		impact = 0.3
	},
	default_target_linesman_executioner_H = {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 0.25,
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_executioner_H = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.275,
				impact = 0.25
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 2,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.2,
				impact = 0.125
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 2,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.15,
				impact = 0.1
			}
		}
	},
	critical_strike_linesman_H = {
		attack_armor_power_modifer = {
			1,
			0.5,
			2.5,
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
	cleave_distribution_linesman_H = {
		attack = 0.75,
		impact = 0.4
	},
	armor_modifier_linesman_H = {
		attack = {
			1,
			0.3,
			2,
			1,
			1
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			1
		}
	},
	default_target_linesman_H = {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 0.25,
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.1,
			impact = 0.05
		}
	},
	default_target_linesman_burn_H = {
		dot_template_name = "burning_dot_1tick",
		boost_curve_coefficient_headshot = 0.25,
		dot_balefire_variant = true,
		boost_curve_type = "linesman_curve",
		attack_template = "light_burning_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.05
		}
	},
	targets_linesman_H = {
		{
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.5,
				impact = 0.275
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.35,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.25,
				impact = 0.1
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.18,
				impact = 0.075
			}
		}
	},
	targets_linesman_polearm_H = {
		{
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "linesman_curve",
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.325,
				impact = 0.25
			},
			armor_modifier = {
				attack = {
					1,
					0.5,
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
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.25,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.15,
				impact = 0.1
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.125,
				impact = 0.075
			}
		}
	},
	targets_linesman_burn_H = {
		{
			boost_curve_coefficient_headshot = 1,
			dot_template_name = "burning_dot_3tick",
			dot_balefire_variant = true,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 2,
			attack_template = "burning_linesman",
			power_distribution = {
				attack = 0.45,
				impact = 0.275
			}
		},
		{
			dot_template_name = "burning_dot_3tick",
			boost_curve_coefficient_headshot = 1,
			dot_balefire_variant = true,
			boost_curve_type = "linesman_curve",
			attack_template = "burning_linesman",
			power_distribution = {
				attack = 0.25,
				impact = 0.15
			}
		},
		{
			dot_template_name = "burning_dot_3tick",
			dot_balefire_variant = true,
			boost_curve_type = "linesman_curve",
			attack_template = "burning_linesman",
			power_distribution = {
				attack = 0.15,
				impact = 0.1
			}
		},
		{
			dot_template_name = "burning_dot_1tick",
			dot_balefire_variant = true,
			boost_curve_type = "linesman_curve",
			attack_template = "burning_linesman",
			power_distribution = {
				attack = 0.125,
				impact = 0.075
			}
		}
	},
	critical_strike_axe_linesman_L = {
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
	cleave_distribution_axe_linesman_L = {
		attack = 0.25,
		impact = 0.2
	},
	armor_modifier_axe_linesman_L = {
		attack = {
			0.9,
			0,
			1.5,
			1,
			0.75
		},
		impact = {
			0.9,
			0.25,
			1,
			1,
			0.75
		}
	},
	default_target_axe_linesman_L = {
		boost_curve_type = "linesman_curve",
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.075
		}
	},
	targets_axe_linesman_L = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.195,
				impact = 0.125
			},
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
					0.9,
					0.25,
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
				attack = 0.125,
				impact = 0.1
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.075,
				impact = 0.08
			}
		}
	},
	critical_strike_axe_linesman_M = {
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
	cleave_distribution_axe_linesman_M = {
		attack = 0.275,
		impact = 0.25
	},
	armor_modifier_axe_linesman_M = {
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
	default_target_axe_linesman_M = {
		boost_curve_type = "linesman_curve",
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.075,
			impact = 0.075
		}
	},
	targets_axe_linesman_M = {
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
	},
	targets_axe_linesman_M_1h = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "linesman_curve",
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.275,
				impact = 0.2
			},
			armor_modifier = {
				attack = {
					1,
					0.5,
					1.5,
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
			}
		},
		{
			boost_curve_type = "linesman_curve",
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.2,
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
	},
	targets_axe_linesman_M_dual = {
		{
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "linesman_curve",
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.225,
				impact = 0.2
			},
			armor_modifier = {
				attack = {
					1,
					0.5,
					1.5,
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
	},
	critical_strike_axe_linesman_H = {
		attack_armor_power_modifer = {
			1,
			0.75,
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
	cleave_distribution_axe_linesman_H = {
		attack = 0.35,
		impact = 0.35
	},
	armor_modifier_axe_linesman_H = {
		attack = {
			0.9,
			0,
			1.5,
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
	default_target_axe_linesman_H = {
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient_headshot = 0.75,
		attack_template = "light_slashing_linesman",
		power_distribution = {
			attack = 0.1,
			impact = 0.125
		}
	},
	targets_axe_linesman_H = {
		{
			boost_curve_coefficient_headshot = 0.75,
			boost_curve_type = "linesman_curve",
			attack_template = "heavy_slashing_linesman",
			power_distribution = {
				attack = 0.45,
				impact = 0.5
			},
			armor_modifier = {
				attack = {
					0.9,
					0.75,
					2,
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
			boost_curve_coefficient_headshot = 0.75,
			attack_template = "slashing_linesman",
			power_distribution = {
				attack = 0.25,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient_headshot = 0.75,
			attack_template = "light_slashing_linesman",
			power_distribution = {
				attack = 0.125,
				impact = 0.125
			}
		}
	},
	cleave_distribution_smiter_default = {
		attack = 0.075,
		impact = 0.075
	},
	cleave_distribution_smiter_fencer = {
		attack = 0.1,
		impact = 0.1
	},
	critical_strike_smiter_L = {
		attack_armor_power_modifer = {
			1.25,
			0.75,
			2.75,
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
	critical_strike_pointy_smiter_L = {
		attack_armor_power_modifer = {
			1,
			1,
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
	critical_strike_smiter_L_dual_light = {
		attack_armor_power_modifer = {
			1.25,
			0.75,
			2.75,
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
	armor_modifier_smiter_L = {
		attack = {
			1.25,
			0.65,
			2.5,
			1,
			0.75,
			0.6
		},
		impact = {
			1,
			0.5,
			1,
			1,
			0.75,
			0.25
		}
	},
	armor_modifier_pointy_smiter_L = {
		attack = {
			1,
			1,
			2,
			1,
			1,
			0.5
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0.5
		}
	},
	armor_modifier_smiter_L_dual_light = {
		attack = {
			1,
			0.4,
			2.5,
			1,
			0.75
		},
		impact = {
			0.75,
			0.5,
			1,
			1,
			0.75
		}
	},
	default_target_smiter_L = {
		boost_curve_type = "smiter_curve",
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0.25,
			impact = 0.175
		}
	},
	default_target_smiter_L_finesse = {
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 2,
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0.25,
			impact = 0.175
		}
	},
	light_slashing_smiter_diag_1h = {
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 1.5,
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0.25,
			impact = 0.175
		}
	},
	default_target_pointy_smiter_L = {
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient_headshot = 1.5,
		attack_template = "blunt_smiter",
		power_distribution = {
			attack = 0.175,
			impact = 0.1
		}
	},
	default_target_smiter_L_dual_heavy = {
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 1.6,
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0.225,
			impact = 0.15
		}
	},
	default_target_smiter_L_dual_light = {
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 2,
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0.225,
			impact = 0.125
		}
	},
	targets_smiter_L = {
		[2] = {
			boost_curve_type = "smiter_curve",
			attack_template = "slashing_smiter",
			armor_modifier = {
				attack = {
					1,
					0.25,
					1,
					1,
					0.75
				},
				impact = {
					0.75,
					0.25,
					1,
					1,
					0.75
				}
			},
			power_distribution = {
				attack = 0.075,
				impact = 0.075
			}
		}
	},
	targets_smiter_L_finesse = {
		[2] = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "smiter_curve",
			attack_template = "slashing_smiter",
			armor_modifier = {
				attack = {
					1,
					0.25,
					1,
					1,
					0.75
				},
				impact = {
					0.75,
					0.25,
					1,
					1,
					0.75
				}
			},
			power_distribution = {
				attack = 0.075,
				impact = 0.075
			}
		}
	},
	critical_strike_smiter_M_2h = {
		attack_armor_power_modifer = {
			1.25,
			0.8,
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
	critical_strike_smiter_M = {
		attack_armor_power_modifer = {
			1,
			0.8,
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
	armor_modifier_smiter_M = {
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
	armor_modifier_pointy_smiter_M = {
		attack = {
			1,
			0.9,
			2,
			1,
			1,
			0.9
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
	default_target_smiter_M = {
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 2,
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0.4,
			impact = 0.25
		}
	},
	default_target_slashing_smiter_burn_M = {
		dot_template_name = "burning_dot_3tick",
		dot_balefire_variant = true,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 2,
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0.4,
			impact = 0.25
		}
	},
	default_target_slashing_smiter_finesse = {
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 2,
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0.4,
			impact = 0.25
		}
	},
	default_target_smiter_burn_M = {
		dot_template_name = "burning_dot_3tick",
		dot_balefire_variant = true,
		boost_curve_type = "smiter_curve",
		attack_template = "burning_smiter",
		power_distribution = {
			attack = 0.325,
			impact = 0.15
		}
	},
	default_target_smiter_burn_H = {
		dot_template_name = "burning_dot_3tick",
		dot_balefire_variant = true,
		boost_curve_type = "smiter_curve",
		attack_template = "burning_smiter",
		power_distribution = {
			attack = 0.25,
			impact = 0.95
		}
	},
	default_target_smiter_burn_H_charged = {
		dot_template_name = "burning_dot_3tick",
		dot_balefire_variant = true,
		boost_curve_type = "smiter_curve",
		attack_template = "burning_smiter",
		power_distribution = {
			attack = 0.45,
			impact = 0.35
		}
	},
	default_target_burning_stab_smiter_M = {
		dot_template_name = "burning_dot_3tick",
		boost_curve_coefficient_headshot = 1.5,
		dot_balefire_variant = true,
		boost_curve_type = "ninja_curve",
		attack_template = "flame_blast",
		power_distribution = {
			attack = 0.275,
			impact = 0.125
		}
	},
	default_target_smiter_M_2H = {
		boost_curve_type = "smiter_curve",
		attack_template = "slashing_smiter",
		armor_modifier = {
			attack = {
				1.25,
				0.8,
				2.5,
				1,
				0.75
			},
			impact = {
				1,
				0.8,
				1,
				1,
				0.75
			}
		},
		power_distribution = {
			attack = 0.325,
			impact = 0.2
		}
	},
	targets_smiter_M = {
		[2] = {
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.1,
				impact = 0.1
			}
		}
	},
	critical_strike_smiter_H = {
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
	critical_strike_smiter_executioner_H = {
		attack_armor_power_modifer = {
			1,
			1,
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
	critical_strike_smiter_glaive_H = {
		attack_armor_power_modifer = {
			1,
			1,
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
	armor_modifier_smiter_H = {
		attack = {
			1,
			0.5,
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
	armor_modifier_smiter_pick_H = {
		attack = {
			1,
			0.85,
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
	critical_strike_blunt_smiter_2h_hammer_H = {
		attack_armor_power_modifer = {
			1,
			0.8,
			2.5,
			1,
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
	armor_modifier_blunt_smiter_2h_hammer_H = {
		attack = {
			1,
			0.8,
			2,
			1,
			0.75,
			1
		},
		impact = {
			1,
			0.8,
			1,
			1,
			0.75
		}
	},
	default_target_smiter_H = {
		boost_curve_coefficient_headshot = 0.75,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "heavy_slashing_smiter",
		power_distribution = {
			attack = 0.65,
			impact = 0.25
		}
	},
	default_target_smiter_executioner_H = {
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 1,
		attack_template = "heavy_slashing_smiter_hs_executioner",
		armor_modifier = {
			attack = {
				1,
				0.85,
				1.5,
				1,
				0.75
			},
			impact = {
				1,
				1,
				1,
				1,
				1.25
			}
		},
		power_distribution = {
			attack = 0.65,
			impact = 0.275
		}
	},
	default_target_smiter_glaive_H = {
		boost_curve_coefficient_headshot = 1.25,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 1,
		attack_template = "heavy_slashing_smiter_hs",
		armor_modifier = {
			attack = {
				1,
				0.75,
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
		power_distribution = {
			attack = 0.65,
			impact = 0.225
		}
	},
	default_target_smiter_H_charged = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 0.5,
		attack_template = "heavy_blunt_smiter",
		power_distribution = {
			attack = 1.2,
			impact = 0.5
		}
	},
	targets_smiter_H = {
		[2] = {
			boost_curve_type = "smiter_curve",
			attack_template = "stab_smiter",
			power_distribution = {
				attack = 0.2,
				impact = 0.1
			}
		}
	},
	critical_strike_stab_smiter_L = {
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
	critical_strike_stab_smiter_L_swords = {
		attack_armor_power_modifer = {
			1,
			0.7,
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
	armor_modifier_stab_smiter_L = {
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
	armor_modifier_stab_smiter_L_swords = {
		attack = {
			1,
			0.45,
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
	armor_modifier_burning_punch_smiter_L = {
		attack = {
			1,
			0.5,
			1.5,
			1,
			0.75
		},
		impact = {
			1,
			1.25,
			1,
			1,
			0.75
		}
	},
	default_target_stab_smiter_L = {
		boost_curve_coefficient_headshot = 2,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "stab_smiter",
		power_distribution = {
			attack = 0.1,
			impact = 0.075
		}
	},
	targets_stab_smiter_L = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "stab_smiter",
			armor_modifier = {
				attack = {
					1,
					0.5,
					1.5,
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
			power_distribution = {
				attack = 0.2,
				impact = 0.1
			}
		}
	},
	targets_stab_smiter_L_swords = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "stab_smiter",
			armor_modifier = {
				attack = {
					1,
					0.7,
					1.5,
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
			power_distribution = {
				attack = 0.2,
				impact = 0.1
			}
		}
	},
	targets_blunt_smiter_stab_L = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "stab_smiter",
			armor_modifier = {
				attack = {
					1,
					0.75,
					1.5,
					1,
					0.75
				},
				impact = {
					1,
					0.75,
					1,
					1,
					1.5
				}
			},
			power_distribution = {
				attack = 0.2,
				impact = 0.175
			}
		}
	},
	targets_burning_stab_smiter_L = {
		{
			boost_curve_coefficient_headshot = 2,
			dot_template_name = "burning_dot_1tick",
			dot_balefire_variant = true,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "burning_stab_fencer",
			power_distribution = {
				attack = 0.2,
				impact = 0.1
			}
		}
	},
	targets_burning_punch_smiter_L = {
		{
			boost_curve_coefficient_headshot = 1.5,
			dot_template_name = "burning_dot_3tick",
			dot_balefire_variant = true,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "burning_stab_fencer",
			power_distribution = {
				attack = 0.2,
				impact = 0.2
			}
		}
	},
	targets_stab_dual_smiter_L = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 1.5,
			attack_template = "stab_smiter",
			armor_modifier = {
				attack = {
					1,
					0.8,
					2.1,
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
			power_distribution = {
				attack = 0.24,
				impact = 0.1
			}
		}
	},
	critical_strike_stab_smiter_M = {
		attack_armor_power_modifer = {
			1,
			0.4,
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
	critical_strike_stab_smiter_M_1h = {
		attack_armor_power_modifer = {
			1,
			1,
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
	critical_strike_stab_dual_smiter_L = {
		attack_armor_power_modifer = {
			1,
			1,
			2.1,
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
	armor_modifier_stab_smiter_M = {
		attack = {
			1,
			0.25,
			2.25,
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
	default_target_stab_smiter_M = {
		boost_curve_coefficient_headshot = 2,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 1,
		attack_template = "stab_smiter",
		power_distribution = {
			attack = 0.2,
			impact = 0.125
		}
	},
	default_target_stab_smiter_M_elf = {
		boost_curve_coefficient_headshot = 2,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 1,
		attack_template = "stab_smiter",
		power_distribution = {
			attack = 0.25,
			impact = 0.125
		}
	},
	default_target_spear_stab_smiter_M = {
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 1,
		attack_template = "stab_smiter",
		power_distribution = {
			attack = 0.25,
			impact = 0.25
		}
	},
	armor_modifier_stab_smiter_M_1h = {
		attack = {
			1,
			0.75,
			2.25,
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
	default_target_stab_smiter_M_1h = {
		boost_curve_coefficient_headshot = 2,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 1,
		attack_template = "stab_smiter",
		power_distribution = {
			attack = 0.3,
			impact = 0.175
		}
	},
	targets_stab_smiter_M = {
		[2] = {
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "stab_smiter",
			power_distribution = {
				attack = 0.125,
				impact = 0.1
			}
		}
	},
	critical_strike_stab_smiter_H = {
		attack_armor_power_modifer = {
			1,
			0.65,
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
	critical_strike_stab_smiter_polearm_H = {
		attack_armor_power_modifer = {
			1,
			0.4,
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
	critical_strike_stab_smiter_heavy_polearm_H = {
		attack_armor_power_modifer = {
			1,
			0.5,
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
	armor_modifier_stab_smiter_H = {
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
	default_target_stab_smiter_H = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "heavy_stab_smiter",
		power_distribution = {
			attack = 0.2,
			impact = 0.15
		}
	},
	targets_stab_smiter_H = {
		{
			boost_curve_coefficient_headshot = 1.5,
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 0.75,
			attack_template = "heavy_stab_smiter",
			armor_modifier = {
				attack = {
					1,
					0.65,
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
	},
	targets_stab_smiter_polearm_H = {
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
	},
	critical_strike_fencer_stab_L = {
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
	armor_modifier_fencer_stab_L = {
		attack = {
			1,
			0,
			1.5,
			1,
			0.75
		},
		impact = {
			1,
			0.1,
			0.5,
			1,
			0.75
		}
	},
	armor_modifier_fencer_stab_L_AP = {
		attack = {
			1,
			0.25,
			1.5,
			1,
			0.75
		},
		impact = {
			1,
			0.1,
			0.5,
			1,
			0.75
		}
	},
	default_target_fencer_stab_L = {
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient_headshot = 3,
		attack_template = "light_stab_smiter",
		power_distribution = {
			attack = 0.075,
			impact = 0.075
		}
	},
	targets_fencer_stab_L = {
		{
			dot_template_name = "weapon_bleed_dot_dagger",
			boost_curve_coefficient_headshot = 3,
			dot_balefire_variant = true,
			boost_curve_type = "ninja_curve",
			attack_template = "light_stab_smiter",
			power_distribution = {
				attack = 0.12,
				impact = 0.08
			}
		}
	},
	default_target_maidenguard_dash_ability = {
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient_headshot = 3,
		attack_template = "light_stab_smiter",
		power_distribution = {
			attack = 0,
			impact = 0.125
		}
	},
	default_target_maidenguard_dash_ability_bleed = {
		dot_template_name = "weapon_bleed_dot_maidenguard",
		boost_curve_coefficient_headshot = 3,
		boost_curve_type = "ninja_curve",
		attack_template = "light_stab_smiter",
		power_distribution = {
			attack = 0,
			impact = 0.125
		}
	},
	critical_strike_fencer_stab_M = {
		attack_armor_power_modifer = {
			1,
			0.75,
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
	armor_modifier_fencer_stab_M = {
		attack = {
			1,
			0.4,
			1.5,
			1,
			1,
			0.25
		},
		impact = {
			1,
			0.25,
			0.5,
			1,
			1,
			0.25
		}
	},
	default_target_fencer_stab_M = {
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 2.5,
		attack_template = "stab_smiter",
		power_distribution = {
			attack = 0.29,
			impact = 0.075
		}
	},
	default_target_fencer_stab_M_charged = {
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient_headshot = 2.5,
		attack_template = "stab_smiter",
		power_distribution = {
			attack = 0.55,
			impact = 0.125
		}
	},
	targets_fencer_stab_M = {},
	critical_strike_tank_L = {
		attack_armor_power_modifer = {
			1,
			0.25,
			1.5,
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
	cleave_distribution_tank_L = {
		attack = 0.2,
		impact = 0.6
	},
	cleave_distribution_tank_dual_L = {
		attack = 0.2,
		impact = 0.4
	},
	armor_modifier_tank_L = {
		attack = {
			1,
			0,
			1,
			1,
			1
		},
		impact = {
			1,
			1,
			0.5,
			1,
			1
		}
	},
	default_target_tank_L = {
		boost_curve_type = "tank_curve",
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.05,
			impact = 0.15
		}
	},
	targets_tank_L = {
		{
			boost_curve_type = "tank_curve",
			boost_curve_coefficient_headshot = 1.5,
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.175,
				impact = 0.25
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.175
			}
		}
	},
	default_target_tank_dual_L = {
		boost_curve_type = "tank_curve",
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.05,
			impact = 0.1
		}
	},
	targets_tank_dual_L = {
		{
			boost_curve_type = "tank_curve",
			boost_curve_coefficient_headshot = 1.5,
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.15,
				impact = 0.2
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.175
			}
		}
	},
	critical_strike_tank_spiked_L = {
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
			0.5,
			1,
			1
		}
	},
	cleave_distribution_tank_spiked_L = {
		attack = 0.25,
		impact = 0.25
	},
	armor_modifier_tank_spiked_L = {
		attack = {
			1,
			0.25,
			1.5,
			1,
			1
		},
		impact = {
			1,
			1,
			0.5,
			1,
			1
		}
	},
	default_target_tank_spiked_L = {
		boost_curve_type = "tank_curve",
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.075,
			impact = 0.075
		}
	},
	targets_tank_spiked_L = {
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.2,
				impact = 0.125
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.1
			}
		}
	},
	critical_strike_tank_M = {
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
	armor_modifier_tank_M = {
		attack = {
			1,
			0.2,
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
	armor_modifier_tank_M_1h = {
		attack = {
			1,
			0.35,
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
	cleave_distribution_tank_M = {
		attack = 0.3,
		impact = 0.8
	},
	default_target_tank_M = {
		boost_curve_type = "tank_curve",
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.05,
			impact = 0.05
		}
	},
	targets_tank_M = {
		{
			boost_curve_type = "tank_curve",
			boost_curve_coefficient_headshot = 1,
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.2,
				impact = 0.2
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.1,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.1
			}
		}
	},
	targets_tank_M_1h = {
		{
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			armor_modifier = {
				attack = {
					1,
					0.5,
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
			power_distribution = {
				attack = 0.3,
				impact = 0.2
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.1,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.1
			}
		}
	},
	targets_tank_M_1h_finesse = {
		{
			boost_curve_coefficient_headshot = 2,
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			armor_modifier = {
				attack = {
					1,
					0.6,
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
			power_distribution = {
				attack = 0.3,
				impact = 0.2
			},
			power_distribution = {
				attack = 0.32,
				impact = 0.2
			}
		},
		{
			boost_curve_type = "tank_curve",
			boost_curve_coefficient_headshot = 2,
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.18,
				impact = 0.18
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.15,
				impact = 0.15
			}
		}
	},
	targets_tank_M_dual = {
		{
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			armor_modifier = {
				attack = {
					1,
					0.5,
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
			power_distribution = {
				attack = 0.225,
				impact = 0.175
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.1,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.1
			}
		}
	},
	critical_strike_burning_tank_M = {
		attack_armor_power_modifer = {
			1,
			0.5,
			1.5,
			1,
			1.5
		},
		impact_armor_power_modifer = {
			1,
			1,
			1.5,
			1,
			1.5
		}
	},
	armor_modifier_burning_tank_M = {
		attack = {
			1,
			0.5,
			1.5,
			1,
			1.5
		},
		impact = {
			1,
			1,
			1.5,
			1,
			1.5
		}
	},
	cleave_distribution_burning_tank_M = {
		attack = 0.2,
		impact = 0.5
	},
	default_target_burning_tank_M = {
		dot_template_name = "burning_dot_1tick",
		dot_balefire_variant = true,
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.3,
		attack_template = "burning_tank",
		power_distribution = {
			attack = 0.075,
			impact = 0.15
		}
	},
	targets_burning_tank_M = {
		{
			dot_template_name = "burning_dot_1tick",
			dot_balefire_variant = true,
			boost_curve_type = "tank_curve",
			boost_curve_coefficient = 0.3,
			attack_template = "burning_tank",
			power_distribution = {
				attack = 0.2,
				impact = 0.3
			}
		},
		{
			dot_template_name = "burning_dot_1tick",
			dot_balefire_variant = true,
			boost_curve_type = "tank_curve",
			boost_curve_coefficient = 0.3,
			attack_template = "burning_tank",
			power_distribution = {
				attack = 0.15,
				impact = 0.2
			}
		}
	},
	critical_strike_tank_spiked_M = {
		attack_armor_power_modifer = {
			1.3,
			1,
			1.3,
			1.3,
			1.3
		},
		impact_armor_power_modifer = {
			1,
			1,
			0.5,
			1,
			1
		}
	},
	armor_modifier_tank_spiked_M = {
		attack = {
			1.3,
			0.8,
			1.3,
			1.3,
			1
		},
		impact = {
			1,
			1,
			0.5,
			1,
			0.75
		}
	},
	cleave_distribution_tank_spiked_M = {
		attack = 0.6,
		impact = 0.65
	},
	default_target_tank_spiked_M = {
		boost_curve_type = "tank_curve",
		stagger_duration_modifier = 1.5,
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.05,
			impact = 0.05
		}
	},
	targets_tank_spiked_M = {
		{
			boost_curve_type = "tank_curve",
			stagger_duration_modifier = 1.5,
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.3,
				impact = 0.3
			}
		},
		{
			boost_curve_type = "tank_curve",
			stagger_duration_modifier = 1.5,
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.15,
				impact = 0.15
			}
		},
		{
			boost_curve_type = "tank_curve",
			stagger_duration_modifier = 1.5,
			attack_template = "light_blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.1
			}
		}
	},
	critical_strike_tank_H = {
		attack_armor_power_modifer = {
			1,
			0.6,
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
	armor_modifier_tank_H = {
		attack = {
			1,
			0,
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
	cleave_distribution_tank_H = {
		attack = 0.3,
		impact = 0.8
	},
	default_target_tank_H = {
		boost_curve_type = "tank_curve",
		attack_template = "blunt_tank",
		power_distribution = {
			attack = 0.05,
			impact = 0.125
		}
	},
	targets_tank_H = {
		{
			boost_curve_type = "tank_curve",
			attack_template = "heavy_blunt_tank",
			power_distribution = {
				attack = 0.275,
				impact = 0.3
			},
			armor_modifier = {
				attack = {
					1,
					0.5,
					2,
					1,
					0.75
				},
				impact = {
					1.5,
					1,
					1,
					1,
					0.75
				}
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "heavy_blunt_tank",
			power_distribution = {
				attack = 0.15,
				impact = 0.225
			}
		},
		{
			boost_curve_type = "tank_curve",
			attack_template = "blunt_tank",
			power_distribution = {
				attack = 0.075,
				impact = 0.2
			}
		}
	},
	armor_modifier_markus_knight_charge = {
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
			100,
			1,
			1
		}
	},
	cleave_distribution_markus_knight_charge = {
		attack = 2,
		impact = 2
	},
	default_target_markus_knight_charge = {
		boost_curve_type = "tank_curve",
		attack_template = "shield_slam",
		power_distribution = {
			attack = 0,
			impact = 10
		}
	}
}

DLCUtils.require_list("power_level_template_files_names")
