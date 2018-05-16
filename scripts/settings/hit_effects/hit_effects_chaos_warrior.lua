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
HitEffectsChaosWarrior = {
	default = {
		husk_hit_effect_name = "fx/impact_blood",
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
		husk_hit_effect_name = "fx/impact_blood_02",
		armour_type = "metal_hollow",
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
		}
	},
	light_slashing_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"light_slashing_linesman"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = -10,
			lateral_force = 30
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
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"light_slashing_linesman_hs"
			}
		},
		animations = {
			"ragdoll",
			"death_backward"
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
			"ragdoll",
			"death_decapitate"
		}
	},
	slashing_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
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
	slashing_linesman_death_right_arm = {
		inherits = "slashing_linesman_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = "right_arm"
		},
		animations = {
			"ragdoll"
		}
	},
	slashing_linesman_death_left_arm = {
		inherits = "slashing_linesman_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = "left_arm"
		},
		animations = {
			"ragdoll"
		}
	},
	slashing_linesman_death_head = {
		inherits = "slashing_linesman_death",
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
	heavy_slashing_linesman_death = {
		inherits = "default_death",
		do_dismember = true,
		extra_conditions = {
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
	heavy_slashing_linesman_death_right_arm = {
		inherits = "heavy_slashing_linesman_death",
		extra_conditions = {
			hit_zone = "right_arm"
		},
		animations = {
			"ragdoll"
		}
	},
	heavy_slashing_linesman_death_left_arm = {
		inherits = "heavy_slashing_linesman_death",
		extra_conditions = {
			hit_zone = "left_arm"
		},
		animations = {
			"ragdoll"
		}
	},
	heavy_slashing_linesman_death_torso = {
		inherits = "heavy_slashing_linesman_death",
		extra_conditions = {
			hit_zone = "torso"
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	heavy_slashing_linesman_death_head = {
		inherits = "heavy_slashing_linesman_death",
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
	light_blunt_linesman_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			damage_type = {
				"light_blunt_linesman"
			}
		},
		animations = {
			"ragdoll",
			"death_backward"
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
	heavy_blunt_linesman_death_head = {
		inherits = "heavy_blunt_linesman_death",
		flow_event = "explode_head",
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
	stab_smiter_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"stab_smiter"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
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
			damage_type = {
				"light_slashing_smiter"
			}
		},
		animations = {
			"ragdoll",
			"death_backward"
		},
		push = {
			distal_force = 0,
			vertical_force = -20,
			lateral_force = 5
		}
	},
	light_slashing_smiter_death_head = {
		inherits = "light_slashing_smiter_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	slashing_smiter_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"slashing_smiter"
			}
		},
		animations = {
			"ragdoll",
			"death_backward"
		},
		push = {
			distal_force = 5,
			vertical_force = -30,
			lateral_force = 10
		}
	},
	slashing_smiter_death_right_arm = {
		inherits = "slashing_smiter_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = "right_arm"
		},
		animations = {
			"ragdoll",
			"death_right"
		},
		push = {
			distal_force = 0,
			vertical_force = 0,
			lateral_force = 15
		}
	},
	slashing_smiter_death_left_arm = {
		inherits = "slashing_smiter_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = "left_arm"
		},
		animations = {
			"ragdoll",
			"death_left"
		},
		push = {
			distal_force = 0,
			vertical_force = 0,
			lateral_force = -15
		}
	},
	slashing_smiter_death_head = {
		inherits = "slashing_smiter_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		},
		push = {
			distal_force = 20,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	heavy_slashing_smiter_death = {
		inherits = "default_death",
		do_dismember = true,
		extra_conditions = {
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
	heavy_slashing_smiter_death_right_arm = {
		inherits = "heavy_slashing_smiter_death",
		extra_conditions = {
			hit_zone = "right_arm"
		},
		animations = {
			"ragdoll",
			"death_right"
		}
	},
	heavy_slashing_smiter_death_left_arm = {
		inherits = "heavy_slashing_smiter_death",
		extra_conditions = {
			hit_zone = "left_arm"
		},
		animations = {
			"ragdoll",
			"death_left"
		}
	},
	heavy_slashing_smiter_death_torso = {
		inherits = "heavy_slashing_smiter_death",
		extra_conditions = {
			hit_zone = "torso"
		},
		animations = {
			"ragdoll"
		}
	},
	heavy_slashing_smiter_death_head = {
		inherits = "heavy_slashing_smiter_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	light_blunt_smiter_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			damage_type = {
				"light_blunt_smiter"
			}
		},
		animations = {
			"ragdoll",
			"death_backward"
		},
		push = {
			distal_force = 10,
			vertical_force = -20,
			lateral_force = 0
		}
	},
	light_blunt_smiter_death_head = {
		inherits = "light_blunt_smiter_death",
		flow_event = "explode_head",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	blunt_smiter_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			damage_type = {
				"blunt_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = -40,
			vertical_force = -100,
			lateral_force = 0
		}
	},
	blunt_smiter_death_head = {
		inherits = "blunt_smiter_death",
		flow_event = "explode_head",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	heavy_blunt_smiter_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			damage_type = {
				"heavy_blunt_smiter"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = -150,
			lateral_force = 0
		}
	},
	heavy_blunt_smiter_death_head = {
		inherits = "heavy_blunt_smiter_death",
		flow_event = "explode_head",
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
	light_stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"light_stab_fencer"
			}
		},
		animations = {
			"ragdoll",
			"death_backward",
			"death_shot_body"
		},
		push = {
			distal_force = 20,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	light_stab_fencer_death_head = {
		inherits = "light_stab_fencer_death",
		flow_event = "explode_head",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate",
			"death_shot_head_front"
		}
	},
	stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"stab_fencer"
			}
		},
		animations = {
			"ragdoll",
			"death_backward"
		},
		push = {
			distal_force = 30,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	stab_fencer_death_head = {
		inherits = "stab_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	burning_stab_fencer_death = {
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
			damage_type = {
				"burning_stab_fencer"
			}
		},
		animations = {
			"ragdoll",
			"death_burn"
		},
		push = {
			distal_force = 30,
			vertical_force = 0,
			lateral_force = 0
		}
	},
	heavy_stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
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
	heavy_stab_fencer_death_head = {
		inherits = "heavy_stab_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	light_blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"light_blunt_fencer"
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
	light_blunt_fencer_death_head = {
		inherits = "light_blunt_fencer_death",
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
	blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
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
	blunt_fencer_death_head = {
		inherits = "blunt_fencer_death",
		flow_event = "explode_head",
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
	heavy_blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
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
	heavy_blunt_fencer_death_head = {
		inherits = "heavy_blunt_fencer_death",
		flow_event = "explode_head",
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
	push_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"push"
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
	light_slashing_fencer_death_head = {
		inherits = "light_slashing_fencer_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	slashing_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
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
	slashing_fencer_death_head = {
		inherits = "slashing_fencer_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	light_slashing_tank_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			damage_type = {
				"light_slashing_tank"
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
	light_slashing_tank_death_head = {
		inherits = "light_slashing_tank_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
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
	slashing_tank_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"slashing_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 20,
			lateral_force = 70
		}
	},
	slashing_tank_death_head = {
		inherits = "slashing_tank_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 20,
			lateral_force = 70
		}
	},
	heavy_slashing_tank_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"heavy_slashing_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 30,
			lateral_force = 90
		}
	},
	heavy_slashing_tank_death_head = {
		inherits = "heavy_slashing_tank_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 30,
			lateral_force = 90
		}
	},
	light_blunt_tank_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
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
	light_blunt_tank_death_head = {
		inherits = "light_blunt_tank_death",
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
	blunt_tank_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			damage_type = {
				"blunt_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 20,
			lateral_force = 90
		}
	},
	blunt_tank_death_head = {
		inherits = "blunt_tank_death",
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
	blunt_tank_uppercut_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			damage_type = {
				"blunt_tank_uppercut"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 40,
			vertical_force = 80,
			lateral_force = 30
		}
	},
	blunt_tank_death_head = {
		inherits = "blunt_tank_uppercut_death",
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
	heavy_blunt_tank_death = {
		inherits = "default_death",
		do_dismember = false,
		extra_conditions = {
			damage_type = {
				"heavy_blunt_tank"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 80,
			vertical_force = 80,
			lateral_force = 150
		}
	},
	heavy_blunt_tank_death_head = {
		inherits = "heavy_blunt_tank_death",
		flow_event = "explode_head",
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
	burning_tank_death_head = {
		inherits = "burning_tank_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head"
			}
		},
		animations = {
			"ragdoll",
			"death_decapitate"
		}
	},
	heavy_burning_tank_death = {
		inherits = "default_death",
		do_dismember = true,
		flow_event = "burn",
		extra_conditions = {
			damage_type = {
				"heavy_burning_tank"
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
	heavy_burning_tank_death_head = {
		inherits = "heavy_burning_tank_death",
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
	light_burning_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"light_burning_linesman"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 20,
			vertical_force = -10,
			lateral_force = 30
		}
	},
	light_burning_linesman_death_head = {
		inherits = "light_burning_linesman_death",
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
	burning_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"burning_linesman"
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
	burning_linesman_death_right_arm = {
		inherits = "burning_linesman_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = "right_arm"
		},
		animations = {
			"ragdoll"
		}
	},
	burning_linesman_death_left_arm = {
		inherits = "burning_linesman_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = "left_arm"
		},
		animations = {
			"ragdoll"
		}
	},
	burning_linesman_death_head = {
		inherits = "burning_linesman_death",
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
	shot_default = {
		hit_effect_name = "fx/impact_blood_02",
		husk_hit_effect_name = "fx/impact_blood_02",
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
	shot_torso_crater_front = {
		inherits = "shot_default",
		flow_event = "wound_crater_torso_front",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "front"
		}
	},
	shot_torso_crater_back = {
		inherits = "shot_default",
		flow_event = "wound_crater_torso_back",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "back"
		}
	},
	shot_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"shot_carbine",
				"shot_machinegun"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_body"
		},
		push = {
			distal_force = 40,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	shot_death_torso_crater_front = {
		inherits = "shot_death",
		flow_event = "wound_crater_torso_back",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "front"
		}
	},
	shot_death_torso_crater_back = {
		inherits = "shot_death",
		flow_event = "wound_crater_torso_front",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "back"
		}
	},
	shot_death_head = {
		inherits = "shot_death",
		flow_event = "explode_head",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate"
		}
	},
	shot_sniper_handgun_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"shot_sniper"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 50,
			vertical_force = 40,
			lateral_force = 0
		}
	},
	shot_sniper_handgun_death_torso_crater_front = {
		inherits = "shot_sniper_handgun_death",
		flow_event = "wound_crater_torso_back",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "front"
		}
	},
	shot_sniper_handgun_death_torso_crater_back = {
		inherits = "shot_sniper_handgun_death",
		flow_event = "wound_crater_torso_front",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "back"
		}
	},
	shot_sniper_handgun_death_head = {
		inherits = "shot_sniper_handgun_death",
		do_dismember = true,
		flow_event = "explode_head",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate"
		}
	},
	shot_sniper_handgun_death_dismember = {
		inherits = "shot_sniper_handgun_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"left_arm",
				"right_arm"
			}
		},
		animations = {
			"ragdoll"
		}
	},
	shot_repeating_handgun_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"shot_repeating_handgun"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_body"
		},
		push = {
			distal_force = 30,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	shot_repeating_handgun_death_torso_crater_front = {
		inherits = "shot_repeating_handgun_death",
		flow_event = "wound_crater_torso_back",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "front"
		}
	},
	shot_repeating_handgun_death_torso_crater_back = {
		inherits = "shot_repeating_handgun_death",
		flow_event = "wound_crater_torso_front",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "back"
		}
	},
	shot_repeating_handgun_death_head = {
		inherits = "shot_repeating_handgun_death",
		flow_event = "explode_head",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate"
		}
	},
	shot_repeating_handgun_death_dismember = {
		inherits = "shot_repeating_handgun_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"left_arm",
				"right_arm"
			}
		},
		animations = {
			"ragdoll",
			"death_left",
			"death_right"
		}
	},
	shotgun_death = {
		inherits = "default_death",
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
			vertical_force = 20,
			lateral_force = 0
		}
	},
	shotgun_death_torso_crater_front = {
		inherits = "shotgun_death",
		flow_event = "wound_crater_torso_back",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "front"
		}
	},
	shotgun_death_torso_crater_back = {
		inherits = "shotgun_death",
		flow_event = "wound_crater_torso_front",
		extra_conditions = {
			hit_zone = "torso",
			hit_direction = "back"
		}
	},
	shotgun_death_head = {
		inherits = "shotgun_death",
		flow_event = "explode_head",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"ragdoll"
		}
	},
	arrow_default = {
		hit_effect_name = "fx/impact_blood_02",
		husk_hit_effect_name = "fx/impact_blood_02",
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
	arrow_machinegun_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"arrow_machinegun"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_body"
		},
		push = {
			distal_force = 20,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	arrow_carbine_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"arrow_carbine",
				"arrow_shotgun"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_body"
		},
		push = {
			distal_force = 20,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	arrow_sniper_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"arrow_sniper"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_body"
		},
		push = {
			distal_force = 20,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	poison_arrow = {
		husk_hit_effect_name = "fx/impact_blood_02",
		hit_effect_name = "fx/impact_blood_02",
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
	poison_arrow_death = {
		inherits = "poison_arrow",
		extra_conditions = {
			death = true,
			damage_type = {
				"arrow_poison"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_body",
			"death_shot_body_2"
		},
		push = {
			distal_force = 50,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	arrow_death_head = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"arrow_sniper",
				"arrow_carbine",
				"arrow_machinegun",
				"arrow_shotgun"
			},
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_head_front"
		},
		push = {
			distal_force = 20,
			vertical_force = 30,
			lateral_force = 0
		}
	},
	bolt_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"bolt_carbine",
				"bolt_machinegun",
				"bolt_shotgun"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_body"
		},
		push = {
			distal_force = 50,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	bolt_death_head = {
		inherits = "bolt_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_head_front"
		},
		push = {
			distal_force = 20,
			vertical_force = 30,
			lateral_force = 0
		}
	},
	bolt_sniper_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"bolt_sniper"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_body"
		},
		push = {
			distal_force = 50,
			vertical_force = 10,
			lateral_force = 0
		}
	},
	bolt_sniper_death_head = {
		inherits = "bolt_sniper_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_head_front"
		},
		push = {
			distal_force = 20,
			vertical_force = 30,
			lateral_force = 0
		}
	},
	burn = {
		flow_event = "burn",
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
	burn_death = {
		flow_event = "burn",
		extra_conditions = {
			death = true,
			damage = true,
			damage_type = {
				"burninating",
				"burn"
			}
		},
		animations = {
			"death_burn"
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
	burn_sniper_death = {
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
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
	burn_sniper_death_dismember = {
		inherits = "burn_sniper_death",
		do_dismember = true,
		flow_event = "burn",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail"
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
	burn_shotgun = {
		inherits = "default",
		flow_event = "burn",
		extra_conditions = {
			damage_type = "burn_shotgun"
		},
		animations = {
			"hit_reaction"
		}
	},
	burn_shotgun_death = {
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
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
	burn_machinegun = {
		inherits = "default",
		extra_conditions = {
			damage_type = "burn_machinegun"
		},
		animations = {
			"hit_reaction"
		}
	},
	burn_machinegun_death = {
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
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
	burn_machinegun_death_hs = {
		inherits = "burn_machinegun_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"death_shot_head_front"
		},
		flow_event = {
			"burn",
			"explode_head"
		},
		push = {
			distal_force = 40,
			vertical_force = 10,
			lateral_force = 0
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
	burn_carbine_death = {
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
			damage_type = {
				"burn_carbine"
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
	burn_carbine_death_hs = {
		inherits = "burn_carbine_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"death_shot_head_front"
		},
		flow_event = {
			"burn",
			"explode_head"
		},
		push = {
			distal_force = 60,
			vertical_force = 10,
			lateral_force = 0
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
	arrow_poison_dot_death = {
		hit_effect_name = "fx/wpnfx_poison_arrow_impact",
		extra_conditions = {
			death = true,
			damage = true,
			damage_type = {
				"arrow_poison_dot",
				"aoe_poison_dot",
				"poison"
			}
		},
		animations = {
			"death_gas"
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
	grenade_glance_death = {
		inherits = "default_death",
		explosion_push = true,
		extra_conditions = {
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
	grenade_glance_death_dismember = {
		inherits = "grenade_glance_death",
		do_dismember = true,
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate",
			"death_decapitate_2",
			"death_decapitate_3",
			"death_decapitate_4",
			"death_decapitate_5",
			"death_decapitate_6"
		},
		push = {
			distal_force = 100,
			vertical_force = 30,
			lateral_force = 0
		}
	},
	grenade_death = {
		inherits = "default_death",
		explosion_push = true,
		extra_conditions = {
			damage_type = "grenade"
		},
		push = {
			distal_force = 300,
			vertical_force = 275,
			lateral_force = 0
		},
		animations = {
			"ragdoll"
		},
		flow_event = {
			"dismember_left_leg",
			"dismember_right_arm"
		}
	},
	fire_grenade_glance_death = {
		inherits = "default_death",
		explosion_push = true,
		flow_event = "burn",
		extra_conditions = {
			damage_type = "fire_grenade_glance"
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
	fire_grenade_glance_death_dismember = {
		inherits = "fire_grenade_glance_death",
		do_dismember = true,
		flow_event = "burn",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail"
			}
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate"
		},
		push = {
			distal_force = 50,
			vertical_force = 30,
			lateral_force = 0
		}
	},
	fire_grenade_death = {
		inherits = "default_death",
		explosion_push = true,
		extra_conditions = {
			damage_type = "fire_grenade"
		},
		push = {
			distal_force = 50,
			vertical_force = 50,
			lateral_force = 0
		},
		animations = {
			"ragdoll"
		},
		flow_event = {
			"burn",
			"dismember_left_leg",
			"dismember_right_arm"
		}
	},
	drakegun = {
		inherits = "default",
		flow_event = "burn",
		extra_conditions = {
			damage_type = {
				"drakegun"
			}
		}
	},
	drakegun_death = {
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
			damage_type = "drakegun"
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 70,
			vertical_force = 35
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
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
			damage_type = "drakegun_glance"
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 30,
			vertical_force = 15
		}
	},
	drakegun_shot_death = {
		inherits = "default_death",
		flow_event = "burn",
		extra_conditions = {
			damage_type = {
				"drakegun_shot"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 100,
			vertical_force = 40,
			lateral_force = 0
		}
	},
	drakegun_shot_death_dismember = {
		inherits = "drakegun_shot_death",
		do_dismember = true,
		flow_event = "burn",
		extra_conditions = {
			hit_zone = {
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail"
			}
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 100,
			vertical_force = 40,
			lateral_force = 0
		}
	},
	drakegun_shot_death_head = {
		inherits = "drakegun_shot_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck"
			}
		},
		animations = {
			"ragdoll"
		},
		flow_event = {
			"burn",
			"explode_head"
		},
		push = {
			distal_force = 100,
			vertical_force = 40,
			lateral_force = 0
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
	gib_killing_blow_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = "killing_blow"
		},
		animations = {
			"ragdoll"
		},
		flow_event = {
			"dismember_gib"
		}
	},
	wound_default = {
		husk_hit_effect_name = "fx/impact_blood_02",
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
		flow_event = "burn",
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

return
