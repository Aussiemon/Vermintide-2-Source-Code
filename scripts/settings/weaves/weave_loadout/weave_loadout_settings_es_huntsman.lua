WeaveLoadoutSettings = WeaveLoadoutSettings or {}
local profile_name = "empire_soldier"
local talent_index = CareerSettings.es_huntsman.talent_tree_index
WeaveLoadoutSettings.es_huntsman = {
	talent_tree = TalentTrees[profile_name][talent_index],
	properties = {},
	traits = {}
}
