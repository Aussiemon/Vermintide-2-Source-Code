-- chunkname: @scripts/settings/equipment/damage_profile_templates_dlc_bless.lua

local function new_template(damage_profile_name, damage_profile_name_appendix, override_damage_profile_name, charge_value, default_attack_template, ...)
	local original_damage_profile = DamageProfileTemplates[damage_profile_name]
	local damage_profile = table.clone(original_damage_profile)
	local num_args = select("#", ...)

	if default_attack_template then
		local default_target_type = type(damage_profile.default_target)

		if default_target_type == "string" then
			damage_profile.default_target = PowerLevelTemplates[damage_profile.default_target]
		end

		damage_profile.default_target = table.clone(damage_profile.default_target)
		damage_profile.default_target.attack_template = default_attack_template

		if type(damage_profile.targets) == "string" then
			damage_profile.targets = PowerLevelTemplates[damage_profile.targets]
		end

		damage_profile.targets = table.clone(damage_profile.targets)

		local targets = damage_profile.targets

		if targets then
			for index, target in ipairs(targets) do
				if index <= num_args then
					target.attack_template = select(index, ...)
				else
					target.attack_template = default_attack_template
				end
			end
		end
	end

	if charge_value then
		damage_profile.charge_value = charge_value
	end

	if override_damage_profile_name then
		DamageProfileTemplates[override_damage_profile_name] = damage_profile
	elseif damage_profile_name_appendix then
		local new_damage_profile_name = damage_profile_name .. damage_profile_name_appendix

		DamageProfileTemplates[new_damage_profile_name] = damage_profile
	end
end

