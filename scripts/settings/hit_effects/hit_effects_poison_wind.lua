left_right_damage_types = {
	"light_stab_linesman",
	"light_stab_tank",
	"stab_linesman",
	"stab_tank",
	"heavy_stab_linesman",
	"heavy_stab_tank",
	"light_slashing_linesman",
	"slashing_linesman",
	"heavy_slashing_linesman"
}
wounding_damage_types = {
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
HitEffectsPoisonWind = {
	default = {
		husk_hit_effect_name = "fx/impact_blood",
		armour_type = "sand",
		extra_conditions = {},
		animations = {
			"hit_reaction"
		}
	},
	default_noDamage = {
		armour_type = "sand",
		extra_conditions = {
			damage = false
		}
	},
	default_death = {
		husk_hit_effect_name = "fx/impact_blood",
		armour_type = "sand",
		extra_conditions = {
			death = true
		},
		animations = {
			"ragdoll"
		}
	},
	heavy_slashing_buffed = {
		inherits = "default",
		do_dismember = true,
		extra_conditions = {
			damage_type = "heavy_slashing_buffed"
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 35,
			lateral_force = 40
		}
	},
	light_slashing_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_linesman"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = -10,
			lateral_force = 20
		}
	},
	light_slashing_linesman_death_head = {
		inherits = "light_slashing_linesman_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll"
		}
	},
	light_slashing_linesman_hs_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_linesman_hs"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = -10,
			lateral_force = 20
		}
	},
	light_slashing_linesman_hs_death_head = {
		inherits = "light_slashing_linesman_hs_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll"
		}
	},
	slashing_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_linesman"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 0,
			lateral_force = 40
		}
	},
	heavy_slashing_linesman_death = {
		inherits = "default_death",
		do_dismember = true,
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_slashing_linesman"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 20,
			lateral_force = 40
		}
	},
	light_blunt_linesman_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"light_blunt_linesman"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = 0,
			lateral_force = 30
		}
	},
	blunt_linesman_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_linesman"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 0,
			lateral_force = 40
		}
	},
	heavy_blunt_linesman_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_blunt_linesman"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 40,
			lateral_force = 50
		}
	},
	stab_smiter_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"stab_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 5,
			vertical_force = -30,
			lateral_force = 10
		}
	},
	light_slashing_smiter_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 0,
			vertical_force = -20,
			lateral_force = 5
		}
	},
	slashing_smiter_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 5,
			vertical_force = -30,
			lateral_force = 10
		}
	},
	heavy_slashing_smiter_death = {
		inherits = "default_death",
		do_dismember = true,
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_slashing_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = -60,
			lateral_force = 10
		}
	},
	light_blunt_smiter_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"light_blunt_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = -20,
			lateral_force = 0
		}
	},
	blunt_smiter_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = -10,
			vertical_force = -50,
			lateral_force = 0
		}
	},
	heavy_blunt_smiter_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_blunt_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 50,
			lateral_force = 0
		}
	},
	light_stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_stab_fencer"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"stab_fencer"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	burning_stab_fencer_death = {
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage_type = {
				"burning_stab_fencer"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	burning_tank_death = {
		inherits = "default_death",
		do_dismember = false,
		flow_event = "burn",
		extra_conditions = {
			damage_type = {
				"burning_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = 0,
			lateral_force = 30
		}
	},
	heavy_stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_stab_fencer"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	light_blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_blunt_fencer"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_fencer",
				"push"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	heavy_blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_blunt_fencer"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 50,
			vertical_force = 20,
			lateral_force = 0
		}
	},
	light_slashing_fencer_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_fencer"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 5,
			lateral_force = 10
		}
	},
	slashing_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_fencer"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	heavy_slashing_tank_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_slashing_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 50,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	light_blunt_tank_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"light_blunt_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = 10,
			lateral_force = 40
		}
	},
	blunt_tank_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = 10,
			lateral_force = 40
		}
	},
	heavy_blunt_tank_death = {
		inherits = "default_death",
		do_dismember = false,
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
			distal_force = 10,
			vertical_force = 20,
			lateral_force = 50
		}
	},
	light_slashing_tank_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = 0,
			lateral_force = 20
		}
	},
	slashing_tank_death = {
		inherits = "default_death",
		do_dismember = true,
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = 0,
			lateral_force = 30
		}
	},
	heavy_slashing_tank_death = {
		inherits = "default_death",
		do_dismember = true,
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_slashing_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 10,
			lateral_force = 40
		}
	},
	shot_default = {
		hit_effect_name = "fx/impact_blood",
		husk_hit_effect_name = "fx/impact_blood",
		armour_type = "sand",
		extra_conditions = {
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
	shot_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_carbine",
				"shot_machinegun"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	shot_repeating_handgun_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_sniper",
				"shot_repeating_handgun"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 60,
			vertical_force = 40,
			lateral_force = 0
		}
	},
	shotgun_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_shotgun"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 80,
			vertical_force = -30,
			lateral_force = 0
		}
	},
	arrow_default = {
		hit_effect_name = "fx/impact_blood",
		husk_hit_effect_name = "fx/impact_blood",
		armour_type = "flesh",
		extra_conditions = {
			damage = true,
			damage_type = {
				"arrow_sniper",
				"arrow_carbine",
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
	arrow_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"arrow_sniper",
				"arrow_carbine",
				"arrow_machinegun",
				"arrow_shotgun"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	poison_arrow = {
		inherits = "default",
		hit_effect_name = "fx/impact_blood",
		husk_hit_effect_name = "fx/impact_blood",
		extra_conditions = {
			damage = true,
			damage_type = {
				"arrow_poison"
			}
		},
		animations = {
			"hit_reaction"
		}
	},
	poison_arrow_nodamage = {
		inherits = "default",
		extra_conditions = {
			damage = false,
			damage_type = {
				"arrow_poison"
			}
		}
	},
	bolt_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"bolt_sniper",
				"bolt_carbine",
				"bolt_machinegun",
				"bolt_shotgun"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 50,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	burn = {
		flow_event = "burn",
		extra_conditions = {
			damage_type = "burn"
		}
	},
	burn_sniper = {
		flow_event = "burn",
		extra_conditions = {
			damage_type = "burn_sniper"
		}
	},
	burn_shotgun = {
		flow_event = "burn",
		extra_conditions = {
			damage_type = "burn_shotgun"
		}
	},
	burn_shotgun = {
		flow_event = "burn",
		extra_conditions = {
			damage_type = "burn_machinegun"
		}
	},
	burninating = {
		extra_conditions = {
			damage_type = "burninating"
		}
	},
	burn_death = {
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage_type = {
				"burninating",
				"burn"
			}
		},
		animations = {
			"death"
		}
	},
	burn_sniper_death = {
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage_type = {
				"burn_sniper"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 80,
			vertical_force = 20,
			lateral_force = 0
		}
	},
	burn_shotgun_death = {
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage_type = {
				"burn_shotgun"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 30,
			lateral_force = 0
		}
	},
	burn_machinegun_death = {
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage_type = {
				"burn_machinegun"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	poison_base = {
		extra_conditions = {
			death = true,
			damage_type = "poison"
		},
		animations = {
			"ragdoll"
		}
	},
	arrow_poison_dot = {
		hit_effect_name = "fx/wpnfx_poison_arrow_impact",
		extra_conditions = {
			damage_type = {
				"arrow_poison_dot",
				"aoe_poison_dot"
			}
		}
	},
	arrow_poison_dot_death = {
		inherits = "arrow_poison_dot",
		hit_effect_name = "fx/wpnfx_poison_arrow_impact",
		extra_conditions = {
			death = true,
			damage_type = {
				"arrow_poison_dot",
				"aoe_poison_dot"
			}
		},
		animations = {
			"ragdoll"
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
	gib_killing_blow_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = "killing_blow"
		},
		push = {
			distal_force = 0,
			vertical_force = 250,
			lateral_force = 0
		},
		animations = {
			"ragdoll"
		}
	},
	grenade_death = {
		inherits = "default",
		explosion_push = true,
		extra_conditions = {
			death = true,
			damage_type = "grenade"
		},
		push = {
			distal_force = 100,
			vertical_force = 75,
			lateral_force = 0
		},
		animations = {
			"ragdoll"
		}
	},
	grenade_glance_death = {
		inherits = "default",
		explosion_push = true,
		extra_conditions = {
			death = true,
			damage_type = "grenade_glance"
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 100,
			vertical_force = 30,
			lateral_force = 0
		}
	},
	fire_grenade_death = {
		inherits = "default",
		explosion_push = true,
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage_type = "fire_grenade"
		},
		push = {
			distal_force = 50,
			vertical_force = 50,
			lateral_force = 0
		},
		animations = {
			"ragdoll"
		}
	},
	fire_grenade_glance_death = {
		inherits = "default",
		explosion_push = true,
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage_type = "fire_grenade_glance"
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 50,
			vertical_force = 30,
			lateral_force = 0
		}
	},
	drakegun = {
		inherits = "default",
		flow_event = "burn",
		extra_conditions = {
			damage_type = "drakegun"
		}
	},
	drakegun_death = {
		inherits = "drakegun",
		explosion_push = true,
		do_dismember = true,
		extra_conditions = {
			death = true
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 70,
			vertical_force = 35
		}
	},
	drakegun_shot_death = {
		inherits = "default",
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage_type = {
				"drakegun_shot"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 60,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	drakegun_glance = {
		inherits = "default",
		flow_event = "burn",
		extra_conditions = {
			damage_type = "drakegun_glance"
		}
	},
	drakegun_glance_death = {
		inherits = "drakegun_glance",
		explosion_push = true,
		extra_conditions = {
			death = true
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 15
		}
	},
	default_burning = {
		inherits = "default",
		flow_event = "burn",
		extra_conditions = {
			damage_type = {
				"burning_tank",
				"heavy_burning_tank",
				"burning_stab_fencer"
			}
		}
	}
}

return 
