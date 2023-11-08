HitEffectsChaosTroll = {
	default = {
		husk_hit_effect_name = "fx/impact_blood_chaos",
		armour_type = "flesh",
		extra_conditions = {
			death = false
		},
		animations = {
			"hit_reaction"
		}
	},
	burn = {
		inherits = "default",
		extra_conditions = {
			damage_type = {
				"burning_tank",
				"heavy_burning_tank",
				"burning_stab_fencer",
				"burn",
				"burn_sniper",
				"burn_carbine",
				"burn_machinegun",
				"drakefire_shot",
				"drakegun",
				"drakegun_glance",
				"fire_grenade",
				"fire_grenade_glance"
			}
		},
		animations = {
			"hit_reaction"
		}
	},
	default_head = {
		inherits = "default",
		husk_hit_effect_name = "fx/impact_blood_chaos",
		armour_type = "flesh",
		extra_conditions = {
			hit_zone = {
				"head"
			}
		},
		animations = {
			"hit_reaction"
		}
	},
	default_left_leg = {
		inherits = "default",
		husk_hit_effect_name = "fx/impact_blood_chaos",
		armour_type = "flesh",
		extra_conditions = {
			hit_zone = {
				"left_leg"
			}
		},
		animations = {
			"hit_reaction_left"
		}
	},
	default_right_leg = {
		inherits = "default",
		husk_hit_effect_name = "fx/impact_blood_chaos",
		armour_type = "flesh",
		extra_conditions = {
			hit_zone = {
				"right_leg"
			}
		},
		animations = {
			"hit_reaction_right"
		}
	},
	default_left_arm = {
		inherits = "default",
		husk_hit_effect_name = "fx/impact_blood_chaos",
		armour_type = "flesh",
		extra_conditions = {
			hit_zone = {
				"left_arm"
			}
		},
		animations = {
			"hit_reaction_left"
		}
	},
	default_right_arm = {
		inherits = "default",
		husk_hit_effect_name = "fx/impact_blood_chaos",
		armour_type = "flesh",
		extra_conditions = {
			hit_zone = {
				"right_arm"
			}
		},
		animations = {
			"hit_reaction_right"
		}
	},
	default_death = {
		inherits = "default",
		extra_conditions = {
			death = true
		},
		animations = {
			"ragdoll"
		}
	},
	heavy_blunt_tank_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_blunt_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 40,
			lateral_force = 90
		}
	},
	burn_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"drakegun_shot",
				"drakegun",
				"drakegun_glance"
			}
		},
		timed_status = StatusEffectNames.burning
	},
	burn_death_conjured = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"burning_tank",
				"heavy_burning_tank",
				"burning_stab_fencer",
				"burn",
				"burn_sniper",
				"burn_carbine",
				"burn_machinegun"
			}
		},
		timed_status = StatusEffectNames.burning
	},
	push = {
		extra_conditions = {
			damage_type = "push"
		}
	},
	gib_killing_blow_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = "killing_blow"
		},
		animations = {
			"ragdoll"
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
	}
}
HitEffectsChaosTroll = table.create_copy(HitEffectsChaosTroll, HitEffectsChaosTroll)
