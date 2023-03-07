WeaveLoadoutSettings = WeaveLoadoutSettings or {}
local profile_name = "wood_elf"
local talent_index = CareerSettings.we_waywatcher.talent_tree_index
WeaveLoadoutSettings.we_waywatcher = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {}
}
