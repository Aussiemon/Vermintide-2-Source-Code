-- chunkname: @scripts/settings/dlcs/termite/termite_common_settings_part_1.lua

local settings = DLCSettings.termite_part_1

settings.unlock_settings_xb1 = {
	termite = {
		class = "AlwaysUnlocked",
	},
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_termite_part_1",
}
settings.item_master_list_file_names = {
	"scripts/settings/equipment/item_master_list_termite",
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		termite = {
			class = "AlwaysUnlocked",
		},
	},
	CUSA13645_00 = {
		termite = {
			class = "AlwaysUnlocked",
		},
	},
}
settings.statistics_lookup = {
	"termite1_skaven_markings_challenge",
	"termite1_bell_challenge",
	"termite1_towers_challenge",
	"termite1_waystone_timer_challenge_easy",
	"termite1_waystone_timer_challenge_hard",
}
