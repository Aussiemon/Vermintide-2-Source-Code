require("scripts/settings/economy")

VaultEconomyLevelFailedKeyTable = {}

local function init_economy_vault()
	for difficulty, settings in pairs(DifficultySettings) do
		local t = {
			amount = "failed." .. difficulty .. ".amount"
		}
		VaultEconomyLevelFailedKeyTable[difficulty] = t
		local level_failed_reward = settings.level_failed_reward

		Vault.deposit_single(t.amount, level_failed_reward.token_amount)
	end

	return 
end

init_economy_vault()

return 
