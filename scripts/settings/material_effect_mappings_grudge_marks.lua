MaterialEffectMappings = MaterialEffectMappings or {}
MaterialEffectMappings.invulnerable = MaterialEffectMappings.invulnerable or {
	sound = {
		cloth = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "enemy_grudge_deflect",
			parameters = {}
		},
		fruit = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "enemy_grudge_deflect",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield_metal",
		dirt = "fx/hit_enemy_shield_metal",
		glass = "fx/hit_enemy_shield_metal",
		stone = "fx/hit_enemy_shield_metal",
		cloth = "fx/hit_enemy_shield_metal",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/hit_enemy_shield_metal",
		water = "fx/hit_enemy_shield_metal",
		fruit = "fx/hit_enemy_shield_metal",
		sand = "fx/hit_enemy_shield_metal",
		armored = "fx/hit_enemy_shield_metal",
		flesh = "fx/hit_enemy_shield_metal",
		stone_dirt = "fx/hit_enemy_shield_metal",
		plaster = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_enemy_shield_metal",
		ice = "fx/hit_enemy_shield_metal",
		water_deep = "fx/hit_enemy_shield_metal",
		forest_grass = "fx/hit_enemy_shield_metal",
		wood_bridge = "fx/hit_enemy_shield_metal",
		grass = "fx/hit_enemy_shield_metal",
		hay = "fx/hit_enemy_shield_metal",
		wood_hollow = "fx/hit_enemy_shield_metal",
		stone_wet = "fx/hit_enemy_shield_metal",
		mud = "fx/hit_enemy_shield_metal",
		wood_solid = "fx/hit_enemy_shield_metal",
		metal_solid = "fx/hit_enemy_shield_metal",
		metal_hollow = "fx/hit_enemy_shield_metal"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
