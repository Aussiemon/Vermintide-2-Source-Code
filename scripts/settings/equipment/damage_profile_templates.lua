require("scripts/settings/equipment/power_level_templates")

DamageProfileTemplates = {}

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

DamageProfileTemplates.default = {
	charge_value = "n/a",
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
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
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	default_target = {
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.1,
			impact = 0.1
		}
	}
}
DamageProfileTemplates.debug_damage = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.debug_damage.default_target.power_distribution.attack = 1
DamageProfileTemplates.debug_damage.default_target.power_distribution.impact = 1
DamageProfileTemplates.light_slashing_axe_linesman = {
	armor_modifier = "armor_modifier_axe_linesman_L",
	critical_strike = "critical_strike_axe_linesman_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_axe_linesman_L",
	default_target = "default_target_axe_linesman_L",
	targets = "targets_axe_linesman_L"
}

new_template("light_slashing_axe_linesman", "_upper", nil, nil, "slashing_upper", "slashing_upper")

DamageProfileTemplates.medium_slashing_axe_linesman = {
	armor_modifier = "armor_modifier_axe_linesman_M",
	critical_strike = "critical_strike_axe_linesman_M",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_axe_linesman_M",
	default_target = "default_target_axe_linesman_M",
	targets = "targets_axe_linesman_M"
}

new_template("medium_slashing_axe_linesman", "_1h", nil, "heavy_attack")

DamageProfileTemplates.medium_slashing_axe_linesman_1h.targets = "targets_axe_linesman_M_1h"
DamageProfileTemplates.medium_slashing_axe_linesman_1h.melee_boost_override = 6

new_template("medium_slashing_axe_linesman_1h", nil, "medium_slashing_axe_linesman_dual", nil)

DamageProfileTemplates.medium_slashing_axe_linesman_dual.targets = "targets_axe_linesman_M_dual"
DamageProfileTemplates.heavy_slashing_axe_linesman = {
	armor_modifier = "armor_modifier_axe_linesman_H",
	critical_strike = "critical_strike_axe_linesman_H",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_axe_linesman_H",
	default_target = "default_target_axe_linesman_H",
	targets = "targets_axe_linesman_H"
}
DamageProfileTemplates.light_slashing_linesman = {
	armor_modifier = "armor_modifier_linesman_L",
	critical_strike = "critical_strike_linesman_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_linesman_L",
	default_target = "default_target_linesman_L",
	targets = "targets_linesman_L"
}
DamageProfileTemplates.light_slashing_linesman_dual = {
	armor_modifier = "armor_modifier_linesman_dual_L",
	critical_strike = "critical_strike_linesman_dual_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_linesman_dual_L",
	default_target = "default_target_linesman_dual_L",
	targets = "targets_linesman_dual_L"
}

new_template("light_slashing_linesman", nil, "light_slashing_linesman_elf", nil, nil)

DamageProfileTemplates.light_slashing_linesman_elf.armor_modifier = "armor_modifier_linesman_elf_L"

new_template("light_slashing_linesman_dual", "_medium", nil, "heavy_attack")

DamageProfileTemplates.light_slashing_linesman_dual_medium.melee_boost_override = 4
DamageProfileTemplates.light_slashing_linesman_dual_medium.armor_modifier = "armor_modifier_linesman_dual_M"
DamageProfileTemplates.light_slashing_linesman_dual_medium.targets = "targets_linesman_dual_M"
DamageProfileTemplates.light_slashing_linesman_dual_medium.critical_strike = "critical_strike_linesman_dual_M"
DamageProfileTemplates.light_slashing_linesman_fencer = {
	armor_modifier = "armor_modifier_linesman_fencer_L",
	critical_strike = "critical_strike_linesman_fencer_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_linesman_fencer_L",
	default_target = "default_target_linesman_fencer_L",
	targets = "targets_linesman_fencer_L"
}

new_template("light_slashing_linesman", "_flat", nil, nil, "light_slashing_tank", "light_slashing_tank")
new_template("light_slashing_linesman", "_burn", nil, nil, "burning_linesman", "light_burning_linesman")

DamageProfileTemplates.light_slashing_linesman_burn.targets = "targets_linesman_burn_L"
DamageProfileTemplates.medium_slashing_linesman = {
	armor_modifier = "armor_modifier_linesman_M",
	critical_strike = "critical_strike_linesman_M",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_linesman_M",
	default_target = "default_target_linesman_M",
	targets = "targets_linesman_M"
}
DamageProfileTemplates.medium_slashing_linesman_executioner = {
	armor_modifier = "armor_modifier_linesman_M",
	critical_strike = "critical_strike_linesman_M",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_linesman_executioner_M",
	default_target = "default_target_linesman_executioner_M",
	targets = "targets_linesman_executioner_M"
}

new_template("light_slashing_linesman", nil, "medium_slashing_linesman_spear", nil)

DamageProfileTemplates.medium_slashing_linesman_spear.targets = "targets_linesman_spear_M"

new_template("medium_slashing_linesman", "_1h", nil, "heavy_attack")

DamageProfileTemplates.heavy_slashing_linesman = {
	armor_modifier = "armor_modifier_linesman_H",
	critical_strike = "critical_strike_linesman_H",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_linesman_H",
	default_target = "default_target_linesman_H",
	targets = "targets_linesman_H"
}
DamageProfileTemplates.heavy_slashing_linesman_polearm = {
	armor_modifier = "armor_modifier_linesman_H",
	critical_strike = "critical_strike_linesman_H",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_linesman_executioner_H",
	default_target = "default_target_linesman_H",
	targets = "targets_linesman_polearm_H"
}
DamageProfileTemplates.heavy_slashing_linesman_executioner = {
	armor_modifier = "armor_modifier_linesman_H",
	critical_strike = "critical_strike_linesman_H",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_linesman_executioner_H",
	default_target = "default_target_linesman_executioner_H",
	targets = "targets_linesman_executioner_H"
}
DamageProfileTemplates.light_blunt_tank = {
	stagger_duration_modifier = 1.25,
	critical_strike = "critical_strike_tank_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_tank_L",
	default_target = "default_target_tank_L",
	targets = "targets_tank_L",
	armor_modifier = "armor_modifier_tank_L"
}

new_template("light_blunt_tank", "_diag", nil, nil, "light_blunt_linesman", "blunt_linesman")
new_template("light_blunt_tank", "_upper", nil, nil, "light_blunt_linesman", "blunt_tank_uppercut")

DamageProfileTemplates.light_blunt_tank_dual = {
	armor_modifier = "armor_modifier_tank_L",
	critical_strike = "critical_strike_tank_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_tank_dual_L",
	default_target = "default_target_tank_dual_L",
	targets = "targets_tank_dual_L"
}

new_template("light_blunt_tank_dual", "_diag", nil, nil, "light_blunt_linesman", "blunt_linesman")
new_template("light_blunt_tank_dual", "_upper", nil, nil, "light_blunt_linesman", "blunt_tank_uppercut")

DamageProfileTemplates.light_blunt_tank_spiked = {
	stagger_duration_modifier = 1.5,
	critical_strike = "critical_strike_tank_spiked_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_tank_spiked_L",
	default_target = "default_target_tank_spiked_L",
	targets = "targets_tank_spiked_L",
	armor_modifier = "armor_modifier_tank_spiked_L"
}
DamageProfileTemplates.medium_burning_tank = {
	stagger_duration_modifier = 1.5,
	critical_strike = "critical_strike_burning_tank_M",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_burning_tank_M",
	default_target = "default_target_burning_tank_M",
	targets = "targets_burning_tank_M",
	armor_modifier = "armor_modifier_burning_tank_M"
}
DamageProfileTemplates.medium_blunt_tank = {
	stagger_duration_modifier = 1.5,
	critical_strike = "critical_strike_tank_M",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_tank_M",
	default_target = "default_target_tank_M",
	targets = "targets_tank_M",
	armor_modifier = "armor_modifier_tank_M"
}

new_template("medium_blunt_tank", "_1h", nil, "heavy_attack")

DamageProfileTemplates.medium_blunt_tank_1h.targets = "targets_tank_M_1h"
DamageProfileTemplates.medium_blunt_tank_1h.armor_modifier = "armor_modifier_tank_M_1h"

new_template("medium_blunt_tank_1h", nil, "medium_slashing_tank_1h", "heavy_attack", "light_slashing_tank", "slashing_tank", "slashing_tank", "light_slashing_tank")
new_template("medium_blunt_tank_1h", nil, "medium_blunt_tank_dual", nil, nil)

DamageProfileTemplates.medium_blunt_tank_dual.targets = "targets_tank_M_dual"
DamageProfileTemplates.medium_blunt_tank_spiked = {
	stagger_duration_modifier = 1.5,
	critical_strike = "critical_strike_tank_spiked_M",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_tank_spiked_M",
	default_target = "default_target_tank_spiked_M",
	targets = "targets_tank_spiked_M",
	armor_modifier = "armor_modifier_tank_spiked_M"
}

new_template("medium_blunt_tank_spiked", nil, "medium_blunt_tank_upper_1h", "heavy_attack", "light_blunt_linesman", "blunt_tank_uppercut")

