local morris_compositions = {
	curse_blood_for_the_blood_god_horde = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_storm_vermin_commander",
				1,
				"skaven_clan_rat",
				{
					2,
					4
				},
				"skaven_slave",
				{
					10,
					15
				}
			}
		},
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_storm_vermin_commander",
				1,
				"skaven_clan_rat",
				{
					4,
					6
				},
				"skaven_slave",
				{
					8,
					10
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	}
}

return morris_compositions
