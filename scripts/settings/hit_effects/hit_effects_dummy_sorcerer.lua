HitEffectsDummySorcerer = {
	default = {
		armour_type = "cloth",
		animations = {
			"hit_reaction"
		}
	},
	default_noDamage = {
		flow_event = "lua_on_damage_taken_shielded",
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
		flow_event = "lua_on_death",
		armour_type = "cloth",
		extra_conditions = {
			death = true
		},
		animations = {
			"death_dissolve"
		}
	},
	shot_default = {
		hit_effect_name = "fx/hit_armored",
		husk_hit_effect_name = "fx/hit_armored",
		armour_type = "cloth",
		extra_conditions = {
			damage_type = {}
		},
		animations = {
			"hit_reaction"
		}
	},
	arrow_default = {
		hit_effect_name = "fx/hit_armored",
		husk_hit_effect_name = "fx/hit_armored",
		armour_type = "flesh",
		extra_conditions = {
			damage_type = {}
		},
		animations = {
			"hit_reaction"
		}
	}
}
HitEffectsDummySorcerer = table.create_copy(HitEffectsDummySorcerer, HitEffectsDummySorcerer)