DamageProfileTemplates.heavy_blunt_tank = {
	stagger_duration_modifier = 1.8,
	critical_strike = "critical_strike_tank_H",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_tank_H",
	default_target = "default_target_tank_H",
	targets = "targets_tank_H",
	armor_modifier = "armor_modifier_tank_H"
}

new_template("heavy_blunt_tank", nil, "heavy_slashing_tank", "heavy_attack", "heavy_slashing_tank", "slashing_tank", "slashing_tank", "light_slashing_tank")

DamageProfileTemplates.light_slashing_smiter = {
	armor_modifier = "armor_modifier_smiter_L",
	critical_strike = "critical_strike_smiter_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_smiter_L",
	ignore_stagger_reduction = true,
	targets = "targets_smiter_L"
}
DamageProfileTemplates.light_pointy_smiter = {
	armor_modifier = "armor_modifier_pointy_smiter_L",
	critical_strike = "critical_strike_pointy_smiter_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_pointy_smiter_L",
	targets = "targets_smiter_L"
}

new_template("light_slashing_smiter", "_diag", nil, nil, "slashing_linesman")
new_template("light_slashing_smiter", "_flat", nil, nil, "slashing_tank")
new_template("light_slashing_smiter", "_upper", nil, nil, "slashing_upper")
new_template("light_pointy_smiter", "_diag", nil, nil, "blunt_linesman")
new_template("light_pointy_smiter", "_flat", nil, nil, "blunt_tank")
new_template("light_pointy_smiter", "_upper", nil, nil, "blunt_tank_uppercut")
new_template("light_slashing_smiter_diag", "_dual_L", nil, nil)

DamageProfileTemplates.light_slashing_smiter_diag_dual_L.default_target = "default_target_smiter_L_dual_light"
DamageProfileTemplates.light_slashing_smiter_diag_dual_L.armor_modifier = "armor_modifier_smiter_L_dual_light"
DamageProfileTemplates.light_slashing_smiter_diag_dual_L.critical_strike = "critical_strike_smiter_L_dual_light"
DamageProfileTemplates.light_slashing_smiter_diag_dual_L.ignore_stagger_reduction = false

new_template("light_slashing_smiter", "_dual", nil, "heavy_attack")

DamageProfileTemplates.light_slashing_smiter_dual.default_target = "default_target_smiter_L_dual_heavy"
DamageProfileTemplates.light_slashing_smiter_dual.ignore_stagger_reduction = false

new_template("light_slashing_smiter", "_dual_bopp", nil, "light_attack")

DamageProfileTemplates.light_slashing_smiter_dual_bopp.default_target = "default_target_smiter_L_dual_light"
DamageProfileTemplates.light_slashing_smiter_dual_bopp.critical_strike = "critical_strike_smiter_L_dual_light"
DamageProfileTemplates.light_slashing_smiter_dual_bopp.ignore_stagger_reduction = false

new_template("light_slashing_smiter", nil, "light_blunt_smiter", nil, "light_blunt_smiter")
new_template("light_slashing_smiter_dual", nil, "light_blunt_smiter_dual", nil, "blunt_smiter")
new_template("light_slashing_smiter_dual", nil, "light_blunt_smiter_dual_diag", nil, "blunt_linesman")
new_template("light_slashing_smiter_dual", nil, "light_blunt_smiter_dual_flat", nil, "blunt_tank")

DamageProfileTemplates.medium_slashing_smiter = {
	armor_modifier = "armor_modifier_smiter_M",
	critical_strike = "critical_strike_smiter_M",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_smiter_M",
	targets = "targets_smiter_M",
	shield_break = true
}

new_template("medium_slashing_smiter", "_diag", nil, nil, "heavy_slashing_linesman")
new_template("medium_slashing_smiter", "_1h", nil, "heavy_attack")
new_template("medium_slashing_smiter", "_upper", nil, "heavy_attack", "slashing_upper")

DamageProfileTemplates.medium_slashing_smiter_1h.melee_boost_override = 5

new_template("medium_slashing_smiter", "_2h")

DamageProfileTemplates.medium_slashing_smiter_2h.default_target = "default_target_smiter_M_2H"
DamageProfileTemplates.medium_slashing_smiter_2h.critical_strike = "critical_strike_smiter_M_2h"

new_template("medium_slashing_smiter_2h", "_upper", nil, nil, "slashing_upper")
new_template("medium_slashing_smiter_2h", "_flat", nil, nil, "slashing_tank")
new_template("medium_slashing_smiter_2h", nil, "medium_blunt_smiter_2h", nil, "blunt_tank")
new_template("medium_slashing_smiter", "_flat", nil, nil, "slashing_tank")
new_template("medium_slashing_smiter", "_flat_1h", nil, "heavy_attack", "slashing_tank")
new_template("medium_slashing_smiter", nil, "medium_blunt_smiter", nil, "blunt_smiter")
new_template("medium_blunt_smiter", "_diag", nil, nil, "blunt_linesman")
new_template("medium_blunt_smiter", "_flat", nil, nil, "blunt_tank")
new_template("medium_blunt_smiter", "_flat_2h", nil, "light_attack", "blunt_tank")
new_template("medium_blunt_smiter", "_upper", nil, nil, "blunt_tank_uppercut")
new_template("medium_blunt_smiter_upper", "_1h", nil, "heavy_attack")
new_template("medium_blunt_smiter", "_1h", nil, "heavy_attack")
new_template("medium_blunt_smiter_upper", nil, "medium_pointy_smiter_upper_1h", "heavy_attack")
new_template("medium_blunt_smiter_flat", nil, "medium_pointy_smiter_flat_1h", "heavy_attack")
new_template("medium_blunt_smiter_diag", nil, "medium_pointy_smiter_diag_1h", "heavy_attack")

DamageProfileTemplates.medium_pointy_smiter_upper_1h.armor_modifier = "armor_modifier_pointy_smiter_M"
DamageProfileTemplates.medium_pointy_smiter_flat_1h.armor_modifier = "armor_modifier_pointy_smiter_M"
DamageProfileTemplates.medium_pointy_smiter_flat_1h.critical_strike = "critical_strike_pointy_smiter_L"

new_template("medium_blunt_smiter_upper", nil, "medium_blunt_smiter_2h_hammer_upper", nil, nil)

DamageProfileTemplates.medium_blunt_smiter_2h_hammer_upper.armor_modifier = "armor_modifier_blunt_smiter_2h_hammer_H"
DamageProfileTemplates.medium_blunt_smiter_2h_hammer_upper.critical_strike = "critical_strike_blunt_smiter_2h_hammer_H"

new_template("medium_blunt_smiter_diag", nil, "medium_blunt_smiter_2h_hammer_diag", nil, nil)

DamageProfileTemplates.medium_blunt_smiter_2h_hammer_diag.armor_modifier = "armor_modifier_blunt_smiter_2h_hammer_H"
DamageProfileTemplates.medium_blunt_smiter_2h_hammer_diag.critical_strike = "critical_strike_blunt_smiter_2h_hammer_H"

new_template("medium_blunt_smiter", nil, "medium_blunt_smiter_2h_hammer", nil, nil)

DamageProfileTemplates.medium_blunt_smiter_2h_hammer.armor_modifier = "armor_modifier_blunt_smiter_2h_hammer_H"
DamageProfileTemplates.medium_blunt_smiter_2h_hammer.critical_strike = "critical_strike_blunt_smiter_2h_hammer_H"
DamageProfileTemplates.medium_blunt_smiter_burn = {
	armor_modifier = "armor_modifier_smiter_M",
	critical_strike = "critical_strike_smiter_M",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_smiter_burn_M",
	targets = "targets_smiter_M",
	shield_break = true
}
DamageProfileTemplates.heavy_blunt_smiter_burn = {
	armor_modifier = "armor_modifier_smiter_M",
	critical_strike = "critical_strike_smiter_M",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_smiter_burn_H",
	targets = "targets_smiter_M",
	shield_break = true
}
DamageProfileTemplates.light_slashing_smiter_stab = {
	armor_modifier = "armor_modifier_stab_smiter_L",
	critical_strike = "critical_strike_stab_smiter_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_stab_smiter_L",
	targets = "targets_stab_smiter_L"
}

new_template("light_slashing_smiter_stab", nil, "light_blunt_smiter_stab", nil, "heavy_blunt_fencer")

DamageProfileTemplates.light_blunt_smiter_stab.targets = "targets_blunt_smiter_stab_L"

new_template("light_slashing_smiter_stab", "_burn", nil, nil)

DamageProfileTemplates.light_slashing_smiter_stab_burn.targets = "targets_burning_stab_smiter_L"

new_template("light_slashing_smiter_stab_burn", nil, "light_blunt_smiter_stab_burn", nil)

DamageProfileTemplates.light_blunt_smiter_stab_burn.targets = "targets_burning_punch_smiter_L"
DamageProfileTemplates.light_blunt_smiter_stab_burn.armor_modifier = "armor_modifier_burning_punch_smiter_L"
DamageProfileTemplates.medium_slashing_smiter_stab = {
	armor_modifier = "armor_modifier_stab_smiter_M",
	critical_strike = "critical_strike_stab_smiter_M",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_stab_smiter_M",
	melee_boost_override = 2.5
}

new_template("medium_slashing_smiter_stab", nil, "medium_spear_smiter_stab", "heavy_attack")

