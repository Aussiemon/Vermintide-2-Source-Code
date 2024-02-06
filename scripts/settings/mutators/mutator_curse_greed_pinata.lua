-- chunkname: @scripts/settings/mutators/mutator_curse_greed_pinata.lua

local mutator_base_curse_marked_enemies = require("scripts/settings/mutators/mutator_base_curse_marked_enemies")
local mutator_config = mutator_base_curse_marked_enemies("curse_greed_pinata_name", "curse_greed_pinata_desc", "deus_curse_slaanesh_01", "curse_greed_pinata_spawner", {
	normal = {
		mark_chance = 1,
		max_marked_enemies = 2,
	},
	hard = {
		mark_chance = 1,
		max_marked_enemies = 2,
	},
	harder = {
		mark_chance = 1,
		max_marked_enemies = 2,
	},
	hardest = {
		mark_chance = 1,
		max_marked_enemies = 2,
	},
	cataclysm = {
		mark_chance = 1,
		max_marked_enemies = 2,
	},
}, {
	beastmen_bestigor = true,
	beastmen_gor = true,
	beastmen_minotaur = true,
	beastmen_standard_bearer = true,
	chaos_berzerker = true,
	chaos_corruptor_sorcerer = true,
	chaos_raider = true,
	chaos_spawn = true,
	chaos_troll = true,
	chaos_vortex_sorcerer = true,
	chaos_warrior = true,
	skaven_gutter_runner = true,
	skaven_pack_master = true,
	skaven_plague_monk = true,
	skaven_poison_wind_globadier = true,
	skaven_rat_ogre = true,
	skaven_ratling_gunner = true,
	skaven_storm_vermin = true,
	skaven_storm_vermin_commander = true,
	skaven_storm_vermin_with_shield = true,
	skaven_stormfiend = true,
	skaven_warpfire_thrower = true,
})

mutator_config.pickup_system_multipliers = {
	ammo = 0,
	deus_potions = 0,
	deus_soft_currency = 0,
	grenades = 0,
	healing = 0,
	level_events = 0,
	potions = 0,
}
mutator_config.curse_package_name = "resource_packages/mutators/mutator_curse_greed_pinata"
mutator_config.marked_enemy_killed_dialogue_event = "curse_see_objective"

return mutator_config
