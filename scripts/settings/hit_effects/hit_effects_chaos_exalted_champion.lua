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
HitEffectsChaosExaltedChampion = {
	default = {
		husk_hit_effect_name = "fx/impact_blood_chaos",
		armour_type = "metal_hollow",
		animations = {
			"hit_reaction"
		}
	},
	default_noDamage = {
		husk_effect_name = "fx/hit_armored",
		armour_type = "metal_hollow",
		extra_conditions = {
			damage = false
		},
		flow_event = {
			"no_damage_taunt_player"
		}
	},
	default_death = {
		husk_hit_effect_name = "fx/impact_blood_chaos_02",
		armour_type = "metal_hollow",
		extra_conditions = {
			death = true
		},
		animations = {
			"death_named_01",
			"death_named_02",
			"death_decapitate"
		}
	},
	default_headshot = {
		sound_event = "Play_enemy_vce_chaos_warrior_hurt_head",
		inherits = "default",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		}
	},
	shot_default = {
		hit_effect_name = "fx/impact_blood_chaos_02",
		husk_hit_effect_name = "fx/impact_blood_chaos_02",
		armour_type = "metal_hollow",
		extra_conditions = {
			damage = true,
			damage_type = {
				"shot_sniper",
				"shot_carbine",
				"shot_machinegun",
				"shot_shotgun",
				"shot_repeating_handgun"
			}
		},
		animations = {
			"hit_reaction"
		}
	},
	arrow_default = {
		hit_effect_name = "fx/impact_blood_chaos_02",
		husk_hit_effect_name = "fx/impact_blood_chaos_02",
		armour_type = "flesh",
		extra_conditions = {
			damage = true,
			damage_type = {
				"arrow_sniper",
				"arrow_carbine",
				"elven_magic_arrow_carbine",
				"arrow_machinegun",
				"arrow_shotgun",
				"bolt_sniper",
				"bolt_carbine",
				"bolt_machinegun",
				"bolt_shotgun"
			}
		},
		animations = {
			"hit_reaction"
		}
	},
	poison_arrow = {
		husk_hit_effect_name = "fx/impact_blood_chaos_02",
		hit_effect_name = "fx/impact_blood_chaos_02",
		extra_conditions = {
			damage_type = {
				"arrow_poison"
			}
		},
		animations = {
			"hit_reaction"
		}
	},
	poison_arrow_nodamage = {
		extra_conditions = {
			damage = false,
			damage_type = {
				"arrow_poison"
			}
		}
	},
	burn = {
		extra_conditions = {
			death = false,
			damage = true,
			damage_type = "burn"
		}
	},
	burninating = {
		extra_conditions = {
			damage = true,
			damage_type = "burninating"
		},
		animations = {
			"hit_reaction"
		}
	},
	burn_sniper = {
		inherits = "default",
		extra_conditions = {
			damage_type = "burn_sniper"
		},
		animations = {
			"hit_reaction"
		}
	},
	burn_shotgun = {
		inherits = "default",
		extra_conditions = {
			damage_type = "burn_shotgun"
		},
		animations = {
			"hit_reaction"
		}
	},
	burn_machinegun = {
		inherits = "default",
		extra_conditions = {
			damage_type = "burn_machinegun"
		},
		animations = {
			"hit_reaction"
		}
	},
	burn_carbine = {
		inherits = "default",
		extra_conditions = {
			damage_type = "burn_machinegun"
		},
		animations = {
			"hit_reaction"
		}
	},
	arrow_poison_dot = {
		inherits = "default",
		hit_effect_name = "fx/wpnfx_poison_arrow_impact",
		extra_conditions = {
			damage_type = {
				"arrow_poison_dot",
				"aoe_poison_dot"
			}
		},
		animations = {
			"hit_reaction"
		}
	},
	push = {
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
			"ragdoll"
		}
	},
	drakegun = {
		inherits = "default",
		extra_conditions = {
			damage_type = {
				"drakegun"
			}
		}
	},
	drakegun_glance = {
		inherits = "default",
		extra_conditions = {
			damage_type = "drakegun_glance"
		}
	},
	shield_hit = {
		extra_conditions = {
			damage_type = "shield_hit"
		},
		animations = {
			"hit_reaction_shield"
		}
	},
	wound_default = {
		husk_hit_effect_name = "fx/impact_blood_chaos_02",
		armour_type = "metal_hollow",
		extra_conditions = {
			death = false,
			damage = true,
			damage_type = wounding_damage_types
		},
		animations = {
			"hit_reaction"
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
HitEffectsChaosExaltedChampion = table.create_copy(HitEffectsChaosExaltedChampion, HitEffectsChaosExaltedChampion)
