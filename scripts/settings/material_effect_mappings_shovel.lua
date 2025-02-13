-- chunkname: @scripts/settings/material_effect_mappings_shovel.lua

require("scripts/settings/material_effect_mappings_utility")
MaterialEffectMappingsUtility.add("career_necro_skeleton_walk", {
	sound = {
		cloth = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water",
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
		snow = "fx/pawprint_walk_snow",
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
MaterialEffectMappingsUtility.add("career_necro_skeleton_run", {
	sound = {
		cloth = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water",
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
		snow = "fx/pawprint_walk_snow",
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
MaterialEffectMappingsUtility.add("career_necro_skeleton_land", {
	sound = {
		cloth = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "career_necro_skeleton_footstep",
			parameters = {
				material = "water",
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
		snow = "fx/pawprint_walk_snow",
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
