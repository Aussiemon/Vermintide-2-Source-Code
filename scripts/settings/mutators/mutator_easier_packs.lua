-- chunkname: @scripts/settings/mutators/mutator_easier_packs.lua

local conversion_table = {
	beastmen = "beastmen_light",
	beastmen_elites = "beastmen",
	marauders_and_warriors = "marauders",
	marauders_elites = "marauders_and_warriors",
	shield_rats = "shield_rats_no_elites",
	standard = "standard_no_elites",
}
local density_multiplier = 0.8

return {
	hide_from_player_ui = true,
	tweak_pack_spawning_settings = function (conflict_director_name, pack_spawning_settings)
		MutatorUtils.tweak_pack_spawning_settings_density_multiplier(pack_spawning_settings, density_multiplier)
		MutatorUtils.tweak_pack_spawning_settings_convert_breeds(pack_spawning_settings, conversion_table)
	end,
}
