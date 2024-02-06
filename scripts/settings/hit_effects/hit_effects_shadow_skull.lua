-- chunkname: @scripts/settings/hit_effects/hit_effects_shadow_skull.lua

HitEffectsShadowSkull = {
	shot_default = {
		armour_type = "metal",
		hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		husk_hit_effect_name = "fx/belakor/blk_totem_chipped_stone_fx",
		extra_conditions = {
			death = true,
			damage_type = {
				"shot_sniper",
				"shot_carbine",
				"shot_machinegun",
				"shot_shotgun",
				"shot_repeating_handgun",
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
			"ragdoll",
		},
		push = {
			distal_force = 100,
			lateral_force = 10,
			vertical_force = -10,
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
			"ragdoll",
		},
		push = {
			distal_force = 40,
			lateral_force = 40,
			vertical_force = -10,
		},
	},
}
HitEffectsShadowSkull = table.create_copy(HitEffectsShadowSkull, HitEffectsShadowSkull)
