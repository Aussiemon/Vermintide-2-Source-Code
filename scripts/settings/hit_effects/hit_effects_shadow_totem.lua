HitEffectsShadowTotem = {
	default = {
		husk_hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		armour_type = "metal",
		animations = {
			"hit_reaction"
		}
	},
	default_noDamage = {
		hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		husk_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		armour_type = "metal",
		extra_conditions = {
			damage = false
		},
		animations = {
			"hit_reaction"
		}
	},
	default_death = {
		hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		husk_hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		armour_type = "metal",
		extra_conditions = {
			death = true
		},
		animations = {
			"death"
		}
	}
}
HitEffectsShadowTotem = table.create_copy(HitEffectsShadowTotem, HitEffectsShadowTotem)
