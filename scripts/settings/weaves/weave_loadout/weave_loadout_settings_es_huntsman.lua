-- chunkname: @scripts/settings/weaves/weave_loadout/weave_loadout_settings_es_huntsman.lua

WeaveLoadoutSettings = WeaveLoadoutSettings or {}

local profile_name = "empire_soldier"
local talent_index = CareerSettings.es_huntsman.talent_tree_index

WeaveLoadoutSettings.es_huntsman = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {},
}
