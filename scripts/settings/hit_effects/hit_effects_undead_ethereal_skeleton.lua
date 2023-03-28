HitEffectsUndeadEtherealSkeleton = {
	default = {
		husk_hit_effect_name = "fx/skull_shatter_ethereal",
		armour_type = "cloth",
		animations = {
			"hit_reaction"
		}
	},
	default_noDamage = {
		husk_effect_name = "fx/hit_armored",
		armour_type = "cloth",
		extra_conditions = {
			damage = false
		},
		animations = {
			"hit_reaction"
		}
	},
	default_death = {
		husk_hit_effect_name = "fx/skull_shatter_ethereal",
		armour_type = "cloth",
		extra_conditions = {
			death = true
		},
		animations = {
			"ragdoll"
		},
		push = {
			distal_force = 10,
			vertical_force = 0,
			lateral_force = 0,
			always_use_hit_direction = true
		}
	}
}