DamageProfileTemplates.medium_spear_smiter_stab.default_target = "default_target_spear_stab_smiter_M"

new_template("medium_blunt_smiter_burn", nil, "medium_burning_smiter_stab_H", "heavy_attack")

DamageProfileTemplates.medium_burning_smiter_stab_H.default_target = "default_target_burning_stab_smiter_M"
DamageProfileTemplates.medium_burning_smiter_stab_H.ignore_stagger_reduction = true
DamageProfileTemplates.medium_slashing_smiter_stab_1h = {
	armor_modifier = "armor_modifier_stab_smiter_M_1h",
	critical_strike = "critical_strike_stab_smiter_M_1h",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_stab_smiter_M_1h"
}

new_template("light_slashing_smiter_stab", nil, "light_slashing_smiter_stab_dual", "heavy_attack")

DamageProfileTemplates.light_slashing_smiter_stab_dual.armor_modifier = "armor_modifier_stab_smiter_M_1h"
DamageProfileTemplates.light_slashing_smiter_stab_dual.targets = "targets_stab_dual_smiter_L"
DamageProfileTemplates.light_slashing_smiter_stab_dual.melee_boost_override = 3.5
DamageProfileTemplates.heavy_slashing_smiter_stab = {
	armor_modifier = "armor_modifier_stab_smiter_H",
	critical_strike = "critical_strike_stab_smiter_H",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_stab_smiter_H",
	targets = "targets_stab_smiter_H",
	melee_boost_override = 3
}
DamageProfileTemplates.heavy_slashing_smiter_stab_polearm = {
	armor_modifier = "armor_modifier_stab_smiter_H",
	critical_strike = "critical_strike_stab_smiter_heavy_polearm_H",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_stab_smiter_H",
	targets = "targets_stab_smiter_polearm_H",
	melee_boost_override = 2.5
}
DamageProfileTemplates.maidenguard_dash_ability = {
	armor_modifier = "armor_modifier_fencer_stab_L_AP",
	critical_strike = "critical_strike_fencer_stab_L",
	charge_value = "ability",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_maidenguard_dash_ability",
	require_damage_for_dot = false
}
DamageProfileTemplates.maidenguard_dash_ability_bleed = {
	armor_modifier = "armor_modifier_fencer_stab_L_AP",
	critical_strike = "critical_strike_fencer_stab_L",
	charge_value = "ability",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_maidenguard_dash_ability_bleed",
	require_damage_for_dot = false,
	is_dot = true
}
DamageProfileTemplates.light_fencer_stab = {
	armor_modifier = "armor_modifier_fencer_stab_L_AP",
	critical_strike = "critical_strike_fencer_stab_L",
	charge_value = "light_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_fencer_stab_L",
	targets = "targets_fencer_stab_L",
	require_damage_for_dot = true
}

new_template("light_fencer_stab", "_diag", nil, nil, "light_slashing_linesman_hs")

DamageProfileTemplates.light_fencer_stab_diag.armor_modifier = "armor_modifier_fencer_stab_L"
DamageProfileTemplates.light_fencer_stab_diag.cleave_distribution = "cleave_distribution_smiter_fencer"
DamageProfileTemplates.medium_fencer_stab = {
	armor_modifier = "armor_modifier_fencer_stab_M",
	critical_strike = "critical_strike_fencer_stab_M",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_fencer_stab_M",
	targets = "targets_fencer_stab_M"
}

new_template("medium_fencer_stab", "_charged", nil, nil)

DamageProfileTemplates.medium_fencer_stab_charged.default_target = "default_target_fencer_stab_M_charged"
DamageProfileTemplates.heavy_slashing_smiter = {
	armor_modifier = "armor_modifier_smiter_H",
	critical_strike = "critical_strike_smiter_H",
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_smiter_default",
	default_target = "default_target_smiter_H",
	targets = "targets_smiter_H",
	shield_break = true
}

new_template("heavy_slashing_smiter", "_polearm", nil)

DamageProfileTemplates.heavy_slashing_smiter_polearm.no_stagger_damage_reduction = false
DamageProfileTemplates.heavy_slashing_smiter_polearm.shield_break = false

new_template("heavy_slashing_smiter", nil, "heavy_slashing_smiter_executioner")

DamageProfileTemplates.heavy_slashing_smiter_executioner.default_target = "default_target_smiter_executioner_H"
DamageProfileTemplates.heavy_slashing_smiter_executioner.critical_strike = "critical_strike_smiter_executioner_H"

new_template("heavy_slashing_smiter", nil, "heavy_slashing_smiter_glaive")

DamageProfileTemplates.heavy_slashing_smiter_glaive.default_target = "default_target_smiter_glaive_H"
DamageProfileTemplates.heavy_slashing_smiter_glaive.melee_boost_override = 3
DamageProfileTemplates.heavy_slashing_smiter_glaive.critical_strike = "critical_strike_smiter_glaive_H"

new_template("heavy_slashing_smiter", nil, "heavy_blunt_smiter", nil, "heavy_blunt_smiter")
new_template("heavy_blunt_smiter", nil, "heavy_blunt_smiter_pick")

DamageProfileTemplates.heavy_blunt_smiter_pick.critical_strike = nil

new_template("heavy_blunt_smiter", "_charged", nil, nil, "heavy_blunt_smiter_pick")

