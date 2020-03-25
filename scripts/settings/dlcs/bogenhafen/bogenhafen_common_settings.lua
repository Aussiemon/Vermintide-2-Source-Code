local settings = DLCSettings.bogenhafen
settings.unlock_settings = {
	bogenhafen = {
		id = "828790",
		class = "UnlockDlc",
		always_unlocked_game_app_ids = {
			1085780
		}
	}
}
settings.unlock_settings_xb1 = {
	bogenhafen = {
		id = "3E0F5C11-261E-4165-A610-176131574B84",
		backend_reward_id = "bogenhafen",
		class = "UnlockDlc"
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		bogenhafen = {
			id = "2b2fc2291fbf4eafb7289a0586ae3994",
			product_label = "V2MAPPACKUS00001",
			class = "UnlockDlc",
			backend_reward_id = "bogenhafen"
		}
	},
	CUSA13645_00 = {
		bogenhafen = {
			id = "78b2c8d131d84d7a9796bb28186ea6b6",
			product_label = "V2MAPPACKEU00001",
			class = "UnlockDlc",
			backend_reward_id = "bogenhafen"
		}
	}
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_bogenhafen"
}

return
