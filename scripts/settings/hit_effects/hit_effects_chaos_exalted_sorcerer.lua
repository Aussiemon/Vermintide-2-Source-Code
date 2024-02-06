-- chunkname: @scripts/settings/hit_effects/hit_effects_chaos_exalted_sorcerer.lua

local sideways_damage_types = {
	"light_slashing_linesman",
	"slashing_linesman",
	"heavy_slashing_linesman",
	"light_slashing_tank",
	"slashing_tank",
	"heavy_slashing_tank",
	"light_blunt_linesman",
	"blunt_linesman",
	"heavy_blunt_linesman",
	"light_blunt_tank",
	"blunt_tank",
	"heavy_blunt_tank",
}
local smiter_damage_types = {
	"light_slashing_smiter",
	"slashing_smiter",
	"heavy_slashing_smiter",
	"light_blunt_smiter",
	"blunt_smiter",
	"heavy_blunt_smiter",
	"light_stab_smiter",
	"heavy_stab_smiter",
}
local fencer_damage_types = {
	"light_slashing_fencer",
	"slashing_fencer",
	"heavy_slashing_fencer",
	"light_stab_fencer",
	"stab_fencer",
	"heavy_stab_fencer",
	"light_blunt_fencer",
	"blunt_fencer",
	"heavy_blunt_fencer",
}
local ranged_damage_types = {
	"arrow_carbine",
	"elven_magic_arrow_carbine",
	"arrow_sniper",
	"arrow_machinegun",
	"shot_carbine",
	"shot_sniper",
	"shot_machinegun",
	"shot_shotgun",
}

HitEffectsChaosExaltedSorcerer = {
	default = {
		armour_type = "cloth",
		husk_hit_effect_name = "fx/impact_blood_chaos",
		animations = {
			"hit_reaction",
		},
	},
	burn = {
		extra_conditions = {
			damage_type = "burn",
		},
	},
	default_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
		},
		animations = {
			"death_dissolve",
		},
		push = {
			distal_force = 50,
			lateral_force = 50,
			vertical_force = -20,
		},
	},
	linesman_tank_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = sideways_damage_types,
		},
		animations = {
			"death_dissolve",
		},
		push = {
			distal_force = 0,
			lateral_force = 10,
			vertical_force = -5,
		},
	},
	smiter_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = smiter_damage_types,
		},
		animations = {
			"death_dissolve",
		},
		push = {
			distal_force = 0,
			lateral_force = 0,
			vertical_force = -20,
		},
	},
	fencer_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = fencer_damage_types,
		},
		animations = {
			"death_dissolve",
		},
		push = {
			distal_force = 20,
			lateral_force = 10,
			vertical_force = 10,
		},
	},
	ranged_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = ranged_damage_types,
		},
		animations = {
			"death_dissolve",
		},
		push = {
			distal_force = 25,
			lateral_force = 0,
			vertical_force = 0,
		},
	},
	push = {
		extra_conditions = {
			damage_type = "push",
		},
	},
	forced_kill = {
		extra_conditions = {
			damage_type = "forced",
			death = true,
		},
		animations = {
			"death_dissolve",
		},
	},
}
HitEffectsChaosExaltedSorcerer = table.create_copy(HitEffectsChaosExaltedSorcerer, HitEffectsChaosExaltedSorcerer)
