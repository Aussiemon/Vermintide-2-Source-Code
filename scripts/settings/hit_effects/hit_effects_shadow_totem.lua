-- chunkname: @scripts/settings/hit_effects/hit_effects_shadow_totem.lua

HitEffectsShadowTotem = {
	default = {
		armour_type = "metal",
		hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		husk_hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		animations = {
			"hit_reaction",
		},
	},
	default_noDamage = {
		armour_type = "metal",
		hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		husk_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		extra_conditions = {
			damage = false,
		},
		animations = {
			"hit_reaction",
		},
	},
	default_death = {
		armour_type = "metal",
		hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		husk_hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		extra_conditions = {
			death = true,
		},
		animations = {
			"death",
		},
	},
}
HitEffectsShadowTotem = table.create_copy(HitEffectsShadowTotem, HitEffectsShadowTotem)
