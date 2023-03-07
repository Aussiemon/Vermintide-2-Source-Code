WeaveLoadoutSettings = WeaveLoadoutSettings or {}
local profile_name = "dwarf_ranger"
local talent_index = CareerSettings.dr_ranger.talent_tree_index
WeaveLoadoutSettings.dr_ranger = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {}
}
