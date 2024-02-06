-- chunkname: @scripts/settings/dlcs/bogenhafen/bogenhafen_common_settings.lua

local settings = DLCSettings.bogenhafen

settings.unlock_settings = {
	bogenhafen = {
		class = "UnlockDlc",
		id = "828790",
		always_unlocked_game_app_ids = {
			1085780,
		},
	},
}
settings.unlock_settings_xb1 = {
	bogenhafen = {
		backend_reward_id = "bogenhafen",
		class = "UnlockDlc",
		id = "3E0F5C11-261E-4165-A610-176131574B84",
	},
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		bogenhafen = {
			backend_reward_id = "bogenhafen",
			class = "UnlockDlc",
			id = "2b2fc2291fbf4eafb7289a0586ae3994",
			product_label = "V2MAPPACKUS00001",
		},
	},
	CUSA13645_00 = {
		bogenhafen = {
			backend_reward_id = "bogenhafen",
			class = "UnlockDlc",
			id = "78b2c8d131d84d7a9796bb28186ea6b6",
			product_label = "V2MAPPACKEU00001",
		},
	},
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_bogenhafen",
}
