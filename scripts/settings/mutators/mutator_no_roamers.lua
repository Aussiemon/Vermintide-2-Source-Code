return {
	hide_from_player_ui = true,
	tweak_pack_spawning_settings = function (conflict_director_name, pack_spawning_settings)
		pack_spawning_settings.area_density_coefficient = 0

		for _, difficulty_override in pairs(pack_spawning_settings.difficulty_overrides) do
			difficulty_override.area_density_coefficient = 0
		end
	end
}
