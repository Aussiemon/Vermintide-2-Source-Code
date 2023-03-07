MaterialEffectMappings = MaterialEffectMappings or {}
MaterialEffectMappings.throwing_axe = MaterialEffectMappings.throwing_axe or {
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
			event = "Play_throwing_axe_1h",
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
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
