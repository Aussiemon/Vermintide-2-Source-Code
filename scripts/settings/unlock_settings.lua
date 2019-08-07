UnlockSettings = {
	{
		unlocks = {
			pre_order = {
				class = "UnlockDlc",
				id = "737040"
			},
			scorpion = {
				class = "UnlockDlc",
				id = "1033060"
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
