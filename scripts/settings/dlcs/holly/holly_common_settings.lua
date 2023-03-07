local settings = DLCSettings.holly
settings.unlock_settings = {
	holly = {
		id = "975400",
		class = "UnlockDlc",
		always_unlocked_game_app_ids = {
			1085780
		}
	}
}
settings.unlock_settings_xb1 = {
	holly = {
		id = "2370E217-689D-4EFB-B31E-6F5D47237922",
		backend_reward_id = "holly",
		class = "UnlockDlc"
	}
}
settings.unlock_settings_ps4 = {
	CUSA13595_00 = {
		holly = {
			id = "55e08f1c10be40a1bab40c582b408994",
			product_label = "V2MAPPACKUS00002",
			class = "UnlockDlc",
			backend_reward_id = "holly"
		}
	},
	CUSA13645_00 = {
		holly = {
			id = "eb035db81456460788318a1be338253f",
			product_label = "V2MAPPACKEU00002",
			class = "UnlockDlc",
			backend_reward_id = "holly"
		}
	}
}
settings.statistics_definitions = {
	"scripts/managers/backend/statistics_definitions_holly"
}
