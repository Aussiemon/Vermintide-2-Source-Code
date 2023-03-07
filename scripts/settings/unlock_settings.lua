UnlockSettings = {
	{
		unlocks = {
			pre_order = {
				class = "UnlockDlc",
				id = "737040"
			},
			vermintide_1 = {
				class = "UnlockDlc",
				id = "235540"
			},
			scorpion = {
				class = "UnlockDlc",
				id = "1033060"
			},
			wom_beta = {
				class = "UnlockDlc",
				id = "1085780"
			},
			serpent_frame = {
				class = "UnlockDlc",
				id = "1040840"
			},
			penny = {
				class = "AlwaysUnlocked"
			}
		}
	}
}

DLCUtils.merge("unlock_settings", UnlockSettings[1].unlocks)
