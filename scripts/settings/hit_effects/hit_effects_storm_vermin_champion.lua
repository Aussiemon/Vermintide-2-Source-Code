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
	"heavy_slashing_smiter"
}
HitEffectsStormVerminChampion = {
	default = {
		husk_hit_effect_name = "fx/impact_blood",
		armour_type = "metal_hollow",
		animations = {
			"hit_reaction"
		}
	},
	default_ward = {
		disable_blood = true,
		husk_hit_effect_name = "fx/chr_stormvermin_champion_shield_dot",
		armour_type = "ward",
		extra_conditions = {
			hit_zone = {
				"ward"
			}
		},
		animations = {
			"hit_reaction"
		}
	},
	default_noDamage = {
		husk_effect_name = "fx/hit_armored",
		disable_blood = true,
		armour_type = "metal_hollow",
		extra_conditions = {
			damage = false
		}
	},
	default_noDamage_ward = {
		inherits = "default_noDamage",
		disable_blood = true,
		husk_effect_name = "fx/chr_stormvermin_champion_shield_dot",
		armour_type = "ward",
		extra_conditions = {
			hit_zone = {
				"ward"
			}
		}
	},
	default_death = {
		disable_wall_nail = true,
		husk_hit_effect_name = "fx/impact_blood_02",
		armour_type = "metal_hollow",
		extra_conditions = {
			death = true
		},
		animations = {
			"death_kneel"
		}
	},
	default_death_ward = {
		inherits = "default_death",
		disable_blood = true,
		disable_wall_nail = true,
		husk_effect_name = "fx/chr_stormvermin_champion_shield_dot",
		armour_type = "ward",
		extra_conditions = {
			hit_zone = {
				"ward"
			}
		},
		animations = {
			"death_kneel",
			"death_decapitate_3"
		}
	},
	burn = {
		disable_blood = true,
		extra_conditions = {
			death = false,
			damage = true,
			damage_type = "burn"
		}
	},
	push = {
		disable_blood = true,
		stagger = 10,
		extra_conditions = {
			damage_type = "push"
		}
	},
	forced_kill = {
		extra_conditions = {
			death = true,
			damage_type = "forced"
		},
		animations = {
			"death_kneel"
		}
	},
	gib_killing_blow_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = "killing_blow"
		},
		animations = {
			"ragdoll"
		},
		flow_event = {
			"dismember_gib"
		},
		push = {
			distal_force = 300,
			vertical_force = 140,
			lateral_force = 0
		}
	},
	wound_default = {
		armour_type = "metal_hollow",
		extra_conditions = {
			death = false,
			damage_type = wounding_damage_types
		}
	},
	wound_back = {
		inherits = "wound_default",
		flow_event = "wound_torso_back",
		extra_conditions = {
			hit_direction = "back"
		}
	},
	wound_front = {
		inherits = "wound_default",
		flow_event = "wound_torso_front",
		extra_conditions = {
			hit_direction = "front"
		}
	},
	wound_gut_left_leg = {
		inherits = "wound_front",
		flow_event = "wound_gut",
		extra_conditions = {
			hit_zone = {
				"left_leg",
				"right_leg",
				"slashing_front"
			}
		}
	},
	default_burning = {
		inherits = "default",
		disable_blood = true,
		extra_conditions = {
			damage_type = {
				"burning_tank",
				"heavy_burning_tank",
				"burning_stab_fencer",
				"fire_grenade",
				"fire_grenade_glance"
			}
		}
	}
}
HitEffectsStormVerminChampion = table.create_copy(HitEffectsStormVerminChampion, HitEffectsStormVerminChampion)

return
