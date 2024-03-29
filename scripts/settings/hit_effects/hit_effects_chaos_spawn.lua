﻿-- chunkname: @scripts/settings/hit_effects/hit_effects_chaos_spawn.lua

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
	"stab_smiter",
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

HitEffectsChaosSpawn = {
	default = {
		armour_type = "cloth",
		husk_hit_effect_name = "fx/impact_blood_chaos",
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
			"ragdoll",
		},
	},
	linesman_tank_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = sideways_damage_types,
		},
		animations = {
			"ragdoll",
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
			"ragdoll",
		},
		push = {
			distal_force = 0,
			lateral_force = 0,
			vertical_force = -200,
		},
	},
	fencer_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = fencer_damage_types,
		},
		animations = {
			"ragdoll",
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
			"ragdoll",
		},
		push = {
			distal_force = 25,
			lateral_force = 0,
			vertical_force = 0,
		},
	},
	heavy_blunt_tank_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_blunt_tank",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 60,
			lateral_force = 120,
			vertical_force = 60,
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
			"ragdoll",
		},
	},
}
HitEffectsChaosSpawn = table.create_copy(HitEffectsChaosSpawn, HitEffectsChaosSpawn)
