local DEFAULT_BOSS_RANGE = {
	{
		max = 94,
		min = 43
	},
	{
		max = 80,
		min = 37
	},
	{
		max = 68,
		min = 32
	},
	{
		max = 58,
		min = 28
	}
}
local DEFAULT_RANGE = {
	{
		max = 44,
		min = 23
	},
	{
		max = 36,
		min = 19
	},
	{
		max = 29,
		min = 16
	},
	{
		max = 23,
		min = 13
	}
}
DeusSoftCurrencySettings = DeusSoftCurrencySettings or {
	loot_amount = {
		["n/a"] = DEFAULT_RANGE,
		beastmen_minotaur = DEFAULT_BOSS_RANGE,
		chaos_exalted_champion_norsca = DEFAULT_BOSS_RANGE,
		chaos_exalted_champion_warcamp = DEFAULT_BOSS_RANGE,
		chaos_exalted_sorcerer = DEFAULT_BOSS_RANGE,
		chaos_exalted_sorcerer_drachenfels = DEFAULT_BOSS_RANGE,
		chaos_spawn = DEFAULT_BOSS_RANGE,
		chaos_spawn_exalted_champion_warcamp = DEFAULT_BOSS_RANGE,
		chaos_troll = DEFAULT_BOSS_RANGE,
		skaven_grey_seer = DEFAULT_BOSS_RANGE,
		skaven_rat_ogre = DEFAULT_BOSS_RANGE,
		skaven_storm_vermin_champion = DEFAULT_BOSS_RANGE,
		skaven_storm_vermin_warlord = DEFAULT_BOSS_RANGE,
		skaven_stormfiend = DEFAULT_BOSS_RANGE,
		skaven_stormfiend_boss = DEFAULT_BOSS_RANGE,
		skaven_loot_rat = DEFAULT_BOSS_RANGE
	},
	types = {
		GROUND = 1,
		MONSTER = 2
	}
}

return
