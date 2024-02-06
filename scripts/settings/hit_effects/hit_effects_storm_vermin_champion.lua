-- chunkname: @scripts/settings/hit_effects/hit_effects_storm_vermin_champion.lua

local wounding_damage_types = {
	"light_stab_fencer",
	"light_stab_smiter",
	"stab_fencer",
	"stab_smiter",
	"heavy_stab_smiter",
	"light_slashing_fencer",
	"light_slashing_smiter",
	"slashing_fencer",
	"slashing_smiter",
	"heavy_slashing_fencer",
	"heavy_slashing_smiter",
}

HitEffectsStormVerminChampion = {
	default = {
		armour_type = "metal_hollow",
		husk_hit_effect_name = "fx/impact_blood",
		animations = {
			"hit_reaction",
		},
	},
	default_ward = {
		armour_type = "ward",
		disable_blood = true,
		husk_hit_effect_name = "fx/chr_stormvermin_champion_shield_dot",
		extra_conditions = {
			hit_zone = {
				"ward",
			},
		},
		animations = {
			"hit_reaction",
		},
	},
	default_noDamage = {
		armour_type = "metal_hollow",
		disable_blood = true,
		husk_effect_name = "fx/hit_armored",
		extra_conditions = {
			damage = false,
		},
	},
	default_noDamage_ward = {
		armour_type = "ward",
		disable_blood = true,
		husk_effect_name = "fx/chr_stormvermin_champion_shield_dot",
		inherits = "default_noDamage",
		extra_conditions = {
			hit_zone = {
				"ward",
			},
		},
	},
	default_death = {
		armour_type = "metal_hollow",
		disable_wall_nail = true,
		husk_hit_effect_name = "fx/impact_blood_02",
		extra_conditions = {
			death = true,
		},
		animations = {
			"death_kneel",
		},
	},
	default_death_ward = {
		armour_type = "ward",
		disable_blood = true,
		disable_wall_nail = true,
		husk_effect_name = "fx/chr_stormvermin_champion_shield_dot",
		inherits = "default_death",
		extra_conditions = {
			hit_zone = {
				"ward",
			},
		},
		animations = {
			"death_kneel",
			"death_decapitate_3",
		},
	},
	burn = {
		disable_blood = true,
		extra_conditions = {
			damage = true,
			damage_type = "burn",
			death = false,
		},
	},
	push = {
		disable_blood = true,
		stagger = 10,
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
			"death_kneel",
		},
	},
	gib_killing_blow_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = "killing_blow",
			death = true,
		},
		animations = {
			"ragdoll",
		},
		flow_event = {
			"dismember_gib",
		},
		push = {
			distal_force = 300,
			lateral_force = 0,
			vertical_force = 140,
		},
	},
	wound_default = {
		armour_type = "metal_hollow",
		extra_conditions = {
			death = false,
			damage_type = wounding_damage_types,
		},
	},
	wound_back = {
		flow_event = "wound_torso_back",
		inherits = "wound_default",
		extra_conditions = {
			hit_direction = "back",
		},
	},
	wound_front = {
		flow_event = "wound_torso_front",
		inherits = "wound_default",
		extra_conditions = {
			hit_direction = "front",
		},
	},
	wound_gut_left_leg = {
		flow_event = "wound_gut",
		inherits = "wound_front",
		extra_conditions = {
			hit_zone = {
				"left_leg",
				"right_leg",
				"slashing_front",
			},
		},
	},
	default_burning = {
		disable_blood = true,
		inherits = "default",
		extra_conditions = {
			damage_type = {
				"burning_tank",
				"heavy_burning_tank",
				"burning_stab_fencer",
				"fire_grenade",
				"fire_grenade_glance",
			},
		},
	},
}
HitEffectsStormVerminChampion = table.create_copy(HitEffectsStormVerminChampion, HitEffectsStormVerminChampion)
