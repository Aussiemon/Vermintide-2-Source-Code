WeaveLoadoutSettings = WeaveLoadoutSettings or {}
local profile_name = "wood_elf"
local talent_index = CareerSettings.we_shade.talent_tree_index
WeaveLoadoutSettings.we_shade = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {}
}

return
