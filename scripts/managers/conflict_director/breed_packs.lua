InterestPointUnits = {
	{
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_1pack",
		spawn_weight = 1
	},
	{
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_2pack",
		spawn_weight = 2
	},
	{
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_3pack",
		spawn_weight = 4
	},
	{
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_4pack",
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_4pack_02",
		spawn_weight = 7
	},
	[7.0] = false,
	[5.0] = false,
	[6] = {
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_6pack_01",
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_6pack_02",
		spawn_weight = 5
	},
	[8] = {
		"units/hub_elements/interest_points/pack_spawning/ai_interest_point_8pack",
		spawn_weight = 2
	}
}
local InterestPointUnits = InterestPointUnits
EncampmentTemplates = {
	{
		{
			y = 2,
			category = "light",
			x = 0,
			size = {
				8,
				2
			},
			dir = {
				0,
				1
			}
		},
		{
			y = 2,
			category = "light",
			x = 6,
			size = {
				2,
				3
			},
			dir = {
				0.3,
				1
			}
		},
		{
			y = 2,
			category = "light",
			x = -6,
			size = {
				2,
				3
			},
			dir = {
				-0.3,
				1
			}
		},
		{
			y = -1,
			x = 0,
			category = "heavy",
			size = {
				4,
				1
			}
		},
		{
			y = -1,
			x = -4,
			category = "special",
			size = {
				2,
				1
			}
		},
		{
			y = -1,
			x = 4,
			category = "special",
			size = {
				2,
				1
			}
		},
		unit_compositions = {
			{
				light = "skaven_clan_rat",
				special = "skaven_clan_rat_with_shield",
				heavy = "skaven_storm_vermin"
			},
			{
				light = "skaven_slave",
				special = "skaven_gutter_runner",
				heavy = "skaven_storm_vermin"
			}
		}
	},
	{
		{
			y = 0,
			category = "light",
			x = 0,
			size = {
				9,
				9
			},
			dir = {
				0,
				1
			}
		},
		unit_compositions = {
			{
				light = "skaven_clan_rat"
			},
			{
				light = "skaven_slave"
			}
		}
	},
	{
		{
			y = 0,
			category = "light",
			x = 4,
			size = {
				2,
				8
			},
			dir = {
				0,
				1
			}
		},
		{
			y = 0,
			category = "heavy",
			x = 0,
			size = {
				2,
				8
			},
			dir = {
				0,
				1
			}
		},
		{
			y = 0,
			category = "light",
			x = -4,
			size = {
				2,
				8
			},
			dir = {
				0,
				1
			}
		},
		unit_compositions = {
			{
				heavy = "skaven_storm_vermin",
				light = "skaven_clan_rat"
			}
		}
	}
}
InterestPointSettings = {
	max_rats_currently_moving_to_ip = 5,
	interest_point_spawn_chance = 0.5
}
BreedPacks = {
	standard = {
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 4,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 4,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 4,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		}
	},
	skaven = {
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 3.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2.5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_storm_vermin_commander
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		}
	},
	shield_rats = {
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.skaven_clan_rat_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_storm_vermin_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_storm_vermin_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.skaven_storm_vermin_commander,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield,
				Breeds.skaven_clan_rat_with_shield
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		}
	},
	plague_monks = {
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_plague_monk,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat,
				Breeds.skaven_clan_rat
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		}
	},
	marauders_and_warriors = {
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_warrior
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_warrior,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.chaos_warrior,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_warrior,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_warrior,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_warrior,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		},
		hi_zone_checks = {
			clamp_breeds = {
				normal = {
					{
						2,
						"chaos_warrior",
						Breeds.chaos_marauder
					}
				}
			}
		}
	},
	marauders = {
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 10,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_marauder,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		}
	},
	marauders_shields = {
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_marauder_with_shield,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		}
	},
	marauders_berzerkers = {
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_berzerker
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_fanatic,
				Breeds.chaos_berzerker
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_fanatic
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		}
	},
	marauders_elites = {
		{
			pack_type = "basic",
			spawn_weight = 1,
			members = {
				Breeds.chaos_marauder
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_fanatic,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_berzerker,
				Breeds.chaos_fanatic,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_berzerker
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 5,
			members = {
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_raider
			}
		},
		{
			pack_type = "basic",
			spawn_weight = 2,
			members = {
				Breeds.chaos_raider,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_fanatic,
				Breeds.chaos_berzerker,
				Breeds.chaos_berzerker,
				Breeds.chaos_raider
			}
		},
		patrol_overrides = {
			patrol_chance = 1
		}
	}
}
BackupBreedPack = {
	pack_type = "backup",
	spawn_weight = 0,
	members = {
		{
			breed = Breeds.skaven_clan_rat,
			animation = {
				"idle",
				"idle_passive_sit"
			}
		}
	}
}

local function calc_num_in_packs(breed_packs, roaming_set_name)
	local num_breed_packs = #breed_packs

	for i = 1, num_breed_packs, 1 do
		local pack = breed_packs[i]
		local size = #pack.members

		fassert(InterestPointUnits[size], "The %d pack in BreedPacks[%s] is of size %d. There are no InterestPointUnits matching this size.", i, roaming_set_name, size)

		pack.members_n = size
	end

	return num_breed_packs
end

local function generate_breed_pack_by_size(breed_packs, roaming_set_name)
	local num_breed_packs = calc_num_in_packs(breed_packs, roaming_set_name)

	assert("BreedPack of size have no matching interestpoint of that size.")

	local breed_pack_by_size = {}
	local by_size = {}

	for i = 1, num_breed_packs, 1 do
		local pack = breed_packs[i]
		local size = pack.members_n

		if not by_size[size] then
			by_size[size] = {
				packs = {},
				weights = {}
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
			alias = alias
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
			for j = 1, data.spawn_weight, 1 do
				items = items + 1
				weight_lookup[items] = i
			end

			for j = 1, #data, 1 do
				unit_name = data[j]
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

BenchmarkSettings.demo_mode_overrides()

return 
