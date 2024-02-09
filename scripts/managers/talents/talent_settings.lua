﻿-- chunkname: @scripts/managers/talents/talent_settings.lua

Talents = Talents or {}

require("scripts/managers/talents/talent_settings_bardin")
require("scripts/managers/talents/talent_settings_sienna")
require("scripts/managers/talents/talent_settings_kerillian")
require("scripts/managers/talents/talent_settings_markus")
require("scripts/managers/talents/talent_settings_victor")
DLCUtils.require_list("talent_settings")

MaxTalentPoints = 6
NumTalentRows = 6
NumTalentColumns = 3
TalentUnlockLevels = {
	talent_point_1 = 5,
	talent_point_2 = 10,
	talent_point_3 = 15,
	talent_point_4 = 20,
	talent_point_5 = 25,
	talent_point_6 = 30,
}
TalentIDLookup = {}

for hero_name, hero_talents in pairs(Talents) do
	for talent_id, data in ipairs(hero_talents) do
		local talent_name = data.name

		if not talent_name then
			table.dump(data, "talent_contents", 2)
		end

		fassert(not TalentIDLookup[talent_name], "talent with unique name %s already exists", talent_name)

		local lookup_entry = {}

		lookup_entry.talent_id = talent_id
		lookup_entry.hero_name = hero_name
		TalentIDLookup[talent_name] = lookup_entry
	end
end

for hero_name, hero_talent_trees in pairs(TalentTrees) do
	for tree, tree_layout in ipairs(hero_talent_trees) do
		for row, coulumns in ipairs(tree_layout) do
			for coulumn, talent_name in ipairs(coulumns) do
				if talent_name ~= "empty" then
					local lookup = TalentIDLookup[talent_name]

					fassert(lookup, "Talent %s is missing from the TalentIDLookup table", talent_name)

					local talent_settings = Talents[hero_name][lookup.talent_id]

					talent_settings.tree = tree
					talent_settings.row = row
					talent_settings.coulumn = coulumn
					talent_settings.talent_id = lookup.talent_id
				end
			end
		end
	end
end
