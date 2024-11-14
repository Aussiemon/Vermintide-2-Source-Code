-- chunkname: @scripts/managers/conflict_director/encampment_templates.lua

EncampmentTemplates = {
	{
		unit_compositions = {
			{
				heavy = "skaven_storm_vermin",
				light = "skaven_clan_rat",
				special = "skaven_clan_rat_with_shield",
			},
			{
				heavy = "skaven_storm_vermin",
				light = "skaven_slave",
				special = "skaven_gutter_runner",
			},
		},
		{
			category = "light",
			x = 0,
			y = 2,
			size = {
				8,
				2,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "light",
			x = 6,
			y = 2,
			size = {
				2,
				3,
			},
			dir = {
				0.3,
				1,
			},
		},
		{
			category = "light",
			x = -6,
			y = 2,
			size = {
				2,
				3,
			},
			dir = {
				-0.3,
				1,
			},
		},
		{
			category = "heavy",
			x = 0,
			y = -1,
			size = {
				4,
				1,
			},
		},
		{
			category = "special",
			x = -4,
			y = -1,
			size = {
				2,
				1,
			},
		},
		{
			category = "special",
			x = 4,
			y = -1,
			size = {
				2,
				1,
			},
		},
		name = "mix_36_skaven",
	},
	{
		unit_compositions = {
			{
				light = "skaven_clan_rat",
			},
			{
				light = "skaven_slave",
			},
		},
		{
			category = "light",
			x = 0,
			y = 0,
			size = {
				9,
				9,
			},
			dir = {
				0,
				1,
			},
		},
		name = "square_81_skaven",
	},
	{
		unit_compositions = {
			{
				heavy = "skaven_storm_vermin",
				light = "skaven_clan_rat",
			},
		},
		{
			category = "light",
			x = 4,
			y = 0,
			size = {
				2,
				8,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "heavy",
			x = 0,
			y = 0,
			size = {
				2,
				8,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "light",
			x = -4,
			y = 0,
			size = {
				2,
				8,
			},
			dir = {
				0,
				1,
			},
		},
		name = "mix_2x8_2x8_2x8",
	},
	{
		unit_compositions = {
			{
				heavy = "skaven_storm_vermin",
				light = "skaven_slave",
			},
		},
		{
			category = "light",
			x = 6,
			y = 0,
			size = {
				4,
				3,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "heavy",
			x = 0,
			y = 0,
			size = {
				8,
				2,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "light",
			x = -6,
			y = 0,
			size = {
				4,
				3,
			},
			dir = {
				0,
				1,
			},
		},
		name = "mix_4x3_8x2_4x3",
	},
	{
		unit_compositions = {
			{
				heavy = "skaven_storm_vermin",
				light = "skaven_clan_rat",
			},
		},
		{
			category = "light",
			x = 0,
			y = 0,
			size = {
				4,
				1,
			},
			dir = {
				0,
				1,
			},
		},
		name = "mix_4x1",
	},
	{
		unit_compositions = {
			{
				boss = "skaven_rat_ogre",
			},
		},
		{
			category = "boss",
			x = 0,
			y = 0,
			size = {
				4,
				1,
			},
			dir = {
				0,
				1,
			},
		},
		name = "boss_4x1",
	},
	{
		unit_compositions = {
			{
				heavy = "chaos_warrior",
				light = "chaos_fanatic",
				medium = "chaos_marauder",
			},
		},
		{
			category = "light",
			x = 6,
			y = 0,
			size = {
				4,
				3,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "heavy",
			x = 0,
			y = -3,
			size = {
				3,
				1,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "medium",
			x = 0,
			y = 0,
			size = {
				6,
				2,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "light",
			x = -6,
			y = 0,
			size = {
				4,
				3,
			},
			dir = {
				0,
				1,
			},
		},
		name = "chaos_mix_2x8_2x8_2x8",
	},
	{
		unit_compositions = {
			{
				light = "chaos_fanatic",
			},
			{
				light = "skaven_clan_rat",
			},
		},
		{
			category = "light",
			x = 0,
			y = 0,
			size = {
				6,
				1,
			},
			dir = {
				0,
				1,
			},
		},
		name = "chaos_fanatic_6x1",
	},
	{
		unit_compositions = {
			{
				light = "human_pleb",
				medium = "human_soldier",
			},
		},
		{
			category = "light",
			x = 0,
			y = 2,
			size = {
				6,
				1,
			},
			dir = {
				0,
				1,
			},
		},
		{
			category = "medium",
			x = 0,
			y = -1,
			size = {
				6,
				1,
			},
			dir = {
				0,
				1,
			},
		},
		name = "soldiers_and_plebs",
	},
}
