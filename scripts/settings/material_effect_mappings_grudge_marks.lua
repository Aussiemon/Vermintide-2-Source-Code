-- chunkname: @scripts/settings/material_effect_mappings_grudge_marks.lua

MaterialEffectMappings = MaterialEffectMappings or {}
MaterialEffectMappings.invulnerable = MaterialEffectMappings.invulnerable or {
	sound = {
		cloth = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_grudge_deflect",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "enemy_grudge_deflect",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_enemy_shield_metal",
		cloth = "fx/hit_enemy_shield_metal",
		dirt = "fx/hit_enemy_shield_metal",
		flesh = "fx/hit_enemy_shield_metal",
		forest_grass = "fx/hit_enemy_shield_metal",
		fruit = "fx/hit_enemy_shield_metal",
		glass = "fx/hit_enemy_shield_metal",
		grass = "fx/hit_enemy_shield_metal",
		hay = "fx/hit_enemy_shield_metal",
		ice = "fx/hit_enemy_shield_metal",
		metal_hollow = "fx/hit_enemy_shield_metal",
		metal_solid = "fx/hit_enemy_shield_metal",
		mud = "fx/hit_enemy_shield_metal",
		plaster = "fx/hit_enemy_shield_metal",
		sand = "fx/hit_enemy_shield_metal",
		shield = "fx/hit_enemy_shield_metal",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_enemy_shield_metal",
		stone = "fx/hit_enemy_shield_metal",
		stone_dirt = "fx/hit_enemy_shield_metal",
		stone_wet = "fx/hit_enemy_shield_metal",
		ward = "fx/hit_enemy_shield_metal",
		water = "fx/hit_enemy_shield_metal",
		water_deep = "fx/hit_enemy_shield_metal",
		wood_bridge = "fx/hit_enemy_shield_metal",
		wood_hollow = "fx/hit_enemy_shield_metal",
		wood_solid = "fx/hit_enemy_shield_metal",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
}
