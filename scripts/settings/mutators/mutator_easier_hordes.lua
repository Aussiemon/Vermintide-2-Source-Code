local VALUE_TWEAK = 0.5

return {
	hide_from_player_ui = true,
	update_conflict_settings = function (context, data)
		CurrentPacing.multiple_hordes = 2

		MutatorUtils.update_conflict_settings_horde_size_modifier(VALUE_TWEAK)
	end
}
