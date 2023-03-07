HitEffectsChaosGreedPinata = {
	default = {
		husk_hit_effect_name = "fx/deus_pinata_impact",
		armour_type = "flesh",
		animations = {
			"hit_reaction"
		}
	},
	default_noDamage = {
		husk_effect_name = "fx/deus_pinata_impact",
		armour_type = "flesh",
		extra_conditions = {
			damage = false
		},
		animations = {
			"hit_reaction"
		}
	},
	default_death = {
		husk_hit_effect_name = "fx/deus_pinata_impact",
		armour_type = "flesh",
		extra_conditions = {
			death = true
		},
		animations = {
			"death"
		}
	}
}
HitEffectsChaosGreedPinata = table.create_copy(HitEffectsChaosGreedPinata, HitEffectsChaosGreedPinata)