local damage_templates = {
	hammer_book_charged_explosion = {
		charge_value = "aoe",
		no_stagger_damage_reduction = true,
		armor_modifier = {
			attack = {
				1,
				1,
				1.5,
				1,
				0.75,
				0.3,
			},
			impact = {
				1,
				1,
				1,
				1,
				0.75,
				0.3,
			},
		},
		default_target = {
			attack_template = "drakegun",
			damage_type = "drakegun",
			power_distribution = {
				attack = 0.3,
				impact = 0.5,
			},
		},
	},
	great_hammer_righteous_heavy = {
		charge_value = "heavy_attack",
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1,
				2,
				1,
				1,
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1,
			},
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.8,
		},
		armor_modifier = {
			attack = {
				1,
				1,
				1.5,
				1,
				0.75,
			},
			impact = {
				1,
				1,
				1,
				1,
				0.75,
			},
		},
		default_target = {
			attack_template = "blunt_tank",
			boost_curve_coefficient = 4,
			boost_curve_type = "tank_curve",
			power_distribution = {
				attack = 0.5,
				impact = 0.5,
			},
		},
		targets = {
			{
				attack_template = "heavy_blunt_tank",
				boost_curve_coefficient = 4,
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.5,
					impact = 0.5,
				},
				armor_modifier = {
					attack = {
						1,
						1,
						2,
						1,
						0.75,
					},
					impact = {
						1.5,
						1,
						1,
						1,
						0.75,
					},
				},
			},
			{
				attack_template = "heavy_blunt_tank",
				boost_curve_coefficient = 4,
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.5,
					impact = 0.5,
				},
				armor_modifier = {
					attack = {
						1,
						1,
						2,
						1,
						0.75,
					},
					impact = {
						1.5,
						1,
						1,
						1,
						0.75,
					},
				},
			},
			{
				attack_template = "heavy_blunt_tank",
				boost_curve_coefficient = 4,
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.5,
					impact = 0.5,
				},
				armor_modifier = {
					attack = {
						1,
						1,
						2,
						1,
						0.75,
					},
					impact = {
						1.5,
						1,
						1,
						1,
						0.75,
					},
				},
			},
			{
				attack_template = "heavy_blunt_tank",
				boost_curve_coefficient = 4,
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.5,
					impact = 0.5,
				},
				armor_modifier = {
					attack = {
						1,
						1,
						2,
						1,
						0.75,
					},
					impact = {
						1.5,
						1,
						1,
						1,
						0.75,
					},
				},
			},
			{
				attack_template = "heavy_blunt_tank",
				boost_curve_coefficient = 4,
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.5,
					impact = 0.5,
				},
				armor_modifier = {
					attack = {
						1,
						1,
						2,
						1,
						0.75,
					},
					impact = {
						1.5,
						1,
						1,
						1,
						0.75,
					},
				},
			},
		},
	},
	priest_hammer_blunt_smiter = {
		charge_value = "heavy_attack",
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				1.1,
				1.75,
				1.2,
				1,
				1.1,
			},
			impact_armor_power_modifer = {
				1,
				1.1,
				1,
				1,
				1,
				1.1,
			},
		},
		cleave_distribution = {
			attack = 0.075,
			impact = 0.075,
		},
		armor_modifier = {
			attack = {
				1,
				1,
				1.75,
				1,
				0.75,
				1,
			},
			impact = {
				1,
				1,
				1,
				1,
				0.75,
				1,
			},
		},
		default_target = {
			attack_template = "heavy_blunt_smiter",
			boost_curve_coefficient = 0.75,
			boost_curve_coefficient_headshot = 0.5,
			boost_curve_type = "smiter_curve",
			power_distribution = {
				attack = 0.6,
				impact = 0.3,
			},
		},
		targets = {
			[2] = {
				attack_template = "heavy_blunt_smiter",
				boost_curve_type = "smiter_curve",
				power_distribution = {
					attack = 0.2,
					impact = 0.1,
				},
			},
		},
	},
	priest_hammer_blunt_tank_upper_2h = {
		charge_value = "light_attack",
		stagger_duration_modifier = 1.5,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				1,
				1,
			},
			impact_armor_power_modifer = {
				1,
				1,
				0.5,
				1,
				1,
			},
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.8,
		},
		armor_modifier = {
			attack = {
				1,
				0.5,
				1,
				1,
				0.75,
			},
			impact = {
				1,
				1,
				0.5,
				1,
				0.75,
			},
		},
		default_target = {
			attack_template = "blunt_tank_uppercut",
			boost_curve_type = "tank_curve",
			power_distribution = {
				attack = 0.05,
				impact = 0.05,
			},
		},
		targets = {
			{
				attack_template = "blunt_tank_uppercut",
				boost_curve_coefficient_headshot = 1,
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.475,
					impact = 0.475,
				},
			},
			{
				attack_template = "blunt_tank_uppercut",
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.3,
					impact = 0.3,
				},
			},
			{
				attack_template = "blunt_tank_uppercut",
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.075,
					impact = 0.1,
				},
			},
		},
	},
	victor_priest_activated_ability_nuke_explosion = {
		charge_value = "ability",
		is_explosion = true,
		no_stagger_damage_reduction_ranged = true,
		armor_modifier = {
			attack = {
				1,
				0.2,
				1.5,
				1,
				0.75,
				0,
			},
			impact = {
				1,
				0.5,
				1,
				1,
				0.75,
				0.5,
			},
		},
		default_target = {
			attack_template = "flame_blast",
			damage_type = "burn_shotgun",
			dot_template_name = "victor_priest_nuke_dot",
			power_distribution = {
				attack = 0.25,
				impact = 0.75,
			},
		},
	},
	priest_shield_slam_shotgun = {
		armor_modifier = "armor_modifier_slam_tank_L",
		charge_value = "light_attack",
		critical_strike = "critical_strike_slam_tank_L",
		default_target = "target_settings_slam_tank_L",
	},
	priest_shield_slam_shotgun_aoe = {
		armor_modifier = "armor_modifier_slam_tank_L",
		charge_value = "light_attack",
		critical_strike = "critical_strike_slam_tank_L",
		default_target = "aoe_target_settings_slam_tank_L",
		no_damage = true,
	},
	priest_hammer_heavy_blunt_tank_upper = {
		charge_value = "heavy_attack",
		stagger_duration_modifier = 1.8,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.6,
				2,
				1,
				1,
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1,
			},
		},
		cleave_distribution = {
			attack = 0.3,
			impact = 0.8,
		},
		armor_modifier = {
			attack = {
				1,
				0,
				1.5,
				1,
				0.75,
			},
			impact = {
				1,
				1,
				1,
				1,
				0.75,
			},
		},
		default_target = {
			attack_template = "blunt_tank",
			boost_curve_type = "tank_curve",
			power_distribution = {
				attack = 0.05,
				impact = 0.125,
			},
		},
		targets = {
			{
				attack_template = "heavy_blunt_tank",
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.46,
					impact = 0.3,
				},
				armor_modifier = {
					attack = {
						1,
						0.5,
						2,
						1,
						0.75,
					},
					impact = {
						1.5,
						1,
						1,
						1,
						0.75,
					},
				},
			},
			{
				attack_template = "heavy_blunt_tank",
				boost_curve_type = "tank_curve",
				power_distribution = {
					attack = 0.45,
					impact = 0.225,
				},
			},
		},
	},
}

new_template("medium_blunt_smiter_1h", "_priest", nil, nil)

DamageProfileTemplates.medium_blunt_smiter_1h_priest.default_target.power_distribution.impact = 0.3

new_template("medium_blunt_smiter_1h", "_thrust", nil, nil)

DamageProfileTemplates.medium_blunt_smiter_1h_thrust.default_target.power_distribution.impact = 0.35
DamageProfileTemplates.medium_blunt_smiter_1h_thrust.default_target.power_distribution.attack = 0.45

new_template("shield_slam_aoe", "_priest", nil, nil)

DamageProfileTemplates.shield_slam_aoe_priest.charge_value = "aoe"

return damage_templates
