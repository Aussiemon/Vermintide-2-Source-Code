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
	},
	beastmen = {
		stinger_sound_event = "enemy_horde_beastmen_stinger",
		music_states = {
			pre_ambush = "pre_ambush_beastmen",
			horde = "horde_beastmen"
		}
	}
}
HordeCompositionsPacing = {
	small = {
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
	},
	medium = {
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
	},
	large = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_slave",
				{
					48,
					52
				},
				"skaven_clan_rat",
				{
					4,
					5
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.skaven
	},
	huge = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_slave",
				{
					42,
					48
				},
				"skaven_clan_rat",
				{
					14,
					16
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.skaven
	},
	huge_shields = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_slave",
				{
					42,
					48
				},
				"skaven_clan_rat",
				{
					8,
					10
				},
				"skaven_clan_rat_with_shield",
				{
					4,
					5
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.skaven
	},
	huge_armor = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_slave",
				{
					38,
					42
				},
				"skaven_clan_rat",
				{
					8,
					10
				},
				"skaven_storm_vermin_commander",
				{
					4,
					5
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.skaven
	},
	huge_berzerker = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"skaven_slave",
				{
					35,
					38
				},
				"skaven_clan_rat",
				{
					8,
					10
				},
				"skaven_plague_monk",
				{
					3,
					4
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.skaven
	},
	mini_patrol = {
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
	},
	chaos_medium = {
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
	},
	chaos_large = {
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
	},
	chaos_huge = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"chaos_fanatic",
				{
					24,
					26
				},
				"chaos_marauder",
				{
					10,
					12
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	},
	chaos_huge_shields = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"chaos_fanatic",
				{
					20,
					22
				},
				"chaos_marauder",
				{
					10,
					12
				},
				"chaos_marauder_with_shield",
				{
					4,
					5
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	},
	chaos_huge_armor = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"chaos_fanatic",
				{
					20,
					22
				},
				"chaos_marauder",
				{
					10,
					12
				},
				"chaos_raider",
				{
					4,
					5
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	},
	chaos_huge_berzerker = {
		{
			name = "berzerk",
			weight = 3,
			breeds = {
				"chaos_marauder",
				{
					8,
					10
				},
				"chaos_fanatic",
				{
					20,
					25
				},
				"chaos_berzerker",
				{
					3,
					4
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	},
	chaos_mini_patrol = {
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
	},
	weave_berzerker_patrol = {
		{
			name = "few_berzerkers",
			weight = 10,
			breeds = {
				"chaos_berzerker",
				{
					5,
					5
				}
			}
		}
	},
	beastmen_medium = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"beastmen_gor",
				{
					12,
					14
				},
				"beastmen_ungor",
				{
					5,
					7
				}
			}
		},
		{
			name = "plain",
			weight = 7,
			breeds = {
				"beastmen_gor",
				{
					7,
					9
				},
				"beastmen_ungor",
				{
					8,
					10
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.beastmen
	},
	beastmen_large = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"beastmen_gor",
				{
					16,
					18
				},
				"beastmen_ungor",
				{
					5,
					7
				}
			}
		},
		{
			name = "plain",
			weight = 7,
			breeds = {
				"beastmen_gor",
				{
					12,
					14
				},
				"beastmen_ungor",
				{
					8,
					10
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.beastmen
	},
	beastmen_huge = {
		{
			name = "plain",
			weight = 7,
			breeds = {
				"beastmen_gor",
				{
					20,
					22
				},
				"beastmen_ungor",
				{
					10,
					12
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.beastmen
	},
	beastmen_huge_armor = {
		{
			name = "elite_mix",
			weight = 4,
			breeds = {
				"beastmen_gor",
				{
					20,
					22
				},
				"beastmen_ungor",
				{
					10,
					12
				},
				"beastmen_bestigor",
				{
					2,
					3
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.beastmen
	},
	beastmen_mini_patrol = {
		{
			name = "few_archers",
			weight = 2,
			breeds = {
				"beastmen_ungor_archer",
				{
					3,
					5
				}
			}
		},
		{
			name = "few_gors",
			weight = 1,
			breeds = {
				"beastmen_gor",
				{
					2,
					3
				}
			}
		},
		{
			name = "few_ungors",
			weight = 3,
			breeds = {
				"beastmen_ungor",
				{
					3,
					5
				}
			}
		}
	},
	mutator_chaos_warrior_mini_patrol = {
		{
			name = "few_chaos_warriors",
			weight = 10,
			breeds = {
				"chaos_warrior",
				{
					3,
					4
				}
			}
		}
	},
	mutator_mixed_horde = {
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
					5,
					6
				},
				"chaos_marauder_with_shield",
				{
					2,
					3
				},
				"chaos_warrior",
				{
					1,
					2
				},
				"skaven_storm_vermin_with_shield",
				1,
				"chaos_berzerker",
				{
					2,
					3
				},
				"skaven_storm_vermin_commander",
				{
					3,
					3
				},
				"skaven_clan_rat",
				{
					5,
					6
				},
				"skaven_slave",
				{
					5,
					6
				},
				"skaven_plague_monk",
				{
					2,
					3
				}
			}
		},
		sound_settings = HordeCompositionsSoundSettings.chaos
	}
}
HordeWaveCompositions = {
	skaven_huge = {
		"huge"
	},
	skaven_huge_shields = {
		"huge",
		"huge_shields"
	},
	skaven_huge_armor = {
		"huge",
		"huge_armor"
	},
	skaven_huge_berzerker = {
		"huge",
		"huge_berzerker"
	},
	chaos_huge = {
		"chaos_huge"
	},
	chaos_huge_shields = {
		"chaos_huge",
		"chaos_huge_shields"
	},
	chaos_huge_armor = {
		"chaos_huge",
		"chaos_huge_armor"
	},
	chaos_huge_berzerker = {
		"chaos_huge",
		"chaos_huge_berzerker"
	},
	beastmen_huge = {
		"beastmen_huge"
	},
	beastmen_huge_armor = {
		"beastmen_huge",
		"beastmen_huge_armor"
	}
}

return
