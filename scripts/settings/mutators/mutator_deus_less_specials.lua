local max_specials_multiplier = 0.5
local spawn_time_reduction = 1.5

return {
	description = "mutator_deus_less_specials_desc",
	display_name = "mutator_deus_less_specials_name",
	hide_from_player_ui = true,
	icon = "mutator_icon_deus_less_specials",
	update_conflict_settings = function (context, data)
		MutatorUtils.update_conflict_settings_specials_frequency(max_specials_multiplier, spawn_time_reduction)
	end
}