DamageProfileTemplates.heavy_blunt_smiter_charged.default_target = "default_target_smiter_H_charged"
DamageProfileTemplates.heavy_blunt_smiter_charged.armor_modifier = "armor_modifier_smiter_pick_H"
DamageProfileTemplates.heavy_blunt_smiter_charged.critical_strike = nil
DamageProfileTemplates.shield_slam_shotgun = {
	armor_modifier = "armor_modifier_slam_tank_L",
	critical_strike = "critical_strike_slam_tank_L",
	charge_value = "heavy_attack",
	default_target = "target_settings_slam_tank_L"
}
DamageProfileTemplates.shield_slam_shotgun_aoe = {
	armor_modifier = "armor_modifier_slam_tank_L",
	critical_strike = "critical_strike_slam_tank_L",
	charge_value = "heavy_attack",
	default_target = "aoe_target_settings_slam_tank_L",
	no_damage = true
}
DamageProfileTemplates.shield_slam_target = {
	stagger_duration_modifier = 1.75,
	critical_strike = "critical_strike_slam_tank_M",
	charge_value = "heavy_attack",
	shield_break = true,
	default_target = "default_target_slam_target_tank_M",
	armor_modifier = "armor_modifier_slam_target_tank_M"
}
DamageProfileTemplates.shield_slam = {
	stagger_duration_modifier = 1.75,
	critical_strike = "critical_strike_slam_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = "armor_modifier_slam_tank_M",
	default_target = "default_target_slam_tank_M"
}
DamageProfileTemplates.shield_slam_aoe = {
	stagger_duration_modifier = 1.5,
	critical_strike = "critical_strike_slam_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = "armor_modifier_slam_aoe_tank_M",
	default_target = "default_target_slam_aoe_tank_M",
	no_damage = true
}
DamageProfileTemplates.dagger_burning_slam_target = {
	stagger_duration_modifier = 1.75,
	critical_strike = "armor_modifier_slam_burn_target_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = "armor_modifier_slam_burn_target_tank_M",
	default_target = "default_target_slam_burn_target_tank_M",
	ignore_stagger_reduction = true
}
DamageProfileTemplates.dagger_burning_slam_target_fencer = {
	stagger_duration_modifier = 1.75,
	critical_strike = "armor_modifier_slam_burn_target_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = "armor_modifier_slam_burn_target_tank_M",
	default_target = "default_target_slam_burn_target_tank_M",
	ignore_stagger_reduction = true
}
DamageProfileTemplates.dagger_burning_slam = {
	stagger_duration_modifier = 1.75,
	critical_strike = "armor_modifier_slam_burn_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = "armor_modifier_slam_burn_tank_M",
	default_target = "default_target_slam_burn_tank_M",
	ignore_stagger_reduction = true
}
DamageProfileTemplates.dagger_burning_slam_fencer = {
	stagger_duration_modifier = 1.75,
	critical_strike = "armor_modifier_slam_burn_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = "armor_modifier_slam_burn_tank_M",
	default_target = "default_target_slam_burn_fencer_M",
	ignore_stagger_reduction = true
}
DamageProfileTemplates.dagger_burning_slam_aoe = {
	stagger_duration_modifier = 1.5,
	critical_strike = "armor_modifier_slam_burn_aoe_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = "armor_modifier_slam_burn_aoe_tank_M",
	default_target = "default_target_slam_burn_aoe_tank_M",
	ignore_stagger_reduction = true,
	no_damage = true
}
DamageProfileTemplates.dagger_burning_slam_fencer_aoe = {
	stagger_duration_modifier = 1.5,
	critical_strike = "armor_modifier_slam_burn_aoe_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = "armor_modifier_slam_burn_aoe_tank_M",
	default_target = "default_target_slam_burn_aoe_fencer_M",
	ignore_stagger_reduction = true,
	no_damage = true
}
DamageProfileTemplates.torch = {
	critical_strike = "critical_strike_slam_tank_M",
	charge_value = "light_attack",
	armor_modifier = {
		attack = {
			1,
			0,
			1,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	cleave_distribution = {
		attack = 100,
		impact = 100
	},
	default_target = {
		stagger_duration_modifier = 1.5,
		dot_template_name = "burning_1W_dot",
		dead_attack_template = "flame_blast",
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "light_blunt_fencer",
		power_distribution = {
			attack = 0.025,
			impact = 0.05
		}
	}
}
DamageProfileTemplates.torch_heavy = {
	critical_strike = "critical_strike_slam_tank_M",
	charge_value = "heavy_attack",
	armor_modifier = {
		attack = {
			1,
			0,
			1,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	cleave_distribution = {
		attack = 100,
		impact = 100
	},
	default_target = {
		stagger_duration_modifier = 1.75,
		dot_template_name = "burning_3W_dot",
		dead_attack_template = "flame_blast",
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "blunt_tank",
		power_distribution = {
			attack = 0.075,
			impact = 0.125
		}
	}
}
DamageProfileTemplates.torch_stab = {
	critical_strike = "critical_strike_slam_tank_M",
	charge_value = "light_attack",
	armor_modifier = {
		attack = {
			1,
			0,
			1,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	cleave_distribution = {
		attack = 0.1,
		impact = 0.1
	},
	default_target = {
		stagger_duration_modifier = 1.75,
		dot_template_name = "burning_3W_dot",
		dead_attack_template = "flame_blast",
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "blunt_fencer",
		power_distribution = {
			attack = 0.05,
			impact = 0.1
		}
	}
}
DamageProfileTemplates.heavy_push = {
	stagger_duration_modifier = 1.75,
	armor_modifier = "armor_modifier_push_H",
	charge_value = "action_push",
	cleave_distribution = "cleave_distribution_push_default",
	default_target = "target_push_H",
	is_push = true,
	damage_type = "push",
	no_damage = true
}
DamageProfileTemplates.slayer_leap_landing = {
	is_push = true,
	armor_modifier = "armor_modifier_push_slayer_leap",
	charge_value = "action_push",
	cleave_distribution = "cleave_distribution_push_default",
	default_target = "target_push_slayer_leap",
	damage_type = "push",
	no_damage = true
}
DamageProfileTemplates.slayer_leap_landing_impact = {
	is_push = true,
	armor_modifier = "armor_modifier_push_slayer_leap_impact",
	charge_value = "action_push",
	cleave_distribution = "cleave_distribution_push_default",
	default_target = "target_push_slayer_leap_impact",
	damage_type = "push",
	no_damage = true
}
DamageProfileTemplates.ability_push = {
	armor_modifier = "armor_modifier_push_Ability",
	is_explosion = true,
	charge_value = "ability",
	cleave_distribution = "cleave_distribution_push_default",
	default_target = "target_push_Ability",
	no_friendly_fire = true,
	no_damage = true
}
DamageProfileTemplates.medium_push = {
	stagger_duration_modifier = 1.3,
	armor_modifier = "armor_modifier_push_M",
	charge_value = "action_push",
	cleave_distribution = "cleave_distribution_push_default",
	default_target = "target_push_M",
	is_push = true,
	damage_type = "push",
	no_damage = true
}
DamageProfileTemplates.shield_push = {
	cleave_distribution = "cleave_distribution_push_default",
	armor_modifier = "armor_modifier_shield_push_M",
	charge_value = "action_push",
	stagger_duration_modifier = 1.8,
	default_target = "target_push_M",
	is_push = true,
	damage_type = "push",
	ignore_stagger_reduction = true,
	no_damage = true
}
DamageProfileTemplates.shield_light_push = {
	armor_modifier = "armor_modifier_shield_push_M",
	stagger_duration_modifier = 1.75,
	charge_value = "action_push",
	damage_type = "push",
	default_target = "target_push_M",
	is_push = true,
	cleave_distribution = "cleave_distribution_push_default",
	stagger_distance_modifier = 0.75,
	ignore_stagger_reduction = true,
	no_damage = true
}
DamageProfileTemplates.light_push = {
	is_push = true,
	armor_modifier = "armor_modifier_push_L",
	charge_value = "action_push",
	cleave_distribution = "cleave_distribution_push_default",
	default_target = "target_push_L",
	damage_type = "push",
	no_damage = true
}
local shotgun_dropoff_ranges = {
	dropoff_start = 8,
	dropoff_end = 15
}
local machinegun_dropoff_ranges = {
	dropoff_start = 10,
	dropoff_end = 30
}
local carbine_dropoff_ranges = {
	dropoff_start = 15,
	dropoff_end = 30
}
local sniper_dropoff_ranges = {
	dropoff_start = 30,
	dropoff_end = 50
}
local flamethrower_dropoff_ranges = {
	dropoff_start = 4,
	dropoff_end = 8
}
local rapier_dropoff_ranges = {
	dropoff_start = 5,
	dropoff_end = 10
}
DamageProfileTemplates.crossbow_bolt = {
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
			0.25
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
	armor_modifier_near = {
		attack = {
			1,
			0.8,
			1.5,
			1,
			0.75,
			0
		},
		impact = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.6,
			1.5,
			1,
			0.75,
			0
		},
		impact = {
			1,
			0.6,
			1,
			1,
			1,
			0.25
		}
	},
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		boost_curve_coefficient_headshot = 2.5,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 1,
		attack_template = "bolt_sniper",
		power_distribution_near = {
			attack = 0.7,
			impact = 0.4
		},
		power_distribution_far = {
			attack = 0.6,
			impact = 0.3
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.longbow_empire = {
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
			0.25
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
	armor_modifier_near = {
		attack = {
			1,
			0.8,
			1,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.8,
			1,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 1,
		attack_template = "bolt_sniper",
		power_distribution_near = {
			attack = 0.5,
			impact = 0.5
		},
		power_distribution_far = {
			attack = 0.35,
			impact = 0.2
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.crossbow_bolt_repeating = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			1,
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
			0.5,
			1.5,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.4,
			1.5,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.4,
			1,
			1,
			1,
			0.25
		}
	},
	cleave_distribution = {
		attack = 0.125,
		impact = 0.125
	},
	default_target = {
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "bolt_carbine",
		power_distribution_near = {
			attack = 0.375,
			impact = 0.25
		},
		power_distribution_far = {
			attack = 0.25,
			impact = 0.15
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.shot_shotgun = {
	charge_value = "instant_projectile",
	no_stagger_damage_reduction_ranged = true,
	shield_break = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.3,
			0.5,
			1,
			0.5,
			0
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
			0.2,
			0.4,
			0.75,
			1,
			0
		},
		impact = {
			1,
			0.75,
			3,
			0,
			1,
			0.75
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0,
			0.25,
			0.75,
			1,
			0
		},
		impact = {
			1,
			0.5,
			0.5,
			0,
			1,
			0.5
		}
	},
	cleave_distribution = {
		attack = 0.1,
		impact = 0.1
	},
	default_target = {
		boost_curve_coefficient_headshot = 0.75,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "shot_shotgun",
		power_distribution_near = {
			attack = 0.25,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.15,
			impact = 0.15
		},
		range_dropoff_settings = machinegun_dropoff_ranges
	}
}
DamageProfileTemplates.shot_machinegun = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.75,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.75,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			0.5,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.2,
		impact = 0.2
	},
	default_target = {
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "shot_machinegun",
		power_distribution_near = {
			attack = 0.3,
			impact = 0.175
		},
		power_distribution_far = {
			attack = 0.175,
			impact = 0.075
		},
		range_dropoff_settings = machinegun_dropoff_ranges
	}
}
DamageProfileTemplates.shot_machinegun_shotgun = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.25,
			1,
			1,
			1,
			0.125
		},
		impact_armor_power_modifer = {
			1,
			0.25,
			1,
			1,
			1,
			0.125
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			0.25,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.25,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0,
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
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.4,
		attack_template = "shot_machinegun",
		power_distribution_near = {
			attack = 0.275,
			impact = 0.15
		},
		power_distribution_far = {
			attack = 0.25,
			impact = 0.05
		},
		range_dropoff_settings = machinegun_dropoff_ranges
	}
}
DamageProfileTemplates.shot_carbine = {
	charge_value = "instant_projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1.5,
			0.75,
			1.5,
			1,
			1,
			0.5
		},
		impact_armor_power_modifer = {
			1,
			0.75,
			1.5,
			1,
			1,
			0.5
		}
	},
	armor_modifier_near = {
		attack = {
			1.5,
			0.75,
			1.5,
			1,
			1,
			0
		},
		impact = {
			1,
			0.75,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.5,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.15,
		impact = 0.15
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 1,
		attack_template = "shot_carbine",
		power_distribution_near = {
			attack = 0.41,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.3,
			impact = 0.25
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.shot_carbine_rapier = {
	charge_value = "instant_projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1.5,
			0.25,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_near = {
		attack = {
			1.5,
			0.25,
			1,
			1,
			1,
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
			0,
			0.75,
			1,
			1,
			0
		},
		impact = {
			1,
			0.5,
			0.75,
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
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "shot_carbine",
		power_distribution_near = {
			attack = 0.35,
			impact = 0.25
		},
		power_distribution_far = {
			attack = 0.05,
			impact = 0.125
		},
		range_dropoff_settings = rapier_dropoff_ranges
	}
}
DamageProfileTemplates.shot_drakefire = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	dot_template_name = "burning_1W_dot",
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
			0.25,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.25,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.25,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.25,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.15,
		impact = 0.15
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "shot_carbine",
		power_distribution_near = {
			attack = 0.275,
			impact = 0.25
		},
		power_distribution_far = {
			attack = 0.15,
			impact = 0.1
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.shot_repeating = {
	charge_value = "instant_projectile",
	no_stagger_damage_reduction_ranged = true,
	shield_break = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1.25,
			0.8,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_near = {
		attack = {
			1.25,
			0.8,
			1,
			1,
			0.5,
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
	armor_modifier_far = {
		attack = {
			1,
			0.8,
			1,
			1,
			0.5,
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
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.shot_sniper = {
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
			0.6
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
			0.5
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
			1,
			1,
			0.75,
			0.25
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
		attack = 0.2,
		impact = 0.2
	},
	default_target = {
		headshot_boost_boss = 0.5,
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 1,
		attack_template = "shot_sniper",
		power_distribution_near = {
			attack = 1,
			impact = 0.5
		},
		power_distribution_far = {
			attack = 0.8,
			impact = 0.5
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.shot_sniper_ability = {
	charge_value = "instant_projectile",
	shield_break = true,
	no_stagger_damage_reduction_ranged = true,
	is_explosion = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			2,
			1,
			1,
			1
		},
		impact_armor_power_modifer = {
			1,
			1,
			200,
			1,
			1,
			1
		}
	},
	armor_modifier = {
		attack = {
			1,
			1,
			2,
			0.1,
			1,
			1
		},
		impact = {
			1,
			1,
			200,
			0.1,
			1,
			1
		}
	},
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		boost_curve_coefficient_headshot = 0.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.5,
		attack_template = "shot_sniper",
		power_distribution = {
			attack = 2,
			impact = 2
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.shot_shotgun_ability = {
	shield_break = true,
	charge_value = "instant_projectile",
	no_stagger_damage_reduction_ranged = true,
	is_explosion = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.1,
			0.2,
			0.25,
			1,
			0.025
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			200,
			0.25,
			1,
			0.05
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			0.1,
			0.2,
			0.25,
			1,
			0
		},
		impact = {
			1,
			0.5,
			100,
			0.25,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0,
			0.2,
			0.25,
			1,
			0
		},
		impact = {
			1,
			0.5,
			200,
			0.25,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		boost_curve_coefficient_headshot = 0.25,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.25,
		attack_template = "shot_sniper",
		power_distribution_near = {
			attack = 0.5,
			impact = 0.5
		},
		power_distribution_far = {
			attack = 0.25,
			impact = 0.25
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.arrow_sniper_kruber = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	shield_break = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
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
			0.75
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			1,
			1.5,
			1,
			0.75,
			0.25
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
			0.5,
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
			1,
			0.5
		}
	},
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		boost_curve_coefficient_headshot = 2.5,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 1,
		attack_template = "bolt_sniper",
		power_distribution_near = {
			attack = 0.75,
			impact = 0.5
		},
		power_distribution_far = {
			attack = 0.5,
			impact = 0.5
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.throwing_axe = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	shield_break = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1,
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
			0.8,
			1,
			1,
			0.75,
			0.25
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
			0.6,
			1,
			1,
			0.75,
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
		attack = 0.01,
		impact = 0.01
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 1,
		attack_template = "throwing_axe",
		power_distribution_near = {
			attack = 0.8,
			impact = 0.85
		},
		power_distribution_far = {
			attack = 0.5,
			impact = 0.75
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.throwing_axe_charged = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	shield_break = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1,
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
			0.8,
			1,
			1,
			0.75,
			0.25
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
			0.6,
			1,
			1,
			0.75,
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
		attack = 0.4,
		impact = 0.4
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 1,
		attack_template = "throwing_axe",
		power_distribution_near = {
			attack = 0.8,
			impact = 0.85
		},
		power_distribution_far = {
			attack = 0.5,
			impact = 0.75
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.arrow_machinegun = {
	charge_value = "projectile",
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
			0,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.25,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0,
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
		attack = 0.1,
		impact = 0.1
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_machinegun",
		power_distribution_near = {
			attack = 0.25,
			impact = 0.075
		},
		power_distribution_far = {
			attack = 0.125,
			impact = 0.05
		},
		range_dropoff_settings = machinegun_dropoff_ranges
	}
}
DamageProfileTemplates.arrow_carbine = {
	charge_value = "projectile",
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
			0.25,
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
			0,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.15,
		impact = 0.15
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 1.25,
		attack_template = "arrow_carbine",
		power_distribution_near = {
			attack = 0.4,
			impact = 0.15
		},
		power_distribution_far = {
			attack = 0.3,
			impact = 0.1
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.arrow_sniper = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1.5,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			0.8,
			1.5,
			1,
			0.5,
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
	armor_modifier_far = {
		attack = {
			1,
			0.8,
			1.5,
			1,
			0.5,
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
		attack = 0.25,
		impact = 0.25
	},
	default_target = {
		boost_curve_coefficient_headshot = 2.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_sniper",
		power_distribution_near = {
			attack = 0.6,
			impact = 0.25
		},
		power_distribution_far = {
			attack = 0.4,
			impact = 0.15
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.arrow_sniper_trueflight = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			1,
			0,
			1,
			1,
			1
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			1,
			1,
			0.25,
			1,
			0.25
		},
		impact = {
			1,
			1,
			0,
			0,
			1,
			1
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			1,
			2,
			0.25,
			1,
			0.25
		},
		impact = {
			1,
			1,
			0,
			0,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
	},
	default_target = {
		boost_curve_coefficient_headshot = 2.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_sniper",
		power_distribution_near = {
			attack = 0.5,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.5,
			impact = 0.25
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.arrow_sniper_ability_piercing = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			1,
			0,
			1,
			1,
			1
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			1,
			1,
			0.25,
			1,
			0.25
		},
		impact = {
			1,
			1,
			0,
			0,
			1,
			1
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			1,
			2,
			0.25,
			1,
			0.25
		},
		impact = {
			1,
			1,
			0,
			0,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 1,
		impact = 1
	},
	default_target = {
		boost_curve_coefficient_headshot = 7,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_sniper",
		power_distribution_near = {
			attack = 1,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.75,
			impact = 0.25
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.shortbow_hagbane = {
	charge_value = "projectile",
	ignore_stagger_reduction = true,
	no_stagger_damage_reduction_ranged = true,
	require_damage_for_dot = true,
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
			0.3,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			0,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.3,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0,
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
		attack = 0.05,
		impact = 0.05
	},
	default_target = {
		dot_template_name = "arrow_poison_dot",
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.5,
		attack_template = "arrow_machinegun",
		power_distribution_near = {
			attack = 0.1,
			impact = 0.15
		},
		power_distribution_far = {
			attack = 0.075,
			impact = 0.1
		},
		range_dropoff_settings = {
			dropoff_start = 10,
			dropoff_end = 30
		}
	}
}
DamageProfileTemplates.shortbow_hagbane_charged = table.clone(DamageProfileTemplates.shortbow_hagbane)
DamageProfileTemplates.shortbow_hagbane_charged.armor_modifier_near.attack = {
	1,
	0.2,
	1.5,
	1,
	1.5,
	0
}
DamageProfileTemplates.shortbow_hagbane_charged.armor_modifier_near.impact = {
	1,
	1,
	1.5,
	1,
	1.5,
	0
}
DamageProfileTemplates.shortbow_hagbane_charged.default_target.power_distribution_near.impact = 0.25
DamageProfileTemplates.shortbow_hagbane_charged.default_target.power_distribution_far.impact = 0.2
DamageProfileTemplates.staff_fireball = {
	charge_value = "projectile",
	require_damage_for_dot = true,
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.35,
			1,
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
			1,
			0.35,
			1.5,
			1,
			1,
			0
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
		attack = 0.1,
		impact = 0.1
	},
	default_target = {
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "fireball",
		power_distribution_near = {
			attack = 0.35,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.15,
			impact = 0.15
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.fire_spark = {
	charge_value = "projectile",
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
			0.25,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.25,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.25,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.25,
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
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "wizard_staff_spark",
		power_distribution_near = {
			attack = 0.125,
			impact = 0.075
		},
		power_distribution_far = {
			attack = 0.05,
			impact = 0.05
		},
		range_dropoff_settings = machinegun_dropoff_ranges
	}
}
DamageProfileTemplates.fire_spear = {
	charge_value = "projectile",
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
			0.25,
			1,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.25,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.25,
			1,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.25,
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
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "wizard_staff_spear",
		power_distribution_near = {
			attack = 0.3,
			impact = 0.25
		},
		power_distribution_far = {
			attack = 0.25,
			impact = 0.15
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.fire_spear_2 = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.4,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.4,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			0.4,
			1.5,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.4,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.2,
			1.5,
			1,
			0.5,
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
	cleave_distribution = {
		attack = 0.45,
		impact = 0.45
	},
	default_target = {
		boost_curve_coefficient_headshot = 1.5,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "wizard_staff_spear",
		power_distribution_near = {
			attack = 0.5,
			impact = 0.35
		},
		power_distribution_far = {
			attack = 0.3,
			impact = 0.25
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.fire_spear_trueflight = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	is_explosion = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1.5,
			2.5,
			0.25,
			1,
			0.75
		},
		impact_armor_power_modifer = {
			1,
			1.5,
			100,
			0.25,
			1,
			0.75
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			1.5,
			2.5,
			0.25,
			1,
			0.75
		},
		impact = {
			1,
			1.5,
			100,
			0,
			1,
			0.75
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			1.5,
			2.5,
			0.25,
			1,
			0.75
		},
		impact = {
			1,
			1.5,
			100,
			0,
			1,
			0.75
		}
	},
	cleave_distribution = {
		attack = 0.4,
		impact = 0.4
	},
	default_target = {
		boost_curve_coefficient_headshot = 2.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "wizard_staff_spear",
		power_distribution_near = {
			attack = 0.75,
			impact = 1
		},
		power_distribution_far = {
			attack = 0.75,
			impact = 1
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.fire_spear_3 = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1.5,
			1,
			1,
			0.4
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
	armor_modifier_near = {
		attack = {
			1,
			0.75,
			1.5,
			1,
			1,
			0.4
		},
		impact = {
			1,
			0.8,
			1,
			1,
			1,
			0.4
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0.75,
			1.5,
			1,
			1,
			0.4
		},
		impact = {
			1,
			0.8,
			1,
			1,
			1,
			0.4
		}
	},
	cleave_distribution = {
		attack = 0.6,
		impact = 0.6
	},
	default_target = {
		boost_curve_coefficient_headshot = 2,
		boost_curve_type = "smiter_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "wizard_staff_spear",
		power_distribution_near = {
			attack = 1,
			impact = 0.5
		},
		power_distribution_far = {
			attack = 1,
			impact = 0.5
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.staff_fireball_charged = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			4,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier = {
		attack = {
			1,
			1,
			4,
			1,
			0.1,
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 1,
		impact = 1
	},
	default_target = {
		dot_template_name = "burning_1W_dot",
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 1,
		attack_template = "fireball",
		power_distribution_near = {
			attack = 0.3,
			impact = 0.5
		},
		power_distribution_far = {
			attack = 0.3,
			impact = 0.25
		},
		range_dropoff_settings = shotgun_dropoff_ranges
	}
}
DamageProfileTemplates.flamethrower_spray = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier = {
		attack = {
			1,
			1,
			1.5,
			1,
			1,
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
		attack = 0.01,
		impact = 0.01
	},
	default_target = {
		boost_curve_coefficient_headshot = 0,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 0.5,
		attack_template = "wizard_staff_beam",
		power_distribution_near = {
			attack = 0.15,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.1,
			impact = 0.25
		},
		range_dropoff_settings = flamethrower_dropoff_ranges
	}
}
DamageProfileTemplates.flamethrower = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.25,
			1,
			1,
			0.5,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	armor_modifier = {
		attack = {
			1,
			0.25,
			1.5,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.3,
			1,
			1,
			0.5,
			0
		}
	},
	cleave_distribution = {
		attack = 0.01,
		impact = 0.01
	},
	default_target = {
		dot_template_name = "burning_flamethrower_dot",
		boost_curve_coefficient_headshot = 0,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 1,
		attack_template = "wizard_staff_beam",
		power_distribution_near = {
			attack = 0.075,
			impact = 0.1
		},
		power_distribution_far = {
			attack = 0.05,
			impact = 0.05
		},
		range_dropoff_settings = flamethrower_dropoff_ranges
	}
}
DamageProfileTemplates.flamethrower_initial = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.25,
			1,
			1,
			1,
			0
		},
		impact_armor_power_modifer = {
			1,
			1,
			1,
			1,
			1,
			0
		}
	},
	armor_modifier = {
		attack = {
			0.5,
			0,
			1,
			0.25,
			0.25,
			0
		},
		impact = {
			1,
			0.35,
			1,
			1,
			0.25,
			0
		}
	},
	cleave_distribution = {
		attack = 0.01,
		impact = 0.01
	},
	default_target = {
		dot_template_name = "burning_flamethrower_dot",
		boost_curve_coefficient_headshot = 0,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 1,
		attack_template = "wizard_staff_beam",
		power_distribution_near = {
			attack = 0.1,
			impact = 0.2
		},
		power_distribution_far = {
			attack = 0.075,
			impact = 0.1
		},
		range_dropoff_settings = flamethrower_dropoff_ranges
	}
}
DamageProfileTemplates.beam = {
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
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier = {
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
		dot_template_name = "beam_burning_dot",
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
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.beam_initial = {
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
			attack = 0.05,
			impact = 0.065
		},
		power_distribution_far = {
			attack = 0.025,
			impact = 0.05
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.blast = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	dot_template_name = "burning_1W_dot",
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.2,
			1,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier = {
		attack = {
			1,
			0,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.25,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.05,
		impact = 0.05
	},
	default_target = {
		boost_curve_coefficient_headshot = 2,
		boost_curve_type = "linesman_curve",
		boost_curve_coefficient = 0.5,
		attack_template = "flame_blast",
		power_distribution_near = {
			attack = 0.1,
			impact = 0.275
		},
		power_distribution_far = {
			attack = 0.05,
			impact = 0.15
		},
		range_dropoff_settings = carbine_dropoff_ranges
	}
}
DamageProfileTemplates.beam_shot = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.8,
			1.5,
			1,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			0.8,
			1,
			1,
			1,
			0.25
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			0.8,
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
	armor_modifier_far = {
		attack = {
			1,
			0.5,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.15,
		impact = 0.05
	},
	default_target = {
		dot_template_name = "burning_3W_dot",
		boost_curve_coefficient_headshot = 1,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "wizard_staff_beam_sniper",
		power_distribution_near = {
			attack = 0.7,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.5,
			impact = 0.2
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.geiser = {
	dot_template_name = "burning_1W_dot",
	charge_value = "aoe",
	no_stagger_damage_reduction_ranged = true,
	attack_template = "wizard_staff_geiser",
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.5,
			1,
			1,
			1,
			0.25
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
			0.5,
			1,
			1,
			1,
			0
		},
		impact = {
			1,
			1.5,
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
		attack_template = "wizard_staff_geiser",
		power_distribution = {
			attack = 0.05,
			impact = 0.175
		}
	},
	targets = {
		{
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "wizard_staff_geiser",
			power_distribution = {
				attack = 0.3,
				impact = 0.7
			}
		},
		{
			boost_curve_type = "ninja_curve",
			boost_curve_coefficient = 1,
			attack_template = "wizard_staff_geiser",
			power_distribution = {
				attack = 0.125,
				impact = 0.35
			}
		}
	}
}

new_template("arrow_carbine", nil, "tutorial_longbow")
new_template("crossbow_bolt", nil, "tutorial_longbow_charged")

DamageProfileTemplates.tutorial_longbow.no_headshot_boost = true
DamageProfileTemplates.tutorial_longbow.no_crit_boost = true
DamageProfileTemplates.tutorial_longbow_charged.no_headshot_boost = true
DamageProfileTemplates.tutorial_longbow_charged.no_crit_boost = true
DamageProfileTemplates.tutorial_longbow.armor_modifier_near.attack[2] = 0
DamageProfileTemplates.tutorial_longbow.armor_modifier_far.attack[2] = 0
DamageProfileTemplates.tutorial_longbow_charged.armor_modifier_near.attack[2] = 0
DamageProfileTemplates.tutorial_longbow_charged.armor_modifier_far.attack[2] = 0
DamageProfileTemplates.tutorial_longbow.armor_modifier_near.attack[6] = 0
DamageProfileTemplates.tutorial_longbow.armor_modifier_far.attack[6] = 0
DamageProfileTemplates.tutorial_longbow_charged.armor_modifier_near.attack[6] = 0
DamageProfileTemplates.tutorial_longbow_charged.armor_modifier_far.attack[6] = 0
DamageProfileTemplates.frag_grenade = {
	charge_value = "grenade",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			0.5,
			3,
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
		damage_type = "grenade",
		attack_template = "drakegun",
		power_distribution = {
			attack = 1.5,
			impact = 2
		}
	}
}
DamageProfileTemplates.frag_grenade_glance = table.clone(DamageProfileTemplates.frag_grenade)
DamageProfileTemplates.frag_grenade_glance.default_target.power_distribution.attack = 0.5
DamageProfileTemplates.frag_grenade_glance.default_target.power_distribution.impact = 1.5
DamageProfileTemplates.frag_grenade_glance.default_target.power_distribution.attack_template = "drakegun_glance"
DamageProfileTemplates.frag_grenade_glance.default_target.power_distribution.damage_type = "grenade_glance"
DamageProfileTemplates.explosive_barrel = {
	charge_value = "grenade",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			0.5,
			2.5,
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
		damage_type = "grenade",
		attack_template = "drakegun",
		power_distribution = {
			attack = 0.75,
			impact = 1
		}
	}
}
DamageProfileTemplates.fire_grenade_aoe = {
	charge_value = "grenade",
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			0.5,
			2.5,
			1,
			1.5
		},
		impact = {
			1,
			0.5,
			2.5,
			1,
			1.5
		}
	},
	default_target = {
		dot_template_name = "burning_3W_dot",
		damage_type = "grenade",
		attack_template = "fire_grenade_dot",
		power_distribution = {
			attack = 0.5,
			impact = 0.1
		}
	}
}
DamageProfileTemplates.fireball_explosion = {
	charge_value = "aoe",
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			0,
			1.5,
			1,
			0.75,
			0
		},
		impact = {
			1,
			0,
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
			impact = 0.2
		}
	}
}
DamageProfileTemplates.blade_storm = {
	charge_value = "n/a",
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
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
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	default_target = {
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "blade_storm",
		power_distribution = {
			attack = 0.1,
			impact = 0.1
		}
	}
}
DamageProfileTemplates.fireball_explosion_glance = table.clone(DamageProfileTemplates.fireball_explosion)
DamageProfileTemplates.fireball_explosion_glance.default_target.attack_template = "drakegun_glance"
DamageProfileTemplates.fireball_explosion_glance.default_target.damage_type = "drakegun_glance"
DamageProfileTemplates.fireball_charged_explosion = {
	charge_value = "aoe",
	no_stagger_damage_reduction_ranged = true,
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
			0.5,
			1,
			1,
			0.75,
			0
		}
	},
	default_target = {
		attack_template = "drakegun",
		dot_template_name = "burning_1W_dot",
		damage_type = "drakegun",
		power_distribution = {
			attack = 0.25,
			impact = 0.5
		}
	}
}
DamageProfileTemplates.fireball_charged_explosion_glance = table.clone(DamageProfileTemplates.fireball_charged_explosion)
DamageProfileTemplates.fireball_charged_explosion_glance.default_target.attack_template = "drakegun_glance"
DamageProfileTemplates.fireball_charged_explosion_glance.default_target.damage_type = "drakegun_glance"
DamageProfileTemplates.fireball_charged_explosion_glance.default_target.dot_template_name = "burning_1W_dot"
DamageProfileTemplates.overcharge_explosion_ability = {
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
			0
		},
		impact = {
			1,
			0.5,
			1,
			1,
			0.75,
			0.5
		}
	},
	default_target = {
		attack_template = "flame_blast",
		dot_template_name = "burning_1W_dot",
		damage_type = "burn_shotgun",
		power_distribution = {
			attack = 0.15,
			impact = 0.75
		}
	}
}
DamageProfileTemplates.overcharge_explosion_glance_ability = table.clone(DamageProfileTemplates.overcharge_explosion_ability)
DamageProfileTemplates.overcharge_explosion_glance_ability.default_target.attack_template = "flame_blast"
DamageProfileTemplates.overcharge_explosion_glance_ability.default_target.damage_type = "burn_shotgun"
DamageProfileTemplates.overcharge_explosion_glance_ability.default_target.dot_template_name = "burning_1W_dot"
DamageProfileTemplates.overcharge_explosion = {
	charge_value = "aoe",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			1,
			2.5,
			1,
			0.75,
			0.5
		},
		impact = {
			1,
			0.5,
			1,
			1,
			0.75,
			0.5
		}
	},
	default_target = {
		attack_template = "flame_blast",
		dot_template_name = "burning_1W_dot",
		damage_type = "burn_shotgun",
		power_distribution = {
			attack = 0.5,
			impact = 0.75
		}
	}
}
DamageProfileTemplates.overcharge_explosion_glance = table.clone(DamageProfileTemplates.overcharge_explosion)
DamageProfileTemplates.overcharge_explosion_glance.default_target.attack_template = "flame_blast"
DamageProfileTemplates.overcharge_explosion_glance.default_target.damage_type = "burn_shotgun"
DamageProfileTemplates.overcharge_explosion_glance.default_target.dot_template_name = "burning_1W_dot"
DamageProfileTemplates.elven_ruins_finish = {
	charge_value = "aoe",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			0.5,
			100,
			1,
			1
		},
		impact = {
			1,
			0.5,
			1.5,
			1,
			1
		}
	},
	default_target = {
		attack_template = "arrow_poison_aoe",
		damage_type = "elven_magic",
		power_distribution = {
			attack = 5,
			impact = 0.5
		}
	}
}
DamageProfileTemplates.elven_ruins_finish_glance = table.clone(DamageProfileTemplates.elven_ruins_finish)
DamageProfileTemplates.elven_ruins_finish_glance.default_target.attack_template = "arrow_poison_aoe"
DamageProfileTemplates.elven_ruins_finish_glance.default_target.damage_type = "elven_magic_glance"
DamageProfileTemplates.military_finish = {
	instant_death = true,
	charge_value = "aoe",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			0.5,
			100,
			1,
			1
		},
		impact = {
			1,
			0.5,
			1.5,
			1,
			1
		}
	},
	default_target = {
		attack_template = "military_finish",
		damage_type = "military_finish",
		power_distribution = {
			attack = 5,
			impact = 0.5
		}
	}
}
DamageProfileTemplates.cannonball_impact = {
	charge_value = "aoe",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			0.5,
			10,
			1,
			1
		},
		impact = {
			1,
			0.5,
			1.5,
			1,
			1
		}
	},
	default_target = {
		attack_template = "arrow_poison_aoe",
		damage_type = "grenade",
		power_distribution = {
			attack = 1,
			impact = 0.5
		}
	}
}
DamageProfileTemplates.heavens_lightning_strike = {
	charge_value = "grenade",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1,
			0.5,
			3,
			3,
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
		damage_type = "grenade",
		attack_template = "drakegun",
		power_distribution = {
			attack = 0.5,
			impact = 2
		}
	}
}
DamageProfileTemplates.warpfire_thrower_explosion = {
	charge_value = "grenade",
	is_explosion = true,
	no_stagger_damage_reduction_ranged = true,
	armor_modifier = {
		attack = {
			1.5,
			1,
			1.5,
			0.75,
			1.2
		},
		impact = {
			1.5,
			1,
			1.5,
			0.75,
			1.2
		}
	},
	default_target = {
		damage_type = "warpfire_ground",
		attack_template = "fire_grenade_explosion",
		power_distribution = {
			attack = 0.75,
			impact = 0.75
		}
	}
}
DamageProfileTemplates.globadier_gas_cloud = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.globadier_gas_cloud.default_target.attack_template = "poison_globe_ai_initial_damage"
DamageProfileTemplates.globadier_gas_cloud.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.spike_trap = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.spike_trap.default_target.attack_template = "spike_trap"
DamageProfileTemplates.spike_trap.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.environment_fire = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.environment_fire.default_target.attack_template = "environment_fire"
DamageProfileTemplates.environment_fire.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.payload_wagon = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.payload_wagon.default_target.attack_template = "payload_wagon"
DamageProfileTemplates.payload_wagon.default_target.power_distribution.impact = 1
DamageProfileTemplates.payload_wagon.is_explosion = true
DamageProfileTemplates.payload_wagon.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.poison = {
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
			1.25,
			1,
			3,
			1,
			0.5,
			0.2
		},
		impact = {
			1,
			1,
			3,
			1,
			0.5,
			0
		}
	},
	default_target = {
		attack_template = "arrow_poison_aoe",
		damage_type = "arrow_poison_dot",
		power_distribution = {
			attack = 0.035,
			impact = 0
		}
	}
}
DamageProfileTemplates.poison_direct = {
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
			1.25,
			1.25,
			3,
			1,
			0.5,
			0.2
		},
		impact = {
			1,
			1,
			3,
			1,
			0.5,
			0
		}
	},
	default_target = {
		attack_template = "arrow_poison_aoe",
		damage_type = "arrow_poison_dot",
		power_distribution = {
			attack = 0.08,
			impact = 0
		}
	}
}
DamageProfileTemplates.poison_aoe = {
	no_friendly_fire = true,
	is_dot = true,
	require_damage_for_dot = true,
	no_stagger_damage_reduction_ranged = true,
	no_stagger = false,
	armor_modifier = {
		attack = {
			1.25,
			0,
			1.5,
			1,
			1,
			0
		},
		impact = {
			1,
			0.75,
			1,
			1,
			0.5,
			0
		}
	},
	default_target = {
		attack_template = "arrow_poison_aoe",
		dot_template_name = "aoe_poison_dot",
		damage_type = "poison",
		power_distribution = {
			attack = 0.05,
			impact = 0.5
		}
	}
}
DamageProfileTemplates.bleed = {
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
			1,
			0.5,
			1,
			0.25,
			0.5,
			0
		},
		impact = {
			1,
			0.5,
			1,
			0.25,
			0.5,
			0
		}
	},
	default_target = {
		damage_type = "bleed",
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.075,
			impact = 0
		}
	}
}
DamageProfileTemplates.bleed_maidenguard = {
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
			1,
			0.5,
			1,
			0.25,
			0.5,
			0
		},
		impact = {
			1,
			0.5,
			1,
			0.25,
			0.5,
			0
		}
	},
	default_target = {
		damage_type = "bleed",
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "light_blunt_tank",
		power_distribution = {
			attack = 0.05,
			impact = 0.05
		}
	}
}
DamageProfileTemplates.burning_dot = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.burning_dot.no_stagger = true
DamageProfileTemplates.burning_dot.is_dot = true
DamageProfileTemplates.burning_dot.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.burning_dot.default_target.damage_type = "burninating"
DamageProfileTemplates.burning_dot.default_target.armor_modifier = {
	attack = {
		1,
		0.75,
		3,
		1,
		1,
		0
	},
	impact = {
		1,
		0,
		0,
		1,
		1,
		0
	}
}
DamageProfileTemplates.burning_dot.default_target.power_distribution = {
	attack = 0.07,
	impact = 0.05
}
DamageProfileTemplates.burning_dot_firegrenade = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.burning_dot_firegrenade.no_stagger = true
DamageProfileTemplates.burning_dot_firegrenade.is_dot = true
DamageProfileTemplates.burning_dot_firegrenade.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.burning_dot_firegrenade.default_target.damage_type = "burninating"
DamageProfileTemplates.burning_dot_firegrenade.default_target.armor_modifier = {
	attack = {
		1,
		0.25,
		2,
		1,
		1,
		0
	},
	impact = {
		1,
		0,
		0,
		1,
		1,
		0
	}
}
DamageProfileTemplates.burning_dot_firegrenade.default_target.power_distribution = {
	attack = 0.3,
	impact = 0.3
}
DamageProfileTemplates.beam_burning_dot = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.beam_burning_dot.no_stagger = true
DamageProfileTemplates.beam_burning_dot.is_dot = true
DamageProfileTemplates.beam_burning_dot.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.beam_burning_dot.default_target.damage_type = "burninating"
DamageProfileTemplates.beam_burning_dot.default_target.armor_modifier = {
	attack = {
		1,
		0.75,
		4,
		1,
		1,
		0
	},
	impact = {
		1,
		0,
		0,
		1,
		1,
		0
	}
}
DamageProfileTemplates.beam_burning_dot.default_target.power_distribution = {
	attack = 0.075,
	impact = 0.075
}
DamageProfileTemplates.flamethrower_burning_dot = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.flamethrower_burning_dot.no_stagger = true
DamageProfileTemplates.flamethrower_burning_dot.is_dot = true
DamageProfileTemplates.flamethrower_burning_dot.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.flamethrower_burning_dot.default_target.damage_type = "burninating"
DamageProfileTemplates.flamethrower_burning_dot.default_target.armor_modifier = {
	attack = {
		1,
		0.25,
		3,
		1,
		1,
		0
	},
	impact = {
		1,
		0,
		0,
		1,
		1,
		0
	}
}
DamageProfileTemplates.flamethrower_burning_dot.default_target.power_distribution = {
	attack = 0.05,
	impact = 0.075
}
DamageProfileTemplates.mutator_player_dot = table.clone(DamageProfileTemplates.default)
DamageProfileTemplates.mutator_player_dot.no_stagger = true
DamageProfileTemplates.mutator_player_dot.no_stagger_damage_reduction_ranged = true
DamageProfileTemplates.mutator_player_dot.default_target.damage_type = "wounded_dot"
DamageProfileTemplates.corpse_explosion_default = {
	charge_value = "n/a",
	no_stagger_damage_reduction_ranged = true,
	no_stagger = false,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
	},
	armor_modifier = {
		attack = {
			1,
			1,
			3,
			1,
			0.5,
			0.2
		},
		impact = {
			1,
			1,
			3,
			1,
			0.5,
			0
		}
	},
	default_target = {
		network_sync_dot = true,
		dot_template_name = "corpse_explosion_default",
		attack_template = "corpse_explosion_default",
		power_distribution = {
			attack = 0.035,
			impact = 0
		}
	}
}
DamageProfileTemplates.sienna_adept_blink = {
	charge_value = "aoe",
	no_stagger_damage_reduction_ranged = true,
	dot_template_name = "burning_1W_dot",
	cleave_distribution = {
		attack = 0.5,
		impact = 0.5
	},
	armor_modifier = {
		attack = {
			1,
			0.5,
			1.5,
			1,
			0.5,
			0
		},
		impact = {
			1,
			0.5,
			0.5,
			1,
			0.5,
			0
		}
	},
	default_target = {
		boost_curve_type = "tank_curve",
		boost_curve_coefficient = 0.2,
		attack_template = "slashing_smiter",
		power_distribution = {
			attack = 0,
			impact = 0
		}
	}
}
DamageProfileTemplates.markus_knight_charge = {
	armor_modifier = "armor_modifier_markus_knight_charge",
	is_explosion = true,
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_markus_knight_charge",
	default_target = "default_target_markus_knight_charge",
	no_stagger_damage_reduction_ranged = true
}
DamageProfileTemplates.markus_knight_charge_blast = {
	armor_modifier = "armor_modifier_markus_knight_charge",
	is_explosion = true,
	charge_value = "heavy_attack",
	cleave_distribution = "cleave_distribution_markus_knight_charge",
	default_target = "default_target_markus_knight_charge",
	no_stagger_damage_reduction_ranged = true
}
DamageProfileTemplates.ratling_gunner = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
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
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	default_target = {
		boost_curve_type = "default",
		boost_curve_coefficient = 0.2,
		attack_template = "shot_machinegun",
		power_distribution = {
			attack = 0.1,
			impact = 0.1
		}
	}
}
DamageProfileTemplates.stormfiend_boss = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
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
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	default_target = {
		boost_curve_type = "default",
		boost_curve_coefficient = 0.2,
		attack_template = "shot_machinegun",
		power_distribution = {
			attack = 0.1,
			impact = 0.1
		}
	}
}
DamageProfileTemplates.stormfiend_boss_narrow = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
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
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	default_target = {
		boost_curve_type = "default",
		boost_curve_coefficient = 0.2,
		attack_template = "shot_machinegun",
		power_distribution = {
			attack = 0.1,
			impact = 0.1
		}
	}
}
DamageProfileTemplates.stormfiend_boss_dual_intro = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
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
			0.5,
			1,
			1,
			0.5,
			0
		}
	},
	default_target = {
		boost_curve_type = "default",
		boost_curve_coefficient = 0.2,
		attack_template = "shot_machinegun",
		power_distribution = {
			attack = 0.1,
			impact = 0.1
		}
	}
}
DamageProfileTemplates.ratling_gunner_backdrop = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
	},
	armor_modifier = {
		attack = {
			10,
			5,
			5,
			0.3,
			5,
			1
		},
		impact = {
			1,
			1,
			1,
			1,
			2,
			1
		}
	},
	default_target = {
		boost_curve_type = "default",
		boost_curve_coefficient = 0.2,
		attack_template = "shot_machinegun",
		power_distribution = {
			attack = 0.5,
			impact = 1
		}
	}
}

