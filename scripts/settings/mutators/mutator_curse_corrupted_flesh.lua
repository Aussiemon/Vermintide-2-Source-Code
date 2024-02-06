-- chunkname: @scripts/settings/mutators/mutator_curse_corrupted_flesh.lua

local mutator_base_curse_marked_enemies = require("scripts/settings/mutators/mutator_base_curse_marked_enemies")
local mutator = mutator_base_curse_marked_enemies("curse_corrupted_flesh_name", "curse_corrupted_flesh_desc", "deus_curse_nurgle_01", "mark_of_nurgle", {
	normal = {
		mark_chance = 0.3,
		max_marked_enemies = 2,
	},
	hard = {
		mark_chance = 0.3,
		max_marked_enemies = 3,
	},
	harder = {
		mark_chance = 0.3,
		max_marked_enemies = 3,
	},
	hardest = {
		mark_chance = 0.3,
		max_marked_enemies = 3,
	},
	cataclysm = {
		mark_chance = 0.3,
		max_marked_enemies = 3,
	},
}, {
	beastmen_bestigor = true,
	beastmen_gor = true,
	beastmen_ungor = true,
	chaos_berzerker = true,
	chaos_fanatic = true,
	chaos_marauder = true,
	chaos_marauder_with_shield = true,
	chaos_raider = true,
	chaos_warrior = true,
	skaven_clan_rat = true,
	skaven_clan_rat_with_shield = true,
	skaven_plague_monk = true,
	skaven_slave = true,
	skaven_storm_vermin = true,
	skaven_storm_vermin_champion = true,
	skaven_storm_vermin_commander = true,
	skaven_storm_vermin_with_shield = true,
})

mutator.curse_package_name = "resource_packages/mutators/mutator_curse_corrupted_flesh"

return mutator
