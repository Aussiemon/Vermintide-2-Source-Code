-- chunkname: @scripts/settings/dlcs/premium_career_bundle/premium_career_bundle_common_settings.lua

local settings = DLCSettings.premium_career_bundle

settings.unlock_settings = {
	premium_career_bundle = {
		class = "UnlockDlcBundle",
		id = "38849",
		requires_restart = true,
		bundle_contains = {
			"lake",
			"cog",
			"woods",
			"bless",
			"shovel",
		},
	},
	premium_career_bundle_upgrade = {
		class = "UnlockDlcBundle",
		id = "38850",
		requires_restart = true,
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
		},
	},
}
settings.unlock_settings_xb1 = {}
settings.unlock_settings_ps4 = {}
