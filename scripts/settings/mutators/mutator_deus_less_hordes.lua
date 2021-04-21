local horde_size_multiplier = 1
local horde_frequency_modifier = -0.4
local horde_startup_time_modifier = -0.4
local relax_duration_modifier = -0.4
local max_delay_modifier = -0.4

return {
	description = "mutator_deus_less_hordes_desc",
	display_name = "mutator_deus_less_hordes_name",
	hide_from_player_ui = true,
	icon = "mutator_icon_deus_less_hordes",
	update_conflict_settings = function (context, data)
		MutatorUtils.update_conflict_settings_horde_size_modifier(horde_size_multiplier)
		MutatorUtils.update_conflict_settings_horde_frequency(horde_frequency_modifier, horde_startup_time_modifier, relax_duration_modifier, max_delay_modifier)
	end
}
