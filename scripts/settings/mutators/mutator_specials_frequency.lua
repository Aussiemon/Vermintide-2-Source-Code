-- chunkname: @scripts/settings/mutators/mutator_specials_frequency.lua

return {
	description = "description_mutator_specials_frequency",
	display_name = "display_name_mutator_specials_frequency",
	icon = "mutator_icon_specials_frequency",
	max_specials_multiplier = 2,
	spawn_time_reduction_multiplier = 0.4,
	update_conflict_settings = function (context, data)
		local template = data.template

		MutatorUtils.update_conflict_settings_specials_frequency(template.max_specials_multiplier, template.spawn_time_reduction_multiplier)
	end,
}
