MaterialEffectMappings = MaterialEffectMappings or {}
MaterialEffectMappings.we_deus_01_arrow_impact = MaterialEffectMappings.we_deus_01_arrow_impact or {
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
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "arrow_hit_armour",
			event = "arrow_hit_we_deus_01",
			parameters = {}
		},
		fruit = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/hit_hay_pierce",
		fruit = "fx/wpnfx_we_deus_01_impact",
		stone = "fx/wpnfx_we_deus_01_impact",
		cloth = "fx/wpnfx_we_deus_01_impact",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_we_deus_01_impact",
		glass = "fx/wpnfx_we_deus_01_impact",
		sand = "fx/wpnfx_we_deus_01_impact",
		armored = "fx/wpnfx_we_deus_01_impact",
		flesh = "fx/wpnfx_we_deus_01_impact",
		stone_dirt = "fx/wpnfx_we_deus_01_impact",
		plaster = "fx/wpnfx_we_deus_01_impact",
		snow = "fx/wpnfx_we_deus_01_impact",
		ice = "fx/hit_ice_pierce",
		water_deep = "fx/wpnfx_we_deus_01_impact",
		forest_grass = "fx/wpnfx_we_deus_01_impact",
		wood_bridge = "fx/wpnfx_we_deus_01_impact",
		grass = "fx/wpnfx_we_deus_01_impact",
		dirt = "fx/wpnfx_we_deus_01_impact",
		wood_hollow = "fx/wpnfx_we_deus_01_impact",
		stone_wet = "fx/wpnfx_we_deus_01_impact",
		mud = "fx/wpnfx_we_deus_01_impact",
		wood_solid = "fx/wpnfx_we_deus_01_impact",
		metal_solid = "fx/wpnfx_we_deus_01_impact",
		metal_hollow = "fx/wpnfx_we_deus_01_impact"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.we_deus_02_arrow_impact = MaterialEffectMappings.we_deus_02_arrow_impact or {
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
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "arrow_hit_armour",
			event = "arrow_hit_we_deus_01",
			parameters = {}
		},
		fruit = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				material = "wood_solid",
				damage_type = "piercing"
			}
		}
	},
	particles = {
		shield = "fx/hit_enemy_shield",
		hay = "fx/hit_hay_pierce",
		fruit = "fx/wpnfx_we_deus_02_impact",
		stone = "fx/wpnfx_we_deus_02_impact",
		cloth = "fx/wpnfx_we_deus_02_impact",
		shield_metal = "fx/hit_enemy_shield_metal",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_we_deus_02_impact",
		glass = "fx/wpnfx_we_deus_02_impact",
		sand = "fx/wpnfx_we_deus_02_impact",
		armored = "fx/wpnfx_we_deus_02_impact",
		flesh = "fx/wpnfx_we_deus_02_impact",
		stone_dirt = "fx/wpnfx_we_deus_02_impact",
		plaster = "fx/wpnfx_we_deus_02_impact",
		snow = "fx/wpnfx_we_deus_02_impact",
		ice = "fx/hit_ice_pierce",
		water_deep = "fx/wpnfx_we_deus_02_impact",
		forest_grass = "fx/wpnfx_we_deus_02_impact",
		wood_bridge = "fx/wpnfx_we_deus_02_impact",
		grass = "fx/wpnfx_we_deus_02_impact",
		dirt = "fx/wpnfx_we_deus_02_impact",
		wood_hollow = "fx/wpnfx_we_deus_02_impact",
		stone_wet = "fx/wpnfx_we_deus_02_impact",
		mud = "fx/wpnfx_we_deus_02_impact",
		wood_solid = "fx/wpnfx_we_deus_02_impact",
		metal_solid = "fx/wpnfx_we_deus_02_impact",
		metal_hollow = "fx/wpnfx_we_deus_02_impact"
	},
	flow_event = {
		ward = "ward_impact"
	},
	world_interaction = {
		water = {}
	}
}
MaterialEffectMappings.magma_impact = MaterialEffectMappings.magma_impact or {
	sound = {
		cloth = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			no_damage_event = "bullet_hit_armour",
			event = "fireball_bw_deus_hit",
			parameters = {}
		},
		fruit = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "fireball_bw_deus_hitt",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "fireball_bw_deus_hit",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "fireball_bw_deus_hit",
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
MaterialEffectMappings.melee_hit_deus_relic_01 = MaterialEffectMappings.melee_hit_deus_relic_01 or {
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
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "cloth",
				damage_type = "piercing"
			}
		},
		dirt = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "dirt",
				damage_type = "piercing"
			}
		},
		flesh = {
			event = "Play_weapon_deus_relic_01_flesh_hit",
			parameters = {
				weapon_type = "1h_sword",
				material = "cloth",
				damage_type = "piercing"
			}
		},
		fruit = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "fruit",
				damage_type = "piercing"
			}
		},
		forest_grass = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "forest_grass",
				damage_type = "piercing"
			}
		},
		glass = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "glass",
				damage_type = "piercing"
			}
		},
		grass = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		hay = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "hay",
				damage_type = "piercing"
			}
		},
		ice = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "ice",
				damage_type = "piercing"
			}
		},
		metal_hollow = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		armored = {
			event = "Play_weapon_deus_relic_01_armour_hit",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		shield_metal = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "metal_hollow",
				damage_type = "piercing"
			}
		},
		metal_solid = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "metal_solid",
				damage_type = "piercing"
			}
		},
		mud = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "mud",
				damage_type = "piercing"
			}
		},
		plaster = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "plaster",
				damage_type = "piercing"
			}
		},
		sand = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "grass",
				damage_type = "piercing"
			}
		},
		stone = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "stone",
				damage_type = "piercing"
			}
		},
		stone_dirt = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "stone_dirt",
				damage_type = "piercing"
			}
		},
		stone_wet = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "stone_wet",
				damage_type = "piercing"
			}
		},
		snow = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "snow",
				damage_type = "piercing"
			}
		},
		water = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "water",
				damage_type = "piercing"
			}
		},
		water_deep = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "water_deep",
				damage_type = "piercing"
			}
		},
		wood_bridge = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "wood_bridge",
				damage_type = "piercing"
			}
		},
		wood_hollow = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				material = "wood_hollow",
				damage_type = "piercing"
			}
		},
		wood_solid = {
			event = "deus_relic_01_hit_statics",
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
