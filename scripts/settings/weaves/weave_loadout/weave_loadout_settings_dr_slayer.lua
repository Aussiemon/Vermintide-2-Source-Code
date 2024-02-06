-- chunkname: @scripts/settings/weaves/weave_loadout/weave_loadout_settings_dr_slayer.lua

WeaveLoadoutSettings = WeaveLoadoutSettings or {}

local profile_name = "dwarf_ranger"
local talent_index = CareerSettings.dr_slayer.talent_tree_index

WeaveLoadoutSettings.dr_slayer = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {},
}
