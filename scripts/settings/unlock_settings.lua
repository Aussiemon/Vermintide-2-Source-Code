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
			}
		}
	}
}

for _, dlc in pairs(DLCSettings) do
	local unlocks = dlc.unlock_settings

	if unlocks then
		for key, value in pairs(unlocks) do
			UnlockSettings[1].unlocks[key] = value
		end
	end
end

return
