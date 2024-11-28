-- chunkname: @scripts/settings/dlcs/ultimate_bundle/ultimate_bundle_common_settings.lua

local settings = DLCSettings.ultimate_bundle

settings.unlock_settings = {
	ultimate_bundle = {
		class = "UnlockDlcBundle",
		id = "47329",
		requires_restart = false,
		bundle_contains = {
			"lake",
			"lake_upgrade",
			"cog",
			"cog_upgrade",
			"woods",
			"woods_upgrade",
			"bless",
			"bless_upgrade",
			"shovel",
			"shovel_upgrade",
			"pre_order",
			"bogenhafen",
			"holly",
			"scorpion",
			"grass",
		},
	},
}
