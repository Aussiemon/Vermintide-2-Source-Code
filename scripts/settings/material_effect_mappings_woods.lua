MaterialEffectMappings = MaterialEffectMappings or {}
MaterialEffectMappings.life_impact = MaterialEffectMappings.life_impact or {
	sound = {
		cloth = {
			event = "weapon_life_staff_thorn_whip_hit",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "weapon_life_staff_thorn_whip_hit",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "weapon_life_staff_thorn_whip_hit",
			parameters = {}
		},
		fruit = {
			event = "weapon_life_staff_thorn_whip_hit",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "thorn_whip_hit_static",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/lifestaff_impact",
		dirt = "fx/lifestaff_impact",
		glass = "fx/lifestaff_impact",
		stone = "fx/lifestaff_impact",
		cloth = "fx/lifestaff_impact",
		shield_metal = "fx/lifestaff_impact",
		ward = "fx/lifestaff_impact",
		water = "fx/lifestaff_impact",
		fruit = "fx/lifestaff_impact",
		sand = "fx/lifestaff_impact",
		armored = "fx/lifestaff_impact",
		flesh = "fx/lifestaff_impact",
		stone_dirt = "fx/lifestaff_impact",
		plaster = "fx/lifestaff_impact",
		snow = "fx/lifestaff_impact",
		ice = "fx/lifestaff_impact",
		water_deep = "fx/lifestaff_impact",
		forest_grass = "fx/lifestaff_impact",
		wood_bridge = "fx/lifestaff_impact",
		grass = "fx/lifestaff_impact",
		hay = "fx/lifestaff_impact",
		wood_hollow = "fx/lifestaff_impact",
		stone_wet = "fx/lifestaff_impact",
		mud = "fx/lifestaff_impact",
		wood_solid = "fx/lifestaff_impact",
		metal_solid = "fx/lifestaff_impact",
		metal_hollow = "fx/lifestaff_impact"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.throwing_javelin = MaterialEffectMappings.throwing_javelin or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_slash_1",
			dirt = "units/projection_decals/hit_dirt_slash_1",
			stone = "units/projection_decals/hit_stone_slash_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_slash_1",
			sand = "units/projection_decals/hit_sand_slash_1",
			stone_dirt = "units/projection_decals/hit_stone_slash_1",
			snow = "units/projection_decals/hit_snow_slash_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_slash_1",
			grass = "units/projection_decals/hit_grass_slash_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_slash_1",
			mud = "units/projection_decals/hit_dirt_slash_1",
			cloth = {
				"units/projection_decals/hit_cloth_slash_1",
				"units/projection_decals/hit_cloth_slash_2"
			},
			flesh = {
				"units/projection_decals/hit_flesh_slash_1",
				"units/projection_decals/hit_flesh_slash_2",
				"units/projection_decals/hit_flesh_slash_3"
			},
			metal_hollow = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3"
			},
			armored = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3"
			},
			metal_solid = {
				"units/projection_decals/hit_metal_solid_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_solid_slash_3"
			},
			plaster = {
				"units/projection_decals/hit_plaster_slash_1",
				"units/projection_decals/hit_plaster_slash_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3"
			}
		},
		settings = {
			depth = 0.6,
			height = 0.04,
			rotation = 90,
			width = 0.3,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			event = "javelin_throw_hit",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "piercing"
			}
		},
		fruit = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "javelin_throw_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "javelin_throw_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/hit_hay_slash",
		fruit = "fx/hit_fruit_slash",
		stone = "fx/hit_stone_slash",
		cloth = "fx/hit_cloth_slash",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/hit_water_slash",
		water_deep = "fx/hit_water_slash",
		glass = "fx/hit_glass",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/hit_flesh_slash",
		stone_dirt = "fx/hit_stone_slash",
		plaster = "fx/hit_plaster_slash",
		snow = "fx/hit_snow_slash",
		ice = "fx/hit_ice_slash",
		wood_bridge = "fx/hit_wood_hollow_slash",
		forest_grass = "fx/hit_grass_slash",
		grass = "fx/hit_grass_slash",
		dirt = "fx/hit_dirt_slash",
		wood_hollow = "fx/hit_wood_hollow_slash",
		stone_wet = "fx/hit_stone_slash",
		mud = "fx/hit_dirt_slash",
		wood_solid = "fx/hit_wood_solid_slash",
		metal_solid = "fx/hit_metal_solid_slash",
		metal_hollow = "fx/hit_metal_hollow_slash"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
