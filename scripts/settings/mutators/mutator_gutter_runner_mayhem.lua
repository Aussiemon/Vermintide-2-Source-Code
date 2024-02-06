-- chunkname: @scripts/settings/mutators/mutator_gutter_runner_mayhem.lua

return {
	description = "description_mutator_gutter_runner_mayhem",
	display_name = "display_name_mutator_gutter_runner_mayhem",
	icon = "mutator_icon_specials_frequency",
	update_conflict_settings = function (context, data)
		CurrentSpecialsSettings.breeds = {
			"skaven_gutter_runner",
		}

		local method = CurrentSpecialsSettings.methods.specials_by_slots

		method.max_of_same = 99
		method.spawn_cooldown = {
			30,
			50,
		}
		method.chance_of_coordinated_attack = 1
		method.coordinated_trickle_time = 0.66
	end,
}
