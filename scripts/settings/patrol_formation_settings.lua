-- chunkname: @scripts/settings/patrol_formation_settings.lua

require("scripts/settings/difficulty_settings")

local EMPTY = ""

PatrolFormationSettings = PatrolFormationSettings or {}
PatrolFormationSettings.default_settings = {
	sounds = {},
	offsets = {
		ANCHOR_OFFSET = {
			x = 1.4,
			y = 0.6,
		},
	},
	speeds = {
		FAST_WALK_SPEED = 2.6,
		MEDIUM_WALK_SPEED = 2.35,
		SLOW_SPLINE_SPEED = 0.1,
		SPLINE_SPEED = 2.22,
		WALK_SPEED = 2.12,
	},
}
PatrolFormationSettings.default_marauder_settings = {
	sounds = {
		CHARGE = "chaos_marauder_patrol_charge",
		FOLEY = "chaos_marauder_patrol_foley",
		FORMATE = "chaos_marauder_patrol_formate",
		FORMATED = "chaos_marauder_patrol_formated",
		FORMING = "chaos_marauder_patrol_forming",
		PLAYER_SPOTTED = "chaos_marauder_patrol_player_spotted",
		VOICE = "chaos_marauder_patrol_voice",
	},
	offsets = PatrolFormationSettings.default_settings.offsets,
	speeds = {
		FAST_WALK_SPEED = 2.6,
		MEDIUM_WALK_SPEED = 2.35,
		SLOW_SPLINE_SPEED = 0.1,
		SPLINE_SPEED = 2.22,
		WALK_SPEED = 2.12,
	},
}
PatrolFormationSettings.chaos_warrior_default = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_raider",
		},
		{
			"chaos_raider",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hard = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	harder = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	hardest = {
		{
			"chaos_raider",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	cataclysm = {
		{
			"chaos_raider",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
	},
}
PatrolFormationSettings.chaos_bulwark_default = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_raider",
		},
		{
			"chaos_raider",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_bulwark",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hard = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_bulwark",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_bulwark",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	harder = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	hardest = {
		{
			"chaos_raider",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	cataclysm = {
		{
			"chaos_raider",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_raider",
			"chaos_raider",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
	},
}
PatrolFormationSettings.chaos_bulwark = {
	normal = {
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
	},
	hard = {
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
	},
	harder = {
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
	},
	hardest = {
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
		{
			"chaos_bulwark",
			"chaos_bulwark",
		},
	},
}
PatrolFormationSettings.storm_vermin_two_column = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_clan_rat",
			"skaven_clan_rat",
		},
		{
			"skaven_clan_rat",
			"skaven_clan_rat",
		},
		{
			"skaven_clan_rat",
			"skaven_clan_rat",
		},
	},
	hard = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	harder = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	cataclysm = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
}
PatrolFormationSettings.storm_vermin_shields_infront = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_clan_rat",
			"skaven_clan_rat",
			"skaven_clan_rat",
			"skaven_clan_rat",
		},
	},
	hard = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	harder = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			EMPTY,
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			EMPTY,
		},
	},
	hardest = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
	},
	cataclysm = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
	},
}
PatrolFormationSettings.offset = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin",
		},
	},
	hard = {
		{
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
	},
	harder = {
		{
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
	},
	hardest = {
		{
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
	},
}
PatrolFormationSettings.single = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin",
		},
	},
	hard = {
		{
			"skaven_storm_vermin",
		},
	},
	harder = {
		{
			"skaven_storm_vermin",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin",
		},
	},
}
PatrolFormationSettings.one_chaos_troll = {
	normal = {
		{
			"chaos_troll",
		},
	},
	hard = {
		{
			"chaos_troll",
		},
	},
	harder = {
		{
			"chaos_troll",
		},
	},
	hardest = {
		{
			"chaos_troll",
		},
	},
}
PatrolFormationSettings.escorted_troll = {
	settings = {
		sounds = {
			CHARGE = "chaos_marauder_patrol_charge",
			FOLEY = "chaos_marauder_patrol_foley",
			FORMATE = "chaos_marauder_patrol_formate",
			FORMATED = "chaos_marauder_patrol_formated",
			FORMING = "chaos_marauder_patrol_forming",
			PLAYER_SPOTTED = "chaos_marauder_patrol_player_spotted",
			VOICE = "chaos_marauder_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_marauder_settings.speeds,
	},
	normal = {
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			"chaos_troll",
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hard = {
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			"chaos_troll",
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	harder = {
		{
			"chaos_marauder",
			"chaos_warrior",
			"chaos_marauder",
			"chaos_warrior",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			"chaos_troll",
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hardest = {
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			"chaos_troll",
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			"chaos_troll",
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			EMPTY,
			EMPTY,
			EMPTY,
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	},
}
PatrolFormationSettings.escorted_rat_ogre = {
	settings = {
		sounds = {
			CHARGE = "chaos_marauder_patrol_charge",
			FOLEY = "chaos_marauder_patrol_foley",
			FORMATE = "chaos_marauder_patrol_formate",
			FORMATED = "chaos_marauder_patrol_formated",
			FORMING = "chaos_marauder_patrol_forming",
			PLAYER_SPOTTED = "chaos_marauder_patrol_player_spotted",
			VOICE = "chaos_marauder_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_marauder_settings.speeds,
	},
	normal = {
		{
			"skaven_pack_master",
			"skaven_pack_master",
		},
		{
			"skaven_rat_ogre",
		},
		{
			"skaven_pack_master",
			"skaven_pack_master",
		},
	},
	hard = {
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_pack_master",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_pack_master",
			EMPTY,
			"skaven_rat_ogre",
			EMPTY,
			"skaven_pack_master",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_pack_master",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	harder = {
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_pack_master",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_pack_master",
			EMPTY,
			"skaven_rat_ogre",
			EMPTY,
			"skaven_pack_master",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_pack_master",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_pack_master",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			"skaven_rat_ogre",
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_pack_master",
			"skaven_storm_vermin",
			"skaven_pack_master",
			"skaven_storm_vermin",
			"skaven_pack_master",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			"skaven_rat_ogre",
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			EMPTY,
			EMPTY,
			EMPTY,
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_pack_master",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
}
PatrolFormationSettings.broad_line = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	hard = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	harder = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
}
PatrolFormationSettings.chaos_warrior = {
	normal = {
		{
			"chaos_warrior",
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
		},
	},
	hard = {
		{
			"chaos_warrior",
		},
	},
	harder = {
		{
			"chaos_warrior",
		},
	},
	hardest = {
		{
			"chaos_warrior",
		},
	},
}
PatrolFormationSettings.chaos_marauders = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_raider",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hard = {
		{
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	harder = {
		{
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hardest = {
		{
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
	},
}
PatrolFormationSettings.one_marauder = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_marauder",
		},
	},
	hard = {
		{
			"chaos_marauder",
		},
	},
	harder = {
		{
			"chaos_marauder",
		},
	},
	hardest = {
		{
			"chaos_marauder",
		},
	},
}
PatrolFormationSettings.one_chaos_warrior = {
	normal = {
		{
			"chaos_warrior",
		},
	},
	hard = {
		{
			"chaos_warrior",
		},
	},
	harder = {
		{
			"chaos_warrior",
		},
	},
	hardest = {
		{
			"chaos_warrior",
		},
	},
}
PatrolFormationSettings.massive = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	hard = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	harder = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
	},
}
PatrolFormationSettings.fatshark = {
	settings = {
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"                   ",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
		},
		{
			"                   ",
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
			"                   ",
		},
		{
			"skaven_storm_vermin",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"                   ",
			"skaven_storm_vermin",
		},
	},
}
PatrolFormationSettings.roaming_size_9 = {
	{
		"",
	},
	{
		"",
		"",
	},
	{
		"",
		"",
		"",
	},
	{
		"",
		"",
	},
	{
		"",
	},
}
PatrolFormationSettings.roaming_size_16 = {
	{
		"",
	},
	{
		"",
		"",
	},
	{
		"",
		"",
		"",
	},
	{
		"",
		"",
		"",
		"",
	},
	{
		"",
		"",
		"",
	},
	{
		"",
		"",
	},
	{
		"",
	},
}
PatrolFormationSettings.roaming_size_25 = {
	{
		"",
	},
	{
		"",
		"",
	},
	{
		"",
		"",
		"",
	},
	{
		"",
		"",
		"",
		"",
	},
	{
		"",
		"",
		"",
		"",
		"",
	},
	{
		"",
		"",
		"",
		"",
	},
	{
		"",
		"",
		"",
	},
	{
		"",
		"",
	},
	{
		"",
	},
}
PatrolFormationSettings.small_stormvermins = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	hard = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	harder = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	cataclysm = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
}
PatrolFormationSettings.small_stormvermins_long = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
	},
	hard = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
	},
	harder = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
	},
	cataclysm = {
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
		},
	},
}
PatrolFormationSettings.medium_stormvermins = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	hard = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	harder = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	cataclysm = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
}
PatrolFormationSettings.medium_stormvermins_wide = {
	settings = {
		extra_breed_name = "skaven_storm_vermin_with_shield",
		use_controlled_advance = true,
		sounds = {
			CHARGE = "storm_vermin_patrol_charge",
			FOLEY = "Play_stormvermin_patrol_foley",
			FOLEY_EXTRA = "Play_stormvermin_patrol_shield_foley",
			FORMATE = "storm_vermin_patrol_formate",
			FORMATED = "Play_stormvemin_patrol_formated",
			FORMING = "Play_stormvermin_patrol_forming",
			PLAYER_SPOTTED = "storm_vermin_patrol_player_spotted",
			VOICE = "Play_stormvermin_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_settings.speeds,
	},
	normal = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	hard = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	harder = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	hardest = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
	cataclysm = {
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
		},
		{
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
			"skaven_storm_vermin_with_shield",
		},
	},
}
PatrolFormationSettings.double_dragon = {
	normal = {
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
	},
	hard = {
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
	},
	harder = {
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
	},
	hardest = {
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
	},
}

