-- chunkname: @scripts/settings/equipment/damage_profile_templates_dlc_lake.lua

local damage_templates = {
	questing_knight_career_sword = {
		charge_value = "heavy_attack",
		is_explosion = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1,
				2,
				1,
				1,
				1,
			},
			impact_armor_power_modifer = {
				1,
				1,
				200,
				1,
				1,
				1,
			},
		},
		armor_modifier = {
			attack = {
				1,
				1,
				2,
				0.1,
				1,
				1,
			},
			impact = {
				1,
				1,
				200,
				0.1,
				1,
				1,
			},
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.5,
		},
		default_target = {
			attack_template = "slashing_smiter",
			boost_curve_coefficient = 0.5,
			boost_curve_coefficient_headshot = 0.5,
			boost_curve_type = "smiter_curve",
			power_distribution = {
				attack = 2,
				impact = 2,
			},
		},
	},
	questing_knight_career_sword_stab = {
		charge_value = "heavy_attack",
		is_explosion = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1.5,
				1.5,
				2.5,
				0.1,
				1.5,
				1.5,
			},
			impact_armor_power_modifer = {
				1,
				1,
				200,
				0.1,
				1,
				1,
			},
		},
		armor_modifier = {
			attack = {
				1.5,
				1.5,
				2.5,
				0.1,
				1.5,
				1.5,
			},
			impact = {
				1,
				1,
				200,
				0.1,
				1,
				1,
			},
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.5,
		},
		default_target = {
			attack_template = "heavy_slashing_fencer",
			boost_curve_coefficient = 0.5,
			boost_curve_coefficient_headshot = 0.5,
			boost_curve_type = "smiter_curve",
			power_distribution = {
				attack = 2,
				impact = 2,
			},
		},
	},
	questing_knight_career_sword_tank = {
		charge_value = "heavy_attack",
		is_explosion = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1,
				2,
				1,
				1,
				1,
			},
			impact_armor_power_modifer = {
				1,
				1,
				200,
				1,
				1,
				1,
			},
		},
		armor_modifier = {
			attack = {
				1,
				1,
				2,
				0.1,
				1,
				1,
			},
			impact = {
				1,
				1,
				200,
				0.1,
				1,
				1,
			},
		},
		cleave_distribution = {
			attack = 100,
			impact = 100,
		},
		default_target = {
			attack_template = "heavy_slashing_tank",
			boost_curve_coefficient = 0.5,
			boost_curve_coefficient_headshot = 0.5,
			boost_curve_type = "tank_curve",
			power_distribution = {
				attack = 2,
				impact = 2,
			},
		},
	},
}

return damage_templates
