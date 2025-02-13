-- chunkname: @scripts/settings/material_effect_mappings_anvil.lua

require("scripts/settings/material_effect_mappings_utility")
MaterialEffectMappingsUtility.add("throwing_axe", {
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
			rotation = 90,
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
			event = "Play_throwing_axe_1h",
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
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
