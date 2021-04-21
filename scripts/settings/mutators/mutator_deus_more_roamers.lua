local density_multiplier = 2

return {
	description = "mutator_deus_more_roamers_desc",
	display_name = "mutator_deus_more_roamers_name",
	hide_from_player_ui = true,
	icon = "mutator_icon_deus_more_roamers",
	tweak_pack_spawning_settings = function (conflict_director_name, pack_spawning_settings)
		MutatorUtils.tweak_pack_spawning_settings_density_multiplier(pack_spawning_settings, density_multiplier)
	end
}
