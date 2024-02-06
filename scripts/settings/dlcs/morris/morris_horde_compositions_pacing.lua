-- chunkname: @scripts/settings/dlcs/morris/morris_horde_compositions_pacing.lua

local morris_compositions = {
	curse_blood_for_the_blood_god_horde = {
		sound_settings = HordeCompositionsSoundSettings.chaos,
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_storm_vermin_commander",
				1,
				"skaven_clan_rat",
				{
					2,
					4,
				},
				"skaven_slave",
				{
					10,
					15,
				},
			},
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
					6,
				},
				"skaven_slave",
				{
					8,
					10,
				},
			},
		},
	},
}

return morris_compositions
