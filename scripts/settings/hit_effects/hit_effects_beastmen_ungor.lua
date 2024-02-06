-- chunkname: @scripts/settings/hit_effects/hit_effects_beastmen_ungor.lua

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
	"light_slashing_linesman_hs",
	"light_slashing_linesman",
	"slashing_linesman",
	"heavy_slashing_linesman",
}
local dismembering_damage_types = {
	"heavy_stab_smiter",
	"light_slashing_smiter",
	"slashing_smiter",
	"heavy_slashing_fencer",
	"heavy_slashing_smiter",
	"slashing_linesman",
	"heavy_slashing_linesman",
	"slashing_tank",
	"heavy_slashing_tank",
}

HitEffectsBeastmenUngor = {
	default = {
		armour_type = "cloth",
		husk_hit_effect_name = "fx/impact_blood_beastman",
		animations = {
			"hit_reaction",
		},
	},
	default_noDamage = {
		armour_type = "cloth",
		disable_blood = true,
		husk_effect_name = "fx/hit_armored",
		extra_conditions = {
			damage = false,
		},
		animations = {
			"hit_reaction",
		},
	},
	default_death = {
		armour_type = "cloth",
		husk_hit_effect_name = "fx/impact_blood_beastman",
		extra_conditions = {
			death = true,
		},
		animations = {
			"ragdoll",
		},
	},
	default_bleed = {
		armour_type = "cloth",
		hit_effect_name = "fx/impact_blood_beastman",
		husk_hit_effect_name = "fx/impact_blood_beastman",
		extra_conditions = {
			damage_type = "bleed",
		},
		animations = {
			"hit_reaction",
		},
	},
	default_bleed_death = {
		armour_type = "cloth",
		hit_effect_name = "fx/impact_blood_beastman",
		husk_hit_effect_name = "fx/impact_blood_beastman",
		inherits = "default_bleed",
		extra_conditions = {
			death = true,
		},
		animations = {
			"ragdoll",
			"death_stab_chest",
			"death_stab_chest_2",
			"death_stab_chest_3",
		},
	},
	heavy_slashing_buffed = {
		do_dismember = true,
		inherits = "default",
		extra_conditions = {
			damage_type = "heavy_slashing_buffed",
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 30,
			lateral_force = 40,
			vertical_force = 35,
		},
	},
	light_slashing_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"light_slashing_linesman",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 30,
			vertical_force = -10,
		},
	},
	light_slashing_linesman_death_head = {
		inherits = "light_slashing_linesman_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	light_slashing_linesman_hs_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_linesman_hs",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 10,
			lateral_force = 20,
			vertical_force = -10,
		},
	},
	light_slashing_linesman_hs_death_head = {
		do_dismember = true,
		inherits = "light_slashing_linesman_hs_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	light_slashing_linesman_hs_death_tail = {
		do_dismember = true,
		inherits = "light_slashing_linesman_hs_death",
		extra_conditions = {
			hit_zone = {
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	slashing_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_linesman",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 80,
			vertical_force = 0,
		},
	},
	slashing_linesman_death_right_arm = {
		do_dismember = true,
		inherits = "slashing_linesman_death",
		extra_conditions = {
			hit_zone = "right_arm",
		},
		animations = {
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"death_arm_right_3",
			"death_arm_right_4",
		},
	},
	slashing_linesman_death_left_arm = {
		do_dismember = true,
		inherits = "slashing_linesman_death",
		extra_conditions = {
			hit_zone = "left_arm",
		},
		animations = {
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"death_arm_left_2",
			"death_arm_left_3",
			"death_arm_left_4",
		},
	},
	slashing_linesman_death_head = {
		do_dismember = true,
		inherits = "slashing_linesman_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
				"tail",
			},
		},
		animations = {
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	heavy_slashing_linesman_death = {
		do_dismember = true,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_slashing_linesman",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 40,
			vertical_force = 20,
		},
	},
	heavy_slashing_linesman_death_right_arm = {
		inherits = "heavy_slashing_linesman_death",
		extra_conditions = {
			hit_zone = "right_arm",
		},
		animations = {
			"ragdoll",
		},
	},
	heavy_slashing_linesman_death_left_arm = {
		inherits = "heavy_slashing_linesman_death",
		extra_conditions = {
			hit_zone = "left_arm",
		},
		animations = {
			"ragdoll",
		},
	},
	heavy_slashing_linesman_death_torso = {
		inherits = "heavy_slashing_linesman_death",
		extra_conditions = {
			hit_zone = "torso",
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	heavy_slashing_linesman_death_head = {
		inherits = "heavy_slashing_linesman_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	light_blunt_linesman_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_blunt_linesman",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 10,
			lateral_force = 30,
			vertical_force = 0,
		},
	},
	blunt_linesman_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_linesman",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 40,
			vertical_force = 0,
		},
	},
	heavy_blunt_linesman_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_blunt_linesman",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 50,
			vertical_force = 40,
		},
	},
	heavy_blunt_linesman_death_head = {
		flow_event = "explode_head",
		inherits = "heavy_blunt_linesman_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	stab_smiter_death = {
		inherits = "default",
		extra_conditions = {
			death = true,
			damage_type = {
				"stab_smiter",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 5,
			lateral_force = 10,
			vertical_force = -30,
		},
	},
	stab_smiter_death_torso = {
		inherits = "stab_smiter_death",
		extra_conditions = {
			hit_zone = {
				"torso",
			},
		},
		animations = {
			"ragdoll",
			"death_stab_chest",
			"death_stab_chest_2",
			"death_stab_chest_3",
		},
		push = {
			distal_force = 5,
			lateral_force = 10,
			vertical_force = -30,
		},
	},
	stab_smiter_death_head = {
		inherits = "stab_smiter_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
		push = {
			distal_force = 5,
			lateral_force = 10,
			vertical_force = -30,
		},
	},
	heavy_stab_smiter_death = {
		inherits = "default_death",
		extra_conditions = {
			damage_type = {
				"heavy_stab_smiter",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 150,
			lateral_force = 0,
			vertical_force = -10,
		},
	},
	light_slashing_smiter_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_smiter",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 0,
			lateral_force = 5,
			vertical_force = -20,
		},
	},
	light_slashing_smiter_death_head = {
		do_dismember = true,
		inherits = "light_slashing_smiter_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	light_slashing_smiter_death_tail = {
		do_dismember = true,
		inherits = "light_slashing_smiter_death",
		extra_conditions = {
			hit_zone = {
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 10,
			lateral_force = 0,
			vertical_force = 0,
		},
	},
	slashing_smiter_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_smiter",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 5,
			lateral_force = 10,
			vertical_force = -30,
		},
	},
	slashing_smiter_death_right_arm = {
		do_dismember = true,
		inherits = "slashing_smiter_death",
		extra_conditions = {
			hit_zone = "right_arm",
		},
		animations = {
			"ragdoll",
			"death_arm_right_3",
			"death_arm_right_4",
		},
		push = {
			distal_force = 0,
			lateral_force = 15,
			vertical_force = 0,
		},
	},
	slashing_smiter_death_left_arm = {
		do_dismember = true,
		inherits = "slashing_smiter_death",
		extra_conditions = {
			hit_zone = "left_arm",
		},
		animations = {
			"ragdoll",
			"death_arm_left_2",
			"death_arm_left_3",
			"death_arm_left_4",
		},
		push = {
			distal_force = 0,
			lateral_force = -15,
			vertical_force = 0,
		},
	},
	slashing_smiter_death_head = {
		do_dismember = true,
		inherits = "slashing_smiter_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = 0,
		},
	},
	slashing_smiter_death_tail = {
		do_dismember = true,
		inherits = "slashing_smiter_death",
		extra_conditions = {
			hit_zone = {
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = 0,
		},
	},
	heavy_slashing_smiter_death = {
		do_dismember = true,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_slashing_smiter",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 10,
			lateral_force = 10,
			vertical_force = -60,
		},
	},
	heavy_slashing_smiter_death_right_arm = {
		inherits = "heavy_slashing_smiter_death",
		extra_conditions = {
			hit_zone = "right_arm",
		},
		animations = {
			"ragdoll",
			"death_arm_right_3",
			"death_arm_right_4",
		},
	},
	heavy_slashing_smiter_death_left_arm = {
		inherits = "heavy_slashing_smiter_death",
		extra_conditions = {
			hit_zone = "left_arm",
		},
		animations = {
			"ragdoll",
			"death_arm_left_2",
			"death_arm_left_3",
			"death_arm_left_4",
		},
	},
	heavy_slashing_smiter_death_torso = {
		do_dismember = false,
		inherits = "heavy_slashing_smiter_death",
		extra_conditions = {
			hit_zone = "torso",
		},
		animations = {
			"ragdoll",
		},
	},
	heavy_slashing_smiter_death_head = {
		inherits = "heavy_slashing_smiter_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	light_blunt_smiter_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_blunt_smiter",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = -50,
		},
	},
	light_blunt_smiter_death_head = {
		flow_event = "explode_head",
		inherits = "light_blunt_smiter_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	blunt_smiter_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_smiter",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = -50,
		},
	},
	blunt_smiter_death_head = {
		flow_event = "explode_head",
		inherits = "blunt_smiter_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	burning_smiter_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"burning_smiter",
			},
		},
		animations = {
			"ragdoll",
			"death_burn",
			"death_burn_2",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = -50,
		},
		timed_status = StatusEffectNames.burning,
	},
	burning_smiter_death_head = {
		inherits = "burning_smiter_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	heavy_blunt_smiter_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_blunt_smiter",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = -150,
		},
	},
	heavy_blunt_smiter_death_head = {
		flow_event = "explode_head",
		inherits = "heavy_blunt_smiter_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	light_stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_stab_fencer",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 60,
			lateral_force = 0,
			vertical_force = 0,
		},
	},
	light_stab_fencer_death_head = {
		inherits = "light_stab_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	light_stab_fencer_death_torso_front = {
		inherits = "light_stab_fencer_death",
		extra_conditions = {
			hit_direction = "front",
			hit_zone = {
				"torso",
			},
		},
		animations = {
			"ragdoll",
			"death_stab_chest",
			"death_stab_chest_2",
			"death_stab_chest_3",
		},
	},
	light_stab_fencer_death_torso_back = {
		inherits = "light_stab_fencer_death",
		extra_conditions = {
			hit_direction = "back",
			hit_zone = {
				"torso",
			},
		},
		animations = {
			"ragdoll",
			"death_stab_back",
			"death_stab_back_2",
		},
	},
	stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"stab_fencer",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 30,
			lateral_force = 0,
			vertical_force = 0,
		},
	},
	stab_fencer_death_head = {
		inherits = "stab_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	stab_fencer_death_torso_front = {
		inherits = "stab_fencer_death",
		extra_conditions = {
			hit_direction = "front",
			hit_zone = {
				"torso",
			},
		},
		animations = {
			"ragdoll",
			"death_stab_chest",
			"death_stab_chest_2",
			"death_stab_chest_3",
		},
	},
	stab_fencer_death_torso_back = {
		inherits = "stab_fencer_death",
		extra_conditions = {
			hit_direction = "back",
			hit_zone = {
				"torso",
			},
		},
		animations = {
			"ragdoll",
			"death_stab_back",
			"death_stab_back_2",
		},
	},
	burning_stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"burning_stab_fencer",
			},
		},
		animations = {
			"ragdoll",
			"death_burn",
			"death_burn_2",
			"death_burn_3",
			"death_burn_4",
			"death_burn_5",
		},
		push = {
			distal_force = 30,
			lateral_force = 0,
			vertical_force = 0,
		},
		timed_status = StatusEffectNames.burning,
	},
	heavy_stab_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_stab_fencer",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 80,
			lateral_force = 40,
			vertical_force = 0,
		},
	},
	heavy_stab_fencer_death_head = {
		inherits = "heavy_stab_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	heavy_stab_fencer_death_torso_front = {
		inherits = "heavy_stab_fencer_death",
		extra_conditions = {
			hit_direction = "front",
			hit_zone = {
				"torso",
			},
		},
		animations = {
			"ragdoll",
			"death_stab_chest",
			"death_stab_chest_2",
			"death_stab_chest_3",
		},
	},
	heavy_stab_fencer_death_torso_back = {
		inherits = "heavy_stab_fencer_death",
		extra_conditions = {
			hit_direction = "back",
			hit_zone = {
				"torso",
			},
		},
		animations = {
			"ragdoll",
			"death_stab_back",
			"death_stab_back_2",
		},
	},
	light_blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_blunt_fencer",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	light_blunt_fencer_death_head = {
		inherits = "light_blunt_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_fencer",
				"push",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 120,
			lateral_force = 0,
			vertical_force = 60,
		},
	},
	blunt_fencer_death_head = {
		flow_event = "explode_head",
		inherits = "blunt_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	heavy_blunt_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_blunt_fencer",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 150,
			lateral_force = 0,
			vertical_force = 60,
		},
	},
	heavy_blunt_fencer_death_head = {
		flow_event = "explode_head",
		inherits = "heavy_blunt_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	push_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"push",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 50,
			lateral_force = 0,
			vertical_force = 20,
		},
	},
	light_slashing_fencer_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_fencer",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 10,
			vertical_force = 5,
		},
	},
	light_slashing_fencer_death_head = {
		do_dismember = true,
		inherits = "light_slashing_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	slashing_fencer_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_fencer",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 100,
			lateral_force = 40,
			vertical_force = 0,
		},
	},
	slashing_fencer_death_head = {
		do_dismember = true,
		inherits = "slashing_fencer_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	light_slashing_tank_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_slashing_tank",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 10,
			lateral_force = 40,
			vertical_force = 10,
		},
	},
	light_slashing_tank_death_head = {
		inherits = "light_slashing_tank_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 10,
			lateral_force = 40,
			vertical_force = 10,
		},
	},
	slashing_tank_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_tank",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 30,
			lateral_force = 70,
			vertical_force = 20,
		},
	},
	slashing_tank_death_head = {
		do_dismember = true,
		inherits = "slashing_tank_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 30,
			lateral_force = 70,
			vertical_force = 20,
		},
	},
	heavy_slashing_tank_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_slashing_tank",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 90,
			vertical_force = 30,
		},
	},
	heavy_slashing_tank_death_head = {
		do_dismember = true,
		inherits = "heavy_slashing_tank_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 90,
			vertical_force = 30,
		},
	},
	light_blunt_tank_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_blunt_tank",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 10,
			lateral_force = 40,
			vertical_force = 10,
		},
	},
	light_blunt_tank_death_head = {
		inherits = "light_blunt_tank_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	blunt_tank_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_tank",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 30,
			lateral_force = 90,
			vertical_force = 20,
		},
	},
	blunt_tank_death_head = {
		inherits = "blunt_tank_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	blunt_tank_uppercut_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"blunt_tank_uppercut",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 30,
			vertical_force = 80,
		},
	},
	blunt_tank_uppercut_death_head = {
		inherits = "blunt_tank_uppercut_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	slashing_smiter_uppercut_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"slashing_smiter_uppercut",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 30,
			vertical_force = 50,
		},
	},
	slashing_smiter_uppercut_death_limbs = {
		do_dismember = true,
		inherits = "slashing_smiter_uppercut_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	heavy_slashing_smiter_uppercut_death = {
		do_dismember = true,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_slashing_smiter_uppercut",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 30,
			vertical_force = 50,
		},
	},
	heavy_slashing_smiter_uppercut_death_head = {
		inherits = "heavy_slashing_smiter_uppercut_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	heavy_blunt_tank_death = {
		do_dismember = false,
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
	heavy_blunt_tank_death_head = {
		flow_event = "explode_head",
		inherits = "heavy_blunt_tank_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	burning_tank_death = {
		do_dismember = false,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"burning_tank",
			},
		},
		animations = {
			"ragdoll",
			"death_burn",
			"death_burn_2",
			"death_burn_3",
			"death_burn_4",
			"death_burn_5",
		},
		push = {
			distal_force = 10,
			lateral_force = 30,
			vertical_force = 0,
		},
		timed_status = StatusEffectNames.burning,
	},
	burning_tank_death_head = {
		inherits = "burning_tank_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	heavy_burning_tank_death = {
		do_dismember = true,
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"heavy_burning_tank",
			},
		},
		animations = {
			"ragdoll",
			"death_burn",
			"death_burn_2",
			"death_burn_3",
			"death_burn_4",
			"death_burn_5",
		},
		push = {
			distal_force = 20,
			lateral_force = 40,
			vertical_force = 10,
		},
		timed_status = StatusEffectNames.burning,
	},
	heavy_burning_tank_death_head = {
		inherits = "heavy_burning_tank_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	light_burning_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"light_burning_linesman",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 30,
			vertical_force = -10,
		},
		timed_status = StatusEffectNames.burning,
	},
	light_burning_linesman_death_head = {
		inherits = "light_burning_linesman_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	burning_linesman_death = {
		inherits = "default_death",
		extra_conditions = {
			death = true,
			damage_type = {
				"burning_linesman",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 20,
			lateral_force = 40,
			vertical_force = 0,
		},
		timed_status = StatusEffectNames.burning,
	},
	burning_linesman_death_right_arm = {
		do_dismember = true,
		inherits = "burning_linesman_death",
		extra_conditions = {
			hit_zone = "right_arm",
		},
		animations = {
			"ragdoll",
			"death_arm_right_3",
			"death_arm_right_4",
		},
	},
	burning_linesman_death_left_arm = {
		do_dismember = true,
		inherits = "burning_linesman_death",
		extra_conditions = {
			hit_zone = "left_arm",
		},
		animations = {
			"ragdoll",
			"death_arm_left_2",
			"death_arm_left_3",
			"death_arm_left_4",
		},
	},
	burning_linesman_death_head = {
		do_dismember = true,
		inherits = "burning_linesman_death",
		extra_conditions = {
			hit_zone = {
				"neck",
				"head",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	shot_default = {
		armour_type = "cloth",
		hit_effect_name = "fx/impact_blood_beastman",
		husk_hit_effect_name = "fx/impact_blood_beastman",
		extra_conditions = {
			damage_type = {
				"shot_sniper",
				"shot_carbine",
				"shot_machinegun",
				"shot_shotgun",
				"shot_repeating_handgun",
			},
		},
		animations = {
			"hit_reaction",
		},
	},
	shot_death = {
		inherits = "shot_default",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_machinegun",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_body",
			"death_shot_body_2",
			"death_shot_body_bwd",
		},
		push = {
			distal_force = 40,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	shot_death_head = {
		flow_event = "explode_head",
		inherits = "shot_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_shot_head_bwd",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	shot_carbine_death = {
		inherits = "shot_default",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_carbine",
			},
		},
		animations = {
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"death_shot_body_bwd",
		},
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 25,
		},
	},
	shot_carbine_death_head = {
		flow_event = "explode_head",
		inherits = "shot_carbine_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	shot_sniper_handgun_death = {
		inherits = "shot_default",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_sniper",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 120,
			lateral_force = 0,
			vertical_force = 40,
		},
	},
	shot_sniper_handgun_death_head = {
		flow_event = "explode_head",
		inherits = "shot_sniper_handgun_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	shot_sniper_handgun_death_dismember = {
		do_dismember = true,
		inherits = "shot_sniper_handgun_death",
		extra_conditions = {
			hit_zone = {
				"left_arm",
				"right_arm",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	shot_repeating_handgun_death = {
		inherits = "shot_default",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_repeating_handgun",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_body",
			"death_shot_body_2",
		},
		push = {
			distal_force = 60,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	shot_repeating_handgun_death_head = {
		flow_event = "explode_head",
		inherits = "shot_repeating_handgun_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate_4",
			"death_decapitate_5",
		},
	},
	shot_repeating_handgun_death_dismember = {
		do_dismember = true,
		inherits = "shot_repeating_handgun_death",
		extra_conditions = {
			hit_zone = {
				"left_arm",
				"right_arm",
			},
		},
		animations = {
			"ragdoll",
			"death_arm_right",
		},
	},
	shotgun_death = {
		inherits = "shot_default",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_shotgun",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 20,
		},
	},
	shotgun_death_head = {
		flow_event = "explode_head",
		inherits = "shotgun_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
		},
	},
	arrow_default = {
		armour_type = "flesh",
		hit_effect_name = "fx/impact_blood_beastman",
		husk_hit_effect_name = "fx/impact_blood_beastman",
		extra_conditions = {
			damage_type = {
				"arrow_sniper",
				"arrow_carbine",
				"elven_magic_arrow_carbine",
				"arrow_machinegun",
				"arrow_shotgun",
				"bolt_sniper",
				"bolt_carbine",
				"bolt_machinegun",
				"bolt_shotgun",
			},
		},
		animations = {
			"hit_reaction",
		},
	},
	arrow_death = {
		inherits = "arrow_default",
		extra_conditions = {
			death = true,
			damage_type = {
				"arrow_machinegun",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_body",
			"death_shot_body_2",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	arrow_death_head = {
		inherits = "arrow_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_shot_head_bwd",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = 30,
		},
	},
	arrow_carbine_death = {
		inherits = "arrow_death",
		extra_conditions = {
			damage_type = {
				"arrow_carbine",
				"arrow_shotgun",
			},
		},
		push = {
			distal_force = 60,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	elven_magic_arrow_carbine_death = {
		inherits = "arrow_carbine_death",
		extra_conditions = {
			damage_type = "elven_magic_arrow_carbine",
		},
		timed_status = StatusEffectNames.burning_elven_magic,
	},
	arrow_sniper_death = {
		inherits = "arrow_death",
		extra_conditions = {
			damage_type = {
				"arrow_sniper",
			},
		},
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	arrow_carbine_death_head = {
		inherits = "arrow_death_head",
		extra_conditions = {
			damage_type = {
				"arrow_carbine",
				"arrow_shotgun",
			},
		},
		push = {
			distal_force = 60,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	elven_magic_arrow_carbine_death_head = {
		inherits = "arrow_carbine_death_head",
		extra_conditions = {
			damage_type = "elven_magic_arrow_carbine",
		},
		timed_status = StatusEffectNames.burning_elven_magic,
	},
	arrow_sniper_death_head = {
		inherits = "arrow_death_head",
		extra_conditions = {
			damage_type = {
				"arrow_sniper",
			},
		},
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	poison_arrow = {
		hit_effect_name = "fx/impact_blood_beastman",
		husk_hit_effect_name = "fx/impact_blood_beastman",
		extra_conditions = {
			damage = true,
			damage_type = {
				"arrow_poison",
			},
		},
		animations = {
			"hit_reaction",
		},
	},
	poison_arrow_nodamage = {
		extra_conditions = {
			damage = false,
			damage_type = {
				"arrow_poison",
			},
		},
	},
	poison_arrow_death = {
		inherits = "arrow_default",
		extra_conditions = {
			death = true,
			damage_type = {
				"arrow_poison",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_body",
			"death_shot_body_2",
			"death_shot_body_bwd",
		},
		push = {
			distal_force = 50,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	bolt_death = {
		inherits = "arrow_default",
		extra_conditions = {
			death = true,
			damage_type = {
				"bolt_carbine",
				"bolt_machinegun",
				"bolt_shotgun",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_body",
			"death_shot_body_2",
			"death_shot_body_bwd",
		},
		push = {
			distal_force = 50,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	bolt_death_head = {
		inherits = "bolt_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_shot_head_bwd",
		},
		push = {
			distal_force = 20,
			lateral_force = 0,
			vertical_force = 30,
		},
	},
	bolt_sniper_death = {
		inherits = "bolt_death",
		extra_conditions = {
			damage_type = {
				"bolt_sniper",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 180,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	bolt_sniper_death_head = {
		inherits = "bolt_death_head",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 120,
			lateral_force = 0,
			vertical_force = 30,
		},
	},
	throwing_axe_death = {
		inherits = "bolt_death",
		extra_conditions = {
			damage_type = {
				"throwing_axe",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 180,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	throwing_axe_death_head = {
		inherits = "throwing_axe_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 120,
			lateral_force = 0,
			vertical_force = 30,
		},
	},
	throwing_axe_dismember_limb = {
		do_dismember = true,
		inherits = "throwing_axe_death",
		extra_conditions = {
			hit_zone = {
				"left_arm",
				"right_arm",
				"right_leg",
				"left_leg",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 120,
			lateral_force = 0,
			vertical_force = 30,
		},
	},
	burn = {
		extra_conditions = {
			damage_type = "burn",
		},
	},
	burn_sniper = {
		extra_conditions = {
			damage_type = "burn_sniper",
		},
		animations = {
			"hit_reaction",
		},
	},
	burn_shotgun = {
		extra_conditions = {
			damage = true,
			damage_type = "burn_shotgun",
		},
		animations = {
			"hit_reaction",
		},
	},
	burn_machinegun = {
		extra_conditions = {
			damage_type = "burn_machinegun",
		},
		animations = {
			"hit_reaction",
		},
	},
	burn_carbine = {
		extra_conditions = {
			damage_type = "burn_machinegun",
		},
		animations = {
			"hit_reaction",
		},
	},
	burninating = {
		extra_conditions = {
			damage_type = "burninating",
		},
	},
	burninating_death = {
		inherits = "burninating",
		extra_conditions = {
			death = true,
		},
		animations = {
			"death_burn",
			"death_burn_2",
			"death_burn_3",
			"death_burn_4",
			"death_burn_5",
		},
	},
	burn_death = {
		extra_conditions = {
			damage_type = "burn",
			death = true,
		},
		animations = {
			"death_burn",
			"death_burn_2",
			"death_burn_3",
			"death_burn_4",
			"death_burn_5",
		},
		timed_status = StatusEffectNames.burning,
	},
	burn_sniper_death = {
		extra_conditions = {
			death = true,
			damage_type = {
				"burn_sniper",
			},
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 20,
		},
	},
	burn_sniper_death_dismember = {
		do_dismember = true,
		inherits = "burn_sniper_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 20,
		},
	},
	burn_sniper_death_torso = {
		do_dismember = true,
		inherits = "burn_sniper_death",
		extra_conditions = {
			hit_zone = {
				"torso",
			},
		},
		animations = {
			"ragdoll",
			"death_burn",
			"death_burn_2",
			"death_burn_3",
			"death_burn_4",
			"death_burn_5",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 20,
		},
	},
	burn_shotgun_death = {
		extra_conditions = {
			death = true,
			damage_type = {
				"burn_shotgun",
			},
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 40,
		},
	},
	burn_machinegun_death = {
		extra_conditions = {
			death = true,
			damage_type = {
				"burn_machinegun",
			},
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 40,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	burn_machinegun_death_hs = {
		inherits = "burn_machinegun_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_burn",
			"death_burn_2",
			"death_burn_3",
			"death_burn_4",
			"death_burn_5",
		},
		flow_event = {
			"explode_head",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 40,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	burn_carbine_death = {
		extra_conditions = {
			death = true,
			damage_type = {
				"burn_carbine",
			},
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 80,
			lateral_force = 0,
			vertical_force = 20,
		},
	},
	burn_carbine_death_hs = {
		inherits = "burn_carbine_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate_4",
			"death_decapitate_5",
		},
		flow_event = {
			"explode_head",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 60,
			lateral_force = 0,
			vertical_force = 10,
		},
	},
	arrow_poison_dot = {
		extra_conditions = {
			damage = true,
			damage_type = {
				"arrow_poison_dot",
				"aoe_poison_dot",
				"poison",
			},
		},
	},
	poison_death = {
		extra_conditions = {
			death = true,
			damage_type = {
				"poison",
			},
		},
		timed_status = StatusEffectNames.poisoned,
		animations = {
			"death_gas",
			"death_gas_2",
			"death_gas_3",
			"death_gas_4",
		},
	},
	arrow_poison_dot_death = {
		extra_conditions = {
			death = true,
			damage_type = {
				"arrow_poison_dot",
				"aoe_poison_dot",
			},
		},
		animations = {
			"death_gas",
			"death_gas_2",
			"death_gas_3",
			"death_gas_4",
		},
	},
	push = {
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
			"ragdoll",
		},
	},
	grenade_glance_death = {
		explosion_push = true,
		inherits = "default",
		extra_conditions = {
			damage_type = "grenade_glance",
			death = true,
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 100,
			lateral_force = 0,
			vertical_force = 30,
		},
	},
	grenade_glance_death_dismember = {
		do_dismember = true,
		inherits = "grenade_glance_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail",
			},
		},
		animations = {
			"ragdoll",
			"death_shot_head_front",
			"death_decapitate_4",
			"death_decapitate_5",
		},
		push = {
			distal_force = 100,
			lateral_force = 0,
			vertical_force = 30,
		},
	},
	grenade_death = {
		explosion_push = true,
		inherits = "default",
		extra_conditions = {
			damage_type = "grenade",
			death = true,
		},
		push = {
			distal_force = 100,
			lateral_force = 0,
			vertical_force = 75,
		},
		animations = {
			"ragdoll",
		},
		flow_event = {
			"dismember_left_leg",
			"dismember_right_arm",
		},
	},
	fire_grenade_glance_death = {
		explosion_push = true,
		inherits = "default",
		extra_conditions = {
			damage_type = "fire_grenade_glance",
			death = true,
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 50,
			lateral_force = 0,
			vertical_force = 50,
		},
	},
	fire_grenade_glance_death_dismember = {
		do_dismember = true,
		inherits = "fire_grenade_glance_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 50,
			lateral_force = 0,
			vertical_force = 50,
		},
	},
	fire_grenade_death = {
		explosion_push = true,
		inherits = "default",
		extra_conditions = {
			damage_type = "fire_grenade",
			death = true,
		},
		push = {
			distal_force = 75,
			lateral_force = 0,
			vertical_force = 50,
		},
		animations = {
			"ragdoll",
		},
		flow_event = {
			"dismember_left_leg",
			"dismember_right_arm",
		},
		timed_status = StatusEffectNames.burning,
	},
	drakegun = {
		inherits = "default",
		extra_conditions = {
			damage_type = {
				"drakegun",
			},
		},
	},
	drakegun_death = {
		explosion_push = true,
		inherits = "drakegun",
		extra_conditions = {
			death = true,
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 80,
			vertical_force = 35,
		},
		timed_status = StatusEffectNames.burning,
	},
	drakegun_glance = {
		inherits = "default",
		extra_conditions = {
			damage_type = {
				"drakegun_glance",
			},
		},
	},
	drakegun_glance_death = {
		inherits = "drakegun_glance",
		extra_conditions = {
			death = true,
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 60,
			vertical_force = 25,
		},
		timed_status = StatusEffectNames.burning,
	},
	drakegun_shot_death = {
		extra_conditions = {
			death = true,
			damage_type = {
				"drakegun_shot",
			},
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 100,
			lateral_force = 0,
			vertical_force = 40,
		},
	},
	drakegun_shot_death_dismember = {
		do_dismember = true,
		inherits = "drakegun_shot_death",
		extra_conditions = {
			hit_zone = {
				"left_arm",
				"right_arm",
				"left_leg",
				"right_leg",
				"tail",
			},
		},
		animations = {
			"ragdoll",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 100,
			lateral_force = 0,
			vertical_force = 40,
		},
	},
	drakegun_shot_death_head = {
		inherits = "drakegun_shot_death",
		extra_conditions = {
			hit_zone = {
				"head",
				"neck",
			},
		},
		animations = {
			"ragdoll",
			"death_decapitate_4",
			"death_decapitate_5",
		},
		flow_event = {
			"explode_head",
		},
		timed_status = StatusEffectNames.burning,
		push = {
			distal_force = 100,
			lateral_force = 0,
			vertical_force = 40,
		},
	},
	shield_hit = {
		extra_conditions = {
			damage_type = "shield_hit",
		},
		animations = {
			"hit_reaction_shield",
		},
	},
	gib_killing_blow_death = {
		inherits = "default",
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
			distal_force = 100,
			lateral_force = 0,
			vertical_force = 140,
		},
	},
	wound_default = {
		armour_type = "cloth",
		husk_hit_effect_name = "fx/impact_blood_beastman",
		extra_conditions = {
			death = false,
			damage_type = wounding_damage_types,
		},
	},
	wound_tail = {
		armour_type = "cloth",
		do_dismember = true,
		inherits = "wound_default",
		extra_conditions = {
			death = false,
			is_critical_strike = true,
			damage_type = dismembering_damage_types,
			hit_zone = {
				"tail",
			},
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
	elven_magic_death = {
		armour_type = "cloth",
		disable_blood = true,
		explosion_push = true,
		extra_conditions = {
			death = true,
			damage_type = {
				"elven_magic",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 200,
			lateral_force = 0,
			vertical_force = 70,
		},
		timed_status = StatusEffectNames.burning_elven_magic,
	},
	military_finish_death = {
		armour_type = "cloth",
		disable_blood = true,
		explosion_push = true,
		flow_event = "military_finish",
		extra_conditions = {
			death = true,
			damage_type = {
				"military_finish",
				"military_finish_glance",
			},
		},
		animations = {
			"ragdoll",
		},
		push = {
			distal_force = 200,
			lateral_force = 0,
			vertical_force = 70,
		},
	},
	default_burning = {
		inherits = "default",
		extra_conditions = {
			damage_type = {
				"burning_tank",
				"heavy_burning_tank",
				"burning_stab_fencer",
			},
		},
	},
	warpfire_burning = {
		inherits = "default",
		extra_conditions = {
			damage_type = {
				"warpfire_ground",
				"warpfire_face",
			},
		},
		timed_status = StatusEffectNames.burning_warpfire,
	},
	warpfire_burning_death = {
		inherits = "warpfire_burning",
		extra_conditions = {
			death = true,
		},
		animations = {
			"ragdoll",
			"death_burn",
			"death_burn_2",
			"death_burn_3",
			"death_burn_4",
			"death_burn_5",
		},
	},
}

local function get_variable(template, ...)
	local val = template

	for i = 1, select("#", ...) do
		local key = select(i, ...)

		val = val[key]

		if not val then
			break
		end
	end

	return val or template.inherits and get_variable(HitEffectsBeastmenUngor[template.inherits], ...)
end

for hit_effect_name, hit_effect_data in pairs(HitEffectsBeastmenUngor) do
	local death = get_variable(hit_effect_data, "extra_conditions", "death")
	local timed_status = get_variable(hit_effect_data, "timed_status")
	local critical_variant = rawget(StatusEffectNames, (timed_status or "") .. "_death_critical")

	if death and critical_variant then
		local new_hit_effect_name = hit_effect_name .. "_critical"
		local new_hit_effect_data = {
			do_diagonal_dismemberments = false,
			do_dismember = false,
			inherits = hit_effect_name,
			extra_conditions = {
				is_critical_strike = true,
			},
			timed_status = critical_variant,
		}

		HitEffectsBeastmenUngor[new_hit_effect_name] = new_hit_effect_data
	end
end

HitEffectsBeastmenUngor = table.create_copy(HitEffectsBeastmenUngor, HitEffectsBeastmenUngor)
