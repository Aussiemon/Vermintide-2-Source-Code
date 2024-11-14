-- chunkname: @scripts/settings/hit_effects/hit_effects_grey_seer_mounted.lua

HitEffectsSkavenGreySeerMounted = {
	default = {
		armour_type = "metal_hollow",
		disable_blood = true,
		flow_event = "lua_on_damage_taken",
		hit_effect_name = "fx/hit_armored",
		husk_effect_name = "fx/hit_armored",
	},
	default_noDamage = {
		armour_type = "metal_hollow",
		disable_blood = true,
		flow_event = "lua_on_damage_taken",
		hit_effect_name = "fx/hit_armored",
		husk_effect_name = "fx/hit_armored",
		extra_conditions = {
			damage = false,
		},
	},
	default_death = {
		armour_type = "cloth",
		extra_conditions = {
			death = true,
		},
		animations = {
			"gs_death",
		},
		sound_event = {
			"Play_clan_rat_die_vce",
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
HitEffectsSkavenGreySeerMounted = table.create_copy(HitEffectsSkavenGreySeerMounted, HitEffectsSkavenGreySeerMounted)
