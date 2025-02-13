-- chunkname: @scripts/settings/material_effect_mappings_woods.lua

require("scripts/settings/material_effect_mappings_utility")
MaterialEffectMappingsUtility.add("life_impact", {
	sound = {
		cloth = {
			event = "weapon_life_staff_thorn_whip_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "weapon_life_staff_thorn_whip_hit",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "weapon_life_staff_thorn_whip_hit",
			no_damage_event = "bullet_hit_armour",
			parameters = {},
		},
		fruit = {
			event = "weapon_life_staff_thorn_whip_hit",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "weapon_life_staff_thorn_whip_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "thorn_whip_hit_static",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/lifestaff_impact",
		cloth = "fx/lifestaff_impact",
		dirt = "fx/lifestaff_impact",
		flesh = "fx/lifestaff_impact",
		forest_grass = "fx/lifestaff_impact",
		fruit = "fx/lifestaff_impact",
		glass = "fx/lifestaff_impact",
		grass = "fx/lifestaff_impact",
		hay = "fx/lifestaff_impact",
		ice = "fx/lifestaff_impact",
		metal_hollow = "fx/lifestaff_impact",
		metal_solid = "fx/lifestaff_impact",
		mud = "fx/lifestaff_impact",
		plaster = "fx/lifestaff_impact",
		sand = "fx/lifestaff_impact",
		shield = "fx/lifestaff_impact",
		shield_metal = "fx/lifestaff_impact",
		snow = "fx/lifestaff_impact",
		stone = "fx/lifestaff_impact",
		stone_dirt = "fx/lifestaff_impact",
		stone_wet = "fx/lifestaff_impact",
		ward = "fx/lifestaff_impact",
		water = "fx/lifestaff_impact",
		water_deep = "fx/lifestaff_impact",
		wood_bridge = "fx/lifestaff_impact",
		wood_hollow = "fx/lifestaff_impact",
		wood_solid = "fx/lifestaff_impact",
	},
	flow_event = {
		ward = "ward_impact",
	},
	world_interaction = {
		water = {},
	},
})
MaterialEffectMappingsUtility.add("throwing_javelin", {
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
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "javelin_throw_hit",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield = {
			event = "slashing_hit_shield_wood",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		shield_metal = {
			event = "javelin_throw_hit_armour",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		metal_solid = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "javelin_throw_hit_statics",
			parameters = {
				damage_type = "piercing",
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