for _, dlc in pairs(DLCSettings) do
	local file_names = dlc.damage_profile_template_files_names

	if file_names then
		for _, file_name in ipairs(file_names) do
			local dlc_damage_templates = require(file_name)

			for template_name, template in pairs(dlc_damage_templates) do
				DamageProfileTemplates[template_name] = template
			end
		end
	end
end

for name, damage_profile in pairs(DamageProfileTemplates) do
	if not damage_profile.targets then
		damage_profile.targets = {}
	end

	fassert(damage_profile.default_target, "damage profile [\"%s\"] missing default_target", name)

	if type(damage_profile.critical_strike) == "string" then
		local template = PowerLevelTemplates[damage_profile.critical_strike]

		fassert(template, "damage profile [\"%s\"] has no corresponding template defined in PowerLevelTemplates. Wanted template name is [\"%s\"] ", name, damage_profile.critical_strike)

		damage_profile.critical_strike = template
	end

	if type(damage_profile.cleave_distribution) == "string" then
		local template = PowerLevelTemplates[damage_profile.cleave_distribution]

		fassert(template, "damage profile [\"%s\"] has no corresponding template defined in PowerLevelTemplates. Wanted template name is [\"%s\"] ", name, damage_profile.cleave_distribution)

		damage_profile.cleave_distribution = template
	end

	if type(damage_profile.armor_modifier) == "string" then
		local template = PowerLevelTemplates[damage_profile.armor_modifier]

		fassert(template, "damage profile [\"%s\"] has no corresponding template defined in PowerLevelTemplates. Wanted template name is [\"%s\"] ", name, damage_profile.armor_modifier)

		damage_profile.armor_modifier = template
	end

	if type(damage_profile.default_target) == "string" then
		local template = PowerLevelTemplates[damage_profile.default_target]

		fassert(template, "damage profile [\"%s\"] has no corresponding template defined in PowerLevelTemplates. Wanted template name is [\"%s\"] ", name, damage_profile.default_target)

		damage_profile.default_target = template
	end

	if type(damage_profile.targets) == "string" then
		local template = PowerLevelTemplates[damage_profile.targets]

		fassert(template, "damage profile [\"%s\"] has no corresponding template defined in PowerLevelTemplates. Wanted template name is [\"%s\"] ", name, damage_profile.targets)

		damage_profile.targets = template
	end
end

local no_damage_templates = {}

for name, damage_profile in pairs(DamageProfileTemplates) do
	local no_damage_name = name .. "_no_damage"

	if not DamageProfileTemplates[no_damage_name] then
		local no_damage_template = table.clone(damage_profile)

		if no_damage_template.targets then
			for _, target in ipairs(no_damage_template.targets) do
				if target.power_distribution then
					target.power_distribution.attack = 0
				end
			end
		end

		if no_damage_template.default_target.power_distribution then
			no_damage_template.default_target.power_distribution.attack = 0
		end

		no_damage_templates[no_damage_name] = no_damage_template
	end
end

DamageProfileTemplates = table.merge(DamageProfileTemplates, no_damage_templates)

return
