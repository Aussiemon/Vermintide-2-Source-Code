-- chunkname: @scripts/settings/material_effect_mappings_morris.lua

MaterialEffectMappings = MaterialEffectMappings or {}
MaterialEffectMappings.we_deus_01_arrow_impact = MaterialEffectMappings.we_deus_01_arrow_impact or {
	decal = {
		material_drawer_mapping = {
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			glass = "units/projection_decals/hit_glass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2",
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
		},
		settings = {
			depth = 0.8,
			depth_offset = 0.5,
			height = 0.15,
			width = 0.15,
		},
	},
	sound = {
		cloth = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "arrow_hit_we_deus_01",
			no_damage_event = "arrow_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/wpnfx_we_deus_01_impact",
		cloth = "fx/wpnfx_we_deus_01_impact",
		dirt = "fx/wpnfx_we_deus_01_impact",
		flesh = "fx/wpnfx_we_deus_01_impact",
		forest_grass = "fx/wpnfx_we_deus_01_impact",
		fruit = "fx/wpnfx_we_deus_01_impact",
		glass = "fx/wpnfx_we_deus_01_impact",
		grass = "fx/wpnfx_we_deus_01_impact",
		hay = "fx/hit_hay_pierce",
		ice = "fx/hit_ice_pierce",
		metal_hollow = "fx/wpnfx_we_deus_01_impact",
		metal_solid = "fx/wpnfx_we_deus_01_impact",
		mud = "fx/wpnfx_we_deus_01_impact",
		plaster = "fx/wpnfx_we_deus_01_impact",
		sand = "fx/wpnfx_we_deus_01_impact",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/wpnfx_we_deus_01_impact",
		stone = "fx/wpnfx_we_deus_01_impact",
		stone_dirt = "fx/wpnfx_we_deus_01_impact",
		stone_wet = "fx/wpnfx_we_deus_01_impact",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_we_deus_01_impact",
		water_deep = "fx/wpnfx_we_deus_01_impact",
		wood_bridge = "fx/wpnfx_we_deus_01_impact",
		wood_hollow = "fx/wpnfx_we_deus_01_impact",
		wood_solid = "fx/wpnfx_we_deus_01_impact",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
}
MaterialEffectMappings.we_deus_02_arrow_impact = MaterialEffectMappings.we_deus_02_arrow_impact or {
	decal = {
		material_drawer_mapping = {
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			glass = "units/projection_decals/hit_glass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2",
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
		},
		settings = {
			depth = 0.8,
			depth_offset = 0.5,
			height = 0.15,
			width = 0.15,
		},
	},
	sound = {
		cloth = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "arrow_hit_we_deus_01",
			no_damage_event = "arrow_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "arrow_hit_we_deus_01",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/wpnfx_we_deus_02_impact",
		cloth = "fx/wpnfx_we_deus_02_impact",
		dirt = "fx/wpnfx_we_deus_02_impact",
		flesh = "fx/wpnfx_we_deus_02_impact",
		forest_grass = "fx/wpnfx_we_deus_02_impact",
		fruit = "fx/wpnfx_we_deus_02_impact",
		glass = "fx/wpnfx_we_deus_02_impact",
		grass = "fx/wpnfx_we_deus_02_impact",
		hay = "fx/hit_hay_pierce",
		ice = "fx/hit_ice_pierce",
		metal_hollow = "fx/wpnfx_we_deus_02_impact",
		metal_solid = "fx/wpnfx_we_deus_02_impact",
		mud = "fx/wpnfx_we_deus_02_impact",
		plaster = "fx/wpnfx_we_deus_02_impact",
		sand = "fx/wpnfx_we_deus_02_impact",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/wpnfx_we_deus_02_impact",
		stone = "fx/wpnfx_we_deus_02_impact",
		stone_dirt = "fx/wpnfx_we_deus_02_impact",
		stone_wet = "fx/wpnfx_we_deus_02_impact",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_we_deus_02_impact",
		water_deep = "fx/wpnfx_we_deus_02_impact",
		wood_bridge = "fx/wpnfx_we_deus_02_impact",
		wood_hollow = "fx/wpnfx_we_deus_02_impact",
		wood_solid = "fx/wpnfx_we_deus_02_impact",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
}
MaterialEffectMappings.magma_impact = MaterialEffectMappings.magma_impact or {
	sound = {
		cloth = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "fireball_bw_deus_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "fireball_bw_deus_hitt",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "fireball_bw_deus_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored_with_fire",
		cloth = "fx/wpnfx_staff_spark_impact",
		dirt = "fx/wpnfx_staff_spark_impact",
		flesh = "fx/wpnfx_staff_spark_impact",
		forest_grass = "fx/wpnfx_staff_spark_impact",
		fruit = "fx/wpnfx_staff_spark_impact",
		glass = "fx/wpnfx_staff_spark_impact",
		grass = "fx/wpnfx_staff_spark_impact",
		hay = "fx/wpnfx_staff_spark_impact",
		ice = "fx/wpnfx_staff_spark_impact",
		metal_hollow = "fx/wpnfx_staff_spark_impact",
		metal_solid = "fx/wpnfx_staff_spark_impact",
		mud = "fx/wpnfx_staff_spark_impact",
		plaster = "fx/wpnfx_staff_spark_impact",
		sand = "fx/wpnfx_staff_spark_impact",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/wpnfx_staff_spark_impact",
		stone = "fx/wpnfx_staff_spark_impact",
		stone_dirt = "fx/wpnfx_staff_spark_impact",
		stone_wet = "fx/wpnfx_staff_spark_impact",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_staff_spark_impact",
		water_deep = "fx/wpnfx_staff_spark_impact",
		wood_bridge = "fx/wpnfx_staff_spark_impact",
		wood_hollow = "fx/wpnfx_staff_spark_impact",
		wood_solid = "fx/wpnfx_staff_spark_impact",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
}
MaterialEffectMappings.melee_hit_deus_relic_01 = MaterialEffectMappings.melee_hit_deus_relic_01 or {
	decal = {
		material_drawer_mapping = {
			armored = "units/projection_decals/hit_metal_hollow_pierce_1",
			dirt = "units/projection_decals/hit_dirt_pierce_1",
			flesh = "units/projection_decals/hit_flesh_pierce_1",
			forest_grass = "units/projection_decals/hit_grass_pierce_1",
			fruit = "units/projection_decals/hit_fruit_pierce_1",
			glass = "units/projection_decals/hit_glass_pierce_1",
			grass = "units/projection_decals/hit_grass_pierce_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_pierce_1",
			metal_hollow = "units/projection_decals/hit_metal_hollow_pierce_1",
			metal_solid = "units/projection_decals/hit_metal_solid_pierce_1",
			mud = "units/projection_decals/hit_dirt_pierce_1",
			sand = "units/projection_decals/hit_sand_pierce_1",
			snow = "units/projection_decals/hit_snow_pierce_1",
			stone = "units/projection_decals/hit_stone_pierce_1",
			stone_dirt = "units/projection_decals/hit_stone_pierce_1",
			stone_wet = "units/projection_decals/hit_stone_pierce_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2",
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_pierce_1",
				"units/projection_decals/hit_wood_pierce_2",
				"units/projection_decals/hit_wood_pierce_3",
			},
		},
		settings = {
			depth = 0.6,
			depth_offset = -0.2,
			height = 0.2,
			width = 0.4,
		},
	},
	sound = {
		cloth = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_weapon_deus_relic_01_flesh_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_weapon_deus_relic_01_armour_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "deus_relic_01_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_blunt",
		dirt = "fx/hit_dirt_blunt",
		flesh = "fx/hit_flesh_blunt",
		forest_grass = "fx/hit_grass_blunt",
		fruit = "fx/hit_fruit_blunt",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_blunt",
		hay = "fx/hit_hay_blunt",
		ice = "fx/hit_ice_blunt",
		metal_hollow = "fx/hit_metal_hollow_blunt",
		metal_solid = "fx/hit_metal_solid_blunt",
		mud = "fx/hit_dirt_blunt",
		plaster = "fx/hit_plaster_blunt",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_blunt",
		stone = "fx/hit_stone_blunt",
		stone_dirt = "fx/hit_stone_blunt",
		stone_wet = "fx/hit_stone_blunt",
		water = "fx/hit_water_blunt",
		water_deep = "fx/hit_water_blunt",
		wood_bridge = "fx/hit_wood_hollow_blunt",
		wood_hollow = "fx/hit_wood_hollow_blunt",
		wood_solid = "fx/hit_wood_solid_blunt",
	},
}
