﻿-- chunkname: @scripts/settings/weaves/weave_loadout/weave_loadout_settings_wh_zealot.lua

WeaveLoadoutSettings = WeaveLoadoutSettings or {}

local profile_name = "witch_hunter"
local talent_index = CareerSettings.wh_zealot.talent_tree_index

WeaveLoadoutSettings.wh_zealot = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {},
}
