﻿-- chunkname: @scripts/settings/dlcs/celebrate/celebrate_common_settings.lua

local settings = DLCSettings.celebrate

settings.unlock_settings = {
	celebrate = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_xb1 = {
	celebrate = {
		class = "AlwaysUnlocked",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		celebrate = {
			class = "AlwaysUnlocked",
		},
	},
	CUSA13645_00 = {
		celebrate = {
			class = "AlwaysUnlocked",
		},
	},
}
settings.husk_lookup = {
	"units/weapons/player/pup_ale/pup_ale",
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_celebrate",
}
