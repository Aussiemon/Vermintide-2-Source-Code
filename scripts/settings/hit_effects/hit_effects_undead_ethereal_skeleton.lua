-- chunkname: @scripts/settings/hit_effects/hit_effects_undead_ethereal_skeleton.lua

HitEffectsUndeadEtherealSkeleton = {
	default = {
		armour_type = "cloth",
		husk_hit_effect_name = "fx/skull_shatter_ethereal",
		animations = {
			"hit_reaction",
		},
	},
	default_noDamage = {
		armour_type = "cloth",
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
		husk_hit_effect_name = "fx/skull_shatter_ethereal",
		extra_conditions = {
			death = true,
		},
		animations = {
			"ragdoll",
		},
		push = {
			always_use_hit_direction = true,
			distal_force = 10,
			lateral_force = 0,
			vertical_force = 0,
		},
	},
}
