return {
	description = "description_mutator_more_specials",
	icon = "mutator_icon_specials_frequency",
	display_name = "display_name_mutator_more_specials",
	update_conflict_settings = function (context, data)
		CurrentSpecialsSettings.max_specials = CurrentSpecialsSettings.max_specials * 2
	end
}
