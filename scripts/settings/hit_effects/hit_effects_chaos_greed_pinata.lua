-- chunkname: @scripts/settings/hit_effects/hit_effects_chaos_greed_pinata.lua

HitEffectsChaosGreedPinata = {
	default = {
		armour_type = "flesh",
		husk_hit_effect_name = "fx/deus_pinata_impact",
		animations = {
			"hit_reaction",
		},
	},
	default_noDamage = {
		armour_type = "flesh",
		husk_effect_name = "fx/deus_pinata_impact",
		extra_conditions = {
			damage = false,
		},
		animations = {
			"hit_reaction",
		},
	},
	default_death = {
		armour_type = "flesh",
		husk_hit_effect_name = "fx/deus_pinata_impact",
		extra_conditions = {
			death = true,
		},
		animations = {
			"death",
		},
	},
}
HitEffectsChaosGreedPinata = table.create_copy(HitEffectsChaosGreedPinata, HitEffectsChaosGreedPinata)
