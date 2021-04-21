return {
	description = "description_mutator_specials_frequency",
	spawn_time_reduction_multiplier = 0.4,
	display_name = "display_name_mutator_specials_frequency",
	max_specials_multiplier = 2,
	icon = "mutator_icon_specials_frequency",
	update_conflict_settings = function (context, data)
		local template = data.template

		MutatorUtils.update_conflict_settings_specials_frequency(template.max_specials_multiplier, template.spawn_time_reduction_multiplier)
	end
}
