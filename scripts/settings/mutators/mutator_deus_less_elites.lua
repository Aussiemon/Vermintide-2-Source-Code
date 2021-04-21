local conversion_table = {
	beastmen = "beastmen_light",
	shield_rats = "shield_rats_no_elites",
	beastmen_elites = "beastmen",
	standard = "standard_no_elites",
	marauders_elites = "marauders_and_warriors"
}

return {
	description = "mutator_deus_less_elites_desc",
	display_name = "mutator_deus_less_elites_name",
	hide_from_player_ui = true,
	icon = "mutator_icon_deus_less_elites",
	tweak_pack_spawning_settings = function (conflict_director_name, pack_spawning_settings)
		MutatorUtils.tweak_pack_spawning_settings_convert_breeds(pack_spawning_settings, conversion_table)
	end
}
