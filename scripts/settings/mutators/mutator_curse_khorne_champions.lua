-- chunkname: @scripts/settings/mutators/mutator_curse_khorne_champions.lua

local mutator_base_curse_marked_enemies = require("scripts/settings/mutators/mutator_base_curse_marked_enemies")
local mutator = mutator_base_curse_marked_enemies("curse_khorne_champions_name", "curse_khorne_champions_desc", "deus_curse_khorne_01", "curse_khorne_champions_aoe", {
	normal = {
		mark_chance = 1,
		max_marked_enemies = 2,
	},
	hard = {
		mark_chance = 1,
		max_marked_enemies = 3,
	},
	harder = {
		mark_chance = 1,
		max_marked_enemies = 4,
	},
	hardest = {
		mark_chance = 1,
		max_marked_enemies = 5,
	},
	cataclysm = {
		mark_chance = 1,
		max_marked_enemies = 6,
	},
}, {
	beastmen_bestigor = true,
	chaos_raider = true,
	chaos_warrior = true,
	skaven_storm_vermin = true,
	skaven_storm_vermin_champion = true,
	skaven_storm_vermin_commander = true,
	skaven_storm_vermin_with_shield = true,
})

mutator.curse_package_name = "resource_packages/mutators/mutator_curse_khorne_champions"

return mutator