local slaves = {
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
	{
		"skaven_slave",
		"skaven_slave",
		"skaven_slave",
	},
}

PatrolFormationSettings.skaven_slave_patrol = {
	settings = PatrolFormationSettings.default_settings,
	normal = slaves,
	hard = slaves,
	harder = slaves,
	hardest = slaves,
}
PatrolFormationSettings.chaos_warrior_small = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hard = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	harder = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hardest = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	cataclysm = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
}
PatrolFormationSettings.chaos_warrior_long = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	hard = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	harder = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	hardest = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	cataclysm = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
}
PatrolFormationSettings.chaos_warrior_wide = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	hard = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	harder = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	hardest = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	cataclysm = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
}
PatrolFormationSettings.prologue_skittergate_patrol = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	hard = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	harder = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	hardest = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
	cataclysm = {
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_warrior",
			"chaos_warrior",
		},
		{
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
			"chaos_marauder_with_shield",
		},
	},
}
PatrolFormationSettings.prologue_marauder = {
	settings = PatrolFormationSettings.default_marauder_settings,
	normal = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hard = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	harder = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	hardest = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
	cataclysm = {
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
		{
			"chaos_marauder",
			"chaos_marauder",
		},
	},
}
PatrolFormationSettings.human_soldier_long = {
	generate_from_normal = true,
	settings = {
		sounds = {
			CHARGE = "npc_human_patrol_charge",
			FOLEY = "chaos_marauder_patrol_foley",
			FORMATE = "npc_human_patrol_formate",
			FORMATED = "npc_human_patrol_formated",
			FORMING = "npc_human_patrol_forming",
			PLAYER_SPOTTED = "chaos_marauder_patrol_player_spotted",
			VOICE = "npc_human_patrol_voice",
		},
		offsets = PatrolFormationSettings.default_settings.offsets,
		speeds = PatrolFormationSettings.default_marauder_settings.speeds,
	},
	normal = {
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
		{
			"human_soldier",
			"human_soldier",
		},
	},
}

