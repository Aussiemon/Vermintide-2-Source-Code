require("scripts/managers/talents/talent_settings_bardin")
require("scripts/managers/talents/talent_settings_sienna")
require("scripts/managers/talents/talent_settings_kerillian")
require("scripts/managers/talents/talent_settings_markus")
require("scripts/managers/talents/talent_settings_victor")

NumTalentTrees = 3
MaxTalentPoints = 5
NumTalentRows = 5
NumTalentColumns = 3
TalentUnlockLevels = {
	talent_point_5 = 25,
	talent_point_1 = 5,
	talent_point_4 = 20,
	talent_point_3 = 15,
	talent_point_2 = 10
}
TalentIDLookup = {}

for _, hero_talents in pairs(Talents) do
	for id, data in ipairs(hero_talents) do
		local talent_name = data.name

		fassert(not TalentIDLookup[talent_name], "talent with unique name %s already exists", talent_name)

		TalentIDLookup[data.name] = id
	end
end

for hero_name, hero_talent_trees in pairs(TalentTrees) do
	for tree, tree_layout in ipairs(hero_talent_trees) do
		for row, coulumns in ipairs(tree_layout) do
			for coulumn, talent_name in ipairs(coulumns) do
				if talent_name ~= "empty" then
					local talent_id = TalentIDLookup[talent_name]
					local talent_settings = Talents[hero_name][talent_id]
					talent_settings.tree = tree
					talent_settings.row = row
					talent_settings.coulumn = coulumn
					talent_settings.talent_id = talent_id
				end
			end
		end
	end
end

return 
