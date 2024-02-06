-- chunkname: @scripts/settings/hit_effects/hit_effects_dummy_sorcerer.lua

HitEffectsDummySorcerer = {
	default = {
		armour_type = "cloth",
		animations = {
			"hit_reaction",
		},
	},
	default_noDamage = {
		armour_type = "cloth",
		flow_event = "lua_on_damage_taken_shielded",
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
		flow_event = "lua_on_death",
		extra_conditions = {
			death = true,
		},
		animations = {
			"death_dissolve",
		},
	},
	shot_default = {
		armour_type = "cloth",
		hit_effect_name = "fx/hit_armored",
		husk_hit_effect_name = "fx/hit_armored",
		extra_conditions = {
			damage_type = {},
		},
		animations = {
			"hit_reaction",
		},
	},
	arrow_default = {
		armour_type = "flesh",
		hit_effect_name = "fx/hit_armored",
		husk_hit_effect_name = "fx/hit_armored",
		extra_conditions = {
			damage_type = {},
		},
		animations = {
			"hit_reaction",
		},
	},
}
HitEffectsDummySorcerer = table.create_copy(HitEffectsDummySorcerer, HitEffectsDummySorcerer)
