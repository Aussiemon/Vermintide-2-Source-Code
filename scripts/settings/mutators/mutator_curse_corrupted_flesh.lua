local mutator_base_curse_marked_enemies = require("scripts/settings/mutators/mutator_base_curse_marked_enemies")

return mutator_base_curse_marked_enemies("curse_corrupted_flesh_name", "curse_corrupted_flesh_desc", "deus_curse_nurgle_01", "mark_of_nurgle", {
	normal = {
		mark_chance = 0.3,
		max_marked_enemies = 2
	},
	hard = {
		mark_chance = 0.3,
		max_marked_enemies = 3
	},
	harder = {
		mark_chance = 0.3,
		max_marked_enemies = 3
	},
	hardest = {
		mark_chance = 0.3,
		max_marked_enemies = 3
	},
	cataclysm = {
		mark_chance = 0.3,
		max_marked_enemies = 3
	}
}, {
	chaos_marauder = true,
	chaos_raider = true,
	skaven_plague_monk = true,
	beastmen_bestigor = true,
	chaos_berzerker = true,
	skaven_clan_rat_with_shield = true,
	skaven_storm_vermin_with_shield = true,
	chaos_marauder_with_shield = true,
	chaos_fanatic = true,
	skaven_slave = true,
	skaven_clan_rat = true,
	beastmen_ungor = true,
	chaos_warrior = true,
	skaven_storm_vermin_commander = true,
	skaven_storm_vermin = true,
	beastmen_gor = true,
	skaven_storm_vermin_champion = true
})
