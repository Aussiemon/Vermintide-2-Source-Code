return {
	description = "description_mutator_same_specials",
	icon = "mutator_icon_specials_frequency",
	display_name = "display_name_mutator_same_specials",
	update_conflict_settings = function (context, data)
		local method = CurrentSpecialsSettings.methods.specials_by_slots
		method.select_next_breed = "get_random_breed"
		method.chance_of_coordinated_attack = 1
		method.max_of_same = 99
		method.same_breeds = true
		method.coordinated_trickle_time = 1
		method.always_coordinated = true
		method.after_safe_zone_delay = {
			30,
			70
		}
	end
}
