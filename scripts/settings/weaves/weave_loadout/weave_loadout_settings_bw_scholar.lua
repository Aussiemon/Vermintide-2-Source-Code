-- chunkname: @scripts/settings/weaves/weave_loadout/weave_loadout_settings_bw_scholar.lua

WeaveLoadoutSettings = WeaveLoadoutSettings or {}

local profile_name = "bright_wizard"
local talent_index = CareerSettings.bw_scholar.talent_tree_index

WeaveLoadoutSettings.bw_scholar = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {},
}
