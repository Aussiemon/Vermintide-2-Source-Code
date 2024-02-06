-- chunkname: @scripts/settings/weaves/weave_loadout/weave_loadout_settings_we_maidenguard.lua

WeaveLoadoutSettings = WeaveLoadoutSettings or {}

local profile_name = "wood_elf"
local talent_index = CareerSettings.we_maidenguard.talent_tree_index

WeaveLoadoutSettings.we_maidenguard = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {},
}
