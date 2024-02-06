-- chunkname: @scripts/settings/dlcs/holly/holly_common_settings.lua

local settings = DLCSettings.holly

settings.unlock_settings = {
	holly = {
		class = "UnlockDlc",
		id = "975400",
		always_unlocked_game_app_ids = {
			1085780,
		},
	},
}
settings.unlock_settings_xb1 = {
	holly = {
		backend_reward_id = "holly",
		class = "UnlockDlc",
		id = "2370E217-689D-4EFB-B31E-6F5D47237922",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		holly = {
			backend_reward_id = "holly",
			class = "UnlockDlc",
			id = "55e08f1c10be40a1bab40c582b408994",
			product_label = "V2MAPPACKUS00002",
		},
	},
	CUSA13645_00 = {
		holly = {
			backend_reward_id = "holly",
			class = "UnlockDlc",
			id = "eb035db81456460788318a1be338253f",
			product_label = "V2MAPPACKEU00002",
		},
	},
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_holly",
}
