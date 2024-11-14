-- chunkname: @scripts/managers/conflict_director/breed_packs.lua

InterestPointUnits = {
	{
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_1pack",
		spawn_weight = 1,
	},
	{
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_2pack",
		spawn_weight = 2,
	},
	{
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_3pack",
		spawn_weight = 4,
	},
	{
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_4pack",
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_4pack_02",
		spawn_weight = 7,
	},
	[5] = false,
	[7] = false,
	[6] = {
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_6pack_01",
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_6pack_02",
		spawn_weight = 5,
	},
	[8] = {
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_8pack",
		spawn_weight = 2,
	},
}

local InterestPointUnits = InterestPointUnits

InterestPointSettings = {
	interest_point_spawn_chance = 0.5,
	max_rats_currently_moving_to_ip = 5,
}

local HEAVY_WEIGHT = 10
local MEDIUM_WEIGHT = 5
local LIGHT_WEIGHT = 2
local heavy_boys = {
	Breeds.chaos_warrior,
	Breeds.chaos_warrior,
	Breeds.chaos_bulwark,
}

BreedPacks = {
	standard = {
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
		},
		patrol_overrides = {
			patrol_chance = 1,
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		roof_spawning_allowed = true,
	},
	skaven_beastmen = {
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						12,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						3,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_2 = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						20,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_3 = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						20,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				versus_base = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						12,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						3,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						4,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_2 = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_3 = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				versus_base = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
			},
		},
		patrol_overrides = {
			patrol_chance = 1,
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		roof_spawning_allowed = true,
	},
	chaos_beastmen = {
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						12,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						2,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						2,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						2,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						3,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						3,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						3,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm = {
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						4,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						4,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						4,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						20,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_2 = {
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						4,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						4,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						4,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						20,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_3 = {
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						5,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						5,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						5,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						20,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				versus_base = {
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						12,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						0,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						2,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						2,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						2,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						3,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						3,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						3,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm = {
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						5,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						5,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						5,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_2 = {
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						5,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						5,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						5,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_3 = {
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						5,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						5,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						5,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						15,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				versus_base = {
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						1,
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						10,
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
			},
		},
		patrol_overrides = {
			patrol_chance = 1,
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		roof_spawning_allowed = true,
	},
	weave_no_elites = {
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
		},
		patrol_overrides = {
			patrol_chance = 1,
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 2,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = 2,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 4,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 4,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = 2.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 2,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		roof_spawning_allowed = true,
	},
	weave = {
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						7,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						7,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						5,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						5,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
		},
		patrol_overrides = {
			patrol_chance = 1,
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		roof_spawning_allowed = true,
	},
	standard_no_elites = {
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							6,
							8,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						{
							6,
							8,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							6,
							8,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						{
							6,
							8,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							6,
							8,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						{
							6,
							8,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							6,
							8,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						{
							6,
							8,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							4,
							5,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							4,
							5,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							4,
							5,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							4,
							5,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
		},
		patrol_overrides = {
			patrol_chance = 1,
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 2,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = 2,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 4,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 4,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = 2.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = 2,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		roof_spawning_allowed = true,
	},
	skaven = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hard = {
					{
						{
							2,
							3,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				harder = {
					{
						{
							5,
							6,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hardest = {
					{
						{
							12,
							14,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm = {
					{
						{
							12,
							14,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_2 = {
					{
						{
							12,
							14,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_3 = {
					{
						{
							12,
							14,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				versus_base = {
					{
						{
							2,
							3,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hard = {
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				harder = {
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hardest = {
					{
						{
							4,
							6,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm = {
					{
						{
							4,
							6,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_2 = {
					{
						{
							4,
							6,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_3 = {
					{
						{
							4,
							6,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				versus_base = {
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		roof_spawning_allowed = true,
	},
	shield_rats_no_elites = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						3,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hard = {
					{
						10,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				harder = {
					{
						12,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hardest = {
					{
						20,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm = {
					{
						20,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_2 = {
					{
						20,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_3 = {
					{
						20,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				versus_base = {
					{
						10,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						2,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hard = {
					{
						4,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				harder = {
					{
						6,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hardest = {
					{
						10,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm = {
					{
						10,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_2 = {
					{
						10,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_3 = {
					{
						10,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				versus_base = {
					{
						4,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		roof_spawning_allowed = true,
	},
	shield_rats = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						{
							2,
							3,
						},
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hard = {
					{
						{
							6,
							8,
						},
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				harder = {
					{
						{
							10,
							15,
						},
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							2,
							3,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							3,
							4,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hardest = {
					{
						100,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							4,
							5,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							5,
							7,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm = {
					{
						100,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							4,
							5,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							5,
							7,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_2 = {
					{
						100,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							4,
							5,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							5,
							7,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_3 = {
					{
						100,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							4,
							5,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							5,
							7,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				versus_base = {
					{
						{
							6,
							8,
						},
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						{
							0,
							1,
						},
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hard = {
					{
						{
							0,
							4,
						},
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				harder = {
					{
						{
							0,
							6,
						},
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hardest = {
					{
						100,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm = {
					{
						100,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_2 = {
					{
						100,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				cataclysm_3 = {
					{
						100,
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							1,
							2,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				versus_base = {
					{
						{
							0,
							4,
						},
						"skaven_clan_rat_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_with_shield",
						Breeds.skaven_clan_rat,
					},
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_with_shield,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
			},
		},
		roof_spawning_allowed = true,
	},
	plague_monks = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						2,
						"skaven_plague_monk",
						Breeds.skaven_clan_rat,
					},
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hard = {
					{
						{
							4,
							6,
						},
						"skaven_plague_monk",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				harder = {
					{
						{
							5,
							8,
						},
						"skaven_plague_monk",
						Breeds.skaven_clan_rat,
					},
					{
						3,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				versus_base = {
					{
						{
							4,
							6,
						},
						"skaven_plague_monk",
						Breeds.skaven_clan_rat,
					},
					{
						2,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						{
							0,
							1,
						},
						"skaven_plague_monk",
						Breeds.skaven_clan_rat,
					},
					{
						0,
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				hard = {
					{
						{
							0,
							3,
						},
						"skaven_plague_monk",
						Breeds.skaven_clan_rat,
					},
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				harder = {
					{
						{
							2,
							3,
						},
						"skaven_plague_monk",
						Breeds.skaven_clan_rat,
					},
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
				versus_base = {
					{
						{
							0,
							3,
						},
						"skaven_plague_monk",
						Breeds.skaven_clan_rat,
					},
					{
						{
							0,
							1,
						},
						"skaven_storm_vermin_commander",
						Breeds.skaven_clan_rat,
					},
				},
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
			},
		},
		roof_spawning_allowed = true,
	},
	marauders_and_warriors = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						1,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							2,
							3,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							15,
							20,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							2,
							3,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							15,
							20,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							2,
							3,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							15,
							20,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							2,
							3,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							15,
							20,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							2,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						0,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						0,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							8,
							10,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							8,
							10,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							8,
							10,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							8,
							10,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						0,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
				},
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				heavy_boys,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		roof_spawning_allowed = false,
	},
	marauders = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						{
							0,
							1,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						{
							0,
							1,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							2,
							3,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							6,
							8,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							2,
							3,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							6,
							8,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							2,
							3,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							6,
							8,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							2,
							3,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							6,
							8,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						{
							0,
							1,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						0,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						0,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						{
							0,
							1,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							1,
							2,
						},
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						0,
						"chaos_warrior",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_bulwark",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				heavy_boys,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		roof_spawning_allowed = false,
	},
	marauders_shields = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						{
							4,
							6,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						1,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						{
							6,
							8,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						{
							8,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							15,
							20,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							7,
							9,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							15,
							20,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							7,
							9,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							15,
							20,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							7,
							9,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							15,
							20,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							7,
							9,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						{
							6,
							8,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						{
							2,
							3,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						0,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						{
							3,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						{
							4,
							6,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							8,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							8,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							8,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							8,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						{
							3,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		roof_spawning_allowed = false,
	},
	marauders_berzerkers = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						{
							1,
							2,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						{
							4,
							5,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						{
							5,
							7,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						3,
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							10,
							12,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							10,
							12,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							10,
							12,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							10,
							12,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						{
							4,
							5,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						{
							0,
							1,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hard = {
					{
						{
							3,
							4,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				harder = {
					{
						{
							5,
							6,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				hardest = {
					{
						{
							6,
							7,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm = {
					{
						{
							6,
							7,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_2 = {
					{
						{
							6,
							7,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				cataclysm_3 = {
					{
						{
							6,
							7,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
				versus_base = {
					{
						{
							3,
							4,
						},
						"chaos_berzerker",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
				},
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_fanatic,
				Breeds.chaos_berzerker,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		roof_spawning_allowed = false,
	},
	marauders_elites = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						{
							1,
							2,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							0,
							1,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							1,
							2,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				hard = {
					{
						{
							3,
							4,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							0,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				harder = {
					{
						{
							5,
							6,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							1,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							4,
							6,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				hardest = {
					{
						{
							7,
							8,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							10,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				cataclysm = {
					{
						{
							7,
							8,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							10,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				cataclysm_2 = {
					{
						{
							7,
							8,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							10,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				cataclysm_3 = {
					{
						{
							7,
							8,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							4,
							5,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							10,
							12,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				versus_base = {
					{
						{
							3,
							4,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							0,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							5,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						{
							0,
							1,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							0,
							1,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							0,
							1,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				hard = {
					{
						{
							2,
							3,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							0,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				harder = {
					{
						{
							3,
							4,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							1,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							3,
							4,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				hardest = {
					{
						{
							4,
							5,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							2,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							6,
							8,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				cataclysm = {
					{
						{
							4,
							5,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							2,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							6,
							8,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				cataclysm_2 = {
					{
						{
							4,
							5,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							2,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							6,
							8,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				cataclysm_3 = {
					{
						{
							4,
							5,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							2,
							3,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							6,
							8,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
				versus_base = {
					{
						{
							2,
							3,
						},
						"chaos_berzerker",
						Breeds.chaos_fanatic,
					},
					{
						{
							0,
							2,
						},
						"chaos_raider",
						Breeds.chaos_marauder,
					},
					{
						{
							2,
							3,
						},
						"chaos_marauder_with_shield",
						Breeds.chaos_fanatic,
					},
				},
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_raider,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_raider,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = LIGHT_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_raider,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_raider,
				Breeds.chaos_raider,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
			},
		},
		roof_spawning_allowed = false,
	},
	beastmen = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						{
							1,
							1,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							8,
							10,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							10,
							12,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						{
							2,
							4,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
				},
				cataclysm = {
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
				},
				cataclysm_2 = {
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
				},
				cataclysm_3 = {
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
				},
				versus_base = {
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							8,
							10,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						{
							0,
							1,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							0,
							0,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						{
							0,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							3,
							5,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							3,
							4,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							3,
							5,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_2 = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_3 = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				versus_base = {
					{
						{
							0,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							3,
							5,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = MEDIUM_WEIGHT,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = HEAVY_WEIGHT,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		roof_spawning_allowed = true,
	},
	beastmen_elites = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							8,
							10,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							10,
							12,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						{
							2,
							4,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
				},
				cataclysm = {
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
				},
				cataclysm_2 = {
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
				},
				cataclysm_3 = {
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
				},
				versus_base = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							8,
							10,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						{
							0,
							1,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							0,
							0,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						{
							0,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							3,
							5,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							3,
							4,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							3,
							5,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_2 = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_3 = {
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				versus_base = {
					{
						{
							0,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							3,
							5,
						},
						"beastmen_ungor_archer",
						Breeds.beastmen_ungor,
					},
				},
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.beastmen_ungor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		roof_spawning_allowed = true,
	},
	beastmen_light = {
		patrol_overrides = {
			patrol_chance = 1,
		},
		zone_checks = {
			clamp_breeds_hi = {
				normal = {
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							0,
							1,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						{
							3,
							4,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							0,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							5,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						{
							5,
							6,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							1,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							4,
							6,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						{
							7,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							10,
							12,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm = {
					{
						{
							7,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							10,
							12,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_2 = {
					{
						{
							7,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							10,
							12,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_3 = {
					{
						{
							7,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							4,
							5,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							10,
							12,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				versus_base = {
					{
						{
							3,
							4,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							0,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							5,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
			},
			clamp_breeds_low = {
				normal = {
					{
						{
							1,
							2,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							0,
							1,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				hard = {
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							0,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				harder = {
					{
						{
							3,
							4,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							3,
							4,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				hardest = {
					{
						{
							4,
							5,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							1,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm = {
					{
						{
							4,
							5,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_2 = {
					{
						{
							4,
							5,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				cataclysm_3 = {
					{
						{
							4,
							5,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							6,
							8,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
				versus_base = {
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
					{
						{
							0,
							2,
						},
						"beastmen_bestigor",
						Breeds.beastmen_gor,
					},
					{
						{
							2,
							3,
						},
						"beastmen_gor",
						Breeds.beastmen_ungor,
					},
				},
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_ungor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor,
				Breeds.beastmen_bestigor,
			},
		},
		{
			spawn_weight = 5,
			members = {
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_ungor,
				Breeds.beastmen_bestigor,
				Breeds.beastmen_gor,
				Breeds.beastmen_gor,
			},
		},
		{
			spawn_weight = 10,
			members = {
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
				Breeds.beastmen_ungor_archer,
			},
		},
		roof_spawning_allowed = true,
	},
	code_test = {
		zone_checks = {
			clamp_breeds_hi = {
				hi = "HI ZONE",
				normal = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_poison_wind_globadier,
					},
				},
				versus_base = {},
			},
			clamp_breeds_low = {
				hi = "LOW ZONE",
				normal = {
					{
						1,
						"skaven_storm_vermin_commander",
						Breeds.skaven_ratling_gunner,
					},
				},
				versus_base = {},
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = 100,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_storm_vermin_commander,
			},
		},
		{
			spawn_weight = 1,
			members = {
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
				Breeds.skaven_loot_rat,
			},
		},
		roof_spawning_allowed = true,
	},
}
BackupBreedPack = {
	pack_type = "backup",
	spawn_weight = 0,
	members = {
		{
			breed = Breeds.skaven_clan_ratskaven_clan_rat,
			animation = {
				"idle",
				"idle_passive_sit",
			},
		},
	},
}

local function calc_num_in_packs(breed_packs, roaming_set_name)
	local num_breed_packs = #breed_packs

	for i = 1, num_breed_packs do
		local pack = breed_packs[i]
		local size = #pack.members

		fassert(InterestPointUnits[size], "The %d pack in BreedPacks[%s] is of size %d. There are no InterestPointUnits matching this size.", i, roaming_set_name, size)

		pack.members_n = size
	end

	return num_breed_packs
end

local function generate_breed_pack_by_size(breed_packs, roaming_set_name)
	local num_breed_packs = calc_num_in_packs(breed_packs, roaming_set_name)
	local breed_pack_by_size = {}
	local by_size = {}

	for i = 1, num_breed_packs do
		local pack = breed_packs[i]
		local size = pack.members_n

		if not by_size[size] then
			by_size[size] = {
				packs = {},
				weights = {},
			}
		end

		local slot = by_size[size]
		local packs = slot.packs

		packs[#packs + 1] = pack
		slot.weights[#slot.weights + 1] = pack.spawn_weight
	end

	for size, slot in pairs(by_size) do
		local prob, alias = LoadedDice.create(slot.weights, false)

		breed_pack_by_size[size] = {
			packs = slot.packs,
			prob = prob,
			alias = alias,
		}
	end

	return breed_pack_by_size
end

BreedPacksBySize = {}

for roaming_set_name, breed_packs in pairs(BreedPacks) do
	BreedPacksBySize[roaming_set_name] = generate_breed_pack_by_size(breed_packs, roaming_set_name)
end

InterestPointUnitsLookup = InterestPointUnitsLookup or false
SizeOfInterestPoint = SizeOfInterestPoint or {}
InterestPointPickListIndexLookup = InterestPointPickListIndexLookup or {}
InterestPointPickList = InterestPointPickList or false

if #InterestPointPickListIndexLookup == 0 then
	local weight_lookup = InterestPointPickList or {}
	local items = 0

	for i, data in ipairs(InterestPointUnits) do
		if data then
			for j = 1, data.spawn_weight do
				items = items + 1
				weight_lookup[items] = i
			end

			for j = 1, #data do
				local unit_name = data[j]

				SizeOfInterestPoint[unit_name] = i
			end

			InterestPointPickListIndexLookup[i] = items

			for roaming_set_name, breed_packs in pairs(BreedPacks) do
				fassert(BreedPacksBySize[roaming_set_name][i], "BreedPacks[%s] is missing a pack of size %d. It must be defined, since InterestPointUnits expects there to be a pack like that.", roaming_set_name, i)
			end
		else
			InterestPointPickListIndexLookup[i] = InterestPointPickListIndexLookup[#InterestPointPickListIndexLookup]
		end
	end

	InterestPointPickList = weight_lookup
end

for pack_name, pack_data in pairs(BreedPacks) do
	local zone_checks = pack_data.zone_checks
	local clamp_breeds_hi = zone_checks.clamp_breeds_hi

	fassert(not clamp_breeds_hi or clamp_breeds_hi.versus_base, "[BreedPacks] '%s' is missing a 'clamp_breeds_hi' setting for versus and won't be able to limit amount of breeds.", pack_name)

	local clamp_breeds_low = zone_checks.clamp_breeds_low

	fassert(not clamp_breeds_low or clamp_breeds_low.versus_base, "[BreedPacks] '%s' is missing a 'clamp_breeds_low' setting for versus and won't be able to limit amount of breeds.", pack_name)
end

BenchmarkSettings.demo_mode_overrides()
