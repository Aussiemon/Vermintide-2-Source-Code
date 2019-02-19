return {
	description = "description_mutator_hordes_galore",
	relax_duration_modifier = 0.7,
	display_name = "display_name_mutator_hordes_galore",
	horde_frequency_modifier = 0.9,
	horde_startup_time_modifier = 0.9,
	icon = "mutator_icon_hordes_galore",
	max_delay_modifier = 0.7,
	update_conflict_settings = function (context, data)
		local function modify_time_table(time_table, modifier, dprint_string)
			local tt_1 = time_table[1]
			local tt_2 = time_table[2]
			time_table[1] = tt_1 - tt_1 * modifier
			time_table[2] = tt_2 - tt_2 * modifier
		end

		local template = data.template
		local horde_frequency_modifier = template.horde_frequency_modifier
		local horde_startup_time_modifier = template.horde_startup_time_modifier
		local relax_duration_modifier = template.relax_duration_modifier
		local max_delay_modifier = template.max_delay_modifier
		local pacing_settings = CurrentPacing

		if not pacing_settings.disabled then
			modify_time_table(pacing_settings.horde_frequency, horde_frequency_modifier, "Changed horde frequency from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
			modify_time_table(pacing_settings.horde_startup_time, horde_startup_time_modifier, "Changed horde startup time from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
			modify_time_table(pacing_settings.relax_duration, relax_duration_modifier, "Changed relax duration from ({%s, %s}) to ({%s, %s}), modifier: %s - original")

			if pacing_settings.max_delay_until_next_horde then
				modify_time_table(pacing_settings.max_delay_until_next_horde, max_delay_modifier, "Changed max_delay_until_next_horde from ({%s, %s}) to ({%s, %s}), modifier: %s - original")
			end
		end
	end
}
