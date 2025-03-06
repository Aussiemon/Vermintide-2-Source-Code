-- chunkname: @scripts/settings/material_effect_mappings.lua

MaterialEffectSettings = {
	blood_splat_raycast_max_range = 3,
	footstep_raycast_max_range = 3,
	footstep_raycast_offset = 0.6,
	material_query_depth = 0.4,
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
			"shield_metal",
		},
	},
}
DefaultSurfaceMaterial = "stone"

local_require("scripts/settings/material_effect_mappings_utility")
require("scripts/settings/material_effect_mappings_skaven")
require("scripts/settings/material_effect_mappings_chaos")
DLCUtils.require_list("material_effect_mappings_file_names", true)
MaterialEffectMappingsUtility.add("melee_hit_piercing", {
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
			puke = "units/projection_decals/empty",
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
			height = 0.1,
			width = 0.1,
		},
	},
	sound = {
		cloth = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
		puke = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_pierce",
		dirt = "fx/hit_dirt_pierce",
		flesh = "fx/hit_flesh_pierce",
		forest_grass = "fx/hit_grass_pierce",
		fruit = "fx/hit_fruit_pierce",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_pierce",
		hay = "fx/hit_hay_pierce",
		ice = "fx/hit_ice_pierce",
		metal_hollow = "fx/hit_metal_hollow_pierce",
		metal_solid = "fx/hit_metal_solid_pierce",
		mud = "fx/hit_dirt_pierce",
		plaster = "fx/hit_plaster_pierce",
		puke = "fx/hit_snow_pierce",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_pierce",
		stone = "fx/hit_stone_pierce",
		stone_dirt = "fx/hit_stone_pierce",
		stone_wet = "fx/hit_stone_pierce",
		water = "fx/hit_snow_pierce",
		water_deep = "fx/hit_snow_pierce",
		wood_bridge = "fx/hit_wood_hollow_pierce",
		wood_hollow = "fx/hit_wood_hollow_pierce",
		wood_solid = "fx/hit_wood_solid_pierce",
	},
})
MaterialEffectMappingsUtility.add("melee_hit_slashing", {
	decal = {
		material_drawer_mapping = {
			dirt = "units/projection_decals/hit_dirt_slash_1",
			forest_grass = "units/projection_decals/hit_grass_slash_1",
			fruit = "units/projection_decals/hit_fruit_slash_1",
			glass = "units/projection_decals/hit_glass_slash_1",
			grass = "units/projection_decals/hit_grass_slash_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_slash_1",
			mud = "units/projection_decals/hit_dirt_slash_1",
			puke = "units/projection_decals/empty",
			sand = "units/projection_decals/hit_sand_slash_1",
			snow = "units/projection_decals/hit_snow_slash_1",
			stone = "units/projection_decals/hit_stone_slash_1",
			stone_dirt = "units/projection_decals/hit_stone_slash_1",
			stone_wet = "units/projection_decals/hit_stone_slash_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_slash_1",
				"units/projection_decals/hit_cloth_slash_2",
			},
			flesh = {
				"units/projection_decals/hit_flesh_slash_1",
				"units/projection_decals/hit_flesh_slash_2",
				"units/projection_decals/hit_flesh_slash_3",
			},
			metal_hollow = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			armored = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			metal_solid = {
				"units/projection_decals/hit_metal_solid_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_solid_slash_3",
			},
			plaster = {
				"units/projection_decals/hit_plaster_slash_1",
				"units/projection_decals/hit_plaster_slash_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
		},
		settings = {
			depth = 2,
			depth_offset = -0.2,
			height = 2,
			width = 1,
		},
	},
	sound = {
		cloth = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
			},
		},
		dirt = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "dirt",
			},
		},
		flesh = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "glass",
			},
		},
		grass = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		hay = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "hay",
			},
		},
		ice = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "mud",
			},
		},
		plaster = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "plaster",
			},
		},
		sand = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		stone = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "snow",
			},
		},
		water = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water",
			},
		},
		water_deep = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_solid",
			},
		},
		puke = {
			event = "melee_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_slash",
		dirt = "fx/hit_dirt_slash",
		flesh = "fx/hit_flesh_slash",
		forest_grass = "fx/hit_grass_slash",
		fruit = "fx/hit_fruit_slash",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_slash",
		hay = "fx/hit_hay_slash",
		ice = "fx/hit_ice_slash",
		metal_hollow = "fx/hit_metal_hollow_slash",
		metal_solid = "fx/hit_metal_solid_slash",
		mud = "fx/hit_dirt_slash",
		plaster = "fx/hit_plaster_slash",
		puke = "fx/hit_water_slash",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_slash",
		stone = "fx/hit_stone_slash",
		stone_dirt = "fx/hit_stone_slash",
		stone_wet = "fx/hit_stone_slash",
		water = "fx/hit_water_slash",
		water_deep = "fx/hit_water_slash",
		wood_bridge = "fx/hit_wood_hollow_slash",
		wood_hollow = "fx/hit_wood_hollow_slash",
		wood_solid = "fx/hit_wood_solid_slash",
	},
})
MaterialEffectMappingsUtility.add("melee_hit_sword_2h", {
	decal = {
		material_drawer_mapping = {
			dirt = "units/projection_decals/hit_dirt_slash_1",
			forest_grass = "units/projection_decals/hit_grass_slash_1",
			fruit = "units/projection_decals/hit_fruit_slash_1",
			glass = "units/projection_decals/hit_glass_slash_1",
			grass = "units/projection_decals/hit_grass_slash_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_slash_1",
			mud = "units/projection_decals/hit_dirt_slash_1",
			sand = "units/projection_decals/hit_sand_slash_1",
			snow = "units/projection_decals/hit_snow_slash_1",
			stone = "units/projection_decals/hit_stone_slash_1",
			stone_dirt = "units/projection_decals/hit_stone_slash_1",
			stone_wet = "units/projection_decals/hit_stone_slash_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_slash_1",
				"units/projection_decals/hit_cloth_slash_2",
			},
			flesh = {
				"units/projection_decals/hit_flesh_slash_1",
				"units/projection_decals/hit_flesh_slash_2",
				"units/projection_decals/hit_flesh_slash_3",
			},
			metal_hollow = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			armored = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			metal_solid = {
				"units/projection_decals/hit_metal_solid_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_solid_slash_3",
			},
			plaster = {
				"units/projection_decals/hit_plaster_slash_1",
				"units/projection_decals/hit_plaster_slash_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
		},
		settings = {
			depth = 0.6,
			depth_offset = -0.2,
			height = 0.3,
			width = 0.3,
		},
	},
	sound = {
		cloth = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
			},
		},
		dirt = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "dirt",
			},
		},
		flesh = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "glass",
			},
		},
		grass = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		hay = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "hay",
			},
		},
		ice = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "slashing_hit_shield_metal",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "mud",
			},
		},
		plaster = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "plaster",
			},
		},
		sand = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		stone = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "snow",
			},
		},
		water = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water",
			},
		},
		water_deep = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "sword_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_slash",
		dirt = "fx/hit_dirt_slash",
		flesh = "fx/hit_flesh_slash",
		forest_grass = "fx/hit_grass_slash",
		fruit = "fx/hit_fruit_slash",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_slash",
		hay = "fx/hit_hay_slash",
		ice = "fx/hit_ice_slash",
		metal_hollow = "fx/hit_metal_hollow_slash",
		metal_solid = "fx/hit_metal_solid_slash",
		mud = "fx/hit_dirt_slash",
		plaster = "fx/hit_plaster_slash",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_slash",
		stone = "fx/hit_stone_slash",
		stone_dirt = "fx/hit_stone_slash",
		stone_wet = "fx/hit_stone_slash",
		water = "fx/hit_water_slash",
		water_deep = "fx/hit_water_slash",
		wood_bridge = "fx/hit_wood_hollow_slash",
		wood_hollow = "fx/hit_wood_hollow_slash",
		wood_solid = "fx/hit_wood_solid_slash",
	},
})
MaterialEffectMappingsUtility.add("melee_hit_sword_1h", {
	decal = {
		material_drawer_mapping = {
			dirt = "units/projection_decals/hit_dirt_slash_1",
			forest_grass = "units/projection_decals/hit_grass_slash_1",
			fruit = "units/projection_decals/hit_fruit_slash_1",
			glass = "units/projection_decals/hit_glass_slash_1",
			grass = "units/projection_decals/hit_grass_slash_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_slash_1",
			mud = "units/projection_decals/hit_dirt_slash_1",
			sand = "units/projection_decals/hit_sand_slash_1",
			snow = "units/projection_decals/hit_snow_slash_1",
			stone = "units/projection_decals/hit_stone_slash_1",
			stone_dirt = "units/projection_decals/hit_stone_slash_1",
			stone_wet = "units/projection_decals/hit_stone_slash_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_slash_1",
				"units/projection_decals/hit_cloth_slash_2",
			},
			flesh = {
				"units/projection_decals/hit_flesh_slash_1",
				"units/projection_decals/hit_flesh_slash_2",
				"units/projection_decals/hit_flesh_slash_3",
			},
			metal_hollow = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			armored = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			metal_solid = {
				"units/projection_decals/hit_metal_solid_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_solid_slash_3",
			},
			plaster = {
				"units/projection_decals/hit_plaster_slash_1",
				"units/projection_decals/hit_plaster_slash_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
		},
		settings = {
			depth = 0.6,
			depth_offset = -0.2,
			height = 0.1,
			width = 0.5,
		},
	},
	sound = {
		cloth = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
			},
		},
		dirt = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "dirt",
			},
		},
		flesh = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "glass",
			},
		},
		grass = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		hay = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "hay",
			},
		},
		ice = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "slashing_hit_shield_metal",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "mud",
			},
		},
		plaster = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "plaster",
			},
		},
		sand = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		stone = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "snow",
			},
		},
		water = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water",
			},
		},
		water_deep = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "sword_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_slash",
		dirt = "fx/hit_dirt_slash",
		flesh = "fx/hit_flesh_slash",
		forest_grass = "fx/hit_grass_slash",
		fruit = "fx/hit_fruit_slash",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_slash",
		hay = "fx/hit_hay_slash",
		ice = "fx/hit_ice_slash",
		metal_hollow = "fx/hit_metal_hollow_slash",
		metal_solid = "fx/hit_metal_solid_slash",
		mud = "fx/hit_dirt_slash",
		plaster = "fx/hit_plaster_slash",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_slash",
		stone = "fx/hit_stone_slash",
		stone_dirt = "fx/hit_stone_slash",
		stone_wet = "fx/hit_stone_slash",
		water = "fx/hit_water_slash",
		water_deep = "fx/hit_water_slash",
		wood_bridge = "fx/hit_wood_hollow_slash",
		wood_hollow = "fx/hit_wood_hollow_slash",
		wood_solid = "fx/hit_wood_solid_slash",
	},
})
MaterialEffectMappingsUtility.add("melee_hit_dagger", {
	decal = {
		material_drawer_mapping = {
			dirt = "units/projection_decals/hit_dirt_slash_1",
			forest_grass = "units/projection_decals/hit_grass_slash_1",
			fruit = "units/projection_decals/hit_fruit_slash_1",
			glass = "units/projection_decals/hit_glass_slash_1",
			grass = "units/projection_decals/hit_grass_slash_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_pierce_1",
			mud = "units/projection_decals/hit_dirt_slash_1",
			sand = "units/projection_decals/hit_sand_slash_1",
			snow = "units/projection_decals/hit_snow_slash_1",
			stone = "units/projection_decals/hit_stone_slash_1",
			stone_dirt = "units/projection_decals/hit_stone_slash_1",
			stone_wet = "units/projection_decals/hit_stone_slash_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_slash_1",
				"units/projection_decals/hit_cloth_slash_2",
			},
			flesh = {
				"units/projection_decals/hit_flesh_slash_1",
				"units/projection_decals/hit_flesh_slash_2",
				"units/projection_decals/hit_flesh_slash_3",
			},
			metal_hollow = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			armored = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			metal_solid = {
				"units/projection_decals/hit_metal_solid_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_solid_slash_3",
			},
			plaster = {
				"units/projection_decals/hit_plaster_slash_1",
				"units/projection_decals/hit_plaster_slash_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
		},
		settings = {
			depth = 0.6,
			depth_offset = -0.2,
			height = 0.04,
			width = 0.3,
		},
	},
	sound = {
		cloth = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
			},
		},
		dirt = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "dirt",
			},
		},
		flesh = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "glass",
			},
		},
		grass = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		hay = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "hay",
			},
		},
		ice = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "stab_hit_shield_wood",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "stab_hit_shield_metal",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "mud",
			},
		},
		plaster = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "plaster",
			},
		},
		sand = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		stone = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "snow",
			},
		},
		water = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water",
			},
		},
		water_deep = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "dagger_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_slash",
		dirt = "fx/hit_dirt_slash",
		flesh = "fx/hit_flesh_slash",
		forest_grass = "fx/hit_grass_slash",
		fruit = "fx/hit_fruit_slash",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_slash",
		hay = "fx/hit_hay_slash",
		ice = "fx/hit_ice_slash",
		metal_hollow = "fx/hit_metal_hollow_slash",
		metal_solid = "fx/hit_metal_solid_slash",
		mud = "fx/hit_dirt_slash",
		plaster = "fx/hit_plaster_slash",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_slash",
		stone = "fx/hit_stone_slash",
		stone_dirt = "fx/hit_stone_slash",
		stone_wet = "fx/hit_stone_slash",
		water = "fx/hit_water_slash",
		water_deep = "fx/hit_water_slash",
		wood_bridge = "fx/hit_wood_hollow_slash",
		wood_hollow = "fx/hit_wood_hollow_slash",
		wood_solid = "fx/hit_wood_solid_slash",
	},
})
MaterialEffectMappingsUtility.add("melee_hit_axes_2h", {
	decal = {
		material_drawer_mapping = {
			dirt = "units/projection_decals/hit_dirt_slash_1",
			forest_grass = "units/projection_decals/hit_grass_slash_1",
			fruit = "units/projection_decals/hit_fruit_slash_1",
			glass = "units/projection_decals/hit_glass_slash_1",
			grass = "units/projection_decals/hit_grass_slash_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_pierce_1",
			mud = "units/projection_decals/hit_dirt_slash_1",
			sand = "units/projection_decals/hit_sand_slash_1",
			snow = "units/projection_decals/hit_snow_slash_1",
			stone = "units/projection_decals/hit_stone_slash_1",
			stone_dirt = "units/projection_decals/hit_stone_slash_1",
			stone_wet = "units/projection_decals/hit_stone_slash_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_slash_1",
				"units/projection_decals/hit_cloth_slash_2",
			},
			flesh = {
				"units/projection_decals/hit_flesh_slash_1",
				"units/projection_decals/hit_flesh_slash_2",
				"units/projection_decals/hit_flesh_slash_3",
			},
			metal_hollow = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			armored = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			metal_solid = {
				"units/projection_decals/hit_metal_solid_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_solid_slash_3",
			},
			plaster = {
				"units/projection_decals/hit_plaster_slash_1",
				"units/projection_decals/hit_plaster_slash_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
		},
		settings = {
			depth = 0.6,
			depth_offset = -0.2,
			height = 0.04,
			width = 0.3,
		},
	},
	sound = {
		cloth = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
			},
		},
		dirt = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "dirt",
			},
		},
		flesh = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "glass",
			},
		},
		grass = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		hay = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "hay",
			},
		},
		ice = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "slashing_hit_shield_metal",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "mud",
			},
		},
		plaster = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "plaster",
			},
		},
		sand = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		stone = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "snow",
			},
		},
		water = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water",
			},
		},
		water_deep = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "axe_2h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_slash",
		dirt = "fx/hit_dirt_slash",
		flesh = "fx/hit_flesh_slash",
		forest_grass = "fx/hit_grass_slash",
		fruit = "fx/hit_fruit_slash",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_slash",
		hay = "fx/hit_hay_slash",
		ice = "fx/hit_ice_slash",
		metal_hollow = "fx/hit_metal_hollow_slash",
		metal_solid = "fx/hit_metal_solid_slash",
		mud = "fx/hit_dirt_slash",
		plaster = "fx/hit_plaster_slash",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_slash",
		stone = "fx/hit_stone_slash",
		stone_dirt = "fx/hit_stone_slash",
		stone_wet = "fx/hit_stone_slash",
		water = "fx/hit_water_slash",
		water_deep = "fx/hit_water_slash",
		wood_bridge = "fx/hit_wood_hollow_slash",
		wood_hollow = "fx/hit_wood_hollow_slash",
		wood_solid = "fx/hit_wood_solid_slash",
	},
})
MaterialEffectMappingsUtility.add("melee_hit_axes_1h", {
	decal = {
		material_drawer_mapping = {
			dirt = "units/projection_decals/hit_dirt_slash_1",
			forest_grass = "units/projection_decals/hit_grass_slash_1",
			fruit = "units/projection_decals/hit_fruit_slash_1",
			glass = "units/projection_decals/hit_glass_slash_1",
			grass = "units/projection_decals/hit_grass_slash_1",
			hay = "units/projection_decals/empty",
			ice = "units/projection_decals/hit_ice_pierce_1",
			mud = "units/projection_decals/hit_dirt_slash_1",
			sand = "units/projection_decals/hit_sand_slash_1",
			snow = "units/projection_decals/hit_snow_slash_1",
			stone = "units/projection_decals/hit_stone_slash_1",
			stone_dirt = "units/projection_decals/hit_stone_slash_1",
			stone_wet = "units/projection_decals/hit_stone_slash_1",
			water = "units/projection_decals/empty",
			water_deep = "units/projection_decals/empty",
			cloth = {
				"units/projection_decals/hit_cloth_slash_1",
				"units/projection_decals/hit_cloth_slash_2",
			},
			flesh = {
				"units/projection_decals/hit_flesh_slash_1",
				"units/projection_decals/hit_flesh_slash_2",
				"units/projection_decals/hit_flesh_slash_3",
			},
			metal_hollow = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			armored = {
				"units/projection_decals/hit_metal_hollow_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_hollow_slash_3",
			},
			metal_solid = {
				"units/projection_decals/hit_metal_solid_slash_1",
				"units/projection_decals/hit_metal_hollow_slash_2",
				"units/projection_decals/hit_metal_solid_slash_3",
			},
			plaster = {
				"units/projection_decals/hit_plaster_slash_1",
				"units/projection_decals/hit_plaster_slash_2",
			},
			wood_bridge = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_solid = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
			wood_hollow = {
				"units/projection_decals/hit_wood_slash_1",
				"units/projection_decals/hit_wood_slash_2",
				"units/projection_decals/hit_wood_slash_3",
			},
		},
		settings = {
			depth = 0.6,
			depth_offset = -0.2,
			height = 0.04,
			width = 0.3,
		},
	},
	sound = {
		cloth = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
			},
		},
		dirt = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "dirt",
			},
		},
		flesh = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "glass",
			},
		},
		grass = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		hay = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "hay",
			},
		},
		ice = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "slashing_hit_shield_metal",
			parameters = {
				damage_type = "slashing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "mud",
			},
		},
		plaster = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "plaster",
			},
		},
		sand = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "grass",
			},
		},
		stone = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "snow",
			},
		},
		water = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water",
			},
		},
		water_deep = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "axe_1h_hit_statics",
			parameters = {
				damage_type = "slashing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_slash",
		dirt = "fx/hit_dirt_slash",
		flesh = "fx/hit_flesh_slash",
		forest_grass = "fx/hit_grass_slash",
		fruit = "fx/hit_fruit_slash",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_slash",
		hay = "fx/hit_hay_slash",
		ice = "fx/hit_ice_slash",
		metal_hollow = "fx/hit_metal_hollow_slash",
		metal_solid = "fx/hit_metal_solid_slash",
		mud = "fx/hit_dirt_slash",
		plaster = "fx/hit_plaster_slash",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_slash",
		stone = "fx/hit_stone_slash",
		stone_dirt = "fx/hit_stone_slash",
		stone_wet = "fx/hit_stone_slash",
		water = "fx/hit_water_slash",
		water_deep = "fx/hit_water_slash",
		wood_bridge = "fx/hit_wood_hollow_slash",
		wood_hollow = "fx/hit_wood_hollow_slash",
		wood_solid = "fx/hit_wood_solid_slash",
	},
})
MaterialEffectMappingsUtility.add("melee_hit_hammers_2h", {
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
			height = 0.3,
			width = 0.5,
		},
	},
	sound = {
		cloth = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "blunt_hit_shield_wood",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "blunt_hit_shield_metal",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "hammer_2h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "hammer_2h_hit_statics",
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
})
MaterialEffectMappingsUtility.add("melee_hit_hammers_1h", {
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
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "blunt_hit_shield_wood",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "blunt_hit_shield_metal",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "hammer_1h_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "hammer_1h_hit_statics",
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
})
MaterialEffectMappingsUtility.add("melee_hit_torches_1h", {
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
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_weapon_fire_torch_flesh_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_weapon_fire_torch_armour_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "Play_weapon_fire_torch_wood_shield_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "Play_weapon_fire_torch_metal_shield_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "Play_weapon_fire_torch_material_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "Play_weapon_fire_torch_material_hit",
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
})
MaterialEffectMappingsUtility.add("bullet_impact", {
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
			height = 0.25,
			width = 0.25,
		},
	},
	sound = {
		cloth = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "bullet_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "bullet_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "bullet_hit_shield_wood",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "bullet_hit_shield_metal",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_pierce",
		dirt = "fx/hit_dirt_pierce",
		flesh = "fx/hit_metal_hollow_pierce",
		forest_grass = "fx/hit_grass_pierce",
		fruit = "fx/hit_fruit_pierce",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_pierce",
		hay = "fx/hit_hay_pierce",
		ice = "fx/hit_ice_pierce",
		metal_hollow = "fx/hit_metal_hollow_pierce",
		metal_solid = "fx/hit_metal_solid_pierce",
		mud = "fx/hit_mud_pierce",
		plaster = "fx/hit_plaster_pierce",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_pierce",
		stone = "fx/hit_stone_pierce",
		stone_dirt = "fx/hit_stone_pierce",
		stone_wet = "fx/hit_stone_pierce",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		water_deep = "fx/hit_snow_pierce",
		wood_bridge = "fx/hit_wood_hollow_pierce",
		wood_hollow = "fx/hit_wood_hollow_pierce",
		wood_solid = "fx/hit_wood_solid_pierce",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("bullet_critical_impact", {
	particles = {
		armored = "fx/wpnfx_range_crit_01",
		cloth = "fx/wpnfx_range_crit_01",
		dirt = "fx/wpnfx_range_crit_01",
		flesh = "fx/wpnfx_range_crit_01",
		forest_grass = "fx/wpnfx_range_crit_01",
		fruit = "fx/wpnfx_range_crit_01",
		glass = "fx/wpnfx_range_crit_01",
		grass = "fx/wpnfx_range_crit_01",
		hay = "fx/wpnfx_range_crit_01",
		ice = "fx/wpnfx_range_crit_01",
		metal_hollow = "fx/wpnfx_range_crit_01",
		metal_solid = "fx/wpnfx_range_crit_01",
		mud = "fx/wpnfx_range_crit_01",
		plaster = "fx/wpnfx_range_crit_01",
		sand = "fx/wpnfx_range_crit_01",
		shield = "fx/wpnfx_range_crit_01",
		shield_metal = "fx/wpnfx_range_crit_01",
		snow = "fx/wpnfx_range_crit_01",
		stone = "fx/wpnfx_range_crit_01",
		stone_dirt = "fx/wpnfx_range_crit_01",
		stone_wet = "fx/wpnfx_range_crit_01",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_range_crit_01",
		water_deep = "fx/wpnfx_range_crit_01",
		wood_bridge = "fx/wpnfx_range_crit_01",
		wood_hollow = "fx/wpnfx_range_crit_01",
		wood_solid = "fx/wpnfx_range_crit_01",
	},
})
MaterialEffectMappingsUtility.add("shotgun_bullet_impact", {
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
			depth = 1,
			depth_offset = 0.5,
			height = 0.2,
			width = 0.2,
		},
	},
	sound = {
		cloth = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "bullet_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "bullet_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "bullet_hit_shield_wood",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "bullet_hit_shield_metal",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_pierce",
		dirt = "fx/arrow_hit_dirt",
		flesh = "fx/arrow_hit_flesh",
		forest_grass = "fx/arrow_hit_generic",
		fruit = "fx/arrow_hit_generic",
		glass = "fx/hit_glass",
		grass = "fx/arrow_hit_generic",
		hay = "fx/hit_hay_pierce",
		ice = "fx/hit_ice_pierce",
		metal_hollow = "fx/arrow_hit_metal_hollow",
		metal_solid = "fx/arrow_hit_metal_solid",
		mud = "fx/arrow_hit_generic",
		plaster = "fx/arrow_hit_generic",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/arrow_hit_snow",
		stone = "fx/arrow_hit_stone",
		stone_dirt = "fx/arrow_hit_stone",
		stone_wet = "fx/arrow_hit_stone",
		water = "fx/hit_water_pierce",
		water_deep = "fx/hit_water_pierce",
		wood_bridge = "fx/arrow_hit_wood_hollow",
		wood_hollow = "fx/arrow_hit_wood_hollow",
		wood_solid = "fx/arrow_hit_wood_solid",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("nodecals", {
	sound = {
		cloth = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_bullet_hit_statics",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_pierce",
		dirt = "fx/hit_dirt_pierce",
		flesh = "fx/hit_metal_hollow_pierce",
		forest_grass = "fx/hit_grass_pierce",
		fruit = "fx/hit_fruit_pierce",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_pierce",
		hay = "fx/hit_hay_pierce",
		ice = "fx/hit_ice_pierce",
		metal_hollow = "fx/hit_metal_hollow_pierce",
		metal_solid = "fx/hit_metal_solid_pierce",
		mud = "fx/hit_mud_pierce",
		plaster = "fx/hit_plaster_pierce",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_pierce",
		stone = "fx/hit_stone_pierce",
		stone_dirt = "fx/hit_stone_pierce",
		stone_wet = "fx/hit_stone_pierce",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		water_deep = "fx/hit_snow_pierce",
		wood_bridge = "fx/hit_wood_hollow_pierce",
		wood_hollow = "fx/hit_wood_hollow_pierce",
		wood_solid = "fx/hit_wood_solid_pierce",
	},
	flow_event = {
		ward = "ward_impact",
	},
})
MaterialEffectMappingsUtility.add("ratling_gunner", {
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
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2",
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2",
			},
			water = {
				"units/projection_decals/empty",
			},
			water_deep = {
				"units/projection_decals/empty",
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
			height = 0.3,
			width = 0.3,
		},
	},
	sound = {
		cloth = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_bullet_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/impact_ratlinggun_default",
		dirt = "fx/impact_ratlinggun_default",
		flesh = "fx/hit_flesh_pierce",
		forest_grass = "fx/impact_ratlinggun_default",
		fruit = "fx/impact_ratlinggun_default",
		glass = "fx/impact_ratlinggun_default",
		grass = "fx/impact_ratlinggun_default",
		hay = "fx/impact_ratlinggun_default",
		ice = "fx/impact_ratlinggun_default",
		metal_hollow = "fx/impact_ratlinggun_default",
		metal_solid = "fx/impact_ratlinggun_default",
		mud = "fx/impact_ratlinggun_default",
		plaster = "fx/impact_ratlinggun_default",
		sand = "fx/impact_ratlinggun_default",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/impact_ratlinggun_default",
		stone = "fx/impact_ratlinggun_default",
		stone_dirt = "fx/impact_ratlinggun_default",
		stone_wet = "fx/impact_ratlinggun_default",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		water_deep = "fx/hit_snow_pierce",
		wood_bridge = "fx/impact_ratlinggun_default",
		wood_hollow = "fx/impact_ratlinggun_default",
		wood_solid = "fx/impact_ratlinggun_default",
	},
	flow_event = {
		ward = "ward_impact",
	},
})
MaterialEffectMappingsUtility.add("autocannon", {
	decal = {
		material_drawer_mapping = {
			cloth = {
				"units/projection_decals/ratlinggun_1",
			},
			dirt = {
				"units/projection_decals/ratlinggun_1",
			},
			flesh = {
				"units/projection_decals/ratlinggun_1",
			},
			forest_grass = {
				"units/projection_decals/ratlinggun_1",
			},
			fruit = {
				"units/projection_decals/ratlinggun_1",
			},
			glass = {
				"units/projection_decals/ratlinggun_1",
			},
			grass = {
				"units/projection_decals/ratlinggun_1",
			},
			hay = {
				"units/projection_decals/empty",
			},
			ice = {
				"units/projection_decals/ratlinggun_1",
			},
			mud = {
				"units/projection_decals/ratlinggun_1",
			},
			metal_solid = {
				"units/projection_decals/ratlinggun_1",
			},
			metal_hollow = {
				"units/projection_decals/ratlinggun_1",
			},
			armored = {
				"units/projection_decals/ratlinggun_1",
			},
			sand = {
				"units/projection_decals/ratlinggun_1",
			},
			stone = {
				"units/projection_decals/ratlinggun_1",
			},
			stone_dirt = {
				"units/projection_decals/ratlinggun_1",
			},
			stone_wet = {
				"units/projection_decals/ratlinggun_1",
			},
			snow = {
				"units/projection_decals/ratlinggun_1",
			},
			plaster = {
				"units/projection_decals/ratlinggun_1",
			},
			water = {
				"units/projection_decals/empty",
			},
			water_deep = {
				"units/projection_decals/empty",
			},
			wood_bridge = {
				"units/projection_decals/ratlinggun_1",
			},
			wood_solid = {
				"units/projection_decals/ratlinggun_1",
			},
			wood_hollow = {
				"units/projection_decals/ratlinggun_1",
			},
		},
		settings = {
			depth = 0.5,
			depth_offset = 0.5,
			height = 0.7,
			random_rotation = true,
			random_size_multiplier = 0.35,
			width = 0.7,
		},
	},
	sound = {
		cloth = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_weapon_autocannon_impact",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "Play_weapon_autocannon_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/impact_autocannon_default",
		dirt = "fx/impact_autocannon_default",
		flesh = "fx/hit_flesh_pierce",
		forest_grass = "fx/impact_autocannon_default",
		fruit = "fx/impact_autocannon_default",
		glass = "fx/impact_autocannon_default",
		grass = "fx/impact_autocannon_default",
		hay = "fx/impact_autocannon_default",
		ice = "fx/impact_autocannon_default",
		metal_hollow = "fx/impact_autocannon_default",
		metal_solid = "fx/impact_autocannon_default",
		mud = "fx/impact_autocannon_default",
		plaster = "fx/impact_autocannon_default",
		sand = "fx/impact_autocannon_default",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/impact_autocannon_default",
		stone = "fx/impact_autocannon_default",
		stone_dirt = "fx/impact_autocannon_default",
		stone_wet = "fx/impact_autocannon_default",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		water_deep = "fx/hit_snow_pierce",
		wood_bridge = "fx/impact_autocannon_default",
		wood_hollow = "fx/impact_autocannon_default",
		wood_solid = "fx/impact_autocannon_default",
	},
	flow_event = {
		ward = "ward_impact",
	},
})
MaterialEffectMappingsUtility.add("enemy_bullet_impact", {
	decal = {
		material_drawer_mapping = {
			cloth = {
				"units/projection_decals/hit_cloth_pierce_1",
				"units/projection_decals/hit_cloth_pierce_2",
			},
			dirt = {
				"units/projection_decals/hit_dirt_pierce_1",
			},
			flesh = {
				"units/projection_decals/hit_flesh_pierce_1",
			},
			forest_grass = {
				"units/projection_decals/hit_grass_pierce_1",
			},
			fruit = {
				"units/projection_decals/hit_fruit_pierce_1",
			},
			glass = {
				"units/projection_decals/hit_glass_pierce_1",
			},
			grass = {
				"units/projection_decals/hit_grass_pierce_1",
			},
			hay = {
				"units/projection_decals/empty",
			},
			ice = {
				"units/projection_decals/hit_ice_pierce_1",
			},
			mud = {
				"units/projection_decals/hit_dirt_pierce_1",
			},
			metal_solid = {
				"units/projection_decals/hit_metal_solid_pierce_1",
			},
			metal_hollow = {
				"units/projection_decals/hit_metal_hollow_pierce_1",
			},
			armored = {
				"units/projection_decals/hit_metal_hollow_pierce_1",
			},
			sand = {
				"units/projection_decals/hit_sand_pierce_1",
			},
			stone = {
				"units/projection_decals/hit_stone_pierce_1",
			},
			stone_dirt = {
				"units/projection_decals/hit_stone_pierce_1",
			},
			stone_wet = {
				"units/projection_decals/hit_stone_pierce_1",
			},
			snow = {
				"units/projection_decals/hit_snow_pierce_1",
			},
			plaster = {
				"units/projection_decals/hit_plaster_pierce_1",
				"units/projection_decals/hit_plaster_pierce_2",
			},
			water = {
				"units/projection_decals/empty",
			},
			water_deep = {
				"units/projection_decals/empty",
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
			height = 0.6,
			width = 0.6,
		},
	},
	sound = {
		cloth = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_bullet_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "enemy_bullet_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_pierce",
		dirt = "fx/hit_dirt_pierce",
		flesh = "fx/hit_metal_hollow_pierce",
		forest_grass = "fx/hit_grass_pierce",
		fruit = "fx/hit_fruit_pierce",
		glass = "fx/hit_glass",
		grass = "fx/hit_grass_pierce",
		hay = "fx/hit_hay_pierce",
		ice = "fx/hit_ice_pierce",
		metal_hollow = "fx/hit_metal_hollow_pierce",
		metal_solid = "fx/hit_metal_solid_pierce",
		mud = "fx/hit_mud_pierce",
		plaster = "fx/hit_plaster_pierce",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_pierce",
		stone = "fx/hit_stone_pierce",
		stone_dirt = "fx/hit_stone_pierce",
		stone_wet = "fx/hit_stone_pierce",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		water_deep = "fx/hit_snow_pierce",
		wood_bridge = "fx/hit_wood_hollow_pierce",
		wood_hollow = "fx/hit_wood_hollow_pierce",
		wood_solid = "fx/hit_wood_solid_pierce",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("drakefire_pistol", {
	sound = {
		armored = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		cloth = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "drakepistol_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "drakepistol_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored_with_fire",
		cloth = "fx/wpnfx_drake_pistols_projectile_impact",
		dirt = "fx/wpnfx_drake_pistols_projectile_impact",
		flesh = "fx/wpnfx_drake_pistols_projectile_impact",
		forest_grass = "fx/wpnfx_drake_pistols_projectile_impact",
		fruit = "fx/wpnfx_drake_pistols_projectile_impact",
		glass = "fx/wpnfx_drake_pistols_projectile_impact",
		grass = "fx/wpnfx_drake_pistols_projectile_impact",
		hay = "fx/wpnfx_drake_pistols_projectile_impact",
		ice = "fx/wpnfx_drake_pistols_projectile_impact",
		metal_hollow = "fx/wpnfx_drake_pistols_projectile_impact",
		metal_solid = "fx/wpnfx_drake_pistols_projectile_impact",
		mud = "fx/wpnfx_drake_pistols_projectile_impact",
		plaster = "fx/wpnfx_drake_pistols_projectile_impact",
		sand = "fx/wpnfx_drake_pistols_projectile_impact",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/wpnfx_drake_pistols_projectile_impact",
		stone = "fx/wpnfx_drake_pistols_projectile_impact",
		stone_dirt = "fx/wpnfx_drake_pistols_projectile_impact",
		stone_wet = "fx/wpnfx_drake_pistols_projectile_impact",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_water_with_fire_projectile",
		water_deep = "fx/hit_water_with_fire_projectile",
		wood_bridge = "fx/wpnfx_drake_pistols_projectile_impact",
		wood_hollow = "fx/wpnfx_drake_pistols_projectile_impact",
		wood_solid = "fx/wpnfx_drake_pistols_projectile_impact",
	},
	world_interaction = {
		water = {},
	},
	flow_event = {
		ward = "ward_impact",
	},
})
MaterialEffectMappingsUtility.add("sienna_scholar_career_ability", {
	sound = {
		armored = {
			event = "Play_weapon_ability_pyromancer_skull_attack_hit",
		},
		shield = {
			event = "Play_weapon_ability_pyromancer_skull_attack_hit",
		},
		shield_metal = {
			event = "Play_weapon_ability_pyromancer_skull_attack_hit",
		},
		cloth = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		dirt = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		flesh = {
			event = "Play_weapon_ability_pyromancer_skull_attack_hit",
		},
		fruit = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		forest_grass = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		glass = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		grass = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		hay = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		ice = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		metal_hollow = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		metal_solid = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		mud = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		plaster = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		sand = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		stone = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		stone_dirt = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		stone_wet = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		snow = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		water = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		water_deep = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		wood_bridge = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		wood_hollow = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
		wood_solid = {
			event = "Play_weapon_ability_pyromancer_skull_bounce",
		},
	},
	particles = {
		armored = "fx/hit_armored_with_fire",
		cloth = "fx/wpnfx_burning_head_impact",
		dirt = "fx/wpnfx_burning_head_impact",
		flesh = "fx/wpnfx_burning_head_impact",
		forest_grass = "fx/wpnfx_burning_head_impact",
		fruit = "fx/wpnfx_burning_head_impact",
		glass = "fx/wpnfx_burning_head_impact",
		grass = "fx/wpnfx_burning_head_impact",
		hay = "fx/wpnfx_burning_head_impact",
		ice = "fx/wpnfx_burning_head_impact",
		metal_hollow = "fx/wpnfx_burning_head_impact",
		metal_solid = "fx/wpnfx_burning_head_impact",
		mud = "fx/wpnfx_burning_head_impact",
		plaster = "fx/wpnfx_burning_head_impact",
		sand = "fx/wpnfx_burning_head_impact",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/wpnfx_burning_head_impact",
		stone = "fx/wpnfx_burning_head_impact",
		stone_dirt = "fx/wpnfx_burning_head_impact",
		stone_wet = "fx/wpnfx_burning_head_impact",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_water_with_fire_projectile",
		wood_bridge = "fx/wpnfx_burning_head_impact",
		wood_hollow = "fx/wpnfx_burning_head_impact",
		wood_solid = "fx/wpnfx_burning_head_impact",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("staff_spark", {
	sound = {
		armored = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		cloth = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "magic_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "magic_hit_statics",
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
		water = "fx/hit_water_with_fire_projectile",
		water_deep = "fx/hit_water_with_fire_projectile",
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
})
MaterialEffectMappingsUtility.add("staff_spear", {
	sound = {
		armored = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		cloth = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "magic_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "magic_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored_with_fire",
		cloth = "fx/wpnfx_staff_spear_impact",
		dirt = "fx/wpnfx_staff_spear_impact",
		flesh = "fx/wpnfx_staff_spear_impact",
		forest_grass = "fx/wpnfx_staff_spear_impact",
		fruit = "fx/wpnfx_staff_spear_impact",
		glass = "fx/wpnfx_staff_spear_impact",
		grass = "fx/wpnfx_staff_spear_impact",
		hay = "fx/wpnfx_staff_spear_impact",
		ice = "fx/wpnfx_staff_spear_impact",
		metal_hollow = "fx/wpnfx_staff_spear_impact",
		metal_solid = "fx/wpnfx_staff_spear_impact",
		mud = "fx/wpnfx_staff_spear_impact",
		plaster = "fx/wpnfx_staff_spear_impact",
		sand = "fx/wpnfx_staff_spear_impact",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/wpnfx_staff_spear_impact",
		stone = "fx/wpnfx_staff_spear_impact",
		stone_dirt = "fx/wpnfx_staff_spear_impact",
		stone_wet = "fx/wpnfx_staff_spear_impact",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_water_with_fire_projectile",
		wood_bridge = "fx/wpnfx_staff_spear_impact",
		wood_hollow = "fx/wpnfx_staff_spear_impact",
		wood_solid = "fx/wpnfx_staff_spear_impact",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("fireball_impact", {
	sound = {
		cloth = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "fireball_small_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "fireball_small_hit",
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
})
MaterialEffectMappingsUtility.add("drake_impact", {
	sound = {
		cloth = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "fireball_small_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "fireball_small_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored_with_fire",
		cloth = "fx/wpnfx_drake_spark_impact",
		dirt = "fx/wpnfx_drake_spark_impact",
		flesh = "fx/wpnfx_drake_spark_impact",
		forest_grass = "fx/wpnfx_drake_spark_impact",
		fruit = "fx/wpnfx_drake_spark_impact",
		glass = "fx/wpnfx_drake_spark_impact",
		grass = "fx/wpnfx_drake_spark_impact",
		hay = "fx/wpnfx_drake_spark_impact",
		ice = "fx/wpnfx_drake_spark_impact",
		metal_hollow = "fx/wpnfx_drake_spark_impact",
		metal_solid = "fx/wpnfx_drake_spark_impact",
		mud = "fx/wpnfx_drake_spark_impact",
		plaster = "fx/wpnfx_drake_spark_impact",
		sand = "fx/wpnfx_drake_spark_impact",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/wpnfx_drake_spark_impact",
		stone = "fx/wpnfx_drake_spark_impact",
		stone_dirt = "fx/wpnfx_drake_spark_impact",
		stone_wet = "fx/wpnfx_drake_spark_impact",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_drake_spark_impact",
		water_deep = "fx/wpnfx_drake_spark_impact",
		wood_bridge = "fx/wpnfx_drake_spark_impact",
		wood_hollow = "fx/wpnfx_drake_spark_impact",
		wood_solid = "fx/wpnfx_drake_spark_impact",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("flamethrower", {
	sound = {
		armored = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		cloth = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "flamethrower_hit_enemy",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "flamethrower_hit",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	world_interaction = {
		water = {},
	},
	flow_event = {
		ward = "ward_impact",
	},
})
MaterialEffectMappingsUtility.add("arrow_impact", {
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
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "arrow_hit",
			no_damage_event = "arrow_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "arrow_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "arrow_hit_shield_wood",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "arrow_hit_shield_metal",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/arrow_hit_cloth",
		dirt = "fx/arrow_hit_dirt",
		flesh = "fx/arrow_hit_flesh",
		forest_grass = "fx/hit_grass_pierce",
		fruit = "fx/arrow_hit_generic",
		glass = "fx/hit_glass",
		grass = "fx/arrow_hit_generic",
		hay = "fx/arrow_hit_generic",
		ice = "fx/arrow_hit_generic",
		metal_hollow = "fx/arrow_hit_metal_hollow",
		metal_solid = "fx/arrow_hit_metal_solid",
		mud = "fx/arrow_hit_generic",
		plaster = "fx/arrow_hit_generic",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/arrow_hit_snow",
		stone = "fx/arrow_hit_stone",
		stone_dirt = "fx/arrow_hit_stone",
		stone_wet = "fx/arrow_hit_stone",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/hit_snow_pierce",
		water_deep = "fx/hit_snow_pierce",
		wood_bridge = "fx/arrow_hit_wood_hollow",
		wood_hollow = "fx/arrow_hit_wood_hollow",
		wood_solid = "fx/arrow_hit_wood_solid",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("kerillian_ability_trueflight_arrow_impact", {
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
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "arrow_hit",
			no_damage_event = "arrow_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "arrow_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "arrow_hit_shield_wood",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "arrow_hit_shield_metal",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "arrow_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/impact_true_shot_ricochet",
		cloth = "fx/impact_true_shot_ricochet",
		dirt = "fx/impact_true_shot_ricochet",
		flesh = "fx/impact_true_shot_ricochet",
		forest_grass = "fx/impact_true_shot_ricochet",
		fruit = "fx/impact_true_shot_ricochet",
		glass = "fx/impact_true_shot_ricochet",
		grass = "fx/impact_true_shot_ricochet",
		hay = "fx/impact_true_shot_ricochet",
		ice = "fx/impact_true_shot_ricochet",
		metal_hollow = "fx/impact_true_shot_ricochet",
		metal_solid = "fx/impact_true_shot_ricochet",
		mud = "fx/impact_true_shot_ricochet",
		plaster = "fx/impact_true_shot_ricochet",
		sand = "fx/impact_true_shot_ricochet",
		shield = "fx/impact_true_shot_ricochet",
		shield_metal = "fx/impact_true_shot_ricochet",
		snow = "fx/impact_true_shot_ricochet",
		stone = "fx/impact_true_shot_ricochet",
		stone_dirt = "fx/impact_true_shot_ricochet",
		stone_wet = "fx/impact_true_shot_ricochet",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/impact_true_shot_ricochet",
		water_deep = "fx/impact_true_shot_ricochet",
		wood_bridge = "fx/impact_true_shot_ricochet",
		wood_hollow = "fx/impact_true_shot_ricochet",
		wood_solid = "fx/impact_true_shot_ricochet",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("poison_arrow_impact", {
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
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "poison_arrow_impact",
			no_damage_event = "arrow_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/wpnfx_poison_arrow_impact",
		cloth = "fx/wpnfx_poison_arrow_impact",
		dirt = "fx/wpnfx_poison_arrow_impact",
		flesh = "fx/wpnfx_poison_arrow_impact",
		forest_grass = "fx/wpnfx_poison_arrow_impact",
		fruit = "fx/wpnfx_poison_arrow_impact",
		glass = "fx/wpnfx_poison_arrow_impact",
		grass = "fx/wpnfx_poison_arrow_impact",
		hay = "fx/hit_hay_pierce",
		ice = "fx/hit_ice_pierce",
		metal_hollow = "fx/wpnfx_poison_arrow_impact",
		metal_solid = "fx/wpnfx_poison_arrow_impact",
		mud = "fx/wpnfx_poison_arrow_impact",
		plaster = "fx/wpnfx_poison_arrow_impact",
		sand = "fx/wpnfx_poison_arrow_impact",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/wpnfx_poison_arrow_impact",
		stone = "fx/wpnfx_poison_arrow_impact",
		stone_dirt = "fx/wpnfx_poison_arrow_impact",
		stone_wet = "fx/wpnfx_poison_arrow_impact",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_poison_arrow_impact",
		water_deep = "fx/wpnfx_poison_arrow_impact",
		wood_bridge = "fx/wpnfx_poison_arrow_impact",
		wood_hollow = "fx/wpnfx_poison_arrow_impact",
		wood_solid = "fx/wpnfx_poison_arrow_impact",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("poison_arrow_impact_small", {
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
			height = 0.6,
			width = 0.6,
		},
	},
	sound = {
		cloth = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "poison_arrow_impact",
			no_damage_event = "arrow_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "poison_arrow_impact",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/wpnfx_poison_arrow_impact_machinegun",
		cloth = "fx/wpnfx_poison_arrow_impact_machinegun",
		dirt = "fx/wpnfx_poison_arrow_impact_machinegun",
		flesh = "fx/wpnfx_poison_arrow_impact_machinegun",
		forest_grass = "fx/wpnfx_poison_arrow_impact_machinegun",
		fruit = "fx/wpnfx_poison_arrow_impact_machinegun",
		glass = "fx/wpnfx_poison_arrow_impact_machinegun",
		grass = "fx/wpnfx_poison_arrow_impact_machinegun",
		hay = "fx/wpnfx_poison_arrow_impact_machinegun",
		ice = "fx/wpnfx_poison_arrow_impact_machinegun",
		metal_hollow = "fx/wpnfx_poison_arrow_impact_machinegun",
		metal_solid = "fx/wpnfx_poison_arrow_impact_machinegun",
		mud = "fx/wpnfx_poison_arrow_impact_machinegun",
		plaster = "fx/wpnfx_poison_arrow_impact_machinegun",
		sand = "fx/wpnfx_poison_arrow_impact_machinegun",
		shield = "fx/wpnfx_poison_arrow_impact_machinegun",
		shield_metal = "fx/wpnfx_poison_arrow_impact_machinegun",
		snow = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone_dirt = "fx/wpnfx_poison_arrow_impact_machinegun",
		stone_wet = "fx/wpnfx_poison_arrow_impact_machinegun",
		ward = "fx/chr_stormvermin_champion_shield_dot",
		water = "fx/wpnfx_poison_arrow_impact_machinegun",
		water_deep = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_bridge = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_hollow = "fx/wpnfx_poison_arrow_impact_machinegun",
		wood_solid = "fx/wpnfx_poison_arrow_impact_machinegun",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("footstep_walk", {
	sound = {
		cloth = {
			event = "walk",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "walk",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "walk",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "walk",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "walk",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "walk",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "walk",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "walk",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "walk",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "walk",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "walk",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "walk",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "walk",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "walk",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "walk",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "walk",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "walk",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "walk",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "walk",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "walk",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "walk",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "walk",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "walk",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "walk",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "walk",
			parameters = {
				material = "puke",
			},
		},
	},
	particles = {
		armored = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		ice = "fx/footstep_walk_ice",
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		sand = "fx/footstep_walk_dirt",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/footstep_walk_snow",
		stone = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("footstep_sneak", {
	sound = {
		cloth = {
			event = "sneak",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "sneak",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "sneak",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "sneak",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "sneak",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "sneak",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "sneak",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "sneak",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "sneak",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "sneak",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "sneak",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "sneak",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "sneak",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "sneak",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "sneak",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "sneak",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "sneak",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "sneak",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "sneak",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "sneak",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "sneak",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "sneak",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "sneak",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "sneak",
			parameters = {
				material = "wood_hollow",
			},
		},
	},
	particles = {
		armored = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		ice = "fx/footstep_walk_ice",
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/footstep_walk_snow",
		stone = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
	},
})
MaterialEffectMappingsUtility.add("footstep_run", {
	sound = {
		cloth = {
			event = "run",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "run",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "run",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "run",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "run",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "run",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "run",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "run",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "run",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "run",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "run",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "run",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "run",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "run",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "run",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "run",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "run",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "run",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "run",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "run",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "run",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "run",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "run",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "run",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "run",
			parameters = {
				material = "puke",
			},
		},
	},
	particles = {
		armored = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		ice = "fx/footstep_walk_ice",
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		sand = "fx/footstep_walk_dirt",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/footstep_walk_snow",
		stone = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("footstep_jump", {
	sound = {
		cloth = {
			event = "jump",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "jump",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "jump",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "jump",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "jump",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "jump",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "jump",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "jump",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "jump",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "jump",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "jump",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "jump",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "jump",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "jump",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "jump",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "jump",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "jump",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "jump",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "jump",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "jump",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "jump",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "jump",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "jump",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "jump",
			parameters = {
				material = "wood_hollow",
			},
		},
	},
	particles = {
		armored = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		ice = "fx/footstep_walk_ice",
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/footstep_walk_snow",
		stone = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("footstep_land", {
	sound = {
		cloth = {
			event = "land",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "land",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "land",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "land",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "land",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "land",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "land",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "land",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "land",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "land",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "land",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "land",
			parameters = {
				material = "metal_hollow",
			},
		},
		shield = {
			event = "land",
			parameters = {
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "land",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "land",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "land",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "land",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "land",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "land",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "land",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "land",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "land",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "land",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "land",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "land",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "land",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "land",
			parameters = {
				material = "puke",
			},
		},
	},
	particles = {
		armored = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		ice = "fx/footstep_walk_ice",
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		sand = "fx/footstep_walk_dirt",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/footstep_walk_snow",
		stone = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("footstep_dodge", {
	sound = {
		cloth = {
			event = "dodge",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "dodge",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "dodge",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "dodge",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "dodge",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "dodge",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "dodge",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "dodge",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "dodge",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "dodge",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "dodge",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "dodge",
			parameters = {
				material = "metal_hollow",
			},
		},
		shield = {
			event = "dodge",
			parameters = {
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "dodge",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "dodge",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "dodge",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "dodge",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "dodge",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "dodge",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "dodge",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "dodge",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "dodge",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "dodge",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "dodge",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "dodge",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "dodge",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "dodge",
			parameters = {
				material = "puke",
			},
		},
	},
	particles = {
		armored = "fx/footstep_walk_dirt",
		cloth = "fx/footstep_walk_dirt",
		dirt = "fx/footstep_walk_dirt",
		flesh = "fx/footstep_walk_dirt",
		forest_grass = "fx/footstep_walk_dirt",
		fruit = "fx/footstep_walk_dirt",
		glass = "fx/footstep_walk_dirt",
		grass = "fx/footstep_walk_dirt",
		hay = "fx/footstep_walk_dirt",
		ice = "fx/footstep_walk_ice",
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		puke = "fx/footstep_walk_water",
		sand = "fx/footstep_walk_dirt",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/footstep_walk_snow",
		stone = "fx/footstep_walk_dirt",
		stone_dirt = "fx/footstep_walk_dirt",
		stone_wet = "fx/footstep_walk_dirt",
		water = "fx/footstep_walk_water",
		water_deep = "fx/footstep_walk_water",
		wood_bridge = "fx/footstep_walk_dirt",
		wood_hollow = "fx/footstep_walk_dirt",
		wood_solid = "fx/footstep_walk_dirt",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("grenade_bounce", {
	sound = {
		cloth = {
			event = "grenade_hit_statics",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "grenade_hit_statics",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "grenade_hit_statics",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "grenade_hit_statics",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "grenade_hit_statics",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "grenade_hit_statics",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "grenade_hit_statics",
			parameters = {
				material = "glass",
			},
		},
		metal_solid = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "grenade_hit_statics",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "grenade_hit_statics",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "grenade_hit_statics",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "grenade_hit_statics",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "water",
			},
		},
		water = {
			event = "grenade_hit_statics",
			parameters = {
				material = "water",
			},
		},
		wood_bridge = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "grenade_hit_statics",
			parameters = {
				material = "wood_hollow",
			},
		},
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("enemy_metal_shield_drop", {
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
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "enemy_foley_metal_shield_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "enemy_foley_metal_shield_drop",
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
})
MaterialEffectMappingsUtility.add("enemy_wood_shield_drop", {
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
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "enemy_foley_shield_wood_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "enemy_foley_shield_wood_drop",
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
})
MaterialEffectMappingsUtility.add("enemy_heavy_weapon_drop", {
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
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "Play_enemy_metal_weapon_heavy_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "Play_enemy_metal_weapon_heavy_drop",
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
})
MaterialEffectMappingsUtility.add("enemy_medium_weapon_drop", {
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
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "Play_enemy_metal_weapon_med_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "Play_enemy_metal_weapon_med_drop",
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
})
MaterialEffectMappingsUtility.add("enemy_light_weapon_drop", {
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
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "Play_enemy_metal_weapon_light_drop",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "Play_enemy_metal_weapon_light_drop",
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
})

MaterialIDToName = {}

for context_name, context_materials in pairs(MaterialEffectSettings.material_contexts) do
	MaterialIDToName[context_name] = {}

	for _, material_name in ipairs(context_materials) do
		MaterialIDToName[context_name][Unit.material_id(material_name)] = material_name
	end
end
