WeaveLoadoutSettings = WeaveLoadoutSettings or {}
local profile_name = "witch_hunter"
local talent_index = CareerSettings.wh_captain.talent_tree_index
WeaveLoadoutSettings.wh_captain = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {}
}

return
