HordeCompositionsSoundSettings = {
	skaven = {
		stinger_sound_event = "enemy_horde_stinger",
		music_states = {
			horde = "horde"
		}
	},
	chaos = {
		stinger_sound_event = "enemy_horde_chaos_stinger",
		music_states = {
			pre_ambush = "pre_ambush_chaos",
			horde = "horde_chaos"
		}
	}
}
HordeCompositions.small = {
	{
		name = "plain",
		weight = 7,
		breeds = {
			"skaven_slave",
			{
				20,
				22
			}
		}
	},
	sound_settings = HordeCompositionsSoundSettings.skaven
}
HordeCompositions.medium = {
	{
		name = "plain",
		weight = 7,
		breeds = {
			"skaven_slave",
			{
				35,
				40
			}
		}
	},
	sound_settings = HordeCompositionsSoundSettings.skaven
}
HordeCompositions.large = {
	{
		name = "plain",
		weight = 7,
		breeds = {
			"skaven_slave",
			{
				50,
				55
			}
		}
	},
	sound_settings = HordeCompositionsSoundSettings.skaven
}
HordeCompositions.mini_patrol = {
	{
		name = "few_clanrats",
		weight = 2,
		breeds = {
			"skaven_clan_rat_with_shield",
			{
				2,
				3
			}
		}
	},
	{
		name = "few_clanrats",
		weight = 10,
		breeds = {
			"skaven_clan_rat",
			{
				3,
				4
			}
		}
	},
	{
		name = "storm_clanrats",
		weight = 3,
		breeds = {
			"skaven_clan_rat",
			{
				2,
				3
			},
			"skaven_storm_vermin_commander",
			{
				1,
				1
			}
		}
	}
}
HordeCompositions.chaos_medium = {
	{
		name = "plain",
		weight = 7,
		breeds = {
			"chaos_fanatic",
			{
				20,
				20
			}
		}
	},
	{
		name = "plain",
		weight = 7,
		breeds = {
			"chaos_marauder",
			{
				3,
				4
			},
			"chaos_fanatic",
			{
				15,
				20
			}
		}
	},
	sound_settings = HordeCompositionsSoundSettings.chaos
}
HordeCompositions.chaos_large = {
	{
		name = "plain",
		weight = 7,
		breeds = {
			"chaos_marauder",
			{
				5,
				6
			},
			"chaos_fanatic",
			{
				20,
				25
			}
		}
	},
	{
		name = "plain",
		weight = 7,
		breeds = {
			"chaos_fanatic",
			{
				25,
				30
			}
		}
	},
	sound_settings = HordeCompositionsSoundSettings.chaos
}
HordeCompositions.chaos_mini_patrol = {
	{
		name = "few_marauders",
		weight = 10,
		breeds = {
			"chaos_marauder",
			{
				2,
				3
			}
		}
	}
}

return
