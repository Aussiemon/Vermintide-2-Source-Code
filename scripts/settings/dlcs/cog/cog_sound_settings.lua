-- chunkname: @scripts/settings/dlcs/cog/cog_sound_settings.lua

local settings = DLCSettings.cog

settings.dialogue_lookup = {
	"dialogues/generated/lookup_dlc_cog",
	"dialogues/generated/lookup_dwarf_ranger_cog",
}
settings.dialogue_settings = {
	inn_level = {
		"dialogues/generated/dlc_cog",
	},
	inn_level_celebrate = {},
	inn_level_halloween = {
		"dialogues/generated/dlc_cog",
	},
	inn_level_skulls = {
		"dialogues/generated/dlc_cog",
	},
	inn_level_sonnstill = {
		"dialogues/generated/dlc_cog",
	},
}
settings.auto_load_files = {
	"dialogues/generated/dwarf_ranger_cog",
}
settings.network_sound_events = {
	"Play_player_engineer_engine_charge_husk",
	"Play_player_engineer_engine_loop_husk",
	"Stop_player_engineer_engine_loop_husk",
	"Play_player_engineer_shooting_single_husk",
	"Play_player_engineer_steam_loop_husk",
	"Stop_player_engineer_steam_loop_husk",
}