for name, data in pairs(PatrolFormationSettings) do
	if type(data) == "table" and data.generate_from_normal then
		data.hard = table.clone(data.normal)
		data.harder = table.clone(data.normal)
		data.hardest = table.clone(data.normal)
		data.hard = table.clone(data.normal)
		data.cataclysm = table.clone(data.normal)
	end
end

DLCUtils.merge("patrol_formation_settings", PatrolFormationSettings)
DLCUtils.merge("patrol_formations", PatrolFormationSettings)

PatrolFormationSettings.random_roaming_formation = function (breed_pack)
	local members = breed_pack.members
	local num_members = #members
	local formation_name

	formation_name = num_members > 9 and "roaming_size_25" or num_members > 4 and "roaming_size_16" or "roaming_size_9"

	local formation = table.clone(PatrolFormationSettings[formation_name])

	formation.speeds = {
		FAST_WALK_SPEED = 2,
		MEDIUM_WALK_SPEED = 1.9,
		SLOW_SPLINE_SPEED = 0.1,
		SPLINE_SPEED = 1.8,
		WALK_SPEED = 1.8,
	}

	local num_formation_slots = 0

	for _, row in ipairs(formation) do
		for _, column in ipairs(row) do
			num_formation_slots = num_formation_slots + 1
		end
	end

	local slots_left = num_formation_slots

	for _, breed in ipairs(members) do
		local slot = math.random(slots_left)
		local breed_name = breed.name
		local index = 0

		for _, row in ipairs(formation) do
			for j, column in ipairs(row) do
				local slot_is_free = column == ""

				if slot_is_free then
					index = index + 1

					if index == slot then
						row[j] = breed_name
						slots_left = slots_left - 1

						break
					end
				end
			end
		end
	end

	return formation
end
