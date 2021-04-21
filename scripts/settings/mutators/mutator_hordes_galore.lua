local horde_frequency_modifier = 0.9
local horde_startup_time_modifier = 0.9
local relax_duration_modifier = 0.7
local max_delay_modifier = 0.7

return {
	description = "description_mutator_hordes_galore",
	icon = "mutator_icon_hordes_galore",
	display_name = "display_name_mutator_hordes_galore",
	update_conflict_settings = function (context, data)
		MutatorUtils.update_conflict_settings_horde_frequency(horde_frequency_modifier, horde_startup_time_modifier, relax_duration_modifier, max_delay_modifier)
	end
}
