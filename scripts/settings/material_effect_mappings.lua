MaterialEffectSettings = {
	material_query_depth = 0.4,
	blood_splat_raycast_max_range = 3,
	footstep_raycast_offset = 0.6,
	footstep_raycast_max_range = 0.8,
	material_contexts = {
		surface_material = {
			"armored",
			"cloth",
			"dirt",
			"flesh",
			"fruit",
			"forest_grass",
			"glass",
			"grass",
			"hay",
			"ice",
			"metal_solid",
			"metal_hollow",
			"mud",
			"fruit",
			"plaster",
			"sand",
			"stone",
			"stone_dirt",
			"stone_wet",
			"snow",
			"water",
			"water_deep",
			"wood_bridge",
			"wood_solid",
			"wood_hollow",
			"puke",
			"shield",
			"shield_metal"
		}
	}
}
DefaultSurfaceMaterial = "stone"
MaterialEffectMappings = MaterialEffectMappings or {}
MaterialEffectMappings.melee_hit_piercing = MaterialEffectMappings.melee_hit_piercing or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			puke = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.6,
			height = 0.1,
			width = 0.1,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "melee_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "melee_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			event = "melee_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "piercing"
			}
		},
		fruit = {
			event = "melee_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "melee_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "melee_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "melee_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "melee_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "melee_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "melee_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "melee_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "melee_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "melee_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "melee_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "melee_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "melee_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "melee_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "melee_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "melee_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "melee_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "melee_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		},
		puke = {
			event = "melee_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/hit_hay_pierce",
		fruit = "fx/hit_fruit_pierce",
		stone = "fx/hit_stone_pierce",
		cloth = "fx/hit_cloth_pierce",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/hit_snow_pierce",
		water_deep = "fx/hit_snow_pierce",
		glass = "fx/hit_glass",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/hit_flesh_pierce",
		stone_dirt = "fx/hit_stone_pierce",
		plaster = "fx/hit_plaster_pierce",
		snow = "fx/hit_snow_pierce",
		ice = "fx/hit_ice_pierce",
		wood_bridge = "fx/hit_wood_hollow_pierce",
		forest_grass = "fx/hit_grass_pierce",
		puke = "fx/hit_snow_pierce",
		grass = "fx/hit_grass_pierce",
		dirt = "fx/hit_dirt_pierce",
		wood_hollow = "fx/hit_wood_hollow_pierce",
		stone_wet = "fx/hit_stone_pierce",
		mud = "fx/hit_dirt_pierce",
		wood_solid = "fx/hit_wood_solid_pierce",
		metal_solid = "fx/hit_metal_solid_pierce",
		metal_hollow = "fx/hit_metal_hollow_pierce"
	}
}
MaterialEffectMappings.melee_hit_slashing = MaterialEffectMappings.melee_hit_slashing or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_slash_1",
			dirt = "units/projection_decals/hit_dirt_slash_1",
			stone = "units/projection_decals/hit_stone_slash_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			puke = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_slash_1",
			sand = "units/projection_decals/hit_sand_slash_1",
			stone_dirt = "units/projection_decals/hit_stone_slash_1",
			snow = "units/projection_decals/hit_snow_slash_1",
			ice = "units/projection_decals/hit_ice_slash_1",
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
			depth = 2,
			height = 2,
			width = 1,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "melee_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "slashing"
			}
		},
		dirt = {
			event = "melee_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "slashing"
			}
		},
		flesh = {
			event = "melee_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "slashing"
			}
		},
		fruit = {
			event = "melee_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "slashing"
			}
		},
		forest_grass = {
			event = "melee_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "slashing"
			}
		},
		glass = {
			event = "melee_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "slashing"
			}
		},
		grass = {
			event = "melee_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		hay = {
			event = "melee_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "slashing"
			}
		},
		ice = {
			event = "melee_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "slashing"
			}
		},
		metal_hollow = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		armored = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield_metal = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		metal_solid = {
			event = "melee_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "slashing"
			}
		},
		mud = {
			event = "melee_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "slashing"
			}
		},
		plaster = {
			event = "melee_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "slashing"
			}
		},
		sand = {
			event = "melee_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		stone = {
			event = "melee_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "slashing"
			}
		},
		stone_dirt = {
			event = "melee_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "slashing"
			}
		},
		stone_wet = {
			event = "melee_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "slashing"
			}
		},
		snow = {
			event = "melee_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "slashing"
			}
		},
		water = {
			event = "melee_hit_statics",
			parameters = {
				material = "water",
				damage_type = "slashing"
			}
		},
		water_deep = {
			event = "melee_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "slashing"
			}
		},
		wood_bridge = {
			event = "melee_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "slashing"
			}
		},
		wood_hollow = {
			event = "melee_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "slashing"
			}
		},
		wood_solid = {
			event = "melee_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "slashing"
			}
		},
		puke = {
			event = "melee_hit_statics",
			parameters = {
				material = "water",
				damage_type = "slashing"
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
		puke = "fx/hit_water_slash",
		grass = "fx/hit_grass_slash",
		dirt = "fx/hit_dirt_slash",
		wood_hollow = "fx/hit_wood_hollow_slash",
		stone_wet = "fx/hit_stone_slash",
		mud = "fx/hit_dirt_slash",
		wood_solid = "fx/hit_wood_solid_slash",
		metal_solid = "fx/hit_metal_solid_slash",
		metal_hollow = "fx/hit_metal_hollow_slash"
	}
}
MaterialEffectMappings.melee_hit_sword_2h = MaterialEffectMappings.melee_hit_sword_2h or {
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
			ice = "units/projection_decals/hit_ice_slash_1",
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
			height = 0.3,
			width = 0.3,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "slashing"
			}
		},
		dirt = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "slashing"
			}
		},
		flesh = {
			event = "sword_2h_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "slashing"
			}
		},
		fruit = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "slashing"
			}
		},
		forest_grass = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "slashing"
			}
		},
		glass = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "slashing"
			}
		},
		grass = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		hay = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "slashing"
			}
		},
		ice = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "slashing"
			}
		},
		metal_hollow = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		armored = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield_metal = {
			event = "slashing_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		metal_solid = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "slashing"
			}
		},
		mud = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "slashing"
			}
		},
		plaster = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "slashing"
			}
		},
		sand = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		stone = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "slashing"
			}
		},
		stone_dirt = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "slashing"
			}
		},
		stone_wet = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "slashing"
			}
		},
		snow = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "slashing"
			}
		},
		water = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "water",
				damage_type = "slashing"
			}
		},
		water_deep = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "slashing"
			}
		},
		wood_bridge = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "slashing"
			}
		},
		wood_hollow = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "slashing"
			}
		},
		wood_solid = {
			event = "sword_2h_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "slashing"
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
	}
}
MaterialEffectMappings.melee_hit_sword_1h = MaterialEffectMappings.melee_hit_sword_1h or {
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
			ice = "units/projection_decals/hit_ice_slash_1",
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
			height = 0.1,
			width = 0.5,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "slashing"
			}
		},
		dirt = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "slashing"
			}
		},
		flesh = {
			event = "sword_1h_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "slashing"
			}
		},
		fruit = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "slashing"
			}
		},
		forest_grass = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "slashing"
			}
		},
		glass = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "slashing"
			}
		},
		grass = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		hay = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "slashing"
			}
		},
		ice = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "slashing"
			}
		},
		metal_hollow = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		armored = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield_metal = {
			event = "slashing_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		metal_solid = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "slashing"
			}
		},
		mud = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "slashing"
			}
		},
		plaster = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "slashing"
			}
		},
		sand = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		stone = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "slashing"
			}
		},
		stone_dirt = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "slashing"
			}
		},
		stone_wet = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "slashing"
			}
		},
		snow = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "slashing"
			}
		},
		water = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "water",
				damage_type = "slashing"
			}
		},
		water_deep = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "slashing"
			}
		},
		wood_bridge = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "slashing"
			}
		},
		wood_hollow = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "slashing"
			}
		},
		wood_solid = {
			event = "sword_1h_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "slashing"
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
	}
}
MaterialEffectMappings.melee_hit_dagger = MaterialEffectMappings.melee_hit_dagger or {
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
			width = 0.3,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "dagger_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "slashing"
			}
		},
		dirt = {
			event = "dagger_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "slashing"
			}
		},
		flesh = {
			event = "dagger_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "slashing"
			}
		},
		fruit = {
			event = "dagger_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "slashing"
			}
		},
		forest_grass = {
			event = "dagger_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "slashing"
			}
		},
		glass = {
			event = "dagger_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "slashing"
			}
		},
		grass = {
			event = "dagger_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		hay = {
			event = "dagger_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "slashing"
			}
		},
		ice = {
			event = "dagger_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "slashing"
			}
		},
		metal_hollow = {
			event = "dagger_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		armored = {
			event = "dagger_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield = {
			event = "stab_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield_metal = {
			event = "stab_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		metal_solid = {
			event = "dagger_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "slashing"
			}
		},
		mud = {
			event = "dagger_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "slashing"
			}
		},
		plaster = {
			event = "dagger_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "slashing"
			}
		},
		sand = {
			event = "dagger_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		stone = {
			event = "dagger_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "slashing"
			}
		},
		stone_dirt = {
			event = "dagger_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "slashing"
			}
		},
		stone_wet = {
			event = "dagger_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "slashing"
			}
		},
		snow = {
			event = "dagger_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "slashing"
			}
		},
		water = {
			event = "dagger_hit_statics",
			parameters = {
				material = "water",
				damage_type = "slashing"
			}
		},
		water_deep = {
			event = "dagger_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "slashing"
			}
		},
		wood_bridge = {
			event = "dagger_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "slashing"
			}
		},
		wood_hollow = {
			event = "dagger_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "slashing"
			}
		},
		wood_solid = {
			event = "dagger_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "slashing"
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
	}
}
MaterialEffectMappings.melee_hit_axes_2h = MaterialEffectMappings.melee_hit_axes_2h or {
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
			width = 0.3,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "slashing"
			}
		},
		dirt = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "slashing"
			}
		},
		flesh = {
			event = "axe_2h_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "slashing"
			}
		},
		fruit = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "slashing"
			}
		},
		forest_grass = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "slashing"
			}
		},
		glass = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "slashing"
			}
		},
		grass = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		hay = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "slashing"
			}
		},
		ice = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "slashing"
			}
		},
		metal_hollow = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		armored = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield_metal = {
			event = "slashing_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		metal_solid = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "slashing"
			}
		},
		mud = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "slashing"
			}
		},
		plaster = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "slashing"
			}
		},
		sand = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		stone = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "slashing"
			}
		},
		stone_dirt = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "slashing"
			}
		},
		stone_wet = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "slashing"
			}
		},
		snow = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "slashing"
			}
		},
		water = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "water",
				damage_type = "slashing"
			}
		},
		water_deep = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "slashing"
			}
		},
		wood_bridge = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "slashing"
			}
		},
		wood_hollow = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "slashing"
			}
		},
		wood_solid = {
			event = "axe_2h_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "slashing"
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
	}
}
MaterialEffectMappings.melee_hit_axes_1h = MaterialEffectMappings.melee_hit_axes_1h or {
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
			width = 0.3,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "slashing"
			}
		},
		dirt = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "slashing"
			}
		},
		flesh = {
			event = "axe_1h_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "slashing"
			}
		},
		fruit = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "slashing"
			}
		},
		forest_grass = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "slashing"
			}
		},
		glass = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "slashing"
			}
		},
		grass = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		hay = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "slashing"
			}
		},
		ice = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "slashing"
			}
		},
		metal_hollow = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		armored = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		shield_metal = {
			event = "slashing_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "slashing"
			}
		},
		metal_solid = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "slashing"
			}
		},
		mud = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "slashing"
			}
		},
		plaster = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "slashing"
			}
		},
		sand = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "slashing"
			}
		},
		stone = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "slashing"
			}
		},
		stone_dirt = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "slashing"
			}
		},
		stone_wet = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "slashing"
			}
		},
		snow = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "slashing"
			}
		},
		water = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "water",
				damage_type = "slashing"
			}
		},
		water_deep = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "slashing"
			}
		},
		wood_bridge = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "slashing"
			}
		},
		wood_hollow = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "slashing"
			}
		},
		wood_solid = {
			event = "axe_1h_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "slashing"
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
	}
}
MaterialEffectMappings.melee_hit_hammers_2h = MaterialEffectMappings.melee_hit_hammers_2h or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.6,
			height = 0.3,
			width = 0.5,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			event = "hammer_2h_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "piercing"
			}
		},
		fruit = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "blunt_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "blunt_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "hammer_2h_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/hit_hay_blunt",
		fruit = "fx/hit_fruit_blunt",
		stone = "fx/hit_stone_blunt",
		cloth = "fx/hit_cloth_blunt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/hit_water_blunt",
		water_deep = "fx/hit_water_blunt",
		glass = "fx/hit_glass",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/hit_flesh_blunt",
		stone_dirt = "fx/hit_stone_blunt",
		plaster = "fx/hit_plaster_blunt",
		snow = "fx/hit_snow_blunt",
		ice = "fx/hit_ice_blunt",
		wood_bridge = "fx/hit_wood_hollow_blunt",
		forest_grass = "fx/hit_grass_blunt",
		grass = "fx/hit_grass_blunt",
		dirt = "fx/hit_dirt_blunt",
		wood_hollow = "fx/hit_wood_hollow_blunt",
		stone_wet = "fx/hit_stone_blunt",
		mud = "fx/hit_dirt_blunt",
		wood_solid = "fx/hit_wood_solid_blunt",
		metal_solid = "fx/hit_metal_solid_blunt",
		metal_hollow = "fx/hit_metal_hollow_blunt"
	}
}
MaterialEffectMappings.melee_hit_hammers_1h = MaterialEffectMappings.melee_hit_hammers_1h or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.6,
			height = 0.2,
			width = 0.4,
			depth_offset = -0.2
		}
	},
	sound = {
		cloth = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			event = "hammer_1h_hit_statics",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "piercing"
			}
		},
		fruit = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "blunt_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "blunt_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "hammer_1h_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/hit_hay_blunt",
		fruit = "fx/hit_fruit_blunt",
		stone = "fx/hit_stone_blunt",
		cloth = "fx/hit_cloth_blunt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/hit_water_blunt",
		water_deep = "fx/hit_water_blunt",
		glass = "fx/hit_glass",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/hit_flesh_blunt",
		stone_dirt = "fx/hit_stone_blunt",
		plaster = "fx/hit_plaster_blunt",
		snow = "fx/hit_snow_blunt",
		ice = "fx/hit_ice_blunt",
		wood_bridge = "fx/hit_wood_hollow_blunt",
		forest_grass = "fx/hit_grass_blunt",
		grass = "fx/hit_grass_blunt",
		dirt = "fx/hit_dirt_blunt",
		wood_hollow = "fx/hit_wood_hollow_blunt",
		stone_wet = "fx/hit_stone_blunt",
		mud = "fx/hit_dirt_blunt",
		wood_solid = "fx/hit_wood_solid_blunt",
		metal_solid = "fx/hit_metal_solid_blunt",
		metal_hollow = "fx/hit_metal_hollow_blunt"
	}
}
MaterialEffectMappings.bullet_impact = MaterialEffectMappings.bullet_impact or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.8,
			height = 0.25,
			width = 0.25,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "bullet_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "bullet_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "bullet_hit",
			parameters = {}
		},
		fruit = {
			event = "bullet_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "bullet_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "bullet_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "bullet_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "bullet_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "bullet_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "bullet_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "bullet_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "bullet_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "bullet_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "bullet_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "bullet_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "bullet_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "bullet_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "bullet_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "bullet_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "bullet_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "bullet_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "bullet_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "bullet_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/hit_dirt_pierce",
		glass = "fx/hit_glass",
		stone = "fx/hit_stone_pierce",
		cloth = "fx/hit_cloth_pierce",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		fruit = "fx/hit_fruit_pierce",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/hit_metal_hollow_pierce",
		stone_dirt = "fx/hit_stone_pierce",
		plaster = "fx/hit_plaster_pierce",
		snow = "fx/hit_snow_pierce",
		ice = "fx/hit_ice_pierce",
		water_deep = "fx/hit_snow_pierce",
		forest_grass = "fx/hit_grass_pierce",
		wood_bridge = "fx/hit_wood_hollow_pierce",
		grass = "fx/hit_grass_pierce",
		hay = "fx/hit_hay_pierce",
		wood_hollow = "fx/hit_wood_hollow_pierce",
		stone_wet = "fx/hit_stone_pierce",
		mud = "fx/hit_mud_pierce",
		wood_solid = "fx/hit_wood_solid_pierce",
		metal_solid = "fx/hit_metal_solid_pierce",
		metal_hollow = "fx/hit_metal_hollow_pierce"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.bullet_critical_impact = MaterialEffectMappings.bullet_critical_impact or {
	particles = {
		shield = "fx/wpnfx_range_crit_01",
		dirt = "fx/wpnfx_range_crit_01",
		glass = "fx/wpnfx_range_crit_01",
		stone = "fx/wpnfx_range_crit_01",
		cloth = "fx/wpnfx_range_crit_01",
		shield_metal = "fx/wpnfx_range_crit_01",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_range_crit_01",
		fruit = "fx/wpnfx_range_crit_01",
		sand = "fx/wpnfx_range_crit_01",
		armored = "fx/wpnfx_range_crit_01",
		flesh = "fx/wpnfx_range_crit_01",
		stone_dirt = "fx/wpnfx_range_crit_01",
		plaster = "fx/wpnfx_range_crit_01",
		snow = "fx/wpnfx_range_crit_01",
		ice = "fx/wpnfx_range_crit_01",
		water_deep = "fx/wpnfx_range_crit_01",
		forest_grass = "fx/wpnfx_range_crit_01",
		wood_bridge = "fx/wpnfx_range_crit_01",
		grass = "fx/wpnfx_range_crit_01",
		hay = "fx/wpnfx_range_crit_01",
		wood_hollow = "fx/wpnfx_range_crit_01",
		stone_wet = "fx/wpnfx_range_crit_01",
		mud = "fx/wpnfx_range_crit_01",
		wood_solid = "fx/wpnfx_range_crit_01",
		metal_solid = "fx/wpnfx_range_crit_01",
		metal_hollow = "fx/wpnfx_range_crit_01"
	}
}
MaterialEffectMappings.shotgun_bullet_impact = MaterialEffectMappings.shotgun_bullet_impact or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 1,
			height = 0.2,
			width = 0.2,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "bullet_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "bullet_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "bullet_hit",
			parameters = {}
		},
		fruit = {
			event = "bullet_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "bullet_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "bullet_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "bullet_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "bullet_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "bullet_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "bullet_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "bullet_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "bullet_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "bullet_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "bullet_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "bullet_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "bullet_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "bullet_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "bullet_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "bullet_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "bullet_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "bullet_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "bullet_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "bullet_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/arrow_hit_dirt",
		glass = "fx/hit_glass",
		stone = "fx/arrow_hit_stone",
		cloth = "fx/hit_cloth_pierce",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/hit_water_pierce",
		water_deep = "fx/hit_water_pierce",
		fruit = "fx/arrow_hit_generic",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/arrow_hit_flesh",
		stone_dirt = "fx/arrow_hit_stone",
		plaster = "fx/arrow_hit_generic",
		snow = "fx/arrow_hit_snow",
		ice = "fx/hit_ice_pierce",
		wood_bridge = "fx/arrow_hit_wood_hollow",
		forest_grass = "fx/arrow_hit_generic",
		grass = "fx/arrow_hit_generic",
		hay = "fx/hit_hay_pierce",
		wood_hollow = "fx/arrow_hit_wood_hollow",
		stone_wet = "fx/arrow_hit_stone",
		mud = "fx/arrow_hit_generic",
		wood_solid = "fx/arrow_hit_wood_solid",
		metal_solid = "fx/arrow_hit_metal_solid",
		metal_hollow = "fx/arrow_hit_metal_hollow"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.nodecals = MaterialEffectMappings.nodecals or {
	sound = {
		cloth = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "enemy_bullet_hit_statics",
			parameters = {}
		},
		fruit = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/hit_dirt_pierce",
		glass = "fx/hit_glass",
		stone = "fx/hit_stone_pierce",
		cloth = "fx/hit_cloth_pierce",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		fruit = "fx/hit_fruit_pierce",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/hit_metal_hollow_pierce",
		stone_dirt = "fx/hit_stone_pierce",
		plaster = "fx/hit_plaster_pierce",
		snow = "fx/hit_snow_pierce",
		ice = "fx/hit_ice_pierce",
		water_deep = "fx/hit_snow_pierce",
		forest_grass = "fx/hit_grass_pierce",
		wood_bridge = "fx/hit_wood_hollow_pierce",
		grass = "fx/hit_grass_pierce",
		hay = "fx/hit_hay_pierce",
		wood_hollow = "fx/hit_wood_hollow_pierce",
		stone_wet = "fx/hit_stone_pierce",
		mud = "fx/hit_mud_pierce",
		wood_solid = "fx/hit_wood_solid_pierce",
		metal_solid = "fx/hit_metal_solid_pierce",
		metal_hollow = "fx/hit_metal_hollow_pierce"
	},
	flow_event = {
		ward = "ward_impact"
	}
}
MaterialEffectMappings.ratling_gunner = MaterialEffectMappings.ratling_gunner or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.8,
			height = 0.3,
			width = 0.3,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "enemy_bullet_hit",
			parameters = {}
		},
		fruit = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/impact_ratlinggun_default",
		glass = "fx/impact_ratlinggun_default",
		stone = "fx/impact_ratlinggun_default",
		cloth = "fx/impact_ratlinggun_default",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		fruit = "fx/impact_ratlinggun_default",
		sand = "fx/impact_ratlinggun_default",
		armored = "fx/hit_armored",
		flesh = "fx/hit_flesh_pierce",
		stone_dirt = "fx/impact_ratlinggun_default",
		plaster = "fx/impact_ratlinggun_default",
		snow = "fx/impact_ratlinggun_default",
		ice = "fx/impact_ratlinggun_default",
		water_deep = "fx/hit_snow_pierce",
		forest_grass = "fx/impact_ratlinggun_default",
		wood_bridge = "fx/impact_ratlinggun_default",
		grass = "fx/impact_ratlinggun_default",
		hay = "fx/impact_ratlinggun_default",
		wood_hollow = "fx/impact_ratlinggun_default",
		stone_wet = "fx/impact_ratlinggun_default",
		mud = "fx/impact_ratlinggun_default",
		wood_solid = "fx/impact_ratlinggun_default",
		metal_solid = "fx/impact_ratlinggun_default",
		metal_hollow = "fx/impact_ratlinggun_default"
	},
	flow_event = {
		ward = "ward_impact"
	}
}
MaterialEffectMappings.enemy_bullet_impact = MaterialEffectMappings.enemy_bullet_impact or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.8,
			height = 0.6,
			width = 0.6,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "enemy_bullet_hit",
			parameters = {}
		},
		fruit = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/hit_dirt_pierce",
		glass = "fx/hit_glass",
		stone = "fx/hit_stone_pierce",
		cloth = "fx/hit_cloth_pierce",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		fruit = "fx/hit_fruit_pierce",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/hit_metal_hollow_pierce",
		stone_dirt = "fx/hit_stone_pierce",
		plaster = "fx/hit_plaster_pierce",
		snow = "fx/hit_snow_pierce",
		ice = "fx/hit_ice_pierce",
		water_deep = "fx/hit_snow_pierce",
		forest_grass = "fx/hit_grass_pierce",
		wood_bridge = "fx/hit_wood_hollow_pierce",
		grass = "fx/hit_grass_pierce",
		hay = "fx/hit_hay_pierce",
		wood_hollow = "fx/hit_wood_hollow_pierce",
		stone_wet = "fx/hit_stone_pierce",
		mud = "fx/hit_mud_pierce",
		wood_solid = "fx/hit_wood_solid_pierce",
		metal_solid = "fx/hit_metal_solid_pierce",
		metal_hollow = "fx/hit_metal_hollow_pierce"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.drakefire_pistol = MaterialEffectMappings.drakefire_pistol or {
	sound = {
		armored = {
			event = "drakepistol_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "drakepistol_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "drakepistol_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		cloth = {
			event = "drakepistol_hit",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "drakepistol_hit",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "drakepistol_hit",
			parameters = {}
		},
		fruit = {
			event = "drakepistol_hit",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "drakepistol_hit",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "drakepistol_hit",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "drakepistol_hit",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "drakepistol_hit",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "drakepistol_hit",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "drakepistol_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "drakepistol_hit",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "drakepistol_hit",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "drakepistol_hit",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "drakepistol_hit",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "drakepistol_hit",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "drakepistol_hit",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "drakepistol_hit",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "drakepistol_hit",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "drakepistol_hit",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "drakepistol_hit",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "drakepistol_hit",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "drakepistol_hit",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "drakepistol_hit",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/wpnfx_drake_pistols_projectile_impact",
		glass = "fx/wpnfx_drake_pistols_projectile_impact",
		stone = "fx/wpnfx_drake_pistols_projectile_impact",
		cloth = "fx/wpnfx_drake_pistols_projectile_impact",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_water_with_fire_projectile",
		fruit = "fx/wpnfx_drake_pistols_projectile_impact",
		sand = "fx/wpnfx_drake_pistols_projectile_impact",
		armored = "fx/hit_armored_with_fire",
		flesh = "fx/wpnfx_drake_pistols_projectile_impact",
		stone_dirt = "fx/wpnfx_drake_pistols_projectile_impact",
		plaster = "fx/wpnfx_drake_pistols_projectile_impact",
		snow = "fx/wpnfx_drake_pistols_projectile_impact",
		ice = "fx/wpnfx_drake_pistols_projectile_impact",
		water_deep = "fx/hit_water_with_fire_projectile",
		forest_grass = "fx/wpnfx_drake_pistols_projectile_impact",
		wood_bridge = "fx/wpnfx_drake_pistols_projectile_impact",
		grass = "fx/wpnfx_drake_pistols_projectile_impact",
		hay = "fx/wpnfx_drake_pistols_projectile_impact",
		wood_hollow = "fx/wpnfx_drake_pistols_projectile_impact",
		stone_wet = "fx/wpnfx_drake_pistols_projectile_impact",
		mud = "fx/wpnfx_drake_pistols_projectile_impact",
		wood_solid = "fx/wpnfx_drake_pistols_projectile_impact",
		metal_solid = "fx/wpnfx_drake_pistols_projectile_impact",
		metal_hollow = "fx/wpnfx_drake_pistols_projectile_impact"
	},
	world_interaction = {
		water = {}
	},
	flow_event = {
		ward = "ward_impact"
	}
}
MaterialEffectMappings.sienna_scholar_career_ability = MaterialEffectMappings.sienna_scholar_career_ability or {
	sound = {
		armored = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		cloth = {
			event = "magic_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "magic_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "magic_hit",
			parameters = {}
		},
		fruit = {
			event = "magic_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "magic_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "magic_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "magic_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "magic_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "magic_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "magic_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "magic_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "magic_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "magic_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "magic_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "magic_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/wpnfx_sienna_scholar_career_ability",
		glass = "fx/wpnfx_sienna_scholar_career_ability",
		stone = "fx/wpnfx_sienna_scholar_career_ability",
		cloth = "fx/wpnfx_sienna_scholar_career_ability",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_water_with_fire_projectile",
		fruit = "fx/wpnfx_sienna_scholar_career_ability",
		sand = "fx/wpnfx_sienna_scholar_career_ability",
		armored = "fx/hit_armored_with_fire",
		flesh = "fx/wpnfx_sienna_scholar_career_ability",
		stone_dirt = "fx/wpnfx_sienna_scholar_career_ability",
		plaster = "fx/wpnfx_sienna_scholar_career_ability",
		snow = "fx/wpnfx_sienna_scholar_career_ability",
		ice = "fx/wpnfx_sienna_scholar_career_ability",
		wood_bridge = "fx/wpnfx_sienna_scholar_career_ability",
		forest_grass = "fx/wpnfx_sienna_scholar_career_ability",
		grass = "fx/wpnfx_sienna_scholar_career_ability",
		hay = "fx/wpnfx_sienna_scholar_career_ability",
		wood_hollow = "fx/wpnfx_sienna_scholar_career_ability",
		stone_wet = "fx/wpnfx_sienna_scholar_career_ability",
		mud = "fx/wpnfx_sienna_scholar_career_ability",
		wood_solid = "fx/wpnfx_sienna_scholar_career_ability",
		metal_solid = "fx/wpnfx_sienna_scholar_career_ability",
		metal_hollow = "fx/wpnfx_sienna_scholar_career_ability"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.staff_spark = MaterialEffectMappings.staff_spark or {
	sound = {
		armored = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		cloth = {
			event = "magic_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "magic_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "magic_hit",
			parameters = {}
		},
		fruit = {
			event = "magic_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "magic_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "magic_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "magic_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "magic_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "magic_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "magic_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "magic_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "magic_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "magic_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "magic_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "magic_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/wpnfx_staff_spark_impact",
		glass = "fx/wpnfx_staff_spark_impact",
		stone = "fx/wpnfx_staff_spark_impact",
		cloth = "fx/wpnfx_staff_spark_impact",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_water_with_fire_projectile",
		fruit = "fx/wpnfx_staff_spark_impact",
		sand = "fx/wpnfx_staff_spark_impact",
		armored = "fx/hit_armored_with_fire",
		flesh = "fx/wpnfx_staff_spark_impact",
		stone_dirt = "fx/wpnfx_staff_spark_impact",
		plaster = "fx/wpnfx_staff_spark_impact",
		snow = "fx/wpnfx_staff_spark_impact",
		ice = "fx/wpnfx_staff_spark_impact",
		water_deep = "fx/hit_water_with_fire_projectile",
		forest_grass = "fx/wpnfx_staff_spark_impact",
		wood_bridge = "fx/wpnfx_staff_spark_impact",
		grass = "fx/wpnfx_staff_spark_impact",
		hay = "fx/wpnfx_staff_spark_impact",
		wood_hollow = "fx/wpnfx_staff_spark_impact",
		stone_wet = "fx/wpnfx_staff_spark_impact",
		mud = "fx/wpnfx_staff_spark_impact",
		wood_solid = "fx/wpnfx_staff_spark_impact",
		metal_solid = "fx/wpnfx_staff_spark_impact",
		metal_hollow = "fx/wpnfx_staff_spark_impact"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.staff_spear = MaterialEffectMappings.staff_spear or {
	sound = {
		armored = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		cloth = {
			event = "magic_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "magic_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "magic_hit",
			parameters = {}
		},
		fruit = {
			event = "magic_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "magic_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "magic_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "magic_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "magic_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "magic_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "magic_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "magic_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "magic_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "magic_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "magic_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "magic_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "magic_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "magic_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "magic_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/wpnfx_staff_spear_impact",
		glass = "fx/wpnfx_staff_spear_impact",
		stone = "fx/wpnfx_staff_spear_impact",
		cloth = "fx/wpnfx_staff_spear_impact",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_water_with_fire_projectile",
		fruit = "fx/wpnfx_staff_spear_impact",
		sand = "fx/wpnfx_staff_spear_impact",
		armored = "fx/hit_armored_with_fire",
		flesh = "fx/wpnfx_staff_spear_impact",
		stone_dirt = "fx/wpnfx_staff_spear_impact",
		plaster = "fx/wpnfx_staff_spear_impact",
		snow = "fx/wpnfx_staff_spear_impact",
		ice = "fx/wpnfx_staff_spear_impact",
		wood_bridge = "fx/wpnfx_staff_spear_impact",
		forest_grass = "fx/wpnfx_staff_spear_impact",
		grass = "fx/wpnfx_staff_spear_impact",
		hay = "fx/wpnfx_staff_spear_impact",
		wood_hollow = "fx/wpnfx_staff_spear_impact",
		stone_wet = "fx/wpnfx_staff_spear_impact",
		mud = "fx/wpnfx_staff_spear_impact",
		wood_solid = "fx/wpnfx_staff_spear_impact",
		metal_solid = "fx/wpnfx_staff_spear_impact",
		metal_hollow = "fx/wpnfx_staff_spear_impact"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.fireball_impact = MaterialEffectMappings.fireball_impact or {
	sound = {
		cloth = {
			event = "fireball_small_hit",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "fireball_small_hit",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "fireball_small_hit",
			parameters = {}
		},
		fruit = {
			event = "fireball_small_hit",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "fireball_small_hit",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "fireball_small_hit",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "fireball_small_hit",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "fireball_small_hit",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "fireball_small_hit",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "fireball_small_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "fireball_small_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "fireball_small_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "fireball_small_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "fireball_small_hit",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "fireball_small_hit",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "fireball_small_hit",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "fireball_small_hit",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "fireball_small_hit",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "fireball_small_hit",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "fireball_small_hit",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "fireball_small_hit",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "fireball_small_hit",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "fireball_small_hit",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "fireball_small_hit",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "fireball_small_hit",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "fireball_small_hit",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		dirt = "fx/wpnfx_staff_spark_impact",
		glass = "fx/wpnfx_staff_spark_impact",
		stone = "fx/wpnfx_staff_spark_impact",
		cloth = "fx/wpnfx_staff_spark_impact",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_staff_spark_impact",
		fruit = "fx/wpnfx_staff_spark_impact",
		sand = "fx/wpnfx_staff_spark_impact",
		armored = "fx/hit_armored_with_fire",
		flesh = "fx/wpnfx_staff_spark_impact",
		stone_dirt = "fx/wpnfx_staff_spark_impact",
		plaster = "fx/wpnfx_staff_spark_impact",
		snow = "fx/wpnfx_staff_spark_impact",
		ice = "fx/wpnfx_staff_spark_impact",
		water_deep = "fx/wpnfx_staff_spark_impact",
		forest_grass = "fx/wpnfx_staff_spark_impact",
		wood_bridge = "fx/wpnfx_staff_spark_impact",
		grass = "fx/wpnfx_staff_spark_impact",
		hay = "fx/wpnfx_staff_spark_impact",
		wood_hollow = "fx/wpnfx_staff_spark_impact",
		stone_wet = "fx/wpnfx_staff_spark_impact",
		mud = "fx/wpnfx_staff_spark_impact",
		wood_solid = "fx/wpnfx_staff_spark_impact",
		metal_solid = "fx/wpnfx_staff_spark_impact",
		metal_hollow = "fx/wpnfx_staff_spark_impact"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.flamethrower = MaterialEffectMappings.flamethrower or {
	sound = {
		armored = {
			event = "flamethrower_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "flamethrower_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "flamethrower_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		cloth = {
			event = "flamethrower_hit",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "flamethrower_hit",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "flamethrower_hit_enemy",
			parameters = {}
		},
		fruit = {
			event = "flamethrower_hit",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "flamethrower_hit",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "flamethrower_hit",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "flamethrower_hit",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "flamethrower_hit",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "flamethrower_hit",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "flamethrower_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "flamethrower_hit",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "flamethrower_hit",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "flamethrower_hit",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "flamethrower_hit",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "flamethrower_hit",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "flamethrower_hit",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "flamethrower_hit",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "flamethrower_hit",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "flamethrower_hit",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "flamethrower_hit",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "flamethrower_hit",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "flamethrower_hit",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "flamethrower_hit",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	world_interaction = {
		water = {}
	},
	flow_event = {
		ward = "ward_impact"
	}
}
MaterialEffectMappings.arrow_impact = MaterialEffectMappings.arrow_impact or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.8,
			height = 0.15,
			width = 0.15,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "arrow_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "arrow_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "arrow_hit_armour",
			event = "arrow_hit",
			parameters = {}
		},
		fruit = {
			event = "arrow_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "arrow_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "arrow_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "arrow_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "arrow_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "arrow_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "arrow_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "arrow_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "arrow_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "arrow_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "arrow_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "arrow_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "arrow_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "arrow_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "arrow_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "arrow_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "arrow_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "arrow_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "arrow_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "arrow_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "arrow_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "arrow_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "arrow_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/arrow_hit_generic",
		fruit = "fx/arrow_hit_generic",
		stone = "fx/arrow_hit_stone",
		cloth = "fx/arrow_hit_cloth",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		glass = "fx/hit_glass",
		sand = "fx/hit_sand",
		armored = "fx/hit_armored",
		flesh = "fx/arrow_hit_flesh",
		stone_dirt = "fx/arrow_hit_stone",
		plaster = "fx/arrow_hit_generic",
		snow = "fx/arrow_hit_snow",
		ice = "fx/arrow_hit_generic",
		water_deep = "fx/hit_snow_pierce",
		forest_grass = "fx/hit_grass_pierce",
		wood_bridge = "fx/arrow_hit_wood_hollow",
		grass = "fx/arrow_hit_generic",
		dirt = "fx/arrow_hit_dirt",
		wood_hollow = "fx/arrow_hit_wood_hollow",
		stone_wet = "fx/arrow_hit_stone",
		mud = "fx/arrow_hit_generic",
		wood_solid = "fx/arrow_hit_wood_solid",
		metal_solid = "fx/arrow_hit_metal_solid",
		metal_hollow = "fx/arrow_hit_metal_hollow"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.kerillian_ability_trueflight_arrow_impact = MaterialEffectMappings.kerillian_ability_trueflight_arrow_impact or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.8,
			height = 0.15,
			width = 0.15,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "arrow_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "arrow_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "arrow_hit_armour",
			event = "arrow_hit",
			parameters = {}
		},
		fruit = {
			event = "arrow_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "arrow_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "arrow_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "arrow_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "arrow_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "arrow_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "arrow_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "arrow_hit_armour",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "arrow_hit_shield_wood",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "arrow_hit_shield_metal",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "arrow_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "arrow_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "arrow_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "arrow_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "arrow_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "arrow_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "arrow_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "arrow_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "arrow_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "arrow_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "arrow_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "arrow_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "arrow_hit_statics",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/impact_true_shot_ricochet",
		hay = "fx/impact_true_shot_ricochet",
		fruit = "fx/impact_true_shot_ricochet",
		stone = "fx/impact_true_shot_ricochet",
		cloth = "fx/impact_true_shot_ricochet",
		shield_metal = "fx/impact_true_shot_ricochet",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/impact_true_shot_ricochet",
		glass = "fx/impact_true_shot_ricochet",
		sand = "fx/impact_true_shot_ricochet",
		armored = "fx/impact_true_shot_ricochet",
		flesh = "fx/impact_true_shot_ricochet",
		stone_dirt = "fx/impact_true_shot_ricochet",
		plaster = "fx/impact_true_shot_ricochet",
		snow = "fx/impact_true_shot_ricochet",
		ice = "fx/impact_true_shot_ricochet",
		water_deep = "fx/impact_true_shot_ricochet",
		forest_grass = "fx/impact_true_shot_ricochet",
		wood_bridge = "fx/impact_true_shot_ricochet",
		grass = "fx/impact_true_shot_ricochet",
		dirt = "fx/impact_true_shot_ricochet",
		wood_hollow = "fx/impact_true_shot_ricochet",
		stone_wet = "fx/impact_true_shot_ricochet",
		mud = "fx/impact_true_shot_ricochet",
		wood_solid = "fx/impact_true_shot_ricochet",
		metal_solid = "fx/impact_true_shot_ricochet",
		metal_hollow = "fx/impact_true_shot_ricochet"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.poison_arrow_impact = MaterialEffectMappings.poison_arrow_impact or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.8,
			height = 0.15,
			width = 0.15,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "poison_arrow_impact",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "poison_arrow_impact",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "arrow_hit_armour",
			event = "poison_arrow_impact",
			parameters = {}
		},
		fruit = {
			event = "poison_arrow_impact",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "poison_arrow_impact",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "poison_arrow_impact",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "poison_arrow_impact",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "poison_arrow_impact",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "poison_arrow_impact",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "poison_arrow_impact",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "poison_arrow_impact",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/hit_hay_pierce",
		fruit = "fx/wpnfx_poison_arrow_impact",
		stone = "fx/wpnfx_poison_arrow_impact",
		cloth = "fx/wpnfx_poison_arrow_impact",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_poison_arrow_impact",
		glass = "fx/wpnfx_poison_arrow_impact",
		sand = "fx/wpnfx_poison_arrow_impact",
		armored = "fx/wpnfx_poison_arrow_impact",
		flesh = "fx/wpnfx_poison_arrow_impact",
		stone_dirt = "fx/wpnfx_poison_arrow_impact",
		plaster = "fx/wpnfx_poison_arrow_impact",
		snow = "fx/wpnfx_poison_arrow_impact",
		ice = "fx/hit_ice_pierce",
		water_deep = "fx/wpnfx_poison_arrow_impact",
		forest_grass = "fx/wpnfx_poison_arrow_impact",
		wood_bridge = "fx/wpnfx_poison_arrow_impact",
		grass = "fx/wpnfx_poison_arrow_impact",
		dirt = "fx/wpnfx_poison_arrow_impact",
		wood_hollow = "fx/wpnfx_poison_arrow_impact",
		stone_wet = "fx/wpnfx_poison_arrow_impact",
		mud = "fx/wpnfx_poison_arrow_impact",
		wood_solid = "fx/wpnfx_poison_arrow_impact",
		metal_solid = "fx/wpnfx_poison_arrow_impact",
		metal_hollow = "fx/wpnfx_poison_arrow_impact"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.poison_arrow_impact_small = MaterialEffectMappings.poison_arrow_impact_small or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.8,
			height = 0.15,
			width = 0.15,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "poison_arrow_impact",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "poison_arrow_impact",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "arrow_hit_armour",
			event = "poison_arrow_impact",
			parameters = {}
		},
		fruit = {
			event = "poison_arrow_impact",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "poison_arrow_impact",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "poison_arrow_impact",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "poison_arrow_impact",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "poison_arrow_impact",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "poison_arrow_impact",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "poison_arrow_impact",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "poison_arrow_impact",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/hit_hay_pierce",
		fruit = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone = "fx/wpnfx_poison_arrow_impact_machinegun",
		cloth = "fx/wpnfx_poison_arrow_impact_machinegun",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_poison_arrow_impact_machinegun",
		glass = "fx/wpnfx_poison_arrow_impact_machinegun",
		sand = "fx/wpnfx_poison_arrow_impact_machinegun",
		armored = "fx/wpnfx_poison_arrow_impact_machinegun",
		flesh = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone_dirt = "fx/wpnfx_poison_arrow_impact_machinegun",
		plaster = "fx/wpnfx_poison_arrow_impact_machinegun",
		snow = "fx/wpnfx_poison_arrow_impact_machinegun",
		ice = "fx/hit_ice_pierce",
		water_deep = "fx/wpnfx_poison_arrow_impact_machinegun",
		forest_grass = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_bridge = "fx/wpnfx_poison_arrow_impact_machinegun",
		grass = "fx/wpnfx_poison_arrow_impact_machinegun",
		dirt = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_hollow = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone_wet = "fx/wpnfx_poison_arrow_impact_machinegun",
		mud = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_solid = "fx/wpnfx_poison_arrow_impact_machinegun",
		metal_solid = "fx/wpnfx_poison_arrow_impact_machinegun",
		metal_hollow = "fx/wpnfx_poison_arrow_impact_machinegun"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.poison_arrow_impact_small = MaterialEffectMappings.poison_arrow_impact or {
	decal = {
		material_drawer_mapping = {
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			glass = "units/projection_decals/hit_glass_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			ice = "units/projection_decals/hit_ice_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2"
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2"
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3"
			}
		},
		settings = {
			depth = 0.8,
			height = 0.6,
			width = 0.6,
			depth_offset = 0.5
		}
	},
	sound = {
		cloth = {
			event = "poison_arrow_impact",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "poison_arrow_impact",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "arrow_hit_armour",
			event = "poison_arrow_impact",
			parameters = {}
		},
		fruit = {
			event = "poison_arrow_impact",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "poison_arrow_impact",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "poison_arrow_impact",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "poison_arrow_impact",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "poison_arrow_impact",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "poison_arrow_impact",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "poison_arrow_impact",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "poison_arrow_impact",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "poison_arrow_impact",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "poison_arrow_impact",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "poison_arrow_impact",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "poison_arrow_impact",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/wpnfx_poison_arrow_impact_machinegun",
		hay = "fx/wpnfx_poison_arrow_impact_machinegun",
		fruit = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone = "fx/wpnfx_poison_arrow_impact_machinegun",
		cloth = "fx/wpnfx_poison_arrow_impact_machinegun",
		shield_metal = "fx/wpnfx_poison_arrow_impact_machinegun",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_poison_arrow_impact_machinegun",
		glass = "fx/wpnfx_poison_arrow_impact_machinegun",
		sand = "fx/wpnfx_poison_arrow_impact_machinegun",
		armored = "fx/wpnfx_poison_arrow_impact_machinegun",
		flesh = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone_dirt = "fx/wpnfx_poison_arrow_impact_machinegun",
		plaster = "fx/wpnfx_poison_arrow_impact_machinegun",
		snow = "fx/wpnfx_poison_arrow_impact_machinegun",
		ice = "fx/wpnfx_poison_arrow_impact_machinegun",
		water_deep = "fx/wpnfx_poison_arrow_impact_machinegun",
		forest_grass = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_bridge = "fx/wpnfx_poison_arrow_impact_machinegun",
		grass = "fx/wpnfx_poison_arrow_impact_machinegun",
		dirt = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_hollow = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone_wet = "fx/wpnfx_poison_arrow_impact_machinegun",
		mud = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_solid = "fx/wpnfx_poison_arrow_impact_machinegun",
		metal_solid = "fx/wpnfx_poison_arrow_impact_machinegun",
		metal_hollow = "fx/wpnfx_poison_arrow_impact_machinegun"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.footstep_walk = MaterialEffectMappings.footstep_walk or {
	sound = {
		cloth = {
			event = "walk",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "walk",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "walk",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "walk",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "walk",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "walk",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "walk",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "walk",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "walk",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "walk",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "walk",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "walk",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "walk",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "walk",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "walk",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "walk",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "walk",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "walk",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "walk",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "walk",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "walk",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "walk",
			parameters = {
				material = "wood_hollow"
			}
		},
		puke = {
			event = "walk",
			parameters = {
				material = "puke"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/footstep_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.footstep_sneak = MaterialEffectMappings.footstep_sneak or {
	sound = {
		cloth = {
			event = "sneak",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "sneak",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "sneak",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "sneak",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "sneak",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "sneak",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "sneak",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "sneak",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "sneak",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "sneak",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "sneak",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "sneak",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "sneak",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "sneak",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "sneak",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "sneak",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "sneak",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "sneak",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "sneak",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "sneak",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "sneak",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "sneak",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "sneak",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "sneak",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/footstep_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	}
}
MaterialEffectMappings.footstep_run = MaterialEffectMappings.footstep_run or {
	sound = {
		cloth = {
			event = "run",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "run",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "run",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "run",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "run",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "run",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "run",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "run",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "run",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "run",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "run",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "run",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "run",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "run",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "run",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "run",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "run",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "run",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "run",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "run",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "run",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "run",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "run",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "run",
			parameters = {
				material = "wood_hollow"
			}
		},
		puke = {
			event = "run",
			parameters = {
				material = "puke"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/footstep_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.footstep_jump = MaterialEffectMappings.footstep_jump or {
	sound = {
		cloth = {
			event = "jump",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "jump",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "jump",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "jump",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "jump",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "jump",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "jump",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "jump",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "jump",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "jump",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "jump",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "jump",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "jump",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "jump",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "jump",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "jump",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "jump",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "jump",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "jump",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "jump",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "jump",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "jump",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "jump",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "jump",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/footstep_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.footstep_land = MaterialEffectMappings.footstep_land or {
	sound = {
		cloth = {
			event = "land",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "land",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "land",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "land",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "land",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "land",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "land",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "land",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "land",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "land",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "land",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "land",
			parameters = {
				material = "metal_hollow"
			}
		},
		shield = {
			event = "land",
			parameters = {
				material = "metal_hollow"
			}
		},
		shield_metal = {
			event = "land",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "land",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "land",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "land",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "land",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "land",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "land",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "land",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "land",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "land",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "land",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "land",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "land",
			parameters = {
				material = "wood_hollow"
			}
		},
		puke = {
			event = "land",
			parameters = {
				material = "puke"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/footstep_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.footstep_dodge = MaterialEffectMappings.footstep_dodge or {
	sound = {
		cloth = {
			event = "dodge",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "dodge",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "dodge",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "dodge",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "dodge",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "dodge",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "dodge",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "dodge",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "dodge",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "dodge",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "dodge",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "dodge",
			parameters = {
				material = "metal_hollow"
			}
		},
		shield = {
			event = "dodge",
			parameters = {
				material = "metal_hollow"
			}
		},
		shield_metal = {
			event = "dodge",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "dodge",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "dodge",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "dodge",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "dodge",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "dodge",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "dodge",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "dodge",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "dodge",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "dodge",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "dodge",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "dodge",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "dodge",
			parameters = {
				material = "wood_hollow"
			}
		},
		puke = {
			event = "dodge",
			parameters = {
				material = "puke"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/footstep_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_footstep_walk = MaterialEffectMappings.enemy_footstep_walk or {
	sound = {
		cloth = {
			event = "enemy_walk",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_walk",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_walk",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_walk",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_walk",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_walk",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_walk",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_walk",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_walk",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "enemy_walk",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_walk",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_walk",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_walk",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_walk",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_walk",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_walk",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_walk",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "enemy_walk",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_walk",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_walk",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_walk",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_walk",
			parameters = {
				material = "wood_hollow"
			}
		},
		puke = {
			event = "enemy_walk",
			parameters = {
				material = "water"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_footstep_run = MaterialEffectMappings.enemy_footstep_run or {
	sound = {
		cloth = {
			event = "enemy_run",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_run",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_run",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_run",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_run",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_run",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_run",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_run",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_run",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "enemy_run",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_run",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_run",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_run",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_run",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_run",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_run",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_run",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "enemy_run",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_run",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_run",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_run",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_run",
			parameters = {
				material = "wood_hollow"
			}
		},
		puke = {
			event = "enemy_run",
			parameters = {
				material = "water"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_stormvermin_champion_footstep_run = MaterialEffectMappings.enemy_stormvermin_champion_footstep_run or {
	sound = {
		cloth = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "wood_hollow"
			}
		},
		puke = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "water"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_footstep_land = MaterialEffectMappings.enemy_footstep_land or {
	sound = {
		cloth = {
			event = "enemy_land",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_land",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_land",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_land",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_land",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_land",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_land",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_land",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_land",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "enemy_land",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_land",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_land",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_land",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_land",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_land",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_land",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_land",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "enemy_land",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_land",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_land",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_land",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_land",
			parameters = {
				material = "wood_hollow"
			}
		},
		puke = {
			event = "enemy_land",
			parameters = {
				material = "water"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_ratogre_run = {
	sound = {
		cloth = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_ratogre_run",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_ogre_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_footstep_ratogre_land = MaterialEffectMappings.enemy_footstep_ratogre_land or {
	sound = {
		cloth = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "ice"
			}
		},
		metal_solid = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "snow"
			}
		},
		water = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_ratogre_land",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_ogre_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.grenade_bounce = {
	sound = {
		cloth = {
			event = "grenade_hit_statics",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "grenade_hit_statics",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "grenade_hit_statics",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "grenade_hit_statics",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "grenade_hit_statics",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "grenade_hit_statics",
			parameters = {
				material = "glass"
			}
		},
		metal_solid = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "grenade_hit_statics",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "grenade_hit_statics",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "water"
			}
		},
		water = {
			event = "grenade_hit_statics",
			parameters = {
				material = "water"
			}
		},
		wood_bridge = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_ratogre_slide = {
	sound = {
		cloth = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "glass"
			}
		},
		metal_solid = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "water"
			}
		},
		water = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_ratogre_slide",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_ogre_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.grenade_bounce = {
	sound = {
		cloth = {
			event = "grenade_hit_statics",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "grenade_hit_statics",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "grenade_hit_statics",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "grenade_hit_statics",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "grenade_hit_statics",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "grenade_hit_statics",
			parameters = {
				material = "glass"
			}
		},
		metal_solid = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "grenade_hit_statics",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "grenade_hit_statics",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "water"
			}
		},
		water = {
			event = "grenade_hit_statics",
			parameters = {
				material = "water"
			}
		},
		wood_bridge = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_ratogre_footstep_single = {
	sound = {
		cloth = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "glass"
			}
		},
		metal_solid = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "water"
			}
		},
		water = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_ratogre_footstep_single",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		shield_metal = "fx/hit_enemy_shield_metal",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_ogre_walk_snow",
		ice = "fx/footstep_walk_ice",
		wood_bridge = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.grenade_bounce = {
	sound = {
		cloth = {
			event = "grenade_hit_statics",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "grenade_hit_statics",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "grenade_hit_statics",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "grenade_hit_statics",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "grenade_hit_statics",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "grenade_hit_statics",
			parameters = {
				material = "glass"
			}
		},
		metal_solid = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "grenade_hit_statics",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "grenade_hit_statics",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "water"
			}
		},
		water = {
			event = "grenade_hit_statics",
			parameters = {
				material = "water"
			}
		},
		wood_bridge = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_chaos_walk = {
	sound = {
		cloth = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_chaos_walk",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_troll_footstep_single = {
	sound = {
		cloth = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_troll_footstep_walk",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		plaster = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_troll_footstep_single_run = {
	sound = {
		cloth = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_troll_footstep_run",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		plaster = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_troll_land_death = {
	sound = {
		cloth = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		plaster = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_sorcerer_footstep_walk = {
	sound = {
		cloth = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "glass"
			}
		},
		metal_solid = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "water"
			}
		},
		water = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_chaos_sorcerer_walk",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		plaster = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_walk_snow",
		ice = "fx/footstep_walk_ice",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_stormfiend_footstep = {
	sound = {
		cloth = {
			event = "stormfiend_footstep",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "stormfiend_footstep",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "stormfiend_footstep",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "stormfiend_footstep",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "stormfiend_footstep",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "stormfiend_footstep",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "stormfiend_footstep",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "stormfiend_footstep",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "stormfiend_footstep",
			parameters = {
				material = "glass"
			}
		},
		metal_solid = {
			event = "stormfiend_footstep",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "stormfiend_footstep",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "stormfiend_footstep",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "stormfiend_footstep",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "stormfiend_footstep",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "stormfiend_footstep",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "stormfiend_footstep",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "stormfiend_footstep",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "stormfiend_footstep",
			parameters = {
				material = "water"
			}
		},
		water = {
			event = "stormfiend_footstep",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "stormfiend_footstep",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "stormfiend_footstep",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "stormfiend_footstep",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "stormfiend_footstep",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		plaster = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_walk_snow",
		ice = "fx/footstep_walk_ice",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_stormfiend_footstep_land = {
	sound = {
		cloth = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "hay"
			}
		},
		ice = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "glass"
			}
		},
		metal_solid = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "stone_wet"
			}
		},
		snow = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "water"
			}
		},
		water = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	particles = {
		plaster = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		stone = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		armored = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		snow = "fx/pawprint_walk_snow",
		ice = "fx/footstep_walk_ice",
		forest_grass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		metal_hollow = "fx/footstep_walk_dirt"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_marauder_run = {
	sound = {
		cloth = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_marauder_footstep_run",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_marauder_walk = {
	sound = {
		cloth = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_marauder_footstep_walk",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_marauder_land = {
	sound = {
		cloth = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_marauder_footstep_land",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_marauder_slide = {
	sound = {
		cloth = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_marauder_footstep_slide",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_marauder_land_knee = {
	sound = {
		cloth = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_marauder_land_knee",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_marauder_land_body = {
	sound = {
		cloth = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_marauder_land_body",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_chaos_spawn_run_small_foot = {
	sound = {
		cloth = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_chaos_spawn_footstep_run_small_foot",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_chaos_spawn_run_big_foot = {
	sound = {
		cloth = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_chaos_spawn_footstep_run_big_foot",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_chaos_spawn_land = {
	sound = {
		cloth = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_chaos_spawn_land",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_chaos_spawn_attack_ground = {
	sound = {
		cloth = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_chaos_spawn_attack_ground",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_chaos_spawn_attack_ground_tentacle = {
	sound = {
		cloth = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_chaos_spawn_attack_ground_tentacle",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_chaos_spawn_footstep_slide = {
	sound = {
		cloth = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "enemy_chaos_spawn_footstep_slide",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_plague_walker_walk = {
	sound = {
		cloth = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "Play_enemy_plague_walker_footstep_walk",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_plague_walker_walk_light = {
	sound = {
		cloth = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "Play_enemy_plague_walker_footstep_walk_light",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_plague_walker_land = {
	sound = {
		cloth = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "Play_enemy_plague_walker_footstep_land",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.enemy_plague_walker_bodyfall = {
	sound = {
		cloth = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "cloth"
			}
		},
		dirt = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "dirt"
			}
		},
		flesh = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "flesh"
			}
		},
		forest_grass = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "forest_grass"
			}
		},
		fruit = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "fruit"
			}
		},
		grass = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "grass"
			}
		},
		glass = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "glass"
			}
		},
		hay = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "hay"
			}
		},
		metal_solid = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "metal_solid"
			}
		},
		metal_hollow = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "metal_hollow"
			}
		},
		armored = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "metal_hollow"
			}
		},
		mud = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "mud"
			}
		},
		plaster = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "stone"
			}
		},
		sand = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "sand"
			}
		},
		stone = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "stone"
			}
		},
		stone_dirt = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "stone_dirt"
			}
		},
		stone_wet = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "stone_wet"
			}
		},
		water = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "water"
			}
		},
		water_deep = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "water_deep"
			}
		},
		wood_bridge = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "wood_bridge"
			}
		},
		wood_solid = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "wood_solid"
			}
		},
		wood_hollow = {
			event = "Play_enemy_plague_walker_footstep_bodyfall",
			parameters = {
				material = "wood_hollow"
			}
		}
	},
	world_interaction = {
		water = {}
	}
}
MaterialIDToName = {}

for context_name, context_materials in pairs(MaterialEffectSettings.material_contexts) do
	MaterialIDToName[context_name] = {}

	for _, material_name in ipairs(context_materials) do
		MaterialIDToName[context_name][Unit.material_id(material_name)] = material_name
	end
end

return
