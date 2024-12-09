-- chunkname: @scripts/settings/material_effect_mappings_player_enemies.lua

MaterialEffectMappings = MaterialEffectMappings or {}
MaterialEffectMappings.enemy_footstep_walk = MaterialEffectMappings.enemy_footstep_walk or {
	sound = {
		cloth = {
			event = "enemy_walk",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_walk",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_walk",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "enemy_walk",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "enemy_walk",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "enemy_walk",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "enemy_walk",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "enemy_walk",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "enemy_walk",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "enemy_walk",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "enemy_walk",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "enemy_walk",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "enemy_walk",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_walk",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "enemy_walk",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "enemy_walk",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_walk",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_walk",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "enemy_walk",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "enemy_walk",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_walk",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_walk",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "enemy_walk",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "enemy_walk",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "enemy_walk",
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
}
MaterialEffectMappings.player_enemy_footstep_run = MaterialEffectMappings.player_enemy_footstep_run or {
	sound = {
		cloth = {
			event = "player_enemy_footstep",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "player_enemy_footstep",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "player_enemy_footstep",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "player_enemy_footstep",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "player_enemy_footstep",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "player_enemy_footstep",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "player_enemy_footstep",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "player_enemy_footstep",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "player_enemy_footstep",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "player_enemy_footstep",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "player_enemy_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "player_enemy_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "player_enemy_footstep",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "player_enemy_footstep",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "player_enemy_footstep",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "player_enemy_footstep",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "player_enemy_footstep",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "player_enemy_footstep",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "player_enemy_footstep",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "player_enemy_footstep",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "player_enemy_footstep",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "player_enemy_footstep",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "player_enemy_footstep",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "player_enemy_footstep",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "player_enemy_footstep",
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
}
MaterialEffectMappings.enemy_stormvermin_champion_footstep_run = MaterialEffectMappings.enemy_stormvermin_champion_footstep_run or {
	sound = {
		cloth = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "enemy_stormvermin_champion_run",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "enemy_stormvermin_champion_run",
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
}
MaterialEffectMappings.player_enemy_footstep_land = MaterialEffectMappings.player_enemy_footstep_land or {
	sound = {
		cloth = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "player_enemy_footstep_land",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "player_enemy_footstep_land",
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
}
MaterialEffectMappings.player_jump_land = MaterialEffectMappings.player_jump_land or {
	sound = {
		cloth = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "player_enemy_footstep_land_after_jump",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "player_enemy_footstep_land_after_jump",
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
}
MaterialEffectMappings.enemy_ratogre_run = {
	sound = {
		cloth = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "Play_vs_rat_ogre_footstep_run",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "Play_vs_rat_ogre_footstep_run",
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
		snow = "fx/pawprint_ogre_walk_snow",
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
}
MaterialEffectMappings.enemy_footstep_ratogre_land = MaterialEffectMappings.enemy_footstep_ratogre_land or {
	sound = {
		cloth = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "Play_vs_rat_ogre_land",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "Play_vs_rat_ogre_land",
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
		snow = "fx/pawprint_ogre_walk_snow",
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
}
MaterialEffectMappings.enemy_ratogre_slide = {
	sound = {
		cloth = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "glass",
			},
		},
		metal_solid = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "water",
			},
		},
		water = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "Play_vs_rat_ogre_slide",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "Play_vs_rat_ogre_slide",
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
		snow = "fx/pawprint_ogre_walk_snow",
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
}
MaterialEffectMappings.enemy_ratogre_footstep_single = {
	sound = {
		cloth = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "glass",
			},
		},
		metal_solid = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "water",
			},
		},
		water = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "Play_vs_rat_ogre_footstep_single",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "Play_vs_rat_ogre_footstep_single",
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
		snow = "fx/pawprint_ogre_walk_snow",
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
}
MaterialEffectMappings.enemy_stormfiend_footstep = {
	sound = {
		cloth = {
			event = "stormfiend_footstep",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "stormfiend_footstep",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "stormfiend_footstep",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "stormfiend_footstep",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "stormfiend_footstep",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "stormfiend_footstep",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "stormfiend_footstep",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "stormfiend_footstep",
			parameters = {
				material = "hay",
			},
		},
		metal_solid = {
			event = "stormfiend_footstep",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "stormfiend_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "stormfiend_footstep",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "stormfiend_footstep",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "stormfiend_footstep",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "stormfiend_footstep",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "stormfiend_footstep",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "stormfiend_footstep",
			parameters = {
				material = "stone_wet",
			},
		},
		water = {
			event = "stormfiend_footstep",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "stormfiend_footstep",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "stormfiend_footstep",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "stormfiend_footstep",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "stormfiend_footstep",
			parameters = {
				material = "wood_hollow",
			},
		},
		ice = {
			event = "stormfiend_footstep",
			parameters = {
				material = "ice",
			},
		},
		snow = {
			event = "stormfiend_footstep",
			parameters = {
				material = "snow",
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
}
MaterialEffectMappings.enemy_stormfiend_footstep_land = {
	sound = {
		cloth = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "hay",
			},
		},
		metal_solid = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "stone_wet",
			},
		},
		water = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "wood_hollow",
			},
		},
		ice = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "ice",
			},
		},
		snow = {
			event = "stormfiend_footstep_land",
			parameters = {
				material = "snow",
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
}
MaterialEffectMappings.ratling_land = {
	sound = {
		cloth = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "player_ratling_gunner_footstep_land",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "player_ratling_gunner_footstep_land",
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
}
MaterialEffectMappings.ratling_run = {
	sound = {
		cloth = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "player_ratling_gunner_footstep_run",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "player_ratling_gunner_footstep_run",
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
}
MaterialEffectMappings.globadier_land = {
	sound = {
		cloth = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "player_globadier_footstep_land",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "player_globadier_footstep_land",
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
}
MaterialEffectMappings.globadier_foot = {
	sound = {
		cloth = {
			event = "player_globadier_footstep",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "player_globadier_footstep",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "player_globadier_footstep",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "player_globadier_footstep",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "player_globadier_footstep",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "player_globadier_footstep",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "player_globadier_footstep",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "player_globadier_footstep",
			parameters = {
				material = "hay",
			},
		},
		ice = {
			event = "player_globadier_footstep",
			parameters = {
				material = "ice",
			},
		},
		metal_solid = {
			event = "player_globadier_footstep",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "player_globadier_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		armored = {
			event = "player_globadier_footstep",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "player_globadier_footstep",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "player_globadier_footstep",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "player_globadier_footstep",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "player_globadier_footstep",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "player_globadier_footstep",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "player_globadier_footstep",
			parameters = {
				material = "stone_wet",
			},
		},
		snow = {
			event = "player_globadier_footstep",
			parameters = {
				material = "snow",
			},
		},
		water = {
			event = "player_globadier_footstep",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "player_globadier_footstep",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "player_globadier_footstep",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "player_globadier_footstep",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "player_globadier_footstep",
			parameters = {
				material = "wood_hollow",
			},
		},
		puke = {
			event = "player_globadier_footstep",
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
}
MaterialEffectMappings.enemy_troll_footstep_single_vs = {
	sound = {
		cloth = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "hay",
			},
		},
		metal_solid = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "stone_wet",
			},
		},
		water = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "wood_hollow",
			},
		},
		ice = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "ice",
			},
		},
		snow = {
			event = "Play_vs_troll_footstep_walk",
			parameters = {
				material = "snow",
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
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
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
}
MaterialEffectMappings.enemy_troll_footstep_single_run_vs = {
	sound = {
		cloth = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "hay",
			},
		},
		metal_solid = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "stone_wet",
			},
		},
		water = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "wood_hollow",
			},
		},
		ice = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "ice",
			},
		},
		snow = {
			event = "Play_vs_troll_footstep_run",
			parameters = {
				material = "snow",
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
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
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
}
MaterialEffectMappings.enemy_troll_land_death = {
	sound = {
		cloth = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "cloth",
			},
		},
		dirt = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "dirt",
			},
		},
		flesh = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "flesh",
			},
		},
		forest_grass = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "forest_grass",
			},
		},
		fruit = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "fruit",
			},
		},
		grass = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "grass",
			},
		},
		glass = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "glass",
			},
		},
		hay = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "hay",
			},
		},
		metal_solid = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "metal_solid",
			},
		},
		metal_hollow = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "metal_hollow",
			},
		},
		mud = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "mud",
			},
		},
		plaster = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "stone",
			},
		},
		sand = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "sand",
			},
		},
		stone = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "stone",
			},
		},
		stone_dirt = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "stone_wet",
			},
		},
		water = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "water",
			},
		},
		water_deep = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "wood_bridge",
			},
		},
		wood_solid = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "wood_solid",
			},
		},
		wood_hollow = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "wood_hollow",
			},
		},
		ice = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "ice",
			},
		},
		snow = {
			event = "enemy_troll_land_death",
			parameters = {
				material = "snow",
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
		metal_hollow = "fx/footstep_walk_dirt",
		metal_solid = "fx/footstep_walk_dirt",
		mud = "fx/footstep_walk_dirt",
		plaster = "fx/footstep_walk_dirt",
		sand = "fx/footstep_walk_dirt",
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
}
MaterialEffectMappings.vs_chaos_troll_axe_light = {
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
		mud = "fx/hit_dirt_large",
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
MaterialEffectMappings.vs_chaos_troll_axe_heavy = {
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
		dirt = "fx/hit_dirt_large",
		flesh = "fx/hit_flesh_blunt",
		forest_grass = "fx/hit_dirt_large",
		fruit = "fx/hit_fruit_blunt",
		glass = "fx/hit_glass",
		grass = "fx/hit_dirt_large",
		hay = "fx/hit_hay_large",
		ice = "fx/hit_ice_blunt",
		metal_hollow = "fx/hit_metal_hollow_blunt",
		metal_solid = "fx/hit_metal_solid_blunt",
		mud = "fx/hit_dirt_large",
		plaster = "fx/hit_plaster_blunt",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_blunt",
		stone = "fx/hit_stone_large",
		stone_dirt = "fx/hit_stone_large",
		stone_wet = "fx/hit_stone_large",
		water = "fx/hit_water_large",
		water_deep = "fx/hit_water_large",
		wood_bridge = "fx/hit_wood_large",
		wood_hollow = "fx/hit_wood_large",
		wood_solid = "fx/hit_wood_large",
	},
}
MaterialEffectMappings.vs_rat_ogre_light = {
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
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
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
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
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
		mud = "fx/hit_dirt_large",
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
MaterialEffectMappings.vs_rat_ogre_heavy = {
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
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
			},
		},
		dirt = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "dirt",
			},
		},
		flesh = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "cloth",
				weapon_type = "1h_sword",
			},
		},
		fruit = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "fruit",
			},
		},
		forest_grass = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "forest_grass",
			},
		},
		glass = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "glass",
			},
		},
		grass = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		hay = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "hay",
			},
		},
		ice = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "ice",
			},
		},
		metal_hollow = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "metal_hollow",
			},
		},
		armored = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
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
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "metal_solid",
			},
		},
		mud = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "mud",
			},
		},
		plaster = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "plaster",
			},
		},
		sand = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "grass",
			},
		},
		stone = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "stone",
			},
		},
		stone_dirt = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "stone_dirt",
			},
		},
		stone_wet = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "stone_wet",
			},
		},
		snow = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "snow",
			},
		},
		water = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "water",
			},
		},
		water_deep = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "water_deep",
			},
		},
		wood_bridge = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "wood_bridge",
			},
		},
		wood_hollow = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "wood_hollow",
			},
		},
		wood_solid = {
			event = "Play_vs_rat_ogre_special_attack_combo_3p",
			parameters = {
				damage_type = "piercing",
				material = "wood_solid",
			},
		},
	},
	particles = {
		armored = "fx/hit_armored",
		cloth = "fx/hit_cloth_blunt",
		dirt = "fx/hit_dirt_large",
		flesh = "fx/hit_flesh_blunt",
		forest_grass = "fx/hit_dirt_large",
		fruit = "fx/hit_fruit_blunt",
		glass = "fx/hit_glass",
		grass = "fx/hit_dirt_large",
		hay = "fx/hit_hay_large",
		ice = "fx/hit_ice_blunt",
		metal_hollow = "fx/hit_metal_hollow_blunt",
		metal_solid = "fx/hit_metal_solid_blunt",
		mud = "fx/hit_dirt_large",
		plaster = "fx/hit_plaster_blunt",
		sand = "fx/hit_sand",
		shield = "fx/hit_enemy_shield",
		shield_metal = "fx/hit_enemy_shield_metal",
		snow = "fx/hit_snow_blunt",
		stone = "fx/hit_stone_large",
		stone_dirt = "fx/hit_stone_large",
		stone_wet = "fx/hit_stone_large",
		water = "fx/hit_water_large",
		water_deep = "fx/hit_water_large",
		wood_bridge = "fx/hit_wood_large",
		wood_hollow = "fx/hit_wood_large",
		wood_solid = "fx/hit_wood_large",
	},
}
