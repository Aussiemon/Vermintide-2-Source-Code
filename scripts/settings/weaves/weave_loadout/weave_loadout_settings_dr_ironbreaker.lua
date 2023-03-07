WeaveLoadoutSettings = WeaveLoadoutSettings or {}
local profile_name = "dwarf_ranger"
local talent_index = CareerSettings.dr_ironbreaker.talent_tree_index
WeaveLoadoutSettings.dr_ironbreaker = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {}
}
