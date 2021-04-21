local conversion_table = {
	marauders_and_warriors = "marauders",
	shield_rats = "shield_rats_no_elites",
	beastmen_elites = "beastmen",
	standard = "standard_no_elites",
	beastmen = "beastmen_light",
	marauders_elites = "marauders_and_warriors"
}
local density_multiplier = 0.8

return {
	hide_from_player_ui = true,
	tweak_pack_spawning_settings = function (conflict_director_name, pack_spawning_settings)
		MutatorUtils.tweak_pack_spawning_settings_density_multiplier(pack_spawning_settings, density_multiplier)
		MutatorUtils.tweak_pack_spawning_settings_convert_breeds(pack_spawning_settings, conversion_table)
	end
}
